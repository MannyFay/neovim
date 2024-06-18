-- loading termguicolors for colorizer plugin (must load bevore plugins otherwise a error appears)
vim.opt.termguicolors = true

require("user.core")
require("user.lazy")
