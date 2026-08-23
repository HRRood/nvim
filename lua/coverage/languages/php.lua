-- Overrides nvim-coverage's built-in PHP loader (coverage/languages/php.lua),
-- which requires the "xmlreader" luarock (lua-xmlreader) to parse Cobertura
-- XML. That rock has no lazy.nvim integration and is old/hard to build, so
-- this parses PHPUnit's coverage.cobertura.xml with plain string patterns
-- instead. This file is picked up in place of the plugin's own module because
-- this config's lua/ directory takes precedence over plugin runtimepaths.
local common = require("coverage.languages.common")
local util = require("coverage.util")

local M = {}

M.sign_list = common.sign_list
M.summary = common.summary

local function apply_path_mappings(source, mappings)
	for needle, replace in pairs(mappings) do
		if source:find(needle) == 1 then
			-- parenthesized to discard gsub's second return value (match count);
			-- table.insert(t, apply_path_mappings(...)) would otherwise expand
			-- it into a 3-arg call and error
			return (source:gsub(needle, replace))
		end
	end
	return source
end

local function file_exists(path)
	return (vim.uv or vim.loop).fs_stat(path) ~= nil
end

local function resolve_filename(sources, filename)
	for _, source in ipairs(sources) do
		local candidate = source == "" and filename or (source .. "/" .. filename)
		if file_exists(candidate) then
			return candidate
		end
	end
	return filename
end

local function new_file_meta()
	return {
		summary = {
			covered_lines = 0,
			excluded_lines = 0,
			missing_lines = 0,
			num_statements = 0,
			percent_covered = 0,
		},
		missing_lines = {},
		missing_branches = {},
		executed_lines = {},
		excluded_lines = {},
	}
end

-- Cobertura's <class> block repeats the same <line> entries once per method
-- (under <methods>) and once more aggregated directly under <class>. Drop
-- the <methods> section first so only the class-level lines are counted.
local function class_lines_block(class_block)
	local without_methods = class_block:gsub("<methods>.-</methods>", "")
	return without_methods:match("<lines>(.-)</lines>")
end

local function parse_cobertura(content, path_mappings)
	local sources = {}
	local sources_block = content:match("<sources>(.-)</sources>")
	if sources_block then
		for src in sources_block:gmatch("<source>(.-)</source>") do
			table.insert(sources, apply_path_mappings(vim.trim(src), path_mappings))
		end
	end
	if #sources == 0 then
		table.insert(sources, "")
	end

	local files = {}
	for class_block in content:gmatch("<class%s.-</class>") do
		local filename = class_block:match('filename="([^"]*)"')
		local lines_block = filename and class_lines_block(class_block)
		if lines_block then
			local meta = new_file_meta()
			for attrs in lines_block:gmatch("<line%s+(.-)/>") do
				local number = tonumber(attrs:match('number="(%d+)"'))
				local hits = tonumber(attrs:match('hits="(%d+)"'))
				if number and hits then
					meta.summary.num_statements = meta.summary.num_statements + 1
					if hits > 0 then
						table.insert(meta.executed_lines, number)
						meta.summary.covered_lines = meta.summary.covered_lines + 1
					else
						table.insert(meta.missing_lines, number)
						meta.summary.missing_lines = meta.summary.missing_lines + 1
					end
				end
			end
			if meta.summary.num_statements > 0 then
				meta.summary.percent_covered = meta.summary.covered_lines / meta.summary.num_statements * 100
				files[resolve_filename(sources, filename)] = meta
			end
		end
	end

	local totals = { num_statements = 0, covered_lines = 0, missing_lines = 0, excluded_lines = 0 }
	for _, meta in pairs(files) do
		totals.num_statements = totals.num_statements + meta.summary.num_statements
		totals.covered_lines = totals.covered_lines + meta.summary.covered_lines
		totals.missing_lines = totals.missing_lines + meta.summary.missing_lines
		totals.excluded_lines = totals.excluded_lines + meta.summary.excluded_lines
	end
	totals.percent_covered = totals.num_statements > 0 and (totals.covered_lines / totals.num_statements * 100) or 0

	return { meta = {}, totals = totals, files = files }
end

--- Loads a coverage report.
-- @param callback called with the results of the coverage report
M.load = function(callback)
	local php_config = require("coverage.config").opts.lang.php
	local file = util.get_coverage_file(php_config.coverage_file)
	if not file or not file_exists(file) then
		vim.notify("No coverage file exists.", vim.log.levels.INFO)
		return
	end

	local f = io.open(file, "r")
	local content = f:read("*a")
	f:close()

	callback(parse_cobertura(content, php_config.path_mappings or {}))
end

return M
