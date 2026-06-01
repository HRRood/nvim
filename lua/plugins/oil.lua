return {
	"stevearc/oil.nvim",
	version = "2.*",
	---@module 'oil'
	---@type oil.SetupOpts
	opts = {
		view_options = {
			show_hidden = true,
			is_always_hidden = function(name)
				local always_hidden_patterns = { "^%.git$", "^%.cache", ".DS_Store", "../" }

				for _, pattern in ipairs(always_hidden_patterns) do
					if name:match(pattern) then
						return true
					end
				end

				return false
			end,
		},
	},
	keys = {
		{ "-", ":Oil<CR>", desc = "Open Oil" },
	},
	init = function()
		vim.api.nvim_create_autocmd("FocusGained", {
			callback = function()
				if vim.bo.filetype == "oil" then
					require("oil.view").render_buffer_async(0)
				end
			end,
		})
	end,
	dependencies = { { "nvim-mini/mini.icons", opts = {} } },
	-- dependencies = { 'nvim-tree/nvim-web-devicons' },
}
