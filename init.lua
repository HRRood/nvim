vim.g.mapleader = " "
vim.g.maplocalleader = " "

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

vim.loader.enable()
