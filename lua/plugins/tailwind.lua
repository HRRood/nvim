return {
	-- Tailwind class colors come from the tailwindcss LSP (Neovim 0.12 shows LSP
	-- document colors by default, blink.cmp colors the completion menu), so the
	-- colorizer only handles literal color values like #ff00aa or rgb(...).
	"NvChad/nvim-colorizer.lua",
	ft = { "css", "scss", "html", "javascript", "javascriptreact", "typescript", "typescriptreact" },
	opts = {
		filetypes = {
			"javascript",
			"javascriptreact",
			"typescript",
			"typescriptreact",
			-- stylesheets also get named colors (red, rebeccapurple, ...)
			css = { css = true },
			scss = { css = true },
			html = { css = true },
		},
		user_default_options = {
			names = false, -- don't color words like "red" in JS/TS code
			RRGGBBAA = true,
			css_fn = true,
			tailwind = false,
		},
	},
}
