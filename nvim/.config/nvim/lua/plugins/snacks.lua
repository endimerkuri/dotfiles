return {
	"folke/snacks.nvim",
	priority = 1000,
	lazy = false,
	opts = {
		bigfile = { enabled = false },
		indent = { enabled = false },
		input = { enabled = false },
		notifier = { enabled = true },
		quickfile = { enabled = false },
		scroll = { enabled = false },
		statuscolumn = { enabled = false },
		words = { enabled = false },
		picker = {
			enabled = true,
			formatters = {
				file = {
					truncate = 80,
				},
			},
		},
		dashboard = {
			preset = {
				keys = {
					{ icon = " ", key = "p", desc = "Projects", action = ":lua Snacks.picker.projects()" },
					{ icon = " ", key = "d", desc = "Database", action = ":ene | DBUIToggle" },
					{ icon = " ", key = "f", desc = "Find File", action = ":lua Snacks.picker.files()" },
					{ icon = " ", key = "n", desc = "New File", action = ":ene | startinsert" },
					{ icon = " ", key = "r", desc = "Recent Files", action = ":lua Snacks.picker.recent()" },
					{ icon = " ", key = "g", desc = "Find Text", action = ":lua Snacks.picker.grep()" },
					{
						icon = " ",
						key = "c",
						desc = "Config",
						action = ":lua Snacks.picker.files({ cwd = vim.fn.stdpath('config') })",
					},
					{
						icon = "󰒲 ",
						key = "l",
						desc = "Lazy",
						action = ":Lazy",
						enabled = package.loaded.lazy ~= nil,
					},
					{ icon = " ", key = "q", desc = "Quit", action = ":qa" },
				},
			},
			sections = {
				{ section = "header" },
				{ section = "keys", gap = 1, padding = 1 },
				{ section = "startup" },
			},
		},
	},
	keys = {
		{
			"<leader>f",
			function()
				Snacks.picker.files({ hidden = true })
			end,
			desc = "Files",
		},
		{
			"<leader>,",
			function()
				Snacks.picker.buffers()
			end,
			desc = "Buffers",
		},
		{
			"<leader>sw",
			function()
				Snacks.picker.grep_word()
			end,
			desc = "Grep Word",
		},
		{
			"<c-p>",
			function()
				Snacks.picker.grep()
			end,
			desc = "Grep",
		},
	},
}
