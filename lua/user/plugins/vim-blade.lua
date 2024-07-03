-------------------------------------------------------------------------------
-- vim-blade Plugin
-- Blade syntax highligting:

-- https://github.com/jwalton512/vim-blade?tab=readme-ov-file
-------------------------------------------------------------------------------
return{
      'jwalton512/vim-blade',
      config = function()

vim.cmd ([[
" Define some single Blade directives. This variable is used for highlighting only.
let g:blade_custom_directives = ['props', 'servers']

" Define pairs of Blade directives. This variable is used for highlighting and indentation.
let g:blade_custom_directives_pairs = {
      \   'markdown': 'endmarkdown',
      \   'cache': 'endcache',
      \   'setup': 'endsetup',
      \   'story': 'endstory',
      \   'task': 'endtask',
      \   'before': 'endbefore',
      \   'error': 'enderror',
      \   'finished': 'endfinished'
      \ }

]])
      end,
}
