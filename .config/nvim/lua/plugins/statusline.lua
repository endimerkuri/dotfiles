local gps = require('nvim-gps')
gps.setup()

require('lualine').setup{
    options = {
        theme = 'gruvbox',
        section_separators = '',
        component_separators = '',
        globalstatus = true,
    },
    sections = {
        lualine_c = {
            { gps.get_location, cond = gps.is_available }
        }
    },
}
