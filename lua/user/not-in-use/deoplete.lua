-- Deoplete (Autocompletion Plugin)

return{
    'Shougo/deoplete.nvim',
    dependencies = {
        'roxma/nvim-yarp',
        'roxma/vim-hug-neovim-rpc',
},
    config = function()
        vim.g['deoplete#enable_at_startup'] = 1
        vim.fn['python3_host_prog'] = '/usr/bin/python3'
end,
}
