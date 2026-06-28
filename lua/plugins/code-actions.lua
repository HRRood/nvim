return {
	"Chaitanyabsprip/fastaction.nvim",
	event = "LspAttach",
	opts = {
		dismiss_keys = { "j", "k", "<c-c>", "q" },
		popup = {
			border = "rounded",
			title = "Code Actions",
			title_pos = "center",
			zindex = 100,
		},
		priority = {
			-- TypeScript / JavaScript (shared rules)
			typescript = {
				{ pattern = "add import", key = "i", order = 1 },
				{ pattern = "import", key = "i", order = 2 },
				{ pattern = "remove unused import", key = "r", order = 3 },
				{ pattern = "remove unused", key = "u", order = 4 },
				{ pattern = "add missing", key = "a", order = 5 },
				{ pattern = "fix all", key = "f", order = 6 },
				{ pattern = "disable .+ for this line", key = "D", order = 90 },
				{ pattern = "disable .+ for the entire file", key = "F", order = 91 },
				{ pattern = "show documentation", key = "?", order = 92 },
			},
			-- .tsx files use filetype typescriptreact
			typescriptreact = {
				{ pattern = "add import", key = "i", order = 1 },
				{ pattern = "import", key = "i", order = 2 },
				{ pattern = "remove unused import", key = "r", order = 3 },
				{ pattern = "remove unused", key = "u", order = 4 },
				{ pattern = "add missing", key = "a", order = 5 },
				{ pattern = "fix all", key = "f", order = 6 },
				{ pattern = "disable .+ for this line", key = "D", order = 90 },
				{ pattern = "disable .+ for the entire file", key = "F", order = 91 },
				{ pattern = "show documentation", key = "?", order = 92 },
			},
			javascript = {
				{ pattern = "import", key = "i", order = 1 },
				{ pattern = "remove unused", key = "r", order = 2 },
				{ pattern = "disable", key = "D", order = 90 },
				{ pattern = "show documentation", key = "?", order = 91 },
			},
			-- PHP
			php = {
				{ pattern = "import", key = "i", order = 1 },
				{ pattern = "remove unused", key = "r", order = 2 },
				{ pattern = "add", key = "a", order = 3 },
			},
		},
	},
}
