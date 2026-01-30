return {
	"tpope/vim-sleuth",
	{
		"j-hui/fidget.nvim",
		opts = {},
	},
	{
		"NickvanDyke/opencode.nvim",
		dependencies = {
			-- Recommended for `ask()` and `select()`.
			-- Required for `snacks` provider.
			---@module 'snacks' <- Loads `snacks.nvim` types for configuration intellisense.
			{ "folke/snacks.nvim", opts = { input = {}, picker = {}, terminal = {} } },
		},
		config = function()
			---@type opencode.Opts
			vim.g.opencode_opts = {
				provider = {
					enabled = "tmux",
					tmux = {
						-- ...
					},
				},
			}

			-- Required for `opts.events.reload`.
			vim.o.autoread = true

			-- Recommended/example keymaps.
			-- vim.keymap.set({ "n", "x" }, "<C-a>", function()
			-- 	require("opencode").ask("@this: ", { submit = true })
			-- end, { desc = "Ask opencode" })
			-- vim.keymap.set({ "n", "x" }, "<C-x>", function()
			-- 	require("opencode").select()
			-- end, { desc = "Execute opencode action…" })
			vim.keymap.set({ "n", "t" }, "<leader>?", function()
				require("opencode").toggle()
			end, { desc = "Toggle opencode" })

			vim.keymap.set({ "n", "x" }, "go", function()
				return require("opencode").operator("@this ")
			end, { expr = true, desc = "Add range to opencode" })
			vim.keymap.set("n", "goo", function()
				return require("opencode").operator("@this ") .. "_"
			end, { expr = true, desc = "Add line to opencode" })

			vim.keymap.set("n", "<S-C-u>", function()
				require("opencode").command("session.half.page.up")
			end, { desc = "opencode half page up" })
			vim.keymap.set("n", "<S-C-d>", function()
				require("opencode").command("session.half.page.down")
			end, { desc = "opencode half page down" })

			-- You may want these if you stick with the opinionated "<C-a>" and "<C-x>" above — otherwise consider "<leader>o".
			-- vim.keymap.set("n", "+", "<C-a>", { desc = "Increment", noremap = true })
			-- vim.keymap.set("n", "-", "<C-x>", { desc = "Decrement", noremap = true })
		end,
	},
	{
		"gennaro-tedesco/nvim-jqx",
		ft = { "json", "yaml" },
	},
	{
		"monaqa/dial.nvim",
		config = function()
			local dial = require("dial.map")
			local augend = require("dial.augend")
			require("dial.config").augends:register_group({
				-- default augends used when no group name is specified
				default = {
					augend.integer.alias.decimal,
					augend.integer.alias.hex,
					augend.date.alias["%Y/%m/%d"],
					augend.constant.alias.bool,
					augend.constant.new({
						elements = { "True", "False" },
						word = true,
						cyclic = true,
					}),
				},
			})
			vim.keymap.set("n", "<C-a>", dial.inc_normal(), { noremap = true })
			vim.keymap.set("n", "<C-x>", dial.dec_normal(), { noremap = true })
			vim.keymap.set("v", "<C-a>", dial.inc_visual(), { noremap = true })
			vim.keymap.set("v", "<C-x>", dial.dec_visual(), { noremap = true })
			vim.keymap.set("v", "g<C-a>", dial.inc_gvisual(), { noremap = true })
			vim.keymap.set("v", "g<C-x>", dial.dec_gvisual(), { noremap = true })
		end,
	},
	"tpope/vim-dotenv",
	{
		"mbbill/undotree",
		config = function()
			vim.keymap.set("n", "<leader>ou", ":UndotreeToggle<CR>", {
				noremap = true,
				desc = "Toggle UndoTree",
			})
		end,
	},
	{
		"windwp/nvim-autopairs",
		config = function()
			require("nvim-autopairs").setup({})
		end,
	},
	"tpope/vim-surround",
}
