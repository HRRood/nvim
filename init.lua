vim.loader.enable()

vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Ensure nvm-managed Node.js is available for Mason tool installation
local nvm_dir = vim.fn.expand("~/.nvm")
if vim.fn.isdirectory(nvm_dir) == 1 then
	local default_file = nvm_dir .. "/alias/default"
	if vim.fn.filereadable(default_file) == 1 then
		local version = vim.trim(vim.fn.readfile(default_file)[1])
		if not version:match("^v") then
			version = "v" .. version
		end
		local bin = nvm_dir .. "/versions/node/" .. version .. "/bin"
		if vim.fn.isdirectory(bin) ~= 1 then
			local matches = vim.fn.glob(nvm_dir .. "/versions/node/" .. version .. "*/bin", false, true)
			bin = matches[#matches] or ""
		end
		if vim.fn.isdirectory(bin) == 1 then
			vim.env.PATH = bin .. ":" .. vim.env.PATH
		end
	end
end

vim.g.have_nerd_font = true

-- Disable some default plugins for better performance
local disabled_plugins = {
	"gzip",
	"matchit",
	"matchparen",
	"netrwPlugin",
	"tarPlugin",
	"tohtml",
	"tutor",
	"zipPlugin",
}

for _, plugin in pairs(disabled_plugins) do
	vim.g["loaded_" .. plugin] = 1
end
require("options")
require("keymaps")
require("autocommands")

require("plugins")
