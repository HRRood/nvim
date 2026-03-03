-- return {
-- 	"sainnhe/everforest",
-- 	priority = 1000,
-- 	config = function()
-- 		vim.g.everforest_background = "soft" -- or "medium", "hard"
-- 		vim.g.everforest_enable_italic = 1
-- 		vim.g.everforest_transparent_background = 1
-- 		vim.cmd.colorscheme("everforest")
-- 	end,
-- }
-- return {
-- 	"rose-pine/neovim",
-- 	name = "rose-pine",
-- 	priority = 1000,
-- 	config = function()
-- 		require("rose-pine").setup({
-- 			variant = "moon", -- options: "main", "moon", "dawn"
-- 			disable_background = true, -- matches Sonokai's transparent background
-- 			disable_float_background = true,
-- 			styles = {
-- 				italic = true,
-- 			},
-- 		})
--
-- 		vim.cmd.colorscheme("rose-pine")
-- 		vim.cmd("highlight Visual guibg=#44475a guifg=NONE")
-- 	end,
-- }

-- return {
-- 	"sainnhe/sonokai",
-- 	priority = 1000,
-- 	config = function()
-- 		vim.g.sonokai_transparent_background = "1"
-- 		vim.g.sonokai_enable_italic = "1"
-- 		vim.g.sonokai_style = "andromeda"
-- 		vim.cmd.colorscheme("sonokai")
-- 	end,
-- }

return {
	"catppuccin/nvim",
	name = "catppuccin",
	priority = 1000,
	config = function()
		require("catppuccin").setup({
			flavour = "mocha", -- latte, frappe, macchiato, mocha
			background = {
				light = "latte",
				dark = "mocha",
			},
			transparent_background = true,
			show_end_of_buffer = false,
			term_colors = true,
			no_italic = false,
			no_bold = false,
			styles = {
				comments = { "italic" },
				conditionals = { "italic" },
				loops = {},
				functions = { "italic" },
				keywords = { "italic" },
				strings = {},
				variables = {},
				numbers = {},
				booleans = { "italic" },
				properties = {},
				types = { "italic" },
				operators = {},
			},
			integrations = {
				aerial = true,
				blink_cmp = true,
				diffview = true,
				flash = true,
				gitsigns = true,
				harpoon = true,
				indent_blankline = { enabled = true },
				lsp_trouble = true,
				mason = true,
				mini = { enabled = true },
				native_lsp = {
					enabled = true,
					underlines = {
						errors = { "undercurl" },
						hints = { "undercurl" },
						warnings = { "undercurl" },
						information = { "undercurl" },
					},
				},
				neotest = true,
				noice = true,
				notify = true,
				telescope = { enabled = true },
				treesitter = true,
				treesitter_context = true,
				which_key = true,
			},
		})
		vim.cmd.colorscheme("catppuccin")
	end,
}
