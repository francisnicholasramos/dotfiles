require("lazy").setup({
	-- Telescope
	{
		"nvim-telescope/telescope.nvim",
		dependencies = { "nvim-lua/plenary.nvim" },
		config = function()
			local builtin = require("telescope.builtin")
			vim.keymap.set("n", "<leader>ff", builtin.find_files, { desc = "Telescope find files" })
			vim.keymap.set(
				"n",
				"<leader>rf",
				require("telescope.builtin").oldfiles,
				{ desc = "Telescope recent files" }
			)
			vim.keymap.set("n", "<leader><leader>", builtin.buffers, { desc = "[ ] Find existing buffers" })
			vim.keymap.set("n", "<leader>sh", builtin.help_tags, { desc = "[S]earch [H]elp" })
		end,
	},

	-- Indent blank line
	{
		"lukas-reineke/indent-blankline.nvim",
		config = function()
			local highlight = {
				"CleanHl",
			}

			local hooks = require("ibl.hooks")
			hooks.register(hooks.type.HIGHLIGHT_SETUP, function()
				vim.api.nvim_set_hl(0, "CleanHl", { fg = "#303336" })
			end)

			require("ibl").setup({
				indent = {
					highlight = highlight,
				},

				scope = {
					enabled = false,
				},
			})
		end,
	},

	-- NvimTree
	{
		"nvim-tree/nvim-tree.lua",
		event = "VimEnter",
		config = function()
			require("nvim-tree").setup({
				sync_root_with_cwd = true,
				respect_buf_cwd = true,
				update_focused_file = { enable = true, update_root = true },
			})
			vim.keymap.set("n", "<leader>e", ":NvimTreeToggle<CR>", { desc = "Toggle File Explorer" })
		end,
	},

	-- LSP
	{
		"neovim/nvim-lspconfig",
		ft = { "python", "javascript", "lua" }, -- Only load LSP config for specific languages
		config = function()
			local lspconfig = require("lspconfig")

			vim.diagnostic.config({
				signs = true,
				virtual_text = false,
				underline = true,
				update_in_insert = false,
			})

			-- Function to attach LSP
			local on_attach = function(client, bufnr)
				local opts = { noremap = true, silent = true, buffer = bufnr }
				-- Keybindings for LSP
				vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
				vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
				vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)
				vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, opts)
			end

			local capabilities = vim.lsp.protocol.make_client_capabilities()
			capabilities.textDocument.completion.completionItem.snippetSupport = true

			-- LSP config for html, css, typescript, tailwindcss, eslint
			lspconfig.html.setup({
				on_attach = on_attach,
				capabilities = capabilities,
			})

			lspconfig.cssls.setup({
				on_attach = on_attach,
				capabilities = capabilities,
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
						},
					},
				},
			})
		end,
	},

	-- Autocompletion setup
	{
		"hrsh7th/nvim-cmp",
		event = "InsertEnter",
		config = function()
			local cmp = require("cmp")
			cmp.setup({
				mapping = {
					["<Down>"] = cmp.mapping.select_next_item(), -- Move down
					["<Up>"] = cmp.mapping.select_prev_item(), -- Move up
					["<C-Space>"] = cmp.mapping.complete(), -- Manually trigger completion
					["<CR>"] = cmp.mapping.confirm({ select = true }), -- Confirm selection
				},
				sources = {
					{ name = "nvim_lsp" },
				},
			})
		end,
	},
	{ "hrsh7th/cmp-nvim-lsp" },

	-- Auto complete tag
	{
		"windwp/nvim-ts-autotag",
    config = function()
			require("nvim-ts-autotag").setup()
		end,
	},

	-- Auto complete pairs
	{
		"windwp/nvim-autopairs",
		config = function()
			require("nvim-autopairs").setup({
				check_ts = true,
			})
		end,
	},

	-- Treesitter
	{
		"nvim-treesitter/nvim-treesitter",
		run = ":TSUpdate", -- Lazy load on specific command or event
		event = "BufRead", -- Only load when a buffer is read
		ft = { "lua", "python", "javascript" }, -- Load Treesitter only for these filetypes
		config = function()
			require("nvim-treesitter.configs").setup({
				ensure_installed = { "html", "css", "javascript", "tsx", "lua", "json", "python", "php", "java" },
				highlight = { enable = true },
				indent = { enable = true, disable = { "html" } },
				autotag = {
					enable = true,
					filetypes = {
						"html",
						"javascript",
						"typescript",
						"javascriptreact",
						"typescriptreact",
						"jsx",
						"tsx",
					},
				},
			})
		end,
	},

	-- Mason
	{
		"williamboman/mason.nvim",
		dependencies = { "williamboman/mason-lspconfig.nvim" },
		config = function()
			require("mason").setup()
			require("mason-lspconfig").setup({
				ensure_installed = {
					"lua_ls",
					"pyright",
					"html",
					"cssls",
					"ts_ls",
					"jsonls",

          -- MasonInstall prettier@2.8.8 
				},
			})
		end,
	},
	{ "williamboman/mason-lspconfig.nvim" },

	-- LuaSnip for rafce emmet
	{
		"L3MON4D3/LuaSnip",
		event = "InsertEnter",
		config = function()
			local luasnip = require("luasnip")
			require("luasnip.loaders.from_vscode").lazy_load()

			-- Keybind to expand snippets
			vim.keymap.set({ "i", "s" }, "<Tab>", function()
				if luasnip.expand_or_jumpable() then
					luasnip.expand_or_jump()
				else
					vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<Tab>", true, true, true), "n", false)
				end
			end, { silent = true })

			-- Navigate snippets with Shift+Tab
			vim.keymap.set({ "i", "s" }, "<S-Tab>", function()
				if luasnip.jumpable(-1) then
					luasnip.jump(-1)
				end
			end, { silent = true })
		end,
	},
	{
		"rafamadriz/friendly-snippets",
	},

	-- Lua formatting
	{
		"jose-elias-alvarez/null-ls.nvim",
		config = function()
			local null_ls = require("null-ls")

			null_ls.setup({
				sources = {
					null_ls.builtins.formatting.stylua,
				},
			})
		end,
	},

	-- Prettier
	{
		"MunifTanjim/prettier.nvim",
		ft = { "javascript", "typescript", "json", "html", "css" }, -- Only load for specific filetypes
		cmd = "Prettier", -- Load on demand when running the `:Prettier` command
		config = function()
			require("prettier").setup({
				bin = "prettier", -- Path to Prettier
				filetypes = {
					"lua",
					"javascript",
					"typescript",
					"javascriptreact",
					"typescriptreact",
					"json",
					"html",
					"css",
					"scss",
					"markdown",
          -- MasonInstall prettier@2.8.8
				},
			})
		end,
	},

	-- Git Signs
	{
		"lewis6991/gitsigns.nvim",
		config = function()
			require("gitsigns").setup({
				signs = {
					add = { text = "+" },
					change = { text = "~" },
					delete = { text = "x" },
					topdelete = { text = "TD" }, -- deletion at the top of a file
					changedelete = { text = "CD" }, -- modified line that was deleted later
					untracked = { text = "?" },
				},
				signs_staged = {
					add = { text = "A" },
					change = { text = "M" },
					delete = { text = "D" },
					topdelete = { text = "TD" }, -- deletion at the top of a file
					changedelete = { text = "CD" }, -- modified line that was deleted later
					untracked = { text = "U" },
				},
				signs_staged_enable = true,
				signcolumn = true, -- Toggle with `:Gitsigns toggle_signs`
				numhl = false, -- Toggle with `:Gitsigns toggle_numhl`
				linehl = false, -- Toggle with `:Gitsigns toggle_linehl`
				word_diff = false, -- Toggle with `:Gitsigns toggle_word_diff`
				watch_gitdir = {
					follow_files = true,
				},
				auto_attach = true,
				attach_to_untracked = false,
				current_line_blame = false, -- Toggle with `:Gitsigns toggle_current_line_blame`
				current_line_blame_opts = {
					virt_text = true,
					virt_text_pos = "eol", -- 'eol' | 'overlay' | 'right_align'
					delay = 1000,
					ignore_whitespace = false,
					virt_text_priority = 100,
					use_focus = true,
				},
				current_line_blame_formatter = "<author>, <author_time:%R> - <summary>",
				sign_priority = 6,
				update_debounce = 100,
				status_formatter = nil, -- Use default
				max_file_length = 40000, -- Disable if file is longer than this (in lines)
				preview_config = {
					-- Options passed to nvim_open_win
					border = "single",
					style = "minimal",
					relative = "cursor",
					row = 0,
					col = 1,
				},
			})
		end,
	},

	-- Tomorrow Night
	{
		"deparr/tairiki.nvim",
		config = function()
			require("tairiki").setup({
				palette = "dimmed",
			})
			vim.cmd("colorscheme tairiki")
		end,
	},


	-- Airline
	{ "vim-airline/vim-airline" },
	{
		"vim-airline/vim-airline-themes",
		config = function()
			vim.g.airline_theme = "onedark"
		end,
	},

	-- Live server
	{
		"barrett-ruth/live-server.nvim",
		  build = "npm add -g live-server",
		  cmd = { "LiveServerStart", "LiveServerStop" },
      config = function()
        require('live-server').setup()
    end
	},

	-- Pets (if you're bored asf)
	{
		"tamton-aquib/duck.nvim",
		config = function()
			vim.keymap.set("n", "<leader>dd", function()
				require("duck").hatch()
			end, {})
			vim.keymap.set("n", "<leader>dk", function()
				require("duck").cook()
			end, {})
			vim.keymap.set("n", "<leader>da", function()
				require("duck").cook_all()
			end, {})
		end,
	},

	-- Fugitive (git integration)
	{ "tpope/vim-fugitive", cmd = "Git" },

	-- StartupTime
	{ "dstein64/vim-startuptime" },

	-- File tree icons
	{ "nvim-tree/nvim-web-devicons" },

  -- Multi-cursor
  { 
   "mg979/vim-visual-multi",
    branch = 'master',
  },
})
