return {
	"coder/claudecode.nvim",
	dependencies = { "folke/snacks.nvim" },
	-- Load early so a `claude` started in another terminal can find Neovim (/ide)
	event = "VeryLazy",
	opts = {
		-- <leader>ks jumps into the Claude panel after sending the selection
		focus_after_send = true,
	},
	config = function(_, opts)
		require("claudecode").setup(opts)

		-- In the Claude panel you're in terminal mode, where the normal-mode <C-h>
		-- window mapping doesn't apply. Map it for that buffer only.
		vim.api.nvim_create_autocmd({ "TermOpen", "TermEnter", "BufEnter" }, {
			group = vim.api.nvim_create_augroup("claudecode-term-keys", { clear = true }),
			callback = function(event)
				if vim.bo[event.buf].buftype ~= "terminal" or vim.b[event.buf].claude_keys then
					return
				end
				local ok, term = pcall(require, "claudecode.terminal")
				if not ok or term.get_active_terminal_bufnr() ~= event.buf then
					return
				end
				vim.b[event.buf].claude_keys = true
				vim.keymap.set("t", "<C-h>", "<C-\\><C-n><C-w>h", { buffer = event.buf, desc = "Move to left window" })
			end,
		})
	end,
	keys = {
		{ "<leader>k", nil, desc = "Claude Code" },
		{ "<leader>kk", "<cmd>ClaudeCode<cr>", desc = "Toggle Claude" },
		{ "<leader>kf", "<cmd>ClaudeCodeFocus<cr>", desc = "Focus Claude" },
		{ "<leader>kr", "<cmd>ClaudeCode --resume<cr>", desc = "Resume a conversation" },
		{ "<leader>kc", "<cmd>ClaudeCode --continue<cr>", desc = "Continue last conversation" },
		{ "<leader>km", "<cmd>ClaudeCodeSelectModel<cr>", desc = "Select model" },
		{ "<leader>kb", "<cmd>ClaudeCodeAdd %<cr>", desc = "Add current file" },
		{ "<leader>ks", "<cmd>ClaudeCodeSend<cr>", mode = "v", desc = "Send selection" },
		{
			"<leader>ks",
			"<cmd>ClaudeCodeTreeAdd<cr>",
			desc = "Add file from tree",
			ft = { "neo-tree", "oil" },
		},
		{ "<leader>ka", "<cmd>ClaudeCodeDiffAccept<cr>", desc = "Accept diff" },
		{ "<leader>kd", "<cmd>ClaudeCodeDiffDeny<cr>", desc = "Deny diff" },
	},
}
