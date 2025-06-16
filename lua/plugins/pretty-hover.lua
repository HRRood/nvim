return {
	"Fildo7525/pretty_hover",
	event = "LspAttach",
	opts = {},
	config = function()
		require("pretty_hover").setup({
			border = "rounded",
			max_width = 80,
			max_height = 20,
			padding = 2,
			highlight_group = "NormalFloat",
			transparency = 10,
		})
		vim.api.nvim_set_keymap(
			"n",
			"K",
			"<cmd>lua require('pretty_hover').hover()<CR>",
			{ noremap = true, silent = true, desc = "Show hover information" }
		)
		-- add keybind for Close hover information
		vim.api.nvim_set_keymap(
			"n",
			"<leader>L",
			"<cmd>lua require('pretty_hover').close()<CR>",
			{ noremap = true, silent = true, desc = "Close hover information" }
		)
	end,
}
