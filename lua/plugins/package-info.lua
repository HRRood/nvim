return {
	"vuki656/package-info.nvim",
	dependencies = { "MunifTanjim/nui.nvim" },
	ft = "json",
	config = function()
		require("package-info").setup({
			colors = {
				up_to_date = "#3C4048",
				outdated = "#fc514e",
			},
			icons = {
				enable = true,
				style = {
					up_to_date = "| ",
					outdated = "| ",
				},
			},
			autostart = true,
			hide_up_to_date = true,
			hide_unstable_versions = false,
		})

		-- Keymaps alleen actief in package.json
		vim.api.nvim_create_autocmd("BufEnter", {
			pattern = "package.json",
			callback = function()
				local opts = { silent = true, noremap = true, buffer = true }
				vim.keymap.set("n", "<leader>ns", require("package-info").show, vim.tbl_extend("force", opts, { desc = "Show package versions" }))
				vim.keymap.set("n", "<leader>nh", require("package-info").hide, vim.tbl_extend("force", opts, { desc = "Hide package versions" }))
				vim.keymap.set("n", "<leader>nu", require("package-info").update, vim.tbl_extend("force", opts, { desc = "Update package" }))
				vim.keymap.set("n", "<leader>nd", require("package-info").delete, vim.tbl_extend("force", opts, { desc = "Delete package" }))
				vim.keymap.set("n", "<leader>ni", require("package-info").install, vim.tbl_extend("force", opts, { desc = "Install new package" }))
				vim.keymap.set("n", "<leader>nc", require("package-info").change_version, vim.tbl_extend("force", opts, { desc = "Change package version" }))
			end,
		})
	end,
}
