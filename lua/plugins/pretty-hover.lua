-- Add this to your Lazy plugin spec list
return {
	"Fildo7525/pretty_hover",
	event = "LspAttach", -- Load when LSP attaches
	opts = {
		border = "rounded", -- or "single", "double", "solid", etc.
		max_width = 100,
		max_height = 200,
		padding = 2,
		close_events = { "CursorMoved", "BufHidden", "InsertCharPre" },
	},
	config = function(_, opts)
		require("pretty_hover").setup(opts)

		-- Example keybinding for triggering pretty_hover
		vim.keymap.set("n", "K", function()
			require("pretty_hover").hover()
		end, { desc = "Pretty Hover", noremap = true, silent = true })
	end,
}
