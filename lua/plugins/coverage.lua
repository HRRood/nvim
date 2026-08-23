return {
	"andythigpen/nvim-coverage",
	dependencies = { "nvim-lua/plenary.nvim" },
	-- lua/coverage/languages/php.lua in this config overrides the plugin's
	-- built-in PHP loader with a dependency-free Cobertura XML parser.
	ft = "php",
	keys = {
		{ "<leader>cc", function() require("coverage").load(true) end, desc = "Load & Show Coverage" },
		{ "<leader>ct", function() require("coverage").toggle() end, desc = "Toggle Coverage Signs" },
		{ "<leader>cs", function() require("coverage").summary() end, desc = "Coverage Summary" },
		{ "<leader>cx", function() require("coverage").clear() end, desc = "Clear Coverage" },
	},
	config = function()
		require("coverage").setup({
			lang = {
				php = {
					coverage_file = "coverage.cobertura.xml",
					-- phpunit runs inside the docker container where the project
					-- root is mounted at /var/www/html; strip that so paths
					-- resolve against the local project root instead.
					-- trailing slash matters: it makes the mapped source relative
					-- ("resources/Leadinfo") instead of an absolute "/resources/..."
					path_mappings = {
						["/var/www/html/"] = "",
					},
				},
			},
		})
	end,
}
