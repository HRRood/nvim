return {
	"nvim-telescope/telescope.nvim",
	dependencies = {
		{
			"nvim-telescope/telescope-fzf-native.nvim",
			build = "make",
		},
		"nvim-telescope/telescope-file-browser.nvim",
		"nvim-telescope/telescope-ui-select.nvim", -- Better UI for LSP code actions
		"nvim-telescope/telescope-live-grep-args.nvim", -- Live grep with args
	},
	keys = {
		-- Your existing keymaps
		{
			"<leader>fP",
			function()
				require("telescope.builtin").find_files({
					cwd = require("lazy.core.config").options.root,
				})
			end,
			desc = "Find Plugin File",
		},
		{
			"<leader>ff",
			function()
				require("telescope.builtin").find_files({
					no_ignore = false,
					hidden = true,
				})
			end,
			desc = "[F]ind [F]ile",
		},
		{
			"<leader>fr",
			function()
				require("telescope").extensions.live_grep_args.live_grep_args()
			end,
			desc = "Live Grep with Args",
		},
		{
			"\\\\",
			function()
				require("telescope.builtin").buffers()
			end,
			desc = "Lists open buffers",
		},
		{
			";t",
			function()
				require("telescope.builtin").help_tags()
			end,
			desc = "Lists available help tags",
		},
		{
			"<leader>;;",
			function()
				require("telescope.builtin").resume()
			end,
			desc = "Resume last Telescope picker",
		},
		{
			"<leader>fe",
			function()
				require("telescope.builtin").diagnostics()
			end,
			desc = "Show diagnostics",
		},
		{
			"<leader>fs",
			function()
				require("telescope.builtin").treesitter()
			end,
			desc = "List symbols from Treesitter",
		},
		{
			"<leader>fc",
			function()
				require("telescope.builtin").lsp_incoming_calls()
			end,
			desc = "LSP incoming calls",
		},
		{
			"sf",
			function()
				local telescope = require("telescope")
				local function telescope_buffer_dir()
					return vim.fn.expand("%:p:h")
				end
				telescope.extensions.file_browser.file_browser({
					path = "%:p:h",
					cwd = telescope_buffer_dir(),
					respect_gitignore = false,
					hidden = true,
					grouped = true,
					previewer = false,
					initial_mode = "normal",
					layout_config = { height = 40 },
				})
			end,
			desc = "Open file browser at buffer path",
		},
		-- Enhanced keymaps
		{
			"<leader>fh",
			function()
				require("telescope.builtin").oldfiles()
			end,
			desc = "Find recent files",
		},
		{
			"<leader>fw",
			function()
				require("telescope.builtin").grep_string()
			end,
			desc = "Find word under cursor",
		},
		{
			"<leader>fW",
			function()
				require("telescope.builtin").grep_string({
					search = vim.fn.expand("<cWORD>"),
				})
			end,
			desc = "Find WORD under cursor",
		},
		{
			"<leader>fb",
			function()
				require("telescope.builtin").current_buffer_fuzzy_find()
			end,
			desc = "Fuzzy find in current buffer",
		},
		{
			"<leader>fj",
			function()
				require("telescope.builtin").jumplist()
			end,
			desc = "Show jumplist",
		},
		{
			"<leader>fk",
			function()
				require("telescope.builtin").keymaps()
			end,
			desc = "Show keymaps",
		},
		{
			"<leader>fm",
			function()
				require("telescope.builtin").marks()
			end,
			desc = "Show marks",
		},
		{
			"<leader>fq",
			function()
				require("telescope.builtin").quickfix()
			end,
			desc = "Show quickfix list",
		},
		{
			"<leader>fQ",
			function()
				require("telescope.builtin").loclist()
			end,
			desc = "Show location list",
		},
		{
			"<leader>f/",
			function()
				require("telescope.builtin").search_history()
			end,
			desc = "Search history",
		},
		{
			"<leader>f:",
			function()
				require("telescope.builtin").command_history()
			end,
			desc = "Command history",
		},
		{
			"<leader>fv",
			function()
				require("telescope.builtin").vim_options()
			end,
			desc = "Vim options",
		},
		{
			"<leader>fg",
			function()
				require("telescope.builtin").git_files()
			end,
			desc = "Find git files",
		},
		{
			"<leader>fgb",
			function()
				require("telescope.builtin").git_branches()
			end,
			desc = "Git branches",
		},
		{
			"<leader>fgc",
			function()
				require("telescope.builtin").git_commits()
			end,
			desc = "Git commits",
		},
		{
			"<leader>fgs",
			function()
				require("telescope.builtin").git_status()
			end,
			desc = "Git status",
		},
	},
	config = function()
		local telescope = require("telescope")
		local actions = require("telescope.actions")
		local fb_actions = require("telescope").extensions.file_browser.actions

		telescope.setup({
			defaults = {
				-- Enhanced sorting and filtering
				file_sorter = require("telescope.sorters").get_fuzzy_file,
				generic_sorter = require("telescope.sorters").get_generic_fuzzy_sorter,
				file_ignore_patterns = {
					"node_modules",
					".git/",
					"dist/",
					"build/",
					"target/",
					"*.pyc",
					"__pycache__",
					".DS_Store",
				},

				-- Better preview and layout
				wrap_results = true,
				layout_strategy = "vertical",
				layout_config = {
					prompt_position = "bottom",
					preview_height = 0.5,
					width = 0.9,
					height = 0.9,
				},
				sorting_strategy = "ascending",
				winblend = 0,

				-- Enhanced preview
				preview = {
					mime_hook = function(filepath, bufnr, opts)
						local is_image = function(filepath)
							local image_extensions = { "png", "jpg", "jpeg", "gif", "bmp", "tiff", "webp" }
							local split_path = vim.split(filepath:lower(), ".", { plain = true })
							local extension = split_path[#split_path]
							return vim.tbl_contains(image_extensions, extension)
						end
						if is_image(filepath) then
							local term = vim.api.nvim_open_term(bufnr, {})
							local function send_output(_, data, _)
								for _, d in ipairs(data) do
									vim.api.nvim_chan_send(term, d .. "\r\n")
								end
							end
							vim.fn.jobstart({ "catimg", filepath }, { on_stdout = send_output, stdout_buffered = true })
						else
							require("telescope.previewers.utils").set_preview_message(
								bufnr,
								opts.winid,
								"Binary cannot be previewed"
							)
						end
					end,
				},

				-- Improved mappings
				mappings = {
					i = {
						["<C-j>"] = actions.move_selection_next,
						["<C-k>"] = actions.move_selection_previous,
						["<C-n>"] = actions.cycle_history_next,
						["<C-p>"] = actions.cycle_history_prev,
						["<C-q>"] = actions.send_to_qflist + actions.open_qflist,
						["<C-a>"] = actions.send_selected_to_qflist + actions.open_qflist,
						["<C-x>"] = actions.select_horizontal,
						["<C-v>"] = actions.select_vertical,
						["<C-t>"] = actions.select_tab,
						["<C-u>"] = actions.preview_scrolling_up,
						["<C-d>"] = actions.preview_scrolling_down,
					},
					n = {
						["<C-q>"] = actions.send_to_qflist + actions.open_qflist,
						["<C-a>"] = actions.send_selected_to_qflist + actions.open_qflist,
						["<C-x>"] = actions.select_horizontal,
						["<C-v>"] = actions.select_vertical,
						["<C-t>"] = actions.select_tab,
					},
				},

				-- Better performance
				dynamic_preview_title = true,
				results_title = false,
				border = true,
				borderchars = {
					prompt = { "─", "│", " ", "│", "╭", "╮", "│", "│" },
					results = { "─", "│", "─", "│", "├", "┤", "╯", "╰" },
					preview = { "─", "│", "─", "│", "╭", "╮", "╯", "╰" },
				},
			},

			pickers = {
				find_files = {
					theme = "dropdown",
					previewer = false,
					layout_config = nil,
					layout_strategy = nil,
					find_command = { "rg", "--files", "--hidden", "--glob", "!**/.git/*" },
				},
				live_grep = {
					additional_args = function(opts)
						return { "--hidden" }
					end,
				},
				grep_string = {
					additional_args = function(opts)
						return { "--hidden" }
					end,
				},
				buffers = {
					theme = "dropdown",
					previewer = false,
					initial_mode = "normal",
					sort_mru = true,
					ignore_current_buffer = true,
				},
				oldfiles = {
					theme = "dropdown",
					previewer = false,
				},
				current_buffer_fuzzy_find = {
					theme = "ivy",
				},
				diagnostics = {
					theme = "ivy",
					initial_mode = "normal",
					layout_config = {
						preview_cutoff = 9999,
					},
				},
				help_tags = {
					theme = "ivy",
				},
				keymaps = {
					theme = "ivy",
				},
				git_files = {
					theme = "dropdown",
					previewer = false,
				},
			},

			extensions = {
				fzf = {
					fuzzy = true,
					override_generic_sorter = true,
					override_file_sorter = true,
					case_mode = "smart_case",
				},
				file_browser = {
					theme = "dropdown",
					hijack_netrw = true,
					mappings = {
						n = {
							["N"] = fb_actions.create,
							["h"] = fb_actions.goto_parent_dir,
							["/"] = function()
								vim.cmd("startinsert")
							end,
							["<C-u>"] = function(prompt_bufnr)
								for _ = 1, 10 do
									actions.move_selection_previous(prompt_bufnr)
								end
							end,
							["<C-d>"] = function(prompt_bufnr)
								for _ = 1, 10 do
									actions.move_selection_next(prompt_bufnr)
								end
							end,
							["<PageUp>"] = actions.preview_scrolling_up,
							["<PageDown>"] = actions.preview_scrolling_down,
						},
					},
				},
				["ui-select"] = {
					require("telescope.themes").get_dropdown({
						winblend = 10,
						width = 0.5,
						prompt = " ",
						results_height = 15,
						preview_cutoff = 1200,
					}),
				},
				live_grep_args = {
					auto_quoting = true,
					mappings = {
						i = {
							["<C-k>"] = require("telescope-live-grep-args.actions").quote_prompt(),
							["<C-i>"] = require("telescope-live-grep-args.actions").quote_prompt({
								postfix = " --iglob ",
							}),
						},
					},
				},
			},
		})

		-- Load extensions
		-- telescope.load_extension("fzf")
		telescope.load_extension("file_browser")
		telescope.load_extension("ui-select")
		telescope.load_extension("live_grep_args")
	end,
}
