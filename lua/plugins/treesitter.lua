return {
	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
		dependencies = {
			"nvim-treesitter/nvim-treesitter-textobjects",
		},
		config = function()
			-- ensure_installed equivalent: install missing parsers async on startup
			vim.defer_fn(function()
				local install = require("nvim-treesitter.install")
				local cfg = require("nvim-treesitter.config")
				local want = {
					"lua", "vim", "vimdoc", "query",
					"javascript", "typescript", "tsx", "jsdoc",
					"css", "gitignore", "http", "json", "json5",
					"scss", "sql", "html", "yaml", "toml",
					"dockerfile", "graphql", "php",
				}
				local installed = cfg.get_installed()
				local missing = vim.tbl_filter(function(lang)
					return not vim.list_contains(installed, lang)
				end, want)
				if #missing > 0 then
					install.install(missing)
				end
			end, 0)

			-- textobjects config (select lookahead, move jump list)
			require("nvim-treesitter-textobjects").setup({
				select = { lookahead = true },
				move = { set_jumps = true },
			})

			local sel = require("nvim-treesitter-textobjects.select")
			local mov = require("nvim-treesitter-textobjects.move")

			-- select keymaps
			for lhs, query in pairs({
				["af"] = "@function.outer",
				["if"] = "@function.inner",
				["ac"] = "@class.outer",
				["ic"] = "@class.inner",
			}) do
				vim.keymap.set({ "x", "o" }, lhs, function()
					sel.select_textobject(query, "textobjects")
				end)
			end

			-- move keymaps
			vim.keymap.set("n", "]m",  function() mov.goto_next_start("@function.outer",    "textobjects") end)
			vim.keymap.set("n", "]]",  function() mov.goto_next_start("@class.outer",        "textobjects") end)
			vim.keymap.set("n", "]M",  function() mov.goto_next_end("@function.outer",       "textobjects") end)
			vim.keymap.set("n", "][",  function() mov.goto_next_end("@class.outer",          "textobjects") end)
			vim.keymap.set("n", "[m",  function() mov.goto_previous_start("@function.outer", "textobjects") end)
			vim.keymap.set("n", "[[",  function() mov.goto_previous_start("@class.outer",    "textobjects") end)
			vim.keymap.set("n", "[M",  function() mov.goto_previous_end("@function.outer",   "textobjects") end)
			vim.keymap.set("n", "[]",  function() mov.goto_previous_end("@class.outer",      "textobjects") end)
		end,
	},
	{
		"windwp/nvim-ts-autotag",
		enabled = true,
		ft = { "html", "xml", "javascript", "typescript", "javascriptreact", "typescriptreact", "svelte" },
		config = function()
			require("nvim-ts-autotag").setup({
				opts = {
					enable_close = true,
					enable_rename = true,
					enable_close_on_slash = false,
				},
				per_filetype = {
					["html"] = { enable_close = true },
					["typescriptreact"] = { enable_close = true },
				},
			})
		end,
	},
}
