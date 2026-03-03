return {
	"folke/zen-mode.nvim",
	cmd = "ZenMode",
	keys = {
		{ "<leader>zz", "<cmd>ZenMode<cr>", desc = "Toggle Zen Mode" },
	},
	dependencies = {
		"folke/twilight.nvim",
	},
	opts = {
		window = {
			backdrop = 0.95,
			width = 120,
			height = 1,
			options = {
				signcolumn = "no",
				number = false,
				relativenumber = false,
				cursorline = false,
				cursorcolumn = false,
				foldcolumn = "0",
				list = false,
			},
		},
		plugins = {
			options = {
				enabled = true,
				ruler = false,
				showcmd = false,
				laststatus = 0,
			},
			twilight = { enabled = true },
			gitsigns = { enabled = false },
			tmux = { enabled = false },
			kitty = {
				enabled = false,
				font = "+4",
			},
			alacritty = {
				enabled = false,
				font = "14",
			},
			wezterm = {
				enabled = false,
				font = "+4",
			},
		},
		on_open = function(win)
			vim.wo[win].wrap = true
			vim.wo[win].linebreak = true
		end,
		on_close = function()
			vim.wo.wrap = false
			vim.wo.linebreak = false
		end,
	},
}
