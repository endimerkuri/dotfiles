return {
	{
		"L3MON4D3/LuaSnip",
		-- follow latest release.
		version = "v2.*", -- Replace <CurrentMajor> by the latest released major (first number of latest release)
		-- install jsregexp (optional!).
		build = "make install_jsregexp",
		config = function()
			require("luasnip.loaders.from_lua").load({ paths = "~/.config/nvim/snippets/" })
			local ls = require("luasnip")
			vim.keymap.set("i", "<C-e>", function()
				ls.expand_or_jump(1)
			end, { silent = true })
			-- map({ "i", "s" }, "<C-J>", function() ls.jump(1) end, { silent = true })
			vim.keymap.set({ "i", "s" }, "<C-k>", function()
				ls.jump(-1)
			end, { silent = true })
		end,
	},
}
