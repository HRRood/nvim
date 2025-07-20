return {
	{
		"lewis6991/gitsigns.nvim",
		event = { "BufReadPre", "BufNewFile" },
		opts = {
			signs = {
				add = { text = "│" },
				change = { text = "│" },
				delete = { text = "_" },
				topdelete = { text = "‾" },
				changedelete = { text = "~" },
				untracked = { text = "┆" },
			},
			signcolumn = true, -- Toggle with `:Gitsigns toggle_signs`
			numhl = false, -- Toggle with `:Gitsigns toggle_numhl`
			linehl = false, -- Toggle with `:Gitsigns toggle_linehl`
			word_diff = false, -- Toggle with `:Gitsigns toggle_word_diff`
			watch_gitdir = {
				follow_files = true,
			},
			attach_to_untracked = true,
			current_line_blame = true, -- Toggle with `:Gitsigns toggle_current_line_blame`
			current_line_blame_opts = {
				virt_text = true,
				virt_text_pos = "eol", -- 'eol' | 'overlay' | 'right_align'
				delay = 1000,
				ignore_whitespace = false,
			},
			current_line_blame_formatter = "<author>, <author_time:%Y-%m-%d> - <summary>",
			sign_priority = 6,
			update_debounce = 100,
			status_formatter = nil, -- Use default
			max_file_length = 40000, -- Disable if file is longer than this (in lines)
			preview_config = {
				-- Options passed to nvim_open_win
				border = "single",
				style = "minimal",
				relative = "cursor",
				row = 0,
				col = 1,
			},
			on_attach = function(bufnr)
				local gs = package.loaded.gitsigns

				local function map(mode, l, r, opts)
					opts = opts or {}
					opts.buffer = bufnr
					vim.keymap.set(mode, l, r, opts)
				end

				-- Navigation
				map("n", "]c", function()
					if vim.wo.diff then
						return "]c"
					end
					vim.schedule(function()
						gs.next_hunk()
					end)
					return "<Ignore>"
				end, { expr = true, desc = "Next hunk" })

				map("n", "[c", function()
					if vim.wo.diff then
						return "[c"
					end
					vim.schedule(function()
						gs.prev_hunk()
					end)
					return "<Ignore>"
				end, { expr = true, desc = "Previous hunk" })

				-- Actions
				map("n", "<leader>hs", gs.stage_hunk, { desc = "Stage hunk" })
				map("n", "<leader>hr", gs.reset_hunk, { desc = "Reset hunk" })
				map("v", "<leader>hs", function()
					gs.stage_hunk({ vim.fn.line("."), vim.fn.line("v") })
				end, { desc = "Stage hunk" })
				map("v", "<leader>hr", function()
					gs.reset_hunk({ vim.fn.line("."), vim.fn.line("v") })
				end, { desc = "Reset hunk" })
				map("n", "<leader>hS", gs.stage_buffer, { desc = "Stage buffer" })
				map("n", "<leader>hu", gs.undo_stage_hunk, { desc = "Undo stage hunk" })
				map("n", "<leader>hR", gs.reset_buffer, { desc = "Reset buffer" })
				map("n", "<leader>hp", gs.preview_hunk, { desc = "Preview hunk" })
				map("n", "<leader>hb", function()
					gs.blame_line({ full = true })
				end, { desc = "Blame line" })
				map("n", "<leader>tb", gs.toggle_current_line_blame, { desc = "Toggle line blame" })
				map("n", "<leader>hd", gs.diffthis, { desc = "Diff this" })
				map("n", "<leader>hD", function()
					gs.diffthis("~")
				end, { desc = "Diff this ~" })
				map("n", "<leader>td", gs.toggle_deleted, { desc = "Toggle deleted" })

				-- Text object
				map({ "o", "x" }, "ih", ":<C-U>Gitsigns select_hunk<CR>", { desc = "Select hunk" })
			end,
		},
	},

	-- Fugitive - Comprehensive Git wrapper
	{
		"tpope/vim-fugitive",
		cmd = {
			"G",
			"Git",
			"Gdiffsplit",
			"Gread",
			"Gwrite",
			"Ggrep",
			"GMove",
			"GDelete",
			"GBrowse",
			"GRemove",
			"GRename",
			"Glgrep",
			"Gedit",
		},
		ft = { "fugitive" },
		keys = {
			{ "<leader>gs", "<cmd>Git<cr>", desc = "Git status" },
			{ "<leader>gc", "<cmd>Git commit<cr>", desc = "Git commit" },
			{ "<leader>gp", "<cmd>Git push<cr>", desc = "Git push" },
			{ "<leader>gP", "<cmd>Git pull<cr>", desc = "Git pull" },
			{ "<leader>gb", "<cmd>Git blame<cr>", desc = "Git blame" },
			{ "<leader>gd", "<cmd>Gdiffsplit<cr>", desc = "Git diff split" },
			{ "<leader>gl", "<cmd>Git log<cr>", desc = "Git log" },
		},
	},

	-- Git Conflict Resolution
	{
		"akinsho/git-conflict.nvim",
		version = "*",
		config = function()
			require("git-conflict").setup({
				default_mappings = true, -- disable buffer local mapping created by this plugin
				default_commands = true, -- disable commands created by this plugin
				disable_diagnostics = false, -- This will disable the diagnostics in a buffer whilst it is conflicted
				list_opener = "copen", -- command or function to open the conflicts list
				highlights = { -- They must have background color, otherwise the default color will be used
					incoming = "DiffAdd",
					current = "DiffText",
				},
			})
		end,
	},

	-- Enhanced Git UI
	{
		"NeogitOrg/neogit",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"sindrets/diffview.nvim",
			"nvim-telescope/telescope.nvim",
		},
		config = function()
			local neogit = require("neogit")
			neogit.setup({
				disable_signs = false,
				disable_hint = false,
				disable_context_highlighting = false,
				disable_commit_confirmation = false,
				auto_refresh = true,
				sort_branches = "-committerdate",
				disable_builtin_notifications = false,
				use_magit_keybindings = false,
				kind = "tab",
				console_timeout = 2000,
				auto_show_console = true,
				remember_settings = true,
				use_per_project_settings = true,
				ignored_settings = {},
				git_services = {
					["github.com"] = "https://github.com/${owner}/${repository}/compare/${branch_name}?expand=1",
					["bitbucket.org"] = "https://bitbucket.org/${owner}/${repository}/pull-requests/new?source=${branch_name}&t=1",
					["gitlab.com"] = "https://gitlab.com/${owner}/${repository}/-/merge_requests/new?merge_request[source_branch]=${branch_name}",
				},
				telescope_sorter = function()
					return require("telescope").extensions.fzf.native_fzf_sorter()
				end,
				mappings = {
					commit_editor = {
						["q"] = "Close",
						["<c-c><c-c>"] = "Submit",
						["<c-c><c-k>"] = "Abort",
					},
					rebase_editor = {
						["p"] = "Pick",
						["r"] = "Reword",
						["e"] = "Edit",
						["s"] = "Squash",
						["f"] = "Fixup",
						["x"] = "Execute",
						["d"] = "Drop",
						["b"] = "Break",
						["q"] = "Close",
						["<cr>"] = "OpenCommit",
						["gk"] = "MoveUp",
						["gj"] = "MoveDown",
						["<c-c><c-c>"] = "Submit",
						["<c-c><c-k>"] = "Abort",
					},
					finder = {
						["<cr>"] = "Select",
						["<c-c>"] = "Close",
						["<esc>"] = "Close",
						["<c-n>"] = "Next",
						["<c-p>"] = "Previous",
						["<down>"] = "Next",
						["<up>"] = "Previous",
						["<tab>"] = "MultiselectToggleNext",
						["<s-tab>"] = "MultiselectTogglePrevious",
						["<c-j>"] = "NOP",
					},
					popup = {
						["?"] = "HelpPopup",
						["A"] = "CherryPickPopup",
						["D"] = "DiffPopup",
						["M"] = "RemotePopup",
						["P"] = "PushPopup",
						["X"] = "ResetPopup",
						["Z"] = "StashPopup",
						["b"] = "BranchPopup",
						["c"] = "CommitPopup",
						["f"] = "FetchPopup",
						["l"] = "LogPopup",
						["m"] = "MergePopup",
						["p"] = "PullPopup",
						["r"] = "RebasePopup",
						["t"] = "TagPopup",
					},
					status = {
						["q"] = "Close",
						["I"] = "InitRepo",
						["1"] = "Depth1",
						["2"] = "Depth2",
						["3"] = "Depth3",
						["4"] = "Depth4",
						["<tab>"] = "Toggle",
						["x"] = "Discard",
						["s"] = "Stage",
						["S"] = "StageUnstaged",
						["<c-s>"] = "StageAll",
						["u"] = "Unstage",
						["U"] = "UnstageStaged",
						["$"] = "CommandHistory",
						["<c-r>"] = "RefreshBuffer",
						["<enter>"] = "GoToFile",
						["<c-v>"] = "VSplitOpen",
						["<c-x>"] = "SplitOpen",
						["<c-t>"] = "TabOpen",
						["{"] = "GoToPreviousHunkHeader",
						["}"] = "GoToNextHunkHeader",
					},
				},
				sections = {
					sequencer = {
						folded = false,
						hidden = false,
					},
					untracked = {
						folded = false,
						hidden = false,
					},
					unstaged = {
						folded = false,
						hidden = false,
					},
					staged = {
						folded = false,
						hidden = false,
					},
					stashes = {
						folded = true,
						hidden = false,
					},
					unpulled_upstream = {
						folded = true,
						hidden = false,
					},
					unmerged_upstream = {
						folded = false,
						hidden = false,
					},
					unpulled_pushRemote = {
						folded = true,
						hidden = false,
					},
					unmerged_pushRemote = {
						folded = false,
						hidden = false,
					},
					recent = {
						folded = true,
						hidden = false,
					},
					rebase = {
						folded = true,
						hidden = false,
					},
				},
				signs = {
					hunk = { "", "" },
					item = { ">", "v" },
					section = { ">", "v" },
				},
			})

			-- Keybindings for Neogit
			vim.keymap.set("n", "<leader>gg", neogit.open, { desc = "Open Neogit" })
			vim.keymap.set("n", "<leader>gG", function()
				neogit.open({ kind = "vsplit" })
			end, { desc = "Open Neogit vsplit" })
		end,
	},

	-- Diffview for better diff visualization
	{
		"sindrets/diffview.nvim",
		dependencies = "nvim-lua/plenary.nvim",
		keys = {
			{ "<leader>gv", "<cmd>DiffviewOpen<cr>", desc = "Open Diffview" },
			{ "<leader>gV", "<cmd>DiffviewClose<cr>", desc = "Close Diffview" },
			{ "<leader>gh", "<cmd>DiffviewFileHistory<cr>", desc = "File history" },
			{ "<leader>gH", "<cmd>DiffviewFileHistory %<cr>", desc = "Current file history" },
		},
		config = function()
			require("diffview").setup({
				diff_binaries = false,
				enhanced_diff_hl = false,
				git_cmd = { "git" },
				use_icons = true,
				watch_index = true,
				icons = {
					folder_closed = "",
					folder_open = "",
				},
				signs = {
					fold_closed = "",
					fold_open = "",
					done = "✓",
				},
				view = {
					default = {
						layout = "diff2_horizontal",
						winbar_info = false,
					},
					merge_tool = {
						layout = "diff3_horizontal",
						disable_diagnostics = true,
						winbar_info = true,
					},
					file_history = {
						layout = "diff2_horizontal",
						winbar_info = false,
					},
				},
				file_panel = {
					listing_style = "tree",
					tree_options = {
						flatten_dirs = true,
						folder_statuses = "only_folded",
					},
					win_config = {
						position = "left",
						width = 35,
						win_opts = {},
					},
				},
				file_history_panel = {
					log_options = {
						git = {
							single_file = {
								diff_merges = "combined",
							},
							multi_file = {
								diff_merges = "first-parent",
							},
						},
					},
					win_config = {
						position = "bottom",
						height = 16,
						win_opts = {},
					},
				},
				commit_log_panel = {
					win_config = {
						win_opts = {},
					},
				},
				default_args = {
					DiffviewOpen = {},
					DiffviewFileHistory = {},
				},
				hooks = {},
				keymaps = {
					disable_defaults = false,
					view = {
						{ "n", "<tab>", "<cmd>DiffviewToggleFiles<cr>", { desc = "Toggle the file panel." } },
						{
							"n",
							"gf",
							"<cmd>DiffviewGoToFile<cr>",
							{ desc = "Open the file in the previous tabpage" },
						},
						{ "n", "<C-w><C-f>", "<cmd>DiffviewToggleFiles<cr>", { desc = "Toggle the file panel" } },
					},
					diff1 = {
						{ "n", "g?", "<cmd>h diffview-maps-diff1<cr>", { desc = "Open the help panel" } },
					},
					diff2 = {
						{ "n", "g?", "<cmd>h diffview-maps-diff2<cr>", { desc = "Open the help panel" } },
					},
					diff3 = {
						{
							{ "n", "x" },
							"2do",
							{ desc = "Obtain the diff hunk from the MERGE_HEAD version of the file" },
						},
						{
							{ "n", "x" },
							"3do",
							{ desc = "Obtain the diff hunk from the MERGE_HEAD version of the file" },
						},
						{ "n", "g?", "<cmd>h diffview-maps-diff3<cr>", { desc = "Open the help panel" } },
					},
					diff4 = {
						{ { "n", "x" }, "1do", { desc = "Obtain the diff hunk from the BASE version of the file" } },
						{ { "n", "x" }, "2do", { desc = "Obtain the diff hunk from the LOCAL version of the file" } },
						{ { "n", "x" }, "3do", { desc = "Obtain the diff hunk from the REMOTE version of the file" } },
						{ "n", "g?", "<cmd>h diffview-maps-diff4<cr>", { desc = "Open the help panel" } },
					},
					file_panel = {
						{
							"n",
							"j",
							"j",
							{ desc = "Bring the cursor to the next file entry" },
						},
						{
							"n",
							"<down>",
							"j",
							{ desc = "Bring the cursor to the next file entry" },
						},
						{
							"n",
							"k",
							"k",
							{ desc = "Bring the cursor to the previous file entry." },
						},
						{
							"n",
							"<up>",
							"k",
							{ desc = "Bring the cursor to the previous file entry." },
						},
						{
							"n",
							"<cr>",
							"<cmd>DiffviewOpen<cr>",
							{ desc = "Open the diff for the selected entry." },
						},
						{
							"n",
							"o",
							"<cmd>DiffviewOpen<cr>",
							{ desc = "Open the diff for the selected entry." },
						},
						{
							"n",
							"l",
							"<cmd>DiffviewOpen<cr>",
							{ desc = "Open the diff for the selected entry." },
						},
						{
							"n",
							"<2-LeftMouse>",
							"<cmd>DiffviewOpen<cr>",
							{ desc = "Open the diff for the selected entry." },
						},
						{ "n", "-", "<cmd>DiffviewToggleFiles<cr>", { desc = "Toggle the file panel" } },
						{ "n", "h", "<cmd>DiffviewClose<cr>", { desc = "Close the diff view." } },
						{ "n", "q", "<cmd>DiffviewClose<cr>", { desc = "Close the diff view." } },
						{
							"n",
							"R",
							"<cmd>DiffviewRefresh<cr>",
							{ desc = "Update stats and entries in the file list." },
						},
						{ "n", "<tab>", "<cmd>DiffviewToggleFiles<cr>", { desc = "Toggle the file panel" } },
						{
							"n",
							"gf",
							"<cmd>DiffviewGoToFile<cr>",
							{ desc = "Open the file in the previous tabpage" },
						},
						{ "n", "<C-w><C-f>", "<cmd>DiffviewToggleFiles<cr>", { desc = "Toggle the file panel" } },
						{ "n", "g<C-x>", "<cmd>DiffviewToggleFiles<cr>", { desc = "Toggle the file panel" } },
						{
							"n",
							"g?",
							"<cmd>h diffview-maps-file-panel<cr>",
							{ desc = "Open the help panel" },
						},
					},
					file_history_panel = {
						{ "n", "g!", "<cmd>DiffviewOptions<cr>", { desc = "Open the option panel" } },
						{ "n", "<C-A-d>", "<cmd>DiffviewToggleFiles<cr>", { desc = "Toggle the file panel" } },
						{ "n", "g<C-x>", "<cmd>DiffviewToggleFiles<cr>", { desc = "Toggle the file panel" } },
						{
							"n",
							"g?",
							"<cmd>h diffview-maps-file-history-panel<cr>",
							{ desc = "Open the help panel" },
						},
					},
					option_panel = {
						{ "n", "<tab>", "<cmd>DiffviewToggleFiles<cr>", { desc = "Toggle the file panel" } },
						{ "n", "q", "<cmd>DiffviewClose<cr>", { desc = "Close the diff view" } },
						{ "n", "g?", "<cmd>h diffview-maps-option-panel<cr>", { desc = "Open the help panel" } },
					},
				},
			})
		end,
	},

	-- Git worktree management
	{
		"ThePrimeagen/git-worktree.nvim",
		dependencies = {
			"nvim-telescope/telescope.nvim",
		},
		config = function()
			require("git-worktree").setup()
			require("telescope").load_extension("git_worktree")

			vim.keymap.set(
				"n",
				"<leader>gw",
				require("telescope").extensions.git_worktree.git_worktrees,
				{ desc = "Git worktrees" }
			)
			vim.keymap.set(
				"n",
				"<leader>gW",
				require("telescope").extensions.git_worktree.create_git_worktree,
				{ desc = "Create worktree" }
			)
		end,
	},
}
