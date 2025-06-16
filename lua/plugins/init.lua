local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
	local lazyrepo = "https://github.com/folke/lazy.nvim.git"
	local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
	if vim.v.shell_error ~= 0 then
		error("Error cloning lazy.nvim:\n" .. out)
	end
end
vim.opt.rtp:prepend(lazypath)

local function load_plugins()
	local plugins = { "tpope/vim-sleuth" }

	local plugins_dir = vim.fn.stdpath("config") .. "/lua/plugins"
	local files = vim.fn.glob(plugins_dir .. "/*.lua", false, true)

	for _, file in ipairs(files) do
		local filename = vim.fn.fnamemodify(file, ":t:r")
		if filename ~= "init" then -- Skip the init.lua file itself
			table.insert(plugins, require("plugins." .. filename))
		end
	end

	return plugins
end

require("lazy").setup(load_plugins())
