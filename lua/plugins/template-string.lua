return {
	"axelvc/template-string.nvim",
	event = "InsertEnter",
	ft = { "javascript", "typescript", "javascriptreact", "typescriptreact" },
	config = function()
		require("template-string").setup()
	end,
}
