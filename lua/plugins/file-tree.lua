return {
	"nvim-neo-tree/neo-tree.nvim",
	branch = "v3.x",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-tree/nvim-web-devicons",
		"MunifTanjim/nui.nvim",
	},
	lazy = true,
	cmd = "Neotree",
	keys = {
		{
			"<leader>ee",
			function()
				require("neo-tree.command").execute({ toggle = true, reveal = true })
			end,
			desc = "Toggle file explorer",
		},
	},
	opts = {
		close_if_last_window = true,
		filesystem = {
			follow_current_file = {
				enabled = true,
				leave_dirs_open = false,
			},
			hijack_netrw_behavior = "disabled",
			use_libuv_file_watcher = true,
			filtered_items = {
				visible = false,
				hide_dotfiles = false,
				hide_gitignored = true,
				hide_by_name = { ".DS_Store", ".git" },
			},
		},
		window = {
			position = "left",
			width = 35,
		},
		default_component_configs = {
			git_status = {
				symbols = {
					added = "",
					modified = "",
					deleted = "✖",
					renamed = "󰁕",
					untracked = "",
					ignored = "",
					unstaged = "󰄱",
					staged = "",
					conflict = "",
				},
			},
		},
	},
}
