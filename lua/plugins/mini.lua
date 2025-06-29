return {
	"echasnovski/mini.nvim",
	config = function()
		-- mini.ai - enhanced text objects
		require("mini.ai").setup({ n_lines = 500 })

		-- mini.surround - add/delete/change surroundings
		require("mini.surround").setup()

		-- mini.statusline - simple statusline
		local statusline = require("mini.statusline")
		statusline.setup({ use_icons = vim.g.have_nerd_font })
		statusline.section_location = function()
			return "%2l:%-2v"
		end

		-- mini.pairs - auto pairs like brackets and quotes
		require("mini.pairs").setup()

		-- mini.comment - commenting with gcc, gc, etc.
		require("mini.comment").setup()

		-- mini.indentscope - visual indent guides
		require("mini.indentscope").setup({
			symbol = "│",
			options = { try_as_border = true },
		})

		-- mini.trailspace - trailing whitespace cleaner
		-- require("mini.trailspace").setup()
		-- mini.move - move lines/selections with arrow keys
		require("mini.move").setup({
			mappings = {
				line_left = "<Left>",
				line_right = "<Right>",
				line_down = "<Down>",
				line_up = "<Up>",
			},
		})
	end,
}
