return {
	{
		"vague2k/vague.nvim",
		lazy = false,
		priority = 1000,
		config = function()
			vim.cmd([[colorscheme vague]])
			vim.api.nvim_set_hl(0, "StatusLine", { bg = "NONE" })
		end,
	},
}
