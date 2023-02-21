local Util = require("lazyvim.util")

return {
    "folke/which-key.nvim",
    event = "VeryLazy",
    opts = {
        plugins = { spelling = true },
    },
    config = function(_, opts)
        local wk = require("which-key")
        wk.setup(opts)
        local keymaps = {
            mode = { "n", "v" },
            ["g"] = { name = "+goto" },
            ["gz"] = { name = "+surround" },
            ["]"] = { name = "+next" },
            ["["] = { name = "+prev" },
            ["<leader><tab>"] = { name = "+tabs" },
            ["<leader>b"] = { name = "+buffer" },
            ["<leader>c"] = { name = "+code" },
            ["<leader>f"] = { name = "+file/find" },
            ["<leader>g"] = { name = "+git" },
            ["<leader>q"] = { name = "+quit/session" },
            ["<leader>s"] = { name = "+search" },
            ["<leader>u"] = { name = "+ui" },
            ["<leader>w"] = { name = "+windows" },
            ["<leader>x"] = { name = "+diagnostics/quickfix" },
            ["<leader>t"] = { name = "+tests" },
            ["<leader>o"] = { name = "+misc" }
        }
        if Util.has("noice.nvim") then
            keymaps["<leader>sn"] = { name = "+noice" }
        end
        wk.register(keymaps)
    end,
}
