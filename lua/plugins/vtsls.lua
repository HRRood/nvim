return {
	-- Extra commands for the vtsls TypeScript server (organize imports, file references, ...)
	-- and the client-side handling "Move to file" refactors need.
	"yioneko/nvim-vtsls",
	ft = { "javascript", "javascriptreact", "typescript", "typescriptreact" },
	keys = {
		{ "<leader>co", "<cmd>VtsExec organize_imports<cr>", desc = "Organize imports", ft = { "typescript", "typescriptreact", "javascript", "javascriptreact" } },
		{ "<leader>cM", "<cmd>VtsExec add_missing_imports<cr>", desc = "Add missing imports", ft = { "typescript", "typescriptreact", "javascript", "javascriptreact" } },
		{ "<leader>cu", "<cmd>VtsExec remove_unused_imports<cr>", desc = "Remove unused imports", ft = { "typescript", "typescriptreact", "javascript", "javascriptreact" } },
		{ "<leader>cF", "<cmd>VtsExec fix_all<cr>", desc = "Fix all TS issues", ft = { "typescript", "typescriptreact", "javascript", "javascriptreact" } },
		{ "<leader>cR", "<cmd>VtsExec file_references<cr>", desc = "File references", ft = { "typescript", "typescriptreact", "javascript", "javascriptreact" } },
		{ "<leader>cV", "<cmd>VtsExec select_ts_version<cr>", desc = "Select TS version", ft = { "typescript", "typescriptreact", "javascript", "javascriptreact" } },
	},
}
