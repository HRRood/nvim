return {
	"coffebar/neovim-project",
	opts = {
		projects = {
			-- Define your project roots here. Glob patterns are supported.
			"~/code/*",
			"~/code/hydra/*",
			"~/.config/nvim", -- Useful for managing your dotfiles/Neovim config as a project
		},
		picker = {
			type = "telescope", -- or "fzf-lua" if you prefer
		},
		session_manager_opts = {
			autosave_last_session = false,
			autosave_ignore_dirs = {},
			autosave_ignore_filetypes = {
				"gitcommit",
				"gitrebase",
			},
		},
	},
	dependencies = {
		"nvim-lua/plenary.nvim", -- Required by Telescope
		"nvim-telescope/telescope.nvim", -- If you choose Telescope as your picker
		"Shatur/neovim-session-manager", -- For session management
	},
	init = function()
		-- Enable saving the state of plugins in the session
		vim.opt.sessionoptions:append("globals")
		vim.keymap.set("n", "<leader>fP", "<cmd>Telescope neovim-project discover<CR>", { desc = "Find project" })
		vim.keymap.set("n", "<leader>ph", "<cmd>Telescope neovim-project history<CR>", { desc = "Project history" })

		-- Automatically set the terminal title to the project name
		local function set_project_title()
			-- Check if we are in a project directory
			local project_path = vim.fn.getcwd()
			if project_path then
				local project_name = vim.fn.fnamemodify(project_path, ":t")
				if project_name and project_name ~= "" then
					vim.opt.title = true
					vim.opt.titlestring = project_name
				else
					-- If not in a project, clear the title to the default
					vim.opt.title = false
				end
			else
				-- If no current directory, clear the title
				vim.opt.title = false
			end
		end

		-- The 'VimEnter' autocmd will run after all startup files are processed.
		-- This is a great place to check if we've started in a project.
		vim.api.nvim_create_autocmd("VimEnter", {
			group = vim.api.nvim_create_augroup("ProjectTitleGroup", { clear = true }),
			callback = set_project_title,
		})

		-- This 'SessionLoadPost' autocmd from neovim-session-manager ensures the title
		-- is updated whenever a project session is loaded.
		vim.api.nvim_create_autocmd("SessionLoadPost", {
			group = "ProjectTitleGroup",
			callback = set_project_title,
		})
	end,
	lazy = false, -- Or set to true and use a custom keymap to load it
	priority = 100, -- Load early
}
