return {
	"folke/twilight.nvim",
	cmd = { "Twilight", "TwilightEnable", "TwilightDisable" },
	keys = {
		{ "<leader>zt", "<cmd>Twilight<cr>", desc = "Toggle Twilight" },
	},
	opts = {
		dimming = {
			alpha = 0.25,
			color = { "Normal", "#ffffff" },
			term_bg = "#000000",
			inactive = false,
		},
		context = 10,
		treesitter = true,
		expand = {
			"function",
			"method",
			"table",
			"if_statement",
			"function_definition",
			"method_definition",
			"arrow_function",
			"function_declaration",
		},
		exclude = {},
	},
}
