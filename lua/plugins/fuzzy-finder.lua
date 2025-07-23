return {
	"nvim-telescope/telescope.nvim",
	dependencies = {
		{
			"nvim-telescope/telescope-fzf-native.nvim",
			build = "make",
		},
		"nvim-telescope/telescope-file-browser.nvim",
	},
	keys = {
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
				require("telescope.builtin").live_grep({})
			end,
			desc = "Live Grep",
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
	},
	config = function()
		local telescope = require("telescope")
		local actions = require("telescope.actions")
		local fb_actions = require("telescope").extensions.file_browser.actions

		telescope.setup({
			defaults = {
				wrap_results = true,
				layout_strategy = "vertical",
				layout_config = { prompt_position = "bottom" },
				sorting_strategy = "ascending",
				winblend = 0,
				mappings = {
					n = {},
					i = {

						["<C-j>"] = require("telescope.actions").move_selection_next,
						["<C-k>"] = require("telescope.actions").move_selection_previous,
					},
				},
			},
			pickers = {
				diagnostics = {
					theme = "ivy",
					initial_mode = "normal",
					layout_config = {
						preview_cutoff = 9999,
					},
				},
			},
			extensions = {
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
			},
		})

		-- telescope.load_extension("fzf")
		telescope.load_extension("file_browser")
	end,
}
