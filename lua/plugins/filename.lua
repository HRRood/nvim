return {
	"b0o/incline.nvim",
	dependencies = { "sainnhe/sonokai" },
	event = "BufReadPre",
	priority = 1200,
	config = function()
		-- Define colors matching Sonokai theme (you can tweak these to better match your variant)
		local colors = {
			mauve = "#a9b1d6", -- e.g., purple-ish (used as background)
			base = "#1a1b26", -- dark background
			surface0 = "#2a2e36", -- inactive background
			subtext0 = "#7aa2f7", -- light blue-ish (used for text in inactive tab)
		}

		require("incline").setup({
			highlight = {
				groups = {
					InclineNormal = { guibg = colors.mauve, guifg = colors.base },
					InclineNormalNC = { guibg = colors.surface0, guifg = colors.subtext0 },
				},
			},
			window = { margin = { vertical = 0, horizontal = 1 } },
			hide = {
				cursorline = true,
			},
			render = function(props)
				local filename = vim.fn.fnamemodify(vim.api.nvim_buf_get_name(props.buf), ":t")
				if vim.bo[props.buf].modified then
					filename = "[+] " .. filename
				end

				local icon, color = require("nvim-web-devicons").get_icon_color(filename)
				return { { icon, guifg = color }, { " " }, { filename } }
			end,
		})
	end,
}
