return {
	"folke/snacks.nvim",
	priority = 1000,
	lazy = false,
	opts = {
		dashboard = {
			enabled = true,
			preset = {
				keys = {
					{ icon = " ", key = "f", desc = "Find File", action = ":lua Snacks.dashboard.pick('files')" },
					-- { icon = " ", key = "n", desc = "New File", action = ":ene | startinsert" },
					-- { icon = " ", key = "g", desc = "Find Text", action = ":lua Snacks.dashboard.pick('live_grep')" },
					{

						action = "<leader>fp",
						key = "p",
						desc = "Find Project",
						icon = "",
					},
					{
						icon = " ",
						key = "r",
						desc = "Recent Files",
						action = ":lua Snacks.dashboard.pick('oldfiles')",
					},
					{
						icon = " ",
						key = "c",
						desc = "Config",
						action = ":lua Snacks.dashboard.pick('files', {cwd = vim.fn.stdpath('config')})",
					},
					{ icon = " ", key = "s", desc = "Restore Session", section = "session" },
					{
						icon = "󰒲 ",
						key = "L",
						desc = "Lazy",
						action = ":Lazy",
						enabled = package.loaded.lazy ~= nil,
					},
					{ icon = " ", key = "q", desc = "Quit", action = ":qa" },
				},
				header = [[
██╗  ██╗██████╗ ██████╗ 
██║  ██║██╔══██╗██╔══██╗
███████║██████╔╝██████╔╝
██╔══██║██╔══██╗██╔══██╗
██║  ██║██║  ██║██║  ██║
╚═╝  ╚═╝╚═╝  ╚═╝╚═╝  ╚═╝
                        
				]],
			},
			sections = {
				{ section = "header" },
				{ section = "keys", gap = 1, padding = 1 },
				{ pane = 2, icon = " ", title = "Recent Files", section = "recent_files", indent = 2, padding = 1 },
				{ pane = 2, icon = " ", title = "Projects", section = "projects", indent = 2, padding = 1 },
				{
					pane = 2,
					icon = " ",
					title = "Git Status",
					section = "terminal",
					enabled = function()
						return Snacks.git.get_root() ~= nil
					end,
					cmd = "git status --short --branch --renames",
					height = 5,
					padding = 1,
					ttl = 5 * 60,
					indent = 3,
				},
				{ section = "startup" },
			},
		},
	},
	keys = {
		-- {
		-- 	"<leader><space>",
		-- 	function()
		-- 		Snacks.picker.smart()
		-- 	end,
		-- 	desc = "Smart Find Files",
		-- },
		-- {
		-- 	"<leader>,",
		-- 	function()
		-- 		Snacks.picker.buffers()
		-- 	end,
		-- 	desc = "Buffers",
		-- },
		-- {
		-- 	"<leader>ps",
		-- 	function()
		-- 		Snacks.picker.grep()
		-- 	end,
		-- 	desc = "Grep",
		-- },
		-- {
		-- 	"<leader>:",
		-- 	function()
		-- 		Snacks.picker.command_history()
		-- 	end,
		-- 	desc = "Command History",
		-- },
		-- -- find
		-- {
		-- 	"<leader>fb",
		-- 	function()
		-- 		Snacks.picker.buffers()
		-- 	end,
		-- 	desc = "Buffers",
		-- },
		-- {
		-- 	"<leader>fc",
		-- 	function()
		-- 		Snacks.picker.files({ cwd = vim.fn.stdpath("config") })
		-- 	end,
		-- 	desc = "Find Config File",
		-- },
		-- {
		-- 	"<leader>ff",
		-- 	function()
		-- 		Snacks.picker.files()
		-- 	end,
		-- 	desc = "Find Files",
		-- },
		-- {
		-- 	"<leader>fg",
		-- 	function()
		-- 		Snacks.picker.git_files()
		-- 	end,
		-- 	desc = "Find Git Files",
		-- },
		{
			"<leader>fp",
			function()
				Snacks.picker.projects()
			end,
			desc = "Projects",
		},
		-- {
		-- 	"<leader>fr",
		-- 	function()
		-- 		Snacks.picker.recent()
		-- 	end,
		-- 	desc = "Recent",
		-- },
		-- -- git
		-- {
		-- 	"<leader>gb",
		-- 	function()
		-- 		Snacks.picker.git_branches()
		-- 	end,
		-- 	desc = "Git Branches",
		-- },
		-- {
		-- 	"<leader>gl",
		-- 	function()
		-- 		Snacks.picker.git_log()
		-- 	end,
		-- 	desc = "Git Log",
		-- },
		-- {
		-- 	"<leader>gL",
		-- 	function()
		-- 		Snacks.picker.git_log_line()
		-- 	end,
		-- 	desc = "Git Log Line",
		-- },
		-- {
		-- 	"<leader>gs",
		-- 	function()
		-- 		Snacks.picker.git_status()
		-- 	end,
		-- 	desc = "Git Status",
		-- },
		-- {
		-- 	"<leader>gS",
		-- 	function()
		-- 		Snacks.picker.git_stash()
		-- 	end,
		-- 	desc = "Git Stash",
		-- },
		-- {
		-- 	"<leader>gd",
		-- 	function()
		-- 		Snacks.picker.git_diff()
		-- 	end,
		-- 	desc = "Git Diff (Hunks)",
		-- },
		-- {
		-- 	"<leader>gf",
		-- 	function()
		-- 		Snacks.picker.git_log_file()
		-- 	end,
		-- 	desc = "Git Log File",
		-- },
		-- {
		-- 	"<leader>fw",
		-- 	function()
		-- 		Snacks.picker.grep_word()
		-- 	end,
		-- 	desc = "Visual selection or word",
		-- 	mode = { "n", "x" },
		-- },
		-- -- search
		-- {
		-- 	"<leader>sh",
		-- 	function()
		-- 		Snacks.picker.search_history()
		-- 	end,
		-- 	desc = "Search History",
		-- },
		-- {
		-- 	"<leader>sj",
		-- 	function()
		-- 		Snacks.picker.jumps()
		-- 	end,
		-- 	desc = "Jumps",
		-- },
		-- {
		-- 	"<leader>sl",
		-- 	function()
		-- 		Snacks.picker.loclist()
		-- 	end,
		-- 	desc = "Location List",
		-- },
		-- {
		-- 	"<leader>sm",
		-- 	function()
		-- 		Snacks.picker.marks()
		-- 	end,
		-- 	desc = "Marks",
		-- },
		-- {
		-- 	"<leader>sM",
		-- 	function()
		-- 		Snacks.picker.man()
		-- 	end,
		-- 	desc = "Man Pages",
		-- },
		-- {
		-- 	"<leader>sq",
		-- 	function()
		-- 		Snacks.picker.qflist()
		-- 	end,
		-- 	desc = "Quickfix List",
		-- },
		-- {
		-- 	"<leader>pr",
		-- 	function()
		-- 		Snacks.picker.resume()
		-- 	end,
		-- 	desc = "Resume",
		-- },
		-- {
		-- 	"<leader>su",
		-- 	function()
		-- 		Snacks.picker.undo()
		-- 	end,
		-- 	desc = "Undo History",
		-- },
		-- -- LSP
		-- {
		-- 	"gd",
		-- 	function()
		-- 		Snacks.picker.lsp_definitions()
		-- 	end,
		-- 	desc = "Goto Definition",
		-- },
		-- {
		-- 	"gD",
		-- 	function()
		-- 		Snacks.picker.lsp_declarations()
		-- 	end,
		-- 	desc = "Goto Declaration",
		-- },
		-- {
		-- 	"gr",
		-- 	function()
		-- 		Snacks.picker.lsp_references()
		-- 	end,
		-- 	nowait = true,
		-- 	desc = "References",
		-- },
		-- {
		-- 	"gI",
		-- 	function()
		-- 		Snacks.picker.lsp_implementations()
		-- 	end,
		-- 	desc = "Goto Implementation",
		-- },
		-- {
		-- 	"gy",
		-- 	function()
		-- 		Snacks.picker.lsp_type_definitions()
		-- 	end,
		-- 	desc = "Goto T[y]pe Definition",
		-- },
	},
}
