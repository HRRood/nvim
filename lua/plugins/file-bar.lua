return {
	{
		"akinsho/bufferline.nvim",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		event = "VeryLazy",
		keys = {
			{ "<leader>bp", "<Cmd>BufferLineTogglePin<CR>", desc = "Toggle Pin buffer" },
			{ "<leader>bP", "<Cmd>BufferLineGroupClose ungrouped<CR>", desc = "Close non‑pinned buffers" },
			{ "<leader>br", "<Cmd>BufferLineCloseRight<CR>", desc = "Close buffers to the right" },
			{ "<leader>bl", "<Cmd>BufferLineCloseLeft<CR>", desc = "Close buffers to the left" },
			{ "<S-q>", "<Cmd>bd<CR>", desc = "Close buffer" },
			{ "<S-h>", "<Cmd>BufferLineCyclePrev<CR>", desc = "Previous buffer" },
			{ "<S-l>", "<Cmd>BufferLineCycleNext<CR>", desc = "Next buffer" },
			{ "[B", "<Cmd>BufferLineMovePrev<CR>", desc = "Move buffer left" },
			{ "]B", "<Cmd>BufferLineMoveNext<CR>", desc = "Move buffer right" },
		},
		opts = {
			options = {
				mode = "buffers",
				style_preset = nil, -- nil = default
				themable = true,
				numbers = "ordinal",
				close_command = "bdelete! %d",
				right_mouse_command = "bdelete! %d",
				left_mouse_command = "buffer %d",
				-- indicator = { icon = "▎", style = "icon" },
				indicator = { style = "icon" },
				buffer_close_icon = "󰅖",
				modified_icon = "●",
				close_icon = "",
				left_trunc_marker = "",
				right_trunc_marker = "",
				max_name_length = 18,
				max_prefix_length = 15,
				truncate_names = true,
				tab_size = 18,
				diagnostics = "nvim_lsp",
				diagnostics_indicator = function(count)
					return "(" .. count .. ")"
				end,
				offsets = {
					{
						filetype = "NvimTree",
						text = "File Explorer",
						text_align = "center",
						separator = true,
					},
				},
				color_icons = true,
				show_buffer_icons = true,
				show_buffer_close_icons = true,
				show_close_icon = true,
				show_tab_indicators = true,
				show_duplicate_prefix = false,
				duplicates_across_groups = true,
				persist_buffer_sort = true,
				separator_style = "slant",
				enforce_regular_tabs = false,
				always_show_bufferline = true,
				hover = { enabled = true, delay = 200, reveal = { "close" } },
				sort_by = "insert_after_current",
			},
		},
		config = function(_, opts)
			require("bufferline").setup(opts)
		end,
	},
}
