return {
	{
		"willothy/flatten.nvim",
		config = true,
		-- or pass configuration with
		-- opts = {  }
		-- Ensure that it runs first to minimize delay when opening file from terminal
		lazy = false,
		priority = 1001,
	},
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
			"Gstatus",
		},
		ft = { "fugitive" },
		keys = {
			-- Algemene Git commands
			{ "<leader>gs", "<cmd>Git<cr>", desc = "Git status (Fugitive)" },
			{ "<leader>gc", "<cmd>Git commit<cr>", desc = "Git commit" },
			{ "<leader>ga", "<cmd>Git add .<cr>", desc = "Git add all" },
			{ "<leader>gp", "<cmd>Git push<cr>", desc = "Git push" },
			{ "<leader>gP", "<cmd>Git pull<cr>", desc = "Git pull" },
			{ "<leader>gb", "<cmd>Git blame<cr>", desc = "Git blame" },
			{ "<leader>gl", "<cmd>Git log<cr>", desc = "Git log" },

			-- Diff en merge functionaliteit
			{ "<leader>gd", "<cmd>Gdiffsplit<cr>", desc = "Git diff split" },
			{ "<leader>gD", "<cmd>Gvdiffsplit<cr>", desc = "Git diff vertical" },

			-- Checkout en branch beheer
			{ "<leader>gCo", "<cmd>Git checkout<space>", desc = "Git checkout (branch/file)" },
			{ "<leader>gCb", "<cmd>Git checkout -b<space>", desc = "Git checkout new branch" },

			-- Remote en fetch
			{ "<leader>gf", "<cmd>Git fetch origin<cr>", desc = "Git fetch origin" },
			{ "<leader>gu", "<cmd>Git remote update<cr>", desc = "Git remote update" },

			-- Browsen en log
			{ "<leader>go", "<cmd>GBrowse<cr>", desc = "Git browse remote" },
			{ "<leader>gL", "<cmd>0Gclog<cr>", desc = "Git file log" },

			-- Bewerken en verwijderen
			{ "<leader>gr", "<cmd>gremove<cr>", desc = "git remove" },
			{ "<leader>gm", "<cmd>gmove<space>", desc = "git move/rename" },
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
	{
		"kdheepak/lazygit.nvim",
		cmd = {
			"LazyGit",
			"LazyGitConfig",
			"LazyGitCurrentFile",
			"LazyGitFilter",
			"LazyGitFilterCurrentFile",
		},
		lazy = true,
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-telescope/telescope.nvim",
			-- optional: to avoid nested terminals
			"flatten.nvim",
		},
		keys = {
			{ "<leader>gg", "<cmd>LazyGit<cr>", desc = "Lazygit (root repo)" },
			{ "<leader>gG", "<cmd>LazyGitCurrentFile<cr>", desc = "Lazygit (cur file)" },
		},

		config = function()
			require("lazygit").setup({
				winscale = 0.85,
				-- optionally adjust float window size
				mappings = {
					t = {
						-- override lazygit mapping: pressing `q` hides
						["q"] = "hide",
						["<C-c>"] = function(bufnr)
							vim.api.nvim_buf_delete(bufnr, { force = true })
						end,
					},
					n = {
						["q"] = "hide",
					},
				},
				-- other options: open in last used repo
				use_last = true,
			})

			-- load Telescope extension
			require("telescope").load_extension("lazygit")

			-- optional: auto-track git projects as you switch buffers
			vim.api.nvim_create_autocmd("BufEnter", {
				callback = function()
					require("lazygit.utils").project_root_dir()
				end,
			})

			-- optional: prevent nested lazygit if using flatten.nvim
			require("flatten").setup({
				window = { open = "smart" },
				callbacks = {
					pre_open = vim.schedule_wrap(function()
						require("lazygit").hide()
					end),
					block_end = vim.schedule_wrap(function()
						require("lazygit").show()
					end),
				},
			})
		end,
	},
}
