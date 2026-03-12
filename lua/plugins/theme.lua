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
			flavour = "mocha",
			background = {
				light = "latte",
				dark = "mocha",
			},
			transparent_background = true,
			show_end_of_buffer = false,
			term_colors = true,
			no_italic = false,
			no_bold = false,
			-- JDM Sakura theme - Honda NSX racing under cherry blossoms
			color_overrides = {
				mocha = {
					rosewater = "#ffd6e0", -- pale sakura petal
					flamingo = "#ffb7c5",  -- classic cherry blossom pink
					pink = "#f8a5c2",      -- vibrant sakura
					mauve = "#dda0dd",     -- plum blossom
					red = "#dc143c",       -- NSX crimson red
					maroon = "#c41e3a",    -- deep racing red
					peach = "#ffb86c",     -- warm sunset glow
					yellow = "#ffe066",    -- headlight beam
					green = "#50c878",     -- lush mountain green
					teal = "#5fb49c",      -- forest canopy
					sky = "#87ceeb",       -- bright anime sky
					sapphire = "#6eb5ff",  -- crisp mountain air
					blue = "#5dade2",      -- vivid sky blue
					lavender = "#e6b8d9",  -- sakura shadow
					text = "#f5e6eb",      -- soft cherry white
					subtext1 = "#e0ccd4",
					subtext0 = "#c9b3bc",
					overlay2 = "#a08a94",
					overlay1 = "#877078",
					overlay0 = "#6e5a62",
					surface2 = "#524148",  -- asphalt with pink hue
					surface1 = "#3d3238",
					surface0 = "#2e252a",
					base = "#1a1418",      -- dark road at dusk
					mantle = "#140f12",
					crust = "#0e0a0c",
				},
			},
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
