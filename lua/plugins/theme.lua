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
					maroon = "#f47c7c",    -- soft coral red (parameters)
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
			highlight_overrides = {
				mocha = function(colors)
					return {
						-- ═══ Cursor & Line ═══
						CursorLine = { bg = "#2a1f24" },
						CursorLineNr = { fg = "#dc143c", style = { "bold" } },
						LineNr = { fg = "#a08a94" },
						Cursor = { fg = "#1a1418", bg = "#ffb7c5" },
						lCursor = { fg = "#1a1418", bg = "#ffb7c5" },

						-- ═══ Visual Selection ═══
						Visual = { bg = "#3d2833", style = { "bold" } },
						VisualNOS = { bg = "#3d2833" },

						-- ═══ Search ═══
						Search = { fg = "#1a1418", bg = "#ffe066", style = { "bold" } },
						IncSearch = { fg = "#1a1418", bg = "#dc143c", style = { "bold" } },
						CurSearch = { fg = "#1a1418", bg = "#dc143c", style = { "bold" } },
						Substitute = { fg = "#1a1418", bg = "#ffb7c5" },

						-- ═══ Matching ═══
						MatchParen = { fg = "#ffb7c5", bg = "#524148", style = { "bold" } },

						-- ═══ Floating Windows ═══
						NormalFloat = { bg = "#1a1418" },
						FloatBorder = { fg = "#dc143c", bg = "#1a1418" },
						FloatTitle = { fg = "#ffb7c5", bg = "#1a1418", style = { "bold" } },

						-- ═══ Telescope ═══
						TelescopeSelection = { fg = "#ffb7c5", bg = "#2a1f24", style = { "bold" } },
						TelescopeSelectionCaret = { fg = "#dc143c", bg = "#2a1f24" },
						TelescopeBorder = { fg = "#dc143c", bg = "NONE" },
						TelescopePromptBorder = { fg = "#dc143c", bg = "NONE" },
						TelescopeResultsBorder = { fg = "#524148", bg = "NONE" },
						TelescopePreviewBorder = { fg = "#524148", bg = "NONE" },
						TelescopePromptTitle = { fg = "#1a1418", bg = "#dc143c", style = { "bold" } },
						TelescopeResultsTitle = { fg = "#1a1418", bg = "#ffb7c5", style = { "bold" } },
						TelescopePreviewTitle = { fg = "#1a1418", bg = "#50c878", style = { "bold" } },
						TelescopeMatching = { fg = "#ffe066", style = { "bold" } },

						-- ═══ Git Signs ═══
						GitSignsAdd = { fg = "#50c878" },
						GitSignsChange = { fg = "#ffb86c" },
						GitSignsDelete = { fg = "#dc143c" },
						GitSignsAddNr = { fg = "#50c878" },
						GitSignsChangeNr = { fg = "#ffb86c" },
						GitSignsDeleteNr = { fg = "#dc143c" },
						GitSignsAddLn = { bg = "#1f2a1f" },
						GitSignsChangeLn = { bg = "#2a2520" },
						GitSignsDeleteLn = { bg = "#2a1f1f" },

						-- ═══ Diff ═══
						DiffAdd = { bg = "#1f2a1f" },
						DiffChange = { bg = "#2a2520" },
						DiffDelete = { fg = "#dc143c", bg = "#2a1f1f" },
						DiffText = { bg = "#3d3028" },

						-- ═══ Diagnostics ═══
						DiagnosticError = { fg = "#dc143c" },
						DiagnosticWarn = { fg = "#ffb86c" },
						DiagnosticInfo = { fg = "#87ceeb" },
						DiagnosticHint = { fg = "#dda0dd" },
						DiagnosticVirtualTextError = { fg = "#dc143c", bg = "#2a1f1f", style = { "italic" } },
						DiagnosticVirtualTextWarn = { fg = "#ffb86c", bg = "#2a2520", style = { "italic" } },
						DiagnosticVirtualTextInfo = { fg = "#87ceeb", bg = "#1f2528", style = { "italic" } },
						DiagnosticVirtualTextHint = { fg = "#dda0dd", bg = "#28202a", style = { "italic" } },

						-- ═══ Indent & Whitespace ═══
						IndentBlanklineChar = { fg = "#3d3238" },
						IndentBlanklineContextChar = { fg = "#dc143c" },
						IblIndent = { fg = "#3d3238" },
						IblScope = { fg = "#dc143c" },

						-- ═══ Window & Statusline ═══
						WinSeparator = { fg = "#dc143c" },
						VertSplit = { fg = "#dc143c" },
						StatusLine = { fg = "#f5e6eb", bg = "#2a1f24" },
						StatusLineNC = { fg = "#877078", bg = "#1a1418" },

						-- ═══ Pmenu (Autocomplete) ═══
						Pmenu = { fg = "#f5e6eb", bg = "#1a1418" },
						PmenuSel = { fg = "#1a1418", bg = "#ffb7c5", style = { "bold" } },
						PmenuSbar = { bg = "#2e252a" },
						PmenuThumb = { bg = "#dc143c" },

						-- ═══ Todo Comments ═══
						["@text.todo"] = { fg = "#1a1418", bg = "#dc143c", style = { "bold" } },
						["@text.note"] = { fg = "#1a1418", bg = "#87ceeb", style = { "bold" } },
						["@text.warning"] = { fg = "#1a1418", bg = "#ffb86c", style = { "bold" } },
						["@text.danger"] = { fg = "#1a1418", bg = "#dc143c", style = { "bold" } },
						Todo = { fg = "#1a1418", bg = "#dc143c", style = { "bold" } },

						-- ═══ Treesitter Context ═══
						TreesitterContext = { bg = "#2a1f24" },
						TreesitterContextLineNumber = { fg = "#dc143c", bg = "#2a1f24" },

						-- ═══ Which Key ═══
						WhichKey = { fg = "#ffb7c5" },
						WhichKeyGroup = { fg = "#dc143c", style = { "bold" } },
						WhichKeySeparator = { fg = "#524148" },
						WhichKeyDesc = { fg = "#f5e6eb" },
						WhichKeyBorder = { fg = "#dc143c" },

						-- ═══ Notify ═══
						NotifyERRORBorder = { fg = "#dc143c" },
						NotifyWARNBorder = { fg = "#ffb86c" },
						NotifyINFOBorder = { fg = "#87ceeb" },
						NotifyDEBUGBorder = { fg = "#dda0dd" },
						NotifyTRACEBorder = { fg = "#ffb7c5" },
						NotifyERRORIcon = { fg = "#dc143c" },
						NotifyWARNIcon = { fg = "#ffb86c" },
						NotifyINFOIcon = { fg = "#87ceeb" },
						NotifyDEBUGIcon = { fg = "#dda0dd" },
						NotifyTRACEIcon = { fg = "#ffb7c5" },
						NotifyERRORTitle = { fg = "#dc143c", style = { "bold" } },
						NotifyWARNTitle = { fg = "#ffb86c", style = { "bold" } },
						NotifyINFOTitle = { fg = "#87ceeb", style = { "bold" } },
						NotifyDEBUGTitle = { fg = "#dda0dd", style = { "bold" } },
						NotifyTRACETitle = { fg = "#ffb7c5", style = { "bold" } },

						-- ═══ Noice ═══
						NoiceCmdlinePopupBorder = { fg = "#dc143c" },
						NoiceCmdlineIcon = { fg = "#ffb7c5" },
						NoiceConfirmBorder = { fg = "#dc143c" },
					}
				end,
			},
			integrations = {
				aerial = true,
				blink_cmp = true,
				diffview = true,
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
