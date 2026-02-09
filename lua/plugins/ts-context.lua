return {
	"nvim-treesitter/nvim-treesitter-context",
	event = "BufReadPost",
	dependencies = { "nvim-treesitter/nvim-treesitter" },
	opts = {
		enable = true,
		mode = "cursor",
		max_lines = 3,
	},
}
