vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>")
vim.keymap.set("t", "<Esc><Esc>", "<C-\\><C-n>", { desc = "Exit terminal mode" })
vim.keymap.set("n", "<left>", '<cmd>echo "Use h to move!!"<CR>')
vim.keymap.set("n", "<right>", '<cmd>echo "Use l to move!!"<CR>')
vim.keymap.set("n", "<up>", '<cmd>echo "Use k to move!!"<CR>')
vim.keymap.set("n", "<down>", '<cmd>echo "Use j to move!!"<CR>')
vim.keymap.set("n", "<C-h>", "<C-w>h", { desc = "Move window left", noremap = true, silent = true })
vim.keymap.set("n", "<C-j>", "<C-w>j", { desc = "Move window down", noremap = true, silent = true })
vim.keymap.set("n", "<C-k>", "<C-w>k", { desc = "Move window up", noremap = true, silent = true })
vim.keymap.set("n", "<C-l>", "<C-w>l", { desc = "Move window right", noremap = true, silent = true })

-- Window resize
vim.keymap.set("n", "<C-Up>", ":resize +2<CR>", { desc = "Increase window height", noremap = true, silent = true })
vim.keymap.set("n", "<C-Down>", ":resize -2<CR>", { desc = "Decrease window height", noremap = true, silent = true })
vim.keymap.set("n", "<C-Left>", ":vertical resize -2<CR>", { desc = "Decrease window width", noremap = true, silent = true })
vim.keymap.set("n", "<C-Right>", ":vertical resize +2<CR>", { desc = "Increase window width", noremap = true, silent = true })

vim.keymap.set("i", "<C-h>", "<Left>", { desc = "Move cursor left", noremap = true, silent = true })
vim.keymap.set("i", "<C-j>", "<Down>", { desc = "Move cursor down", noremap = true, silent = true })
vim.keymap.set("i", "<C-k>", "<Up>", { desc = "Move cursor up", noremap = true, silent = true })
vim.keymap.set("i", "<C-l>", "<Right>", { desc = "Move cursor right", noremap = true, silent = true })
vim.keymap.set("n", "<Esc><Esc>", ":nohlsearch<CR>", { desc = "Clear search highlight" })
vim.keymap.set("n", "P", '"_dP', { noremap = true, silent = true, desc = "Paste without copying selection" })

vim.keymap.set("n", "<leader>sd", function()
	local input = vim.fn.input("Search directories: ")
	if input ~= "" then
		local dirs = vim.split(input, " ")
		require("telescope.builtin").live_grep({ search_dirs = dirs })
	end
end, { desc = "Search in a specific directory" })

vim.keymap.set({ "n", "i", "c", "s", "o", "x" }, "<F1>", "<Nop>", { noremap = true, silent = true })

-- Quickfix and location list navigation
vim.keymap.set("n", "]q", ":cnext<CR>zz", { desc = "Next quickfix", noremap = true, silent = true })
vim.keymap.set("n", "[q", ":cprev<CR>zz", { desc = "Prev quickfix", noremap = true, silent = true })
vim.keymap.set("n", "]l", ":lnext<CR>zz", { desc = "Next loclist", noremap = true, silent = true })
vim.keymap.set("n", "[l", ":lprev<CR>zz", { desc = "Prev loclist", noremap = true, silent = true })

-- Duplicate line
vim.keymap.set("n", "<leader>d", '"ayy"ap', { noremap = true, silent = true, desc = "Duplicate line" })
vim.keymap.set("v", "<leader>d", '"ay`>"ap', { noremap = true, silent = true, desc = "Duplicate selection" })

-- Move lines up/down (Alt+Up/Down because Alt+j/k is used by Harpoon)
vim.keymap.set("n", "<A-Down>", ":m .+1<CR>==", { noremap = true, silent = true, desc = "Move line down" })
vim.keymap.set("n", "<A-Up>", ":m .-2<CR>==", { noremap = true, silent = true, desc = "Move line up" })
vim.keymap.set("i", "<A-Down>", "<Esc>:m .+1<CR>==gi", { noremap = true, silent = true, desc = "Move line down" })
vim.keymap.set("i", "<A-Up>", "<Esc>:m .-2<CR>==gi", { noremap = true, silent = true, desc = "Move line up" })
vim.keymap.set("v", "<A-Down>", ":m '>+1<CR>gv=gv", { noremap = true, silent = true, desc = "Move selection down" })
vim.keymap.set("v", "<A-Up>", ":m '<-2<CR>gv=gv", { noremap = true, silent = true, desc = "Move selection up" })

vim.keymap.set("n", "<leader>ra", function()
	-- Prompt for search term
	vim.ui.input({ prompt = "Search for: " }, function(search)
		if not search or search == "" then
			return
		end
		-- Prompt for replacement term
		vim.ui.input({ prompt = "Replace with: " }, function(replace)
			if replace == nil then
				return
			end
			-- Execute the search and replace for the whole file
			vim.cmd(string.format("%%s/%s/%s/g", search, replace))
		end)
	end)
end, { noremap = true, silent = true, desc = "Replace all" })

vim.keymap.set("n", "<leader>rq", function()
	vim.ui.input({ prompt = "Search for: " }, function(search)
		if not search or search == "" then
			return
		end
		vim.ui.input({ prompt = "Replace with: " }, function(replace)
			if replace == nil then
				return
			end
			vim.cmd(string.format("cdo s/%s/%s/ge | update", search, replace))
		end)
	end)
end, { noremap = true, silent = true, desc = "Replace all in quickfix (auto)" })

vim.keymap.set("n", "<leader>rQ", function()
	vim.ui.input({ prompt = "Search for: " }, function(search)
		if not search or search == "" then
			return
		end
		vim.ui.input({ prompt = "Replace with: " }, function(replace)
			if replace == nil then
				return
			end
			vim.cmd(string.format("cdo s/%s/%s/gc | update", search, replace))
		end)
	end)
end, { noremap = true, silent = true, desc = "Replace in quickfix (confirm each)" })
