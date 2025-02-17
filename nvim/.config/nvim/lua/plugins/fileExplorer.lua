return {
	{
		"stevearc/oil.nvim",
		dependencies = { { "echasnovski/mini.icons", opts = {} } },
		config = function()
			require("oil").setup({
				delete_to_trash = true,
			})
			vim.keymap.set("n", "-", "<CMD>Oil<CR>", { desc = "Open parent directory" })
		end,
	},
	{
		"ThePrimeagen/harpoon",
		branch = "harpoon2",
		dependencies = { "nvim-lua/plenary.nvim" },
		config = function()
			local harpoon = require("harpoon")
			harpoon.setup()

			vim.keymap.set("n", "<leader>a", function()
				harpoon:list():add()
			end, { desc = "Harpoon Add File" })
			vim.keymap.set("n", "<leader>.", function()
				harpoon.ui:toggle_quick_menu(harpoon:list())
			end, { desc = "Harpoon" })
			vim.keymap.set("n", "<leader>1", function()
				harpoon:list():select(1)
			end, { desc = "Harpoon File 1" })
			vim.keymap.set("n", "<leader>2", function()
				harpoon:list():select(2)
			end, { desc = "Harpoon File 2" })
			vim.keymap.set("n", "<leader>3", function()
				harpoon:list():select(3)
			end, { desc = "Harpoon File 3" })
			vim.keymap.set("n", "<leader>4", function()
				harpoon:list():select(4)
			end, { desc = "Harpoon File 4" })
		end,
	},
}
