return {
	"romgrk/barbar.nvim",
	dependencies = {},
	init = function()
		vim.g.barbar_auto_setup = false
		local map = vim.api.nvim_set_keymap
		local opts = { noremap = true, silent = true }
		map("n", "<C-,>", "<Cmd>BufferPrevious<CR>", opts)
		map("n", "<C-.>", "<Cmd>BufferNext<CR>", opts)
		map("n", "<C-<>", "<Cmd>BufferMovePrevious<CR>", opts)
		map("n", "<C->>", "<Cmd>BufferMoveNext<CR>", opts)
		map("n", "<C-1>", "<Cmd>BufferGoto 1<CR>", opts)
		map("n", "<C-2>", "<Cmd>BufferGoto 2<CR>", opts)
		map("n", "<C-3>", "<Cmd>BufferGoto 3<CR>", opts)
		map("n", "<C-4>", "<Cmd>BufferGoto 4<CR>", opts)
		map("n", "<C-5>", "<Cmd>BufferGoto 5<CR>", opts)
		map("n", "<C-6>", "<Cmd>BufferGoto 6<CR>", opts)
		map("n", "<C-7>", "<Cmd>BufferGoto 7<CR>", opts)
		map("n", "<C-8>", "<Cmd>BufferGoto 8<CR>", opts)
		map("n", "<C-9>", "<Cmd>BufferGoto 9<CR>", opts)
		map("n", "<leader>bc", "<Cmd>BufferClose<CR>", { noremap = true, silent = true })
		map("n", "<leader>ba", "<Cmd>BufferCloseAllButCurrent<CR>", { noremap = true, silent = true })
		map("n", "<C-p>", "<Cmd>BufferPick<CR>", opts)
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
