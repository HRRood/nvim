return {
	"romgrk/barbar.nvim",
	dependencies = {},
	init = function()
		vim.g.barbar_auto_setup = false
		local map = vim.api.nvim_set_keymap
		local opts = { noremap = true, silent = true }
		map("n", "<A-,>", "<Cmd>BufferPrevious<CR>", opts)
		map("n", "<A-.>", "<Cmd>BufferNext<CR>", opts)
		map("n", "<A-<>", "<Cmd>BufferMovePrevious<CR>", opts)
		map("n", "<A->>", "<Cmd>BufferMoveNext<CR>", opts)
		map("n", "<A-1>", "<Cmd>BufferGoto 1<CR>", opts)
		map("n", "<A-2>", "<Cmd>BufferGoto 2<CR>", opts)
		map("n", "<A-3>", "<Cmd>BufferGoto 3<CR>", opts)
		map("n", "<A-4>", "<Cmd>BufferGoto 4<CR>", opts)
		map("n", "<A-5>", "<Cmd>BufferGoto 5<CR>", opts)
		map("n", "<A-6>", "<Cmd>BufferGoto 6<CR>", opts)
		map("n", "<A-7>", "<Cmd>BufferGoto 7<CR>", opts)
		map("n", "<A-8>", "<Cmd>BufferGoto 8<CR>", opts)
		map("n", "<A-9>", "<Cmd>BufferGoto 9<CR>", opts)
		map("n", "<leader>bc", "<Cmd>BufferClose<CR>", { noremap = true, silent = true })
		map("n", "<leader>ba", "<Cmd>BufferCloseAllButCurrent<CR>", { noremap = true, silent = true })
		map("n", "<A-p>", "<Cmd>BufferPick<CR>", opts)
		map("n", "<leader>bb", "<Cmd>BufferOrderByBufferNumber<CR>", opts)
		map("n", "<leader>bn", "<Cmd>BufferOrderByName<CR>", opts)
		map("n", "<leader>bd", "<Cmd>BufferOrderByDirectory<CR>", opts)
	end,
	config = function()
		require("barbar").setup({
			icons = {
				filetype = {
					enabled = true,
				},
			},
			offsets = {
				{
					filetype = "neo-tree",
					text = "Hello There", -- no label, so bufferline is next to Neo-tree
				},
			},
		})
	end,
	version = "^1.0.0",
}
