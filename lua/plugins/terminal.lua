return {
	"akinsho/toggleterm.nvim",
	version = "*",
	config = function()
		local shell_cmd = vim.o.shell
		if vim.fn.has("win32") == 1 then
			shell_cmd = "powershell -NoLogo -NoProfile -NoExit -Command \". $env:USERPROFILE\\Documents\\PowerShell\\Microsoft.PowerShell_profile.ps1\""
		end

		require("toggleterm").setup({
			size = function(term)
				if term.direction == "horizontal" then
					return 15
				elseif term.direction == "vertical" then
					return vim.o.columns * 0.4
				else
					return 20 -- fallback size
				end
			end,
			open_mapping = [[<c-\>]],
			shade_terminals = true,
			shading_factor = 4,
			start_in_insert = true,
			insert_mappings = true,
			persist_size = true,
			direction = "float",
			close_on_exit = true,
			shell = shell_cmd,
			float_opts = {
				border = "curved",
				winblend = 3,
				highlights = {
					border = "ToggleTermBorder",
					background = "ToggleTermNormal",
				},
			},
		})

		-- Set highlights to match rose-pine theme
		vim.api.nvim_set_hl(0, "ToggleTermBorder", { link = "FloatBorder" })
		vim.api.nvim_set_hl(0, "ToggleTermNormal", { link = "NormalFloat" })
	end,
}
