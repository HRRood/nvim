return {
	"supermaven-inc/supermaven-nvim",
	event = "InsertEnter",
	config = function()
		require("supermaven-nvim").setup({
			-- <Tab> is handled in blink-cmp.lua so it can fall through to snippet jumps
			disable_keymaps = true,
		})
		vim.keymap.set("i", "<C-]>", function()
			require("supermaven-nvim.completion_preview").on_dispose_inlay()
		end, { desc = "Clear Supermaven suggestion" })
	end,
}
