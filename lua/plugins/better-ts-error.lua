return {
	{
		"OlegGulevskyy/better-ts-errors.nvim",
		dependencies = { "MunifTanjim/nui.nvim" },
		config = function()
			require("better-ts-errors").setup({
				keymaps = {
					toggle = "<leader>te", -- Toggle the error explanation
					go_to_definition = "<leader>tx", -- Jump to the error's definition
				},
			})
		end,
		event = "LspAttach", -- Ensure the plugin loads when the LSP attaches
	},
	{
		"folke/ts-comments.nvim",
		opts = {},
		event = "VeryLazy",
	},
}
