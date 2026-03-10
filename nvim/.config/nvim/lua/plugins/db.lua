return {
	{
		"kristijanhusak/vim-dadbod-ui",
		dependencies = {
			{ "tpope/vim-dadbod", lazy = true },
			{ "kristijanhusak/vim-dadbod-completion", lazy = true },
		},
		cmd = { "DBUI", "DBUIToggle", "DBUIAddConnection", "DBUIFindBuffer" },
		keys = {
			{ "<leader>od", ":DBUIToggle<CR>", noremap = true, desc = "Toggle DBUI" },
		},
		config = function()
			vim.g.db_ui_win_position = "left"
			vim.g.db_ui_use_nerd_fonts = true
			vim.g.db_ui_icons = {
				expanded = {
					db = "▾  ",
					buffers = "▾  ",
					saved_queries = "▾  ",
					schemas = "▾  ",
					schema = "▾  ",
					tables = "▾  ",
					table = "▾  ",
				},
				collapsed = {
					db = "▸  ",
					buffers = "▸  ",
					saved_queries = "▸  ",
					schemas = "▸  ",
					schema = "▸  ",
					tables = "▸  ",
					table = "▸  ",
				},
				saved_query = " ",
				new_query = " ",
				tables = " ",
				buffers = " ",
				add_connection = " ",
				connection_ok = "✓ ",
				connection_error = "✕ ",
			}
		end,
	},
}
