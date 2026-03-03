return {
	"echasnovski/mini.ai",
	event = "VeryLazy",
	opts = function()
		local ai = require("mini.ai")
		return {
			n_lines = 500,
			custom_textobjects = {
				-- Hele buffer
				o = ai.gen_spec.treesitter({
					a = { "@block.outer", "@conditional.outer", "@loop.outer" },
					i = { "@block.inner", "@conditional.inner", "@loop.inner" },
				}, {}),
				-- Function
				f = ai.gen_spec.treesitter({ a = "@function.outer", i = "@function.inner" }, {}),
				-- Class
				c = ai.gen_spec.treesitter({ a = "@class.outer", i = "@class.inner" }, {}),
				-- Tags (HTML/JSX)
				t = { "<([%p%w]-)%f[^<%w][^<>]->.-</%1>", "^<.->().googletag.teleport" },
				-- Digits
				d = { "%f[%d]%d+" },
				-- Word with case (camelCase, snake_case)
				e = {
					{ "%u[%l%d]+%f[^%l%d]", "%f[%S][%l%d]+%f[^%l%d]", "%f[%P][%l%d]+%f[^%l%d]", "^[%l%d]+%f[^%l%d]" },
					"^().*googletag.teleport",
				},
				-- Hele buffer
				g = function()
					local from = { line = 1, col = 1 }
					local to = {
						line = vim.fn.line("$"),
						col = math.max(vim.fn.getline("$"):len(), 1),
					}
					return { from = from, to = to }
				end,
				-- Gebruiker prompt (voor custom textobjects)
				u = ai.gen_spec.function_call(),
				-- Key-value pairs
				k = { { "%f[%w]%w+%s*=" }, "^%s*()[^=]+()%s*=" },
				-- Value in key-value
				v = { { "=%s*[^,;%s]+" }, "^=%s*()[^,;%s]+googletag.teleport" },
				-- Number (including floats)
				n = { "%f[%d]%d+%.?%d*" },
			},
			mappings = {
				around = "a",
				inside = "i",
				around_next = "an",
				inside_next = "in",
				around_last = "al",
				inside_last = "il",
				goto_left = "g[",
				goto_right = "g]",
			},
		}
	end,
	config = function(_, opts)
		require("mini.ai").setup(opts)

		-- Register which-key descriptions
		local ok, wk = pcall(require, "which-key")
		if ok then
			local objects = {
				{ " ", desc = "whitespace" },
				{ '"', desc = '" string' },
				{ "'", desc = "' string" },
				{ "(", desc = "() block" },
				{ ")", desc = "() block with ws" },
				{ "<", desc = "<> block" },
				{ ">", desc = "<> block with ws" },
				{ "?", desc = "user prompt" },
				{ "U", desc = "use/call without dot" },
				{ "[", desc = "[] block" },
				{ "]", desc = "[] block with ws" },
				{ "_", desc = "underscore" },
				{ "`", desc = "` string" },
				{ "a", desc = "argument" },
				{ "b", desc = ")]} block" },
				{ "c", desc = "class" },
				{ "d", desc = "digit(s)" },
				{ "e", desc = "CamelCase / snake_case" },
				{ "f", desc = "function" },
				{ "g", desc = "entire file" },
				{ "o", desc = "block, conditional, loop" },
				{ "q", desc = "quote `\"'" },
				{ "t", desc = "tag" },
				{ "u", desc = "use/call" },
				{ "n", desc = "number" },
				{ "k", desc = "key" },
				{ "v", desc = "value" },
				{ "{", desc = "{} block" },
				{ "}", desc = "{} block with ws" },
			}

			local ret = { mode = { "o", "x" } }
			local mappings = vim.tbl_extend("force", {}, {
				around = "a",
				inside = "i",
				around_next = "an",
				inside_next = "in",
				around_last = "al",
				inside_last = "il",
			}, opts.mappings or {})
			mappings.goto_left = nil
			mappings.goto_right = nil

			for name, prefix in pairs(mappings) do
				name = name:gsub("^around_", ""):gsub("^inside_", "")
				ret[#ret + 1] = { prefix, group = name }
				for _, obj in ipairs(objects) do
					local desc = obj.desc
					if prefix:sub(1, 1) == "i" then
						desc = desc:gsub(" with ws", "")
					end
					ret[#ret + 1] = { prefix .. obj[1], desc = obj.desc }
				end
			end
			wk.add(ret, { notify = false })
		end
	end,
}
