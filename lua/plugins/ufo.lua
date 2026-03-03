return {
	"kevinhwang91/nvim-ufo",
	dependencies = {
		"kevinhwang91/promise-async",
	},
	event = { "BufReadPost", "BufNewFile" },
	keys = {
		{ "zR", function() require("ufo").openAllFolds() end, desc = "Open all folds" },
		{ "zM", function() require("ufo").closeAllFolds() end, desc = "Close all folds" },
		{ "zr", function() require("ufo").openFoldsExceptKinds() end, desc = "Open folds except kinds" },
		{ "zm", function() require("ufo").closeFoldsWith() end, desc = "Close folds with" },
		{ "zK", function() require("ufo").peekFoldedLinesUnderCursor() end, desc = "Peek fold" },
	},
	opts = {
		-- Use treesitter as main provider, fallback to indent
		provider_selector = function(bufnr, filetype, buftype)
			return { "treesitter", "indent" }
		end,
		-- Customize fold text
		fold_virt_text_handler = function(virtText, lnum, endLnum, width, truncate)
			local newVirtText = {}
			local suffix = ("  󰁂 %d lines "):format(endLnum - lnum)
			local sufWidth = vim.fn.strdisplaywidth(suffix)
			local targetWidth = width - sufWidth
			local curWidth = 0

			for _, chunk in ipairs(virtText) do
				local chunkText = chunk[1]
				local chunkWidth = vim.fn.strdisplaywidth(chunkText)
				if targetWidth > curWidth + chunkWidth then
					table.insert(newVirtText, chunk)
				else
					chunkText = truncate(chunkText, targetWidth - curWidth)
					local hlGroup = chunk[2]
					table.insert(newVirtText, { chunkText, hlGroup })
					chunkWidth = vim.fn.strdisplaywidth(chunkText)
					if curWidth + chunkWidth < targetWidth then
						suffix = suffix .. (" "):rep(targetWidth - curWidth - chunkWidth)
					end
					break
				end
				curWidth = curWidth + chunkWidth
			end

			-- Catppuccin Mauve color for fold indicator
			table.insert(newVirtText, { suffix, "UfoFoldedEllipsis" })
			return newVirtText
		end,
		-- Preview settings
		preview = {
			win_config = {
				border = "rounded",
				winhighlight = "Normal:Normal,FloatBorder:FloatBorder",
				winblend = 0,
			},
			mappings = {
				scrollU = "<C-u>",
				scrollD = "<C-d>",
				jumpTop = "[",
				jumpBot = "]",
			},
		},
		-- Close fold kinds for specific filetypes
		close_fold_kinds_for_ft = {
			default = { "imports", "comment" },
		},
	},
	config = function(_, opts)
		-- Catppuccin colors for fold highlights
		vim.api.nvim_set_hl(0, "UfoFoldedEllipsis", { fg = "#cba6f7" }) -- Mauve
		vim.api.nvim_set_hl(0, "Folded", { bg = "#313244" }) -- Surface0

		-- Required options for ufo
		vim.o.foldcolumn = "1"
		vim.o.foldlevel = 99
		vim.o.foldlevelstart = 99
		vim.o.foldenable = true
		vim.o.fillchars = [[eob: ,fold: ,foldopen:,foldsep: ,foldclose:]]

		require("ufo").setup(opts)
	end,
}
