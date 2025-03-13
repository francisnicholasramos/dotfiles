print ("Hello, niko!")

vim.opt.number = true
vim.opt.cursorline = true -- show which line your cursor is on

-- Key Maps
vim.g.mapleader = " "
vim.keymap.set('n', '<leader>w', ':w<CR>') -- save
vim.keymap.set('n', '<leader>q', ':q<CR>') -- quit 
vim.keymap.set('n', '<leader>t', ':terminal<CR>') -- terminal/shell
vim.keymap.set('n', '<leader>vv', ':Vex<cr>') -- vertical tab
vim.keymap.set('n', '<leader>ss', ':Sex<cr>') -- horizontal tab
vim.keymap.set('n', 'cf', ':e ~/.config/nvim/init.lua<cr>') -- init.lua
vim.keymap.set('n', ';', ':', { noremap = true }) -- command mode
vim.keymap.set('n', '[', ':bp<cr>') -- previous tab
vim.keymap.set('n', ']', ':bn<cr>') -- next tab
vim.keymap.set('n', '<leader>bd', ':bd<cr>') -- kill/exit current buffer
vim.keymap.set('n', '=p', '"+gP', { noremap = true, silent = true}) -- paste something you copy outside the vim
vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>") -- clear highlights on search when pressing
vim.keymap.set('t', '<Esc>', '<C-\\><C-n>', { noremap = true, silent =  true }) -- exit terminal mode
vim.keymap.set('n', '<leader>bd', '<C-\\><C-n>:bd!<CR>', { noremap = true, silent = true }) -- kill terminal
vim.opt.splitright = true -- configure how new splits should be opened 
vim.opt.splitbelow = true -- configure how new splits should be opened 


vim.keymap.set('n', '<leader>ff', ':Files<cr>', { noremap = true, silent = true })


-- Indentation
vim.o.autoindent = true   -- Enable auto indentation
vim.o.smartindent = true  -- Enable smart indentation
vim.o.expandtab = true    -- Convert tabs to spaces
vim.o.shiftwidth = 2      -- Number of spaces for indentation
vim.o.tabstop = 2         -- Number of spaces for a tab


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

Plug 'windwp/nvim-ts-autotag' " Auto complete tag
Plug 'windwp/nvim-autopairs' " Auto-Complete Brackets, Quotes, and Parentheses 
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'} " nvim-treesitter

" Mason
Plug 'williamboman/mason.nvim'
Plug 'williamboman/mason-lspconfig.nvim'

" LuaSnip for rafce emmet
Plug 'L3MON4D3/LuaSnip'
Plug 'rafamadriz/friendly-snippets'

" Prettier
Plug 'jose-elias-alvarez/null-ls.nvim'
Plug 'MunifTanjim/prettier.nvim'

" Tomorrow Night theme
Plug 'deparr/tairiki.nvim'

" Airline
Plug 'vim-airline/vim-airline'  
Plug 'vim-airline/vim-airline-themes'  

call plug#end()
]]


-- Mason setup
require("mason").setup()
require("mason-lspconfig").setup({
    ensure_installed = {
        "lua_ls", "html", "cssls", "ts_ls",
        "jsonls" }
})

-- treesitter
require('nvim-treesitter.configs').setup {
  ensure_installed = { "html", "css", "javascript", "tsx", "lua", "json"},
  highlight = { enable = false },
  indent = { enable = true, disable = {"html"} },
  autotag = {
        enable = true,
        filetypes = { 'html', 'javascript', 'typescript', 'javascriptreact', 'typescriptreact', 'jsx', 'tsx' } 
    },

}

require('nvim-ts-autotag').setup() -- auto complete tag
require("nvim-autopairs").setup({ -- auto complete pair
  check_ts = true,
})

-- Prettier
require("prettier").setup({
    bin = 'prettier', -- Path to Prettier
    filetypes = {
        "javascript", "typescript", "javascriptreact", "typescriptreact",
        "json", "html", "css", "scss", "markdown"
    }
})


-- LuaSnip emmet for jsx/tsx
local luasnip = require("luasnip")
require("luasnip.loaders.from_vscode").lazy_load()

-- Keybind to expand snippets
vim.keymap.set({"i", "s"}, "<Tab>", function()
    if luasnip.expand_or_jumpable() then
        luasnip.expand_or_jump()
    else
        vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<Tab>", true, true, true), "n", false)
    end
end, { silent = true })

-- Navigate snippets with Shift+Tab
vim.keymap.set({"i", "s"}, "<S-Tab>", function()
    if luasnip.jumpable(-1) then
        luasnip.jump(-1)
    end
end, { silent = true })


-- Setup LSPConfig
local lspconfig = require("lspconfig")

vim.diagnostic.config({
  virtual_text = true, 
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
local servers = { "ts_ls", "tailwindcss", "eslint", "lua_ls", "pyright", "html", "cssls", "jsonls" }
for _, server in ipairs(servers) do
    lspconfig[server].setup({
        on_attach = on_attach,
        capabilities = capabilities,
        flags = {
            debounce_text_changes = 150,
        }
    })
end


local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true


-- LSP config for html, css, typescript, tailwindcss, eslint
lspconfig.html.setup({
    on_attach = on_attach,
    capabilities = capabilities
})

lspconfig.cssls.setup({
    on_attach = on_attach,
    capabilities = capabilities
})

lspconfig.ts_ls.setup({
    on_attach = on_attach,
    capabilities = capabilities,
})

lspconfig.tailwindcss.setup({
    on_attach = on_attach,
    capabilities = capabilities,
})

lspconfig.eslint.setup({
    on_attach = on_attach,
    capabilities = capabilities,
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


-- Telescope
local builtin = require('telescope.builtin')
vim.keymap.set("n", "<leader>sh", builtin.help_tags, { desc = "[S]earch [H]elp" })
vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = 'Telescope find files' })
vim.keymap.set("n", "<leader><leader>", builtin.buffers, { desc = "[ ] Find existing buffers" }) -- find existing buffers

-- Default theme
-- vim.cmd.colorscheme("habamax")

-- Tomorrow night theme
require('tairiki').setup({
  palette = "dimmed",
  default_dark  = "dimmed",
})
vim.cmd("colorscheme tairiki")
vim.g.airline_theme = 'onedark'



