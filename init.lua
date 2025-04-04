local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

-- Load your plugins
require("core.keymaps")
require("plugins.plugin_config")

-- Custom theme (one dark)
-- vim.opt.termguicolors = true
-- vim.cmd([[
--     " General 
--     highlight Normal guibg=#1E222A guifg=#ABB2BF
--     highlight LineNr guifg=#5C6370
--     highlight Comment guifg=#5C6370
--     highlight Keyword guifg=#C678DD
--     highlight Identifier guifg=#E06C75
--     highlight Function guifg=#61AFEF
--     highlight String guifg=#98C379
--     highlight Type guifg=#E5C07B
--     highlight Constant guifg=#D19A66
--     highlight Statement guifg=#56B6C2
--     highlight Visual guibg=#3E4452
--     highlight CursorLine guibg=#2C323C
--     highlight StatusLine guibg=#282C34 guifg=#ABB2BF
--     highlight VertSplit guibg=#282C34 guifg=#3E4452
    
--     " Html
--     highlight htmlTag guifg=#56B6C2 
--     highlight htmlTagName guifg=#E06C75
--     highlight htmlArg guifg=#D19A66 
--     highlight htmlEndTag guifg=#E06C75

--     " Imports 
--     highlight pythonImport guifg=#56B6C2
--     highlight javascriptImport guifg=#56B6C2  
--     highlight typescriptImport guifg=#56B6C2 
--     highlight goImport guifg=#56B6C2
--     highlight rustImport guifg=#56B6C2 

--     " PHP Syntax Highlighting Fixes
--     highlight phpVarSelector guifg=#E06C75  
--     highlight phpKeyword guifg=#C678DD       
--     highlight phpOperator guifg=#56B6C2     
--     highlight phpParent guifg=#ABB2BF        
--     highlight phpFunction guifg=#61AFEF      
--     highlight phpStringDouble guifg=#98C379  
--     highlight phpStringSingle guifg=#98C379  
--     highlight phpHereDoc guifg=#98C379       
--     highlight phpNumber guifg=#D19A66        
--     highlight phpTag guifg=#E06C75           
-- ]])
