return {
	"kylechui/nvim-surround",
	version = "^3.0.0", -- stable release
	event = "VeryLazy",
	config = function()
		require("nvim-surround").setup({
			-- Keymaps (these are the defaults, but it's nice to be explicit)
			keymaps = {
				insert = "<C-g>s", -- Insert surround in insert mode
				insert_line = "<C-g>S", -- Insert surround for whole line
				normal = "ys", -- Add surround (you surround)
				normal_cur = "yss", -- Add surround to current line
				normal_line = "yS", -- Add surround for whole line (big)
				normal_cur_line = "ySS",
				visual = "S", -- Surround selection
				visual_line = "gS", -- Surround line selection
				delete = "ds", -- Delete surround
				change = "cs", -- Change surround
			},
		})
	end,
}
