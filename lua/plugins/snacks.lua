return {
	"folke/snacks.nvim",
	priority = 1000,
	lazy = false,
	opts = {
		dashboard = {
			enabled = true,
			preset = {
				keys = {
					{ icon = " ", key = "f", desc = "Find File", action = "<leader>ff" },
					{ icon = " ", key = "g", desc = "Find Text", action = "<leader>fr" },
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
				-- 				header = [[
				-- ██╗  ██╗██████╗ ██████╗
				-- ██║  ██║██╔══██╗██╔══██╗
				-- ███████║██████╔╝██████╔╝
				-- ██╔══██║██╔══██╗██╔══██╗
				-- ██║  ██║██║  ██║██║  ██║
				-- ╚═╝  ╚═╝╚═╝  ╚═╝╚═╝  ╚═╝
				--
				-- 				]],
				header = [[
.------..------..------.
|H.--. ||R.--. ||R.--. |
| :/\: || :(): || :(): |
| (__) || ()() || ()() |
| '--'H|| '--'R|| '--'R|
`------'`------'`------'
				]],
			},
			sections = {
				{ section = "header" },
				{ section = "keys", gap = 1, padding = 1 },
				{ pane = 2, icon = " ", title = "Recent Files", section = "recent_files", indent = 2, padding = 1 },
				{ pane = 2, icon = " ", title = "Projects", section = "projects", indent = 2, padding = 1 },
				-- {
				-- 	pane = 2,
				-- 	icon = " ",
				-- 	title = "Git Status",
				-- 	section = "terminal",
				-- 	enabled = function()
				-- 		return Snacks.git.get_root() ~= nil
				-- 	end,
				-- 	cmd = "git status --short --branch --renames",
				-- 	height = 5,
				-- 	padding = 1,
				-- 	ttl = 5 * 60,
				-- 	indent = 3,
				-- },
				{ section = "startup" },
			},
		},
		-- vim.ui.input popup (replaces dressing.nvim)
		input = { enabled = true },
		picker = {
			actions = {
				-- Hand the current grep search over to grug-far to replace it
				grug_far = function(picker)
					local filter = picker:filter()
					local search = vim.trim(filter.search ~= "" and filter.search or filter.pattern)
					local cwd = picker:cwd()
					picker:close()
					require("grug-far").open({
						prefills = {
							search = search,
							paths = cwd ~= vim.fn.getcwd() and cwd or nil,
							flags = picker.opts.regex == false and "--fixed-strings" or nil,
						},
					})
				end,
			},
			sources = {
				grep = {
					win = {
						input = {
							keys = {
								["<a-s>"] = { "grug_far", mode = { "n", "i" }, desc = "Search & replace in grug-far" },
							},
						},
					},
				},
				projects = {
					-- Directories to search for projects
					dev = { "~/projects" },
					patterns = { ".git", "package.json" },
				},
			},
		},
	},
	keys = {
		-- Snacks Picker
		{
			"<leader>ff",
			function()
				Snacks.picker.files()
			end,
			desc = "Find File",
		},
		{
			"<leader>fr",
			function()
				Snacks.picker.grep()
			end,
			desc = "Find (grep)",
		},
		{
			"<leader>fp",
			function()
				Snacks.picker.projects()
			end,
			desc = "Projects",
		},
	},
}
