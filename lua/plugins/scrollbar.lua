return {
	"petertriho/nvim-scrollbar",
	event = { "BufReadPost", "BufNewFile" },
	opts = {
		show = true,
		show_in_active_only = false,
		set_highlights = true,
		folds = 1000, -- Handle folds, set to number to disable folds if no. of lines in buffer exceeds this
		max_lines = false, -- Disables if no. of lines in buffer exceeds this
		hide_if_all_visible = false, -- Hides everything if all lines are visible
		throttle_ms = 100,
		handle = {
			text = " ",
			blend = 30, -- Integer between 0 and 100 for transparency
			color = "#cba6f7", -- Mauve
			color_nr = nil,
			highlight = "ScrollbarHandle",
			hide_if_all_visible = true,
		},
		marks = {
			Cursor = {
				text = "•",
				priority = 0,
				gui = nil,
				color = "#f5e0dc", -- Rosewater
				cterm = nil,
				color_nr = nil,
				highlight = "ScrollbarCursor",
			},
			Search = {
				text = { "-", "=" },
				priority = 1,
				gui = nil,
				color = "#f9e2af", -- Yellow
				cterm = nil,
				color_nr = nil,
				highlight = "ScrollbarSearch",
			},
			Error = {
				text = { "-", "=" },
				priority = 2,
				gui = nil,
				color = "#f38ba8", -- Red
				cterm = nil,
				color_nr = nil,
				highlight = "ScrollbarError",
			},
			Warn = {
				text = { "-", "=" },
				priority = 3,
				gui = nil,
				color = "#fab387", -- Peach
				cterm = nil,
				color_nr = nil,
				highlight = "ScrollbarWarn",
			},
			Info = {
				text = { "-", "=" },
				priority = 4,
				gui = nil,
				color = "#89b4fa", -- Blue
				cterm = nil,
				color_nr = nil,
				highlight = "ScrollbarInfo",
			},
			Hint = {
				text = { "-", "=" },
				priority = 5,
				gui = nil,
				color = "#94e2d5", -- Teal
				cterm = nil,
				color_nr = nil,
				highlight = "ScrollbarHint",
			},
			Misc = {
				text = { "-", "=" },
				priority = 6,
				gui = nil,
				color = "#cba6f7", -- Mauve
				cterm = nil,
				color_nr = nil,
				highlight = "ScrollbarMisc",
			},
			GitAdd = {
				text = "│",
				priority = 7,
				gui = nil,
				color = "#a6e3a1", -- Green
				cterm = nil,
				color_nr = nil,
				highlight = "ScrollbarGitAdd",
			},
			GitChange = {
				text = "│",
				priority = 7,
				gui = nil,
				color = "#f9e2af", -- Yellow
				cterm = nil,
				color_nr = nil,
				highlight = "ScrollbarGitChange",
			},
			GitDelete = {
				text = "▁",
				priority = 7,
				gui = nil,
				color = "#f38ba8", -- Red
				cterm = nil,
				color_nr = nil,
				highlight = "ScrollbarGitDelete",
			},
		},
		excluded_buftypes = {
			"terminal",
		},
		excluded_filetypes = {
			"cmp_docs",
			"cmp_menu",
			"noice",
			"prompt",
			"TelescopePrompt",
			"snacks_dashboard",
			"lazy",
			"mason",
			"oil",
		},
		autocmd = {
			render = {
				"BufWinEnter",
				"TabEnter",
				"TermEnter",
				"WinEnter",
				"CmdwinLeave",
				"TextChanged",
				"VimResized",
				"WinScrolled",
			},
			clear = {
				"BufWinLeave",
				"TabLeave",
				"TermLeave",
				"WinLeave",
			},
		},
		handlers = {
			cursor = true,
			diagnostic = true,
			gitsigns = true, -- Requires gitsigns
			handle = true,
			search = false, -- Requires hlslens
			ale = false, -- Requires ALE
		},
	},
}
