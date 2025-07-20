vim.api.nvim_create_autocmd("TextYankPost", {
	desc = "Highlight when yanking (copying) text",
	group = vim.api.nvim_create_augroup("kickstart-highlight-yank", { clear = true }),
	callback = function()
		vim.highlight.on_yank()
	end,
})

local function setup_git_autocmds()
	local augroup = vim.api.nvim_create_augroup("GitIntegration", { clear = true })

	-- Auto-refresh gitsigns when files change
	vim.api.nvim_create_autocmd({ "BufWritePost" }, {
		group = augroup,
		pattern = "*",
		callback = function()
			if vim.fn.exists(":Gitsigns") > 0 then
				vim.cmd("Gitsigns refresh")
			end
		end,
	})

	-- Set up git commit message editing
	vim.api.nvim_create_autocmd("FileType", {
		group = augroup,
		pattern = "gitcommit",
		callback = function()
			vim.opt_local.spell = true
			vim.opt_local.textwidth = 72
			vim.cmd("startinsert")
		end,
	})
end

-- Call the setup function
setup_git_autocmds()

-- Status line integration (if you're using a custom statusline)
local function git_status()
	local gitsigns = vim.b.gitsigns_status_dict
	if gitsigns then
		return string.format(" +%d ~%d -%d", gitsigns.added or 0, gitsigns.changed or 0, gitsigns.removed or 0)
	end
	return ""
end

-- Custom command to show git summary
vim.api.nvim_create_user_command("GitSummary", function()
	local gitsigns = vim.b.gitsigns_status_dict
	if gitsigns then
		print(
			string.format(
				"Git Status: +%d additions, ~%d changes, -%d deletions (Branch: %s)",
				gitsigns.added or 0,
				gitsigns.changed or 0,
				gitsigns.removed or 0,
				gitsigns.head or "unknown"
			)
		)
	else
		print("No git information available for this buffer")
	end
end, { desc = "Show git status summary" })
