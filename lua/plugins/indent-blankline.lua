return {
	"lukas-reineke/indent-blankline.nvim",
	main = "ibl",
	event = { "BufReadPost", "BufNewFile" },
	opts = {
		indent = {
			char = "│",
			tab_char = "│",
		},
		scope = {
			enabled = true,
			show_start = true,
			show_end = false,
			injected_languages = true,
			highlight = { "Function", "Label" },
			priority = 500,
		},
		exclude = {
			filetypes = {
				"help",
				"alpha",
				"dashboard",
				"neo-tree",
				"Trouble",
				"trouble",
				"lazy",
				"mason",
				"notify",
				"toggleterm",
				"lazyterm",
				"snacks_dashboard",
				"oil",
			},
		},
	},
	config = function(_, opts)
		-- Catppuccin Mocha colors for indent guides
		local hooks = require("ibl.hooks")

		hooks.register(hooks.type.HIGHLIGHT_SETUP, function()
			vim.api.nvim_set_hl(0, "IblIndent", { fg = "#313244" }) -- Surface0 - subtle
			vim.api.nvim_set_hl(0, "IblScope", { fg = "#cba6f7" }) -- Mauve - current scope
		end)

		opts.indent.highlight = { "IblIndent" }
		opts.scope.highlight = { "IblScope" }

		require("ibl").setup(opts)
	end,
}
