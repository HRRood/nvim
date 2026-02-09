return {
	{
		"ziontee113/icon-picker.nvim",
		event = "InsertEnter",
		config = function()
			require("icon-picker").setup({ disable_default_icons = false })
		end,
	},
}
