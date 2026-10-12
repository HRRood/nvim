-- prettierd keeps a Prettier daemon running; plain prettier is the fallback
local prettier = { "prettierd", "prettier", stop_after_first = true }

return {
	"stevearc/conform.nvim",
	event = { "BufWritePre" },
	cmd = { "ConformInfo" },
	keys = {
		-- {
		-- 	"<leader>fb",
		-- 	function()
		-- 		require("conform").format({ async = true, lsp_format = "fallback" })
		-- 	end,
		-- 	mode = "",
		-- 	desc = "[F]ormat [B]uffer",
		-- },
	},
	init = function()
		-- Apply ESLint auto-fixes before conform formats the buffer
		vim.api.nvim_create_autocmd("BufWritePre", {
			group = vim.api.nvim_create_augroup("eslint-fix-on-save", { clear = true }),
			pattern = { "*.js", "*.jsx", "*.ts", "*.tsx", "*.mjs", "*.cjs" },
			callback = function(event)
				if vim.fn.exists(":LspEslintFixAll") == 2 then
					vim.api.nvim_buf_call(event.buf, function()
						vim.cmd("LspEslintFixAll")
					end)
				end
			end,
		})
	end,
	opts = {
		notify_on_error = false,
		format_on_save = function(bufnr)
			local disable_filetypes = { c = true, cpp = true }
			local lsp_format_opt
			if disable_filetypes[vim.bo[bufnr].filetype] then
				lsp_format_opt = "never"
			else
				lsp_format_opt = "fallback"
			end
			return {
				timeout_ms = 500,
				lsp_format = lsp_format_opt,
			}
		end,
		formatters_by_ft = {
			lua = { "stylua" },
			javascript = prettier,
			javascriptreact = prettier,
			typescript = prettier,
			typescriptreact = prettier,
			css = prettier,
			scss = prettier,
			html = prettier,
			json = prettier,
			jsonc = prettier,
			markdown = prettier,
			php = { "php_cs_fixer" },
		},
		-- cs = { "csharpier" },
		formatters = {
			php_cs_fixer = {
				prepend_args = { "--cache-file=" .. vim.fn.expand("~/.cache/php-cs-fixer/.php-cs-fixer.cache") },
			},
		},
	},
}
