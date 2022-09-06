local navic = require('nvim-navic')
navic.setup()

require('lualine').setup{
    options = {
        theme = 'gruvbox',
        section_separators = '',
        component_separators = '',
        globalstatus = true,
    },
    sections = {
        lualine_c = {
            { navic.get_location, cond = navic.is_available }
        }
    },
}
