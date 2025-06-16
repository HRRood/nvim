return {
	"echasnovski/mini.nvim",
	config = function()
		-- mini.ai - enhanced text objects
		require("mini.ai").setup({ n_lines = 500 })

		require("mini.sessions").setup({
			autosave = true, -- auto save session on exit or switch
			directory = "~/.config/nvim/session/", -- where session files are saved
		})

		-- mini.surround - add/delete/change surroundings
		require("mini.surround").setup()

		-- mini.statusline - simple statusline
		local statusline = require("mini.statusline")
		statusline.setup({ use_icons = vim.g.have_nerd_font })
		statusline.section_location = function()
			return "%2l:%-2v"
		end

		-- mini.pairs - auto pairs like brackets and quotes
		require("mini.pairs").setup()

		-- mini.comment - commenting with gcc, gc, etc.
		require("mini.comment").setup()

		-- mini.indentscope - visual indent guides
		require("mini.indentscope").setup({
			symbol = "│",
			options = { try_as_border = true },
		})

		-- mini.trailspace - trailing whitespace cleaner
		require("mini.trailspace").setup()

		-- mini.bufremove - better buffer delete
		require("mini.bufremove").setup()
		vim.keymap.set("n", "<leader>bd", function()
			require("mini.bufremove").delete(0, false)
		end, { desc = "Delete buffer" })

		-- mini.move - move lines/selections with arrow keys
		require("mini.move").setup({
			mappings = {
				line_left = "<Left>",
				line_right = "<Right>",
				line_down = "<Down>",
				line_up = "<Up>",
			},
		})

		local find_project_action = function()
			local hostname = vim.fn.hostname()

			local projects = {}

			if hostname == "ROYWERK" then
				projects = {
					"C:\\Users\\roy.roodenburg\\AppData\\Local\\nvim\\",
					"C:\\projects\\engineeringtrainer\\react-app\\",
					"C:\\projects\\engineeringtrainer\\EngineeringTrainer",
					"C:\\projects\\imagebuilders\\react-app\\",
					"C:\\projects\\imagebuilders\\ImageBuilders\\",
					"C:\\projects\\nextleapahead\\",
					"C:\\projects\\happyhairservice\\HappyHairService",
					"C:\\projects\\inlandmarinegroup\\InlandMarineGroup",
					"C:\\projects\\nacrasailing\\NacraSailing",
					"C:\\projects\\remeha\\Remeha",
					"C:\\projects\\remeha\\remeha-react",
					"C:\\projects\\aircomponents\\Aircomponents",
					"C:\\projects\\aircologic\\Aircologic",
					"C:\\projects\\lydis\\Lydis",
					"C:\\projects\\vandijkgroothandel\\VanDijkGroothandel",
					"C:\\projects\\aa-equipment\\AA-Equipment",
					"C:\\projects\\bosheide\\Bosheide",
					"C:\\projects\\asianfoodgroup\\AsianFoodGroup",
					"C:\\projects\\aircovent\\Aircovent",
					"C:\\projects\\aiki-budo\\Aiki-Budo",
					"C:\\projects\\mediceuticals\\Mediceuticals",
					"C:\\projects\\npm-checkout",
					"C:\\projects\\check-out",
					"C:\\projects\\birthbear\\BirthBear",
					"C:\\projects\\birthbear\\Configurator",
					"C:\\projects\\hotelpaal8\\HotelPaal8",
					"C:\\projects\\hotelpaal8\\i3be",
					"C:\\projects\\aspectra\\Aspectra",
					"C:\\projects\\bodyenshapestore\\BodyEnShapeStore",
					"C:\\projects\\good2move\\Good2Move",
					"C:\\projects\\odysseyhotelgroup.corporate",
					"C:\\projects\\karelv",
					"C:\\projects\\odysseyhotelgroup.therebyl",
					"C:\\projects\\odysseyhotelgroup.theden",
					"C:\\projects\\odysseyhotelgroup.madameliberty",
					"C:\\projects\\odysseyhotelgroup.adamundeden",
					"C:\\projects\\odysseyhotelgroup.zaatar",
					"C:\\projects\\styledevie\\StyleDeVie",
					"C:\\projects\\performance-dashboard",
					"C:\\projects\\brinkscoffeeroasters\\BrinkscoffeeRoasters",
					"C:\\projects\\1la-cms",
					"C:\\projects\\hetoranjekruis/HetOranjeKruis",
					"C:\\projects\\cleverdiagnostix\\CleverDiagnostix",
					"C:\\projects\\hagertyshop\\HagertyShop",
					"C:\\projects\\hagertyb2c\\HagertyB2C",
					"C:\\projects\\hs-climate-solutions\\HS-Climate-Solutions",
					"C:\\projects\\bodyandshapestore\\BodyAndShapeStore",
					"C:\\projects\\somerset-inn",
					"C:\\projects\\bobasupply\\BobaSupply",
					"C:\\projects\\alberstrading\\AlbersTrading",
					"C:\\projects\\pangaea-website-v3\\pangaea-website-v3",
					"C:\\projects\\phc\\PHC",
					"C:\\projects\\spaansen\\Spaansen",
					"C:\\projects\\mocbedrijfskleding\\MOCbedrijfskleding",
					"C:\\projects\\kartstoreinternational\\KartStoreInternational",
					"C:\\projects\\atis\\Atis",
					"C:\\projects\\atis\\3cx-app",
					"C:\\projects\\teleqare\\Teleqare",
					"C:\\projects\\fredimare\\Fredimare",
					"C:\\projects\\mp2netwerkproducten\\MP2NetwerkProducten",
					"C:\\projects\\trigitec\\Trigitec",
					"C:\\projects\\heetwaterexpert\\HeetWaterExpert",
					"C:\\projects\\shopaeav2\\ShopaeaV2",
					"C:\\projects\\hoteldesindes\\HotelDesIndes",
				}
			else
				projects = {
					"~/Sythir/Hydra/frontend",
					"~/Sythir/Hydra/platform",
					"~/Sythir/Hydra/agent",
					"~/projects/tivoli",
					"~/projects/gold-tracker",
					"~/projects/f1-stats",
				}
			end

			vim.ui.select(projects, { prompt = "Select project:" }, function(choice)
				if choice then
					vim.cmd("cd " .. choice)
					vim.cmd("bufdo bwipeout")
					print("Opened project: " .. choice)
				end
			end)
		end

		-- mini.starter - start screen
		require("mini.starter").setup({
			header = table.concat({

				"⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣀⣀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀",
				"⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣠⣤⣶⣿⣿⣿⣿⣷⣶⣤⣄⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀",
				"⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣠⣾⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣷⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀",
				"⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣴⣿⣿⣯⢀⡈⢻⣿⣿⣿⡏⢀⠈⣿⣿⣷⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀",
				"⣠⡶⠶⢦⠀⠀⠀⠀⠀⠀⠀⠀⠀⣿⣿⣿⣿⣾⣧⣿⡛⠙⠛⣷⣾⣼⣿⢿⣿⡅⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀",
				"⠹⣷⠾⣿⣆⠀⠀⠀⠀⠀⠀⠀⠀⣿⣿⣿⣿⠛⢿⣟⠇⠀⠀⠠⡶⣿⣿⣦⢻⣷⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀",
				"⠀⢻⣧⢹⣿⡀⠀⠀⠀⠀⠀⠀⢸⣿⢻⣿⣿⠀⠀⢠⡆⠀⠄⠀⠀⢸⣿⡟⡇⢻⡇⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀",
				"⠀⠈⣿⡆⣿⣧⠀⠀⠀⠀⠀⢀⣿⡏⣸⣿⣿⡄⠀⠈⠀⠀⠀⠀⠀⠀⣿⠃⣿⣿⣻⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀",
				"⠀⠀⠘⣿⡌⣿⣇⠀⠀⠀⠀⣾⡏⢠⣿⢻⣿⠃⣀⣤⣤⣤⣀⣀⠀⢠⣿⡆⢻⣿⣿⣷⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀",
				"⠀⠀⠀⢹⣿⢹⣿⡄⠀⠀⠀⣿⣇⣼⡇⣯⣿⡄⠹⠉⠉⠁⠀⠈⠉⣹⣿⣧⣾⣿⣿⠟⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀",
				"⠀⠀⠀⠀⢻⣇⢻⣳⡀⠀⠀⢈⣻⣿⣿⣿⣿⣿⣶⡶⣶⣷⣶⣶⣶⣿⣿⣿⣿⣿⣥⣀⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀",
				"⠀⠀⠀⠀⠈⢿⡌⣯⢷⣴⣾⣿⣿⣿⣿⣿⣿⣿⣿⣇⣿⣿⣿⡧⣿⣿⣿⣿⣿⣿⢿⣿⣿⣷⡀⠀⠀⠀⠀⠀⠀⠀",
				"⠀⠀⠀⠀⠀⠸⣿⣹⡎⢿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣯⢿⣿⣿⣿⡆⠀⠀⠀⠀⠀⠀",
				"⠀⠀⠀⠀⠀⠀⣼⣿⣷⢾⣻⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣽⣿⣿⣿⣿⣿⣿⣿⣿⣿⣷⣿⣿⣿⣿⡄⠀⠀⠀⠀⠀",
				"⠀⠀⠀⠀⠀⣸⠇⢶⣶⡿⢇⠄⣿⣿⣿⣿⣿⣿⡿⣾⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠿⣿⣿⣿⣿⣿⡀⠀⠀⠀⠀",
				"⠀⠀⠀⠀⢠⣿⣇⢷⣄⣴⡇⡰⢿⣿⣿⡿⣽⡟⣸⣿⣯⣿⣿⣯⣽⣿⣿⣿⣿⣿⣿⣦⣸⣿⣿⣿⣿⣧⠀⠀⠀⠀",
				"⠀⠀⠀⠀⣿⣿⣿⣦⢀⡥⠤⠀⠈⣿⣿⣿⣿⣩⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡿⠛⠙⢿⣿⣿⣿⣿⡄⠀⠀⠀",
				"⠀⠀⠀⢸⣿⣿⣿⣿⡟⢷⠀⢷⠀⠘⣿⣿⢻⣿⣿⣟⣿⣿⣿⣿⣛⣻⣿⣿⣿⣿⡟⢀⣤⣤⡉⢿⣿⣿⣿⠀⠀⠀",
				"⠀⠀⠀⣿⣿⣿⣿⣿⣧⣈⢳⣦⠼⣶⣿⣿⣿⣿⣿⠿⣿⠿⣿⠿⢿⣿⣿⡿⣿⣿⡇⠘⣿⣷⠇⢸⣿⣿⣿⡇⠀⠀",
				"⠀⠀⣼⣿⣿⣿⣿⣿⣿⣿⣏⣉⣠⣴⣶⣿⣿⣾⣿⣴⣾⣶⣶⣷⣾⣿⡿⣾⣾⣿⣷⣶⣿⣿⣶⣿⣿⣿⣿⣷⠀⠀",
				"⠀⢰⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣻⣹⣸⣯⣾⣿⣿⣿⣿⣿⣿⣿⡇⣿⣟⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡇⠀",
				"⠀⣾⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠀",
				"⣼⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣷⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡿⠿⠟⠂",
				"⠈⠉⠙⠛⠿⠿⠿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡿⠿⠛⠛⠉⠉⠁⠀⠀⠀⠀⠀⠀",
				"⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠉⣽⣿⣿⣿⣿⣿⣿⣿⠉⣿⣿⣿⣿⣿⣿⣿⣿⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀",
				"⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣿⣿⣿⣿⣿⣿⣿⣿⠀⣿⣿⣿⣿⣿⣿⣿⣿⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀",
				-- "⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣀⡀⠀⠀⠀⢀⣀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀",
				-- "⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣠⣤⣶⣾⣿⡉⢤⣍⡓⢶⣶⣦⣤⣉⠒⠤⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀",
				-- "⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣴⣿⣿⣿⣿⣿⣿⣷⡀⠙⣿⣷⣌⠻⣿⣿⣿⣶⣌⢳⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀",
				-- "⠀⠀⠀⠀⠀⠀⠀⠀⣰⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣄⠈⢿⣿⡆⠹⣿⣿⣿⣿⣷⣿⡀⠀⠀⠀⠀⠀⠀⠀⠀",
				-- "⠀⠀⠀⠀⠀⠀⠀⣰⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣷⣄⠹⣿⡄⢻⣿⣿⣿⣿⣿⣧⠀⠀⠀⠀⠀⠀⠀⠀",
				-- "⠀⠀⠀⠀⠀⠀⢠⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡿⠿⠿⣿⣿⣷⣽⣷⢸⣿⡿⣿⡿⠿⠿⣆⠀⠀⠀⠀⠀⠀⠀",
				-- "⠀⠀⠀⠀⠀⠀⣼⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡄⠀⠀⠀⠐⠾⢭⣭⡼⠟⠃⣤⡆⠘⢟⢺⣦⡀⠀⠀⠀⠀⠀",
				-- "⠀⠀⠀⠀⠀⠀⣿⣿⣿⣿⣿⣿⣿⣿⣿⡿⢛⣥⣶⠾⠿⠛⠿⠶⢬⡁⠀⠀⠘⣃⠤⠤⠤⢍⠻⡄⠀⠀⠀⠀",
				-- "⠀⠀⠀⠀⠀⠀⣿⣿⣿⣿⣿⣿⣿⡿⣫⣾⡿⢋⣥⣶⣿⠿⢿⣿⣿⣿⠩⠭⢽⣷⡾⢿⣿⣦⢱⡹⡀⠀⠀⠀",
				-- "⠀⠀⠀⠀⠀⠀⣿⣿⣿⣿⣿⣿⡟⠈⠛⠏⠰⢿⣿⣿⣧⣤⣼⣿⣿⣿⡏⠩⠽⣿⣀⣼⣿⣿⢻⣷⢡⠀⠀⠀",
				-- "⠀⠀⠀⠀⠀⢰⣿⣿⣿⣿⣿⣿⢁⣿⣷⣦⡀⠀⠉⠙⠛⠛⠛⠋⠁⠙⢻⡆⠀⢌⣉⠉⠉⠀⠸⣿⣇⠆⠀⠀",
				-- "⠀⠀⠀⠀⢀⣾⣿⣿⣿⣿⣿⡇⢸⣿⣿⣿⣿⠷⣄⢠⣶⣾⣿⣿⣿⣿⣿⠁⠀⠀⢿⣿⣿⣿⣷⠈⣿⠸⡀⠀",
				-- "⠀⠀⠀⠀⣼⣿⣿⣿⣿⣿⣿⠀⣌⡛⠿⣿⣿⠀⠈⢧⢿⣿⡿⠟⠋⠉⣠⣤⣤⣤⣄⠙⢿⣿⠏⣰⣿⡇⢇⠀",
				-- "⠀⠀⠀⣼⣿⣿⣿⣿⣿⣿⡇⢸⣿⣿⣶⣤⣙⠣⢀⠈⠘⠏⠀⠀⢀⣴⢹⡏⢻⡏⣿⣷⣄⠉⢸⣿⣿⣷⠸⡄",
				-- "⠀⠀⣸⣿⣿⣿⣿⣿⣿⣿⠁⣾⣟⣛⠛⠛⠻⠿⠶⠬⠔⠀⣠⡶⠋⠿⠈⠷⠸⠇⠻⠏⠻⠆⣀⢿⣿⣿⡄⢇",
				-- "⠀⢰⣿⣿⣿⣿⠿⠿⠛⠋⣰⣿⣿⣿⣿⠿⠿⠿⠒⠒⠂⠀⢨⡤⢶⣶⣶⣶⣶⣶⣶⣶⣶⠆⠃⣀⣿⣿⡇⣸",
				-- "⢀⣿⣿⠿⠋⣡⣤⣶⣾⣿⣿⣿⡟⠁⠀⣠⣤⣴⣶⣶⣾⣿⣿⣷⡈⢿⣿⣿⣿⣿⠿⠛⣡⣴⣿⣿⣿⣿⠟⠁",
				-- "⣼⠋⢁⣴⣿⣿⣿⣿⣿⣿⣿⣿⠀⠀⠀⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣎⠻⠟⠋⣠⣴⣿⣿⣿⣿⠿⠋⠁⠀⠀",
				-- "⢿⣷⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠀⣴⠀⠻⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣧⣠⣾⣿⠿⠿⠟⠋⠁⠀⠀⠀⠀⠀",
				-- "⠀⠉⠛⠛⠿⠿⠿⢿⣿⣿⣿⣵⣾⣿⣧⣾⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡿⠏⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀",
				-- "⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠉⠉⠉⠉⠉⠉⠉⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀",
			}, "\n"),
			items = {
				{
					name = "📂 Find Project",
					action = find_project_action,
					section = "Projects",
				},
				require("mini.starter").sections.recent_files(5, true),
				require("mini.starter").sections.sessions(5, true),
				require("mini.starter").sections.builtin_actions(),
			},
		})

		-- open the starter buffer when <leader>ss is pressed
		vim.keymap.set("n", "<leader>ss", function()
			require("mini.starter").open()
		end, { desc = "Open starter buffer" })

		-- close the starter buffer when <leader>sc is pressed
		vim.keymap.set("n", "<leader>sc", function()
			require("mini.starter").close()
		end, { desc = "Close starter buffer" })
	end,
}
