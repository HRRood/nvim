return {
	"nvim-neotest/neotest",
	dependencies = {
		"nvim-neotest/nvim-nio",
		"nvim-lua/plenary.nvim",
		"nvim-treesitter/nvim-treesitter",
		"marilari88/neotest-vitest",
		"nvim-neotest/neotest-jest",
		"Issafalcon/neotest-dotnet",
	},
	keys = {
		{ "<leader>tt", function() require("neotest").run.run() end, desc = "Run Nearest Test" },
		{ "<leader>tf", function() require("neotest").run.run(vim.fn.expand("%")) end, desc = "Run File Tests" },
		{ "<leader>ts", function() require("neotest").summary.toggle() end, desc = "Toggle Test Summary" },
		{ "<leader>to", function() require("neotest").output_panel.toggle() end, desc = "Toggle Test Output" },
		{ "<leader>tS", function() require("neotest").run.stop() end, desc = "Stop Test" },
	},
	config = function()
		require("neotest").setup({
			adapters = {
				require("neotest-vitest")({
					-- Detecteer vitest config automatisch
					vitestCommand = "npx vitest",
				}),
				require("neotest-jest")({
					jestCommand = "npx jest",
					jestConfigFile = function()
						local file = vim.fn.expand("%:p")
						if string.find(file, "/packages/") then
							return string.match(file, "(.-/[^/]+/)src") .. "jest.config.ts"
						end
						return vim.fn.getcwd() .. "/jest.config.ts"
					end,
					env = { CI = true },
					cwd = function()
						return vim.fn.getcwd()
					end,
				}),
				require("neotest-dotnet")({
					dap = { justMyCode = false },
				}),
			},
		})
	end,
}
