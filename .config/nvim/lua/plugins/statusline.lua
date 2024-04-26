return {
    'nvim-lualine/lualine.nvim',
    config = function ()
        require('lualine').setup{
            options = {
                section_separators = '',
                component_separators = '',
                globalstatus = true,
            },
            sections = {
                lualine_c = { 'buffers' }
            }
        }
    end
}
