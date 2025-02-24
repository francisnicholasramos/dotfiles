require("dashboard")

-- print("Hello, niko!")
 
vim.opt.number = true 
vim.opt.guicursor = "n-v-c:block-blinkwait700-blinkoff400-blinkon250" -- blinking cursor 
vim.opt.guicursor = "n-v-c:block,i-ci:ver25,r-cr:hor20,o:hor50" -- thick cursor when insert mode

-- Key Maps
vim.g.mapleader = " "
vim.keymap.set('n', '<leader>w', ':w<CR>') -- save
vim.keymap.set('n', '<leader>q', ':q<CR>') -- quit 
vim.keymap.set('n', '<leader>t', ':terminal<CR>') -- terminal/shell
vim.keymap.set('n', '<leader>vv', ':Vex<cr>') -- vertical tab
vim.keymap.set('n', '<leader>ss', ':Sex<cr>') -- horizontal tab
vim.keymap.set('n', 'cf', ':e C:/Users/niko/AppData/Local/nvim/init.lua<cr>') -- init.lua
vim.keymap.set('n', ';', ':', { noremap = true }) -- command mode
vim.keymap.set('n', '[', ':bp<cr>') -- previous tab
vim.keymap.set('n', ']', ':bn<cr>') -- next tab
vim.keymap.set('n', '<leader>bd', ':bd<cr>') -- kill/exit current buffer
vim.keymap.set('n', '=p', '"+gP', { noremap = true, silent = true}) -- paste something you copy outside the vim


vim.keymap.set('n', '<leader>ff', ':Files<cr>', { noremap = true, silent = true })

-- Indentation
vim.o.autoindent = true   -- Enable auto indentation
vim.o.smartindent = true  -- Enable smart indentation
vim.o.expandtab = true    -- Convert tabs to spaces
vim.o.shiftwidth = 4      -- Number of spaces for indentation
vim.o.tabstop = 4         -- Number of spaces for a tab
vim.o.softtabstop = 4     -- Ensures backspace removes 4 spaces


-- Plug
vim.cmd [[
call plug#begin('~/.vim/plugged')

" Telescope
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim', { 'tag': '0.1.8' }

" NvimTree
Plug 'nvim-tree/nvim-tree.lua'

" LSP
Plug 'neovim/nvim-lspconfig'
Plug 'hrsh7th/nvim-cmp'
Plug 'hrsh7th/cmp-nvim-lsp'

Plug 'windwp/nvim-ts-autotag' " Auto complete tag for html
Plug 'windwp/nvim-autopairs' " Auto-Complete Brackets, Quotes, and Parentheses 
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'} " nvim-treesitter

" Mason
Plug 'williamboman/mason.nvim'
Plug 'williamboman/mason-lspconfig.nvim'

call plug#end()
]]

-- Mason setup
require("mason").setup()
require("mason-lspconfig").setup({
    ensure_installed = {
        "lua_ls", "pyright", "html", "cssls",
        "jsonls" }
})

-- treesitter
require('nvim-treesitter.configs').setup {
  ensure_installed = { "html", "css", "javascript", "lua", "json", "python", "php", "java" },
  highlight = { enable = false },
  indent = { enable = true, disable = {"html"} },
  autotag = { enable = true },
}

require('nvim-ts-autotag').setup() -- auto complete tag
require("nvim-autopairs").setup({ -- auto complete pair
  check_ts = true,
})

-- Setup LSPConfig
local lspconfig = require("lspconfig")

vim.diagnostic.config({
  signs = false,
})


-- Function to attach LSP
local on_attach = function(client, bufnr)
    local opts = { noremap=true, silent=true, buffer=bufnr }
    -- Keybindings for LSP
    vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
    vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
    vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, opts)
    vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, opts)
end

-- Setup LSP server
local servers = { "ts_ls", "lua_ls", "pyright", "html", "cssls", "jsonls" }
for _, server in ipairs(servers) do
    lspconfig[server].setup({
        on_attach = on_attach,
        flags = {
            debounce_text_changes = 150,
        }
    })
end

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true


-- LSP config for HTML/CSS
lspconfig.html.setup({
    on_attach = on_attach,
    capabilities = capabilities
})

lspconfig.cssls.setup({
    on_attach = on_attach,
    capabilities = capabilities
})

-- Emmet
lspconfig.emmet_ls.setup({
    filetypes = { "html", "css", "javascriptreact", "typescriptreact", "vue", "svelte" },
    init_options = {
        html = {
            options = {
                ["bem.enabled"] = true, -- Enable BEM support
            }
        }
    }
})

-- Autocompletion setup
local cmp = require'cmp'
cmp.setup({
    mapping = {
        ['<Down>'] = cmp.mapping.select_next_item(),  -- Move down
        ['<Up>'] = cmp.mapping.select_prev_item(), -- Move up
        ['<C-Space>'] = cmp.mapping.complete(),  -- Manually trigger completion
        ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Confirm selection
    },
    sources = {
        { name = 'nvim_lsp' },
    }
})


-- NvimTree config
require("nvim-tree").setup({
  sync_root_with_cwd = true,  -- Automatically change root when cd changes
  respect_buf_cwd = true,     -- Follow the buffer's directory
  update_focused_file = {
    enable = true,
    update_root = true,       -- Update NvimTree root when opening a new file
  },
})

vim.keymap.set("n", "<leader>e", ":NvimTreeToggle<CR>", { desc = "Toggle File Explorer" })

-- Auto-refresh NvimTree when changing directories
vim.api.nvim_create_autocmd("DirChanged", {
  pattern = "*",
  callback = function()
    require("nvim-tree.api").tree.reload()
  end,
})

-- NvimTree config
require("nvim-tree").setup({
  sync_root_with_cwd = true,  -- Automatically change root when `cd` changes
  respect_buf_cwd = true,     -- Follow the buffer's directory
  update_focused_file = {
    enable = true,
    update_root = true,       -- Update NvimTree root when opening a new file
  },
})

vim.keymap.set("n", "<leader>e", ":NvimTreeToggle<CR>", { desc = "Toggle File Explorer" })

-- Auto-refresh NvimTree when changing directories
vim.api.nvim_create_autocmd("DirChanged", {
  pattern = "*",
  callback = function()
    require("nvim-tree.api").tree.reload()
  end,
})

-- Telescope
local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = 'Telescope find files' })

-- -- Default theme
vim.cmd.colorscheme("habamax")
