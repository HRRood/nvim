return {
	"HiPhish/rainbow-delimiters.nvim",
	event = { "BufReadPost", "BufNewFile" },
	config = function()
		local rainbow_delimiters = require("rainbow-delimiters")

		-- Catppuccin Mocha rainbow colors
		vim.api.nvim_set_hl(0, "RainbowDelimiterRed", { fg = "#f38ba8" }) -- Red
		vim.api.nvim_set_hl(0, "RainbowDelimiterYellow", { fg = "#f9e2af" }) -- Yellow
		vim.api.nvim_set_hl(0, "RainbowDelimiterBlue", { fg = "#89b4fa" }) -- Blue
		vim.api.nvim_set_hl(0, "RainbowDelimiterOrange", { fg = "#fab387" }) -- Peach
		vim.api.nvim_set_hl(0, "RainbowDelimiterGreen", { fg = "#a6e3a1" }) -- Green
		vim.api.nvim_set_hl(0, "RainbowDelimiterViolet", { fg = "#cba6f7" }) -- Mauve
		vim.api.nvim_set_hl(0, "RainbowDelimiterCyan", { fg = "#94e2d5" }) -- Teal

		vim.g.rainbow_delimiters = {
			strategy = {
				[""] = rainbow_delimiters.strategy["global"],
				vim = rainbow_delimiters.strategy["local"],
			},
			query = {
				[""] = "rainbow-delimiters",
				lua = "rainbow-blocks",
			},
			priority = {
				[""] = 110,
				lua = 210,
			},
			highlight = {
				"RainbowDelimiterRed",
				"RainbowDelimiterYellow",
				"RainbowDelimiterBlue",
				"RainbowDelimiterOrange",
				"RainbowDelimiterGreen",
				"RainbowDelimiterViolet",
				"RainbowDelimiterCyan",
			},
		}
	end,
}
