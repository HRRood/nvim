return {
	"sainnhe/sonokai",
	priority = 1000,
	config = function()
		vim.g.sonokai_transparent_background = "1"
		vim.g.sonokai_enable_italic = "1"
		vim.g.sonokai_style = "andromeda"
		vim.cmd.colorscheme("sonokai")
	end,
}
-- return {
-- 	"catppuccin/nvim",
-- 	name = "catppuccin",
-- 	priority = 1000,
-- 	config = function()
-- 		require("catppuccin").setup({
-- 			flavour = "mocha", -- latte, frappe, macchiato, mocha
-- 			background = { -- :h background
-- 				light = "latte",
-- 				dark = "mocha",
-- 			},
-- 			transparent_background = true,
-- 			show_end_of_buffer = false, -- show the '~' characters after the end of buffers
-- 			term_colors = false, -- set terminal colors (vim.g.terminal_color_0 = base.Red)
-- 			no_italic = false, -- force no italic
-- 			no_bold = false, -- force no bold
-- 			styles = {
-- 				comments = { "italic" },
-- 				functions = { "italic" },
-- 				keywords = { "italic" },
-- 				strings = { "italic" },
-- 				variables = { "italic" },
-- 			},
-- 		})
-- 	end,
-- 	init = function()
-- 		vim.cmd.colorscheme("catppuccin-mocha")
-- 	end,
-- }
