return {
	{
		"tpope/vim-fugitive",
		config = function()
			vim.keymap.set("n", "<leader>gs", ":Gedit :<CR>", { noremap = true, desc = "Git Fugitive" })
			vim.keymap.set("n", "<leader>gu", ":G pull<CR>", { noremap = true, desc = "Git Fetch All" })
		end,
	},
	{
		"lewis6991/gitsigns.nvim",
		event = { "BufReadPre", "BufNewFile" },
		opts = {
			signs = {
				add = { text = "│" },
				change = { text = "│" },
				delete = { text = "_" },
				topdelete = { text = "‾" },
				changedelete = { text = "~" },
				untracked = { text = "┆" },
			},
			on_attach = function(buffer)
				local gs = package.loaded.gitsigns

				local function map(mode, l, r, desc)
					vim.keymap.set(mode, l, r, { buffer = buffer, desc = desc })
				end

				map("n", "]h", gs.next_hunk, "Next Hunk")
				map("n", "[h", gs.prev_hunk, "Prev Hunk")
				map({ "n", "v" }, "ghs", ":Gitsigns stage_hunk<CR>", "Stage Hunk")
				map({ "n", "v" }, "ghr", ":Gitsigns reset_hunk<CR>", "Reset Hunk")
				map("n", "ghS", gs.stage_buffer, "Stage Buffer")
				map("n", "ghu", gs.undo_stage_hunk, "Undo Stage Hunk")
				map("n", "ghR", gs.reset_buffer, "Reset Buffer")
				map("n", "ghp", gs.preview_hunk, "Preview Hunk")
				map("n", "ghb", function()
					gs.blame_line({ full = true })
				end, "Blame Line")
				map("n", "ghd", gs.diffthis, "Diff This")
				map("n", "ghD", function()
					gs.diffthis("~")
				end, "Diff This ~")
				map({ "o", "x" }, "ih", ":<C-U>Gitsigns select_hunk<CR>", "GitSigns Select Hunk")
				map("n", "<leader>gb", ":Gitsigns blame<CR>", "Git Blame")
			end,
		},
	},
}
