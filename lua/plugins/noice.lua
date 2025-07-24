return {
	"folke/noice.nvim",
	event = "VeryLazy",
	dependencies = {
		"MunifTanjim/nui.nvim",
		"rcarriga/nvim-notify", -- Optional: for better notifications
	},
	opts = {
		-- Enhanced LSP configuration
		lsp = {
			override = {
				["vim.lsp.util.convert_input_to_markdown_lines"] = true,
				["vim.lsp.util.stylize_markdown"] = true,
				["cmp.entry.get_documentation"] = true,
			},
			-- Add hover and signature help styling
			hover = {
				enabled = true,
				silent = false, -- Set to true to not show a message if hover is not available
			},
			signature = {
				enabled = true,
				auto_open = {
					enabled = true,
					trigger = true, -- Automatically show signature help when typing a trigger character
					luasnip = true, -- Will open signature help when jumping to Luasnip insert nodes
					throttle = 50, -- Debounce lsp signature help request by 50ms
				},
				view = nil, -- When nil, use defaults from documentation
			},
			-- Show progress messages from LSP servers
			progress = {
				enabled = true,
				format = "lsp_progress",
				format_done = "lsp_progress_done",
				throttle = 1000 / 30, -- Frequency to update lsp progress message
				view = "mini",
			},
			-- Override markdown rendering for better display
			documentation = {
				view = "hover",
				opts = {
					lang = "markdown",
					replace = true,
					render = "plain",
					format = { "{message}" },
					win_options = { concealcursor = "n", conceallevel = 3 },
				},
			},
		},
		-- Enhanced message routing
		routes = {
			-- Hide written messages
			{
				filter = {
					event = "msg_show",
					any = {
						{ find = "%d+L, %d+B" },
						{ find = "; after #%d+" },
						{ find = "; before #%d+" },
						{ find = "%d+ fewer lines" },
						{ find = "%d+ more lines" },
						{ find = '^".*" %d+L, %d+B$' }, -- File read messages
					},
				},
				view = "mini",
			},
			-- Hide search count messages
			{
				filter = {
					event = "msg_show",
					kind = "search_count",
				},
				opts = { skip = true },
			},
			-- Hide macro recording messages
			{
				filter = {
					event = "msg_show",
					find = "recording @",
				},
				view = "mini",
			},
			-- Route long messages to split view
			{
				filter = {
					event = "msg_show",
					min_height = 20,
				},
				view = "split",
			},
			-- Route errors to notify
			{
				filter = {
					event = "msg_show",
					kind = "emsg",
				},
				view = "notify",
				opts = { level = "error" },
			},
			-- Route warnings to notify
			{
				filter = {
					event = "msg_show",
					kind = "wmsg",
				},
				view = "notify",
				opts = { level = "warn" },
			},
			-- Hide "Pattern not found" messages
			{
				filter = {
					event = "msg_show",
					kind = "",
					find = "Pattern not found",
				},
				opts = { skip = true },
			},
		},
		-- Enhanced command line configuration
		cmdline = {
			enabled = true,
			view = "cmdline_popup",
			opts = {},
			format = {
				cmdline = { pattern = "^:", icon = "", lang = "vim" },
				search_down = { kind = "search", pattern = "^/", icon = " ", lang = "regex" },
				search_up = { kind = "search", pattern = "^%?", icon = " ", lang = "regex" },
				filter = { pattern = "^:%s*!", icon = "$", lang = "bash" },
				lua = { pattern = { "^:%s*lua%s+", "^:%s*lua%s*=%s*", "^:%s*=%s*" }, icon = "", lang = "lua" },
				help = { pattern = "^:%s*he?l?p?%s+", icon = "" },
				input = {}, -- Used by input()
			},
		},
		-- Enhanced message display
		messages = {
			enabled = true,
			view = "notify",
			view_error = "notify",
			view_warn = "notify",
			view_history = "messages",
			view_search = "virtualtext",
		},
		-- Enhanced popup menu
		popupmenu = {
			enabled = true,
			backend = "nui", -- Backend to use for regular cmdline completions
			kind_icons = {}, -- Set to false to disable icons
		},
		-- Smart redirects
		redirect = {
			view = "popup",
			filter = { event = "msg_show" },
		},
		-- Enhanced presets
		presets = {
			bottom_search = true, -- Use a classic bottom cmdline for search
			command_palette = true, -- Position the cmdline and popupmenu together
			long_message_to_split = true, -- Long messages will be sent to a split
			inc_rename = false, -- Enables an input dialog for inc-rename.nvim
			lsp_doc_border = false, -- Add a border to hover docs and signature help
		},
		-- Throttle configuration
		throttle = 1000 / 30, -- How frequently to update the UI (30fps)
		-- Enhanced views configuration
		views = {
			cmdline_popup = {
				position = {
					row = 5,
					col = "50%",
				},
				size = {
					width = 60,
					height = "auto",
				},
			},
			popupmenu = {
				relative = "editor",
				position = {
					row = 8,
					col = "50%",
				},
				size = {
					width = 60,
					height = 10,
				},
				border = {
					style = "rounded",
					padding = { 0, 1 },
				},
				win_options = {
					winhighlight = { Normal = "Normal", FloatBorder = "DiagnosticInfo" },
				},
			},
			hover = {
				border = {
					style = "rounded",
				},
				position = { row = 2, col = 2 },
			},
			confirm = {
				border = {
					style = "rounded",
				},
			},
			popup = {
				border = {
					style = "rounded",
				},
			},
			mini = {
				position = {
					row = -2,
				},
				size = "auto",
				border = {
					style = "none",
				},
			},
		},
		-- Format configuration for better message display
		format = {
			level = {
				icons = {
					error = "✖",
					warn = "▼",
					info = "●",
					debug = "◯",
					trace = "◯",
				},
			},
		},
	},
	-- Enhanced keymaps with better organization
	keys = {
		-- Noice main commands group
		{ "<leader>sn", "", desc = "+noice" },

		-- Command line enhancements
		{
			"<S-Enter>",
			function()
				require("noice").redirect(vim.fn.getcmdline())
			end,
			mode = "c",
			desc = "Redirect Cmdline",
		},
		{
			"<leader>scr",
			function()
				require("noice").redirect(vim.fn.getcmdline())
			end,
			mode = "c",
			desc = "Redirect Cmdline",
		},

		-- Message navigation
		{
			"<leader>snl",
			function()
				require("noice").cmd("last")
			end,
			desc = "Noice Last Message",
		},
		{
			"<leader>snh",
			function()
				require("noice").cmd("history")
			end,
			desc = "Noice History",
		},
		{
			"<leader>sna",
			function()
				require("noice").cmd("all")
			end,
			desc = "Noice All",
		},
		{
			"<leader>snd",
			function()
				require("noice").cmd("dismiss")
			end,
			desc = "Dismiss All",
		},
		{
			"<leader>snt",
			function()
				require("noice").cmd("pick")
			end,
			desc = "Noice Picker (Telescope/FzfLua)",
		},

		-- Enhanced scrolling with fallback
		{
			"<c-f>",
			function()
				if not require("noice.lsp").scroll(4) then
					return "<c-f>"
				end
			end,
			silent = true,
			expr = true,
			desc = "Scroll Forward",
			mode = { "i", "n", "s" },
		},
		{
			"<c-b>",
			function()
				if not require("noice.lsp").scroll(-4) then
					return "<c-b>"
				end
			end,
			silent = true,
			expr = true,
			desc = "Scroll Backward",
			mode = { "i", "n", "s" },
		},

		-- Additional useful keymaps
		{
			"<leader>sne",
			function()
				require("noice").cmd("errors")
			end,
			desc = "Show Errors",
		},
		{
			"<leader>sns",
			function()
				require("noice").cmd("stats")
			end,
			desc = "Show Stats",
		},
		{
			"<leader>snc",
			function()
				require("noice").cmd("config")
			end,
			desc = "Show Config",
		},

		-- Quick dismiss with Escape
		{
			"<Esc>",
			function()
				require("noice").cmd("dismiss")
			end,
			mode = "n",
			desc = "Dismiss Noice Messages",
			silent = true,
		},
	},

	config = function(_, opts)
		-- Enhanced initialization
		if vim.o.filetype == "lazy" then
			vim.cmd([[messages clear]])
		end

		-- Setup noice with enhanced options
		require("noice").setup(opts)

		-- Set up additional integrations if available
		local has_telescope = pcall(require, "telescope")
		if has_telescope then
			require("telescope").load_extension("noice")
		end

		-- Set up autocmds for better UX
		local augroup = vim.api.nvim_create_augroup("NoiceConfig", { clear = true })

		-- Auto-dismiss messages after a delay
		vim.api.nvim_create_autocmd("User", {
			pattern = "NoiceMessage",
			group = augroup,
			callback = function()
				vim.defer_fn(function()
					require("noice").cmd("dismiss")
				end, 4000) -- Auto dismiss after 4 seconds
			end,
		})

		-- Clear messages when entering insert mode
		vim.api.nvim_create_autocmd("InsertEnter", {
			group = augroup,
			callback = function()
				require("noice").cmd("dismiss")
			end,
		})

		-- Enhanced error handling
		vim.api.nvim_create_autocmd("User", {
			pattern = "NoiceError",
			group = augroup,
			callback = function(event)
				vim.notify("Noice Error: " .. vim.inspect(event.data), vim.log.levels.ERROR)
			end,
		})
	end,
}

