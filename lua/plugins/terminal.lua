return {
	"akinsho/toggleterm.nvim",
	version = "*",
	config = function()
		require("toggleterm").setup({
			size = function(term)
				if term.direction == "horizontal" then
					return 15
				elseif term.direction == "vertical" then
					return vim.o.columns * 0.4
				end
			end,
			open_mapping = [[<c-\>]],
			shade_terminals = true,
			shading_factor = 4, -- The degree of shading applied for terminals
			start_in_insert = true,
			insert_mappings = true, -- Allow terminal to be opened using the specified mapping in insert mode
			persist_size = true,
			-- direction = "float", -- Open terminal as a floating window
			close_on_exit = true, -- Close the terminal window when the process exits
			shell = vim.o.shell, -- Use the default shell
			float_opts = {
				border = "curved", -- Style of border for floating terminal ('single', 'double', 'curved', etc.)
				width = 120,
				height = 30,
				winblend = 3, -- Transparency level for floating terminal
			},
		})
	end,
}
