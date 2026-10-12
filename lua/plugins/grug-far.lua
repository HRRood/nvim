return {
	"MagicDuck/grug-far.nvim",
	cmd = { "GrugFar", "GrugFarWithin" },
	keys = {
		{
			"<leader>sr",
			function()
				require("grug-far").open()
			end,
			desc = "Search & Replace (project)",
		},
		{
			"<leader>sw",
			function()
				require("grug-far").open({ prefills = { search = vim.fn.expand("<cword>") } })
			end,
			desc = "Search current word",
		},
		{
			"<leader>sw",
			function()
				require("grug-far").with_visual_selection()
			end,
			mode = "v",
			desc = "Search selection",
		},
		{
			"<leader>sp",
			function()
				require("grug-far").open({
					prefills = { search = vim.fn.expand("<cword>"), paths = vim.fn.expand("%") },
				})
			end,
			desc = "Search in current file",
		},
	},
	opts = {},
}
