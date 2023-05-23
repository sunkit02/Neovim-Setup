-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]
--
return require('packer').startup(function(use)
    -- Packer can manage itself
    use {'wbthomason/packer.nvim'}
    use {
        'nvim-telescope/telescope.nvim', tag = '0.1.1',
        -- or                            , branch = '0.1.x',
        requires = { {'nvim-lua/plenary.nvim'} }
    }
    -- Colorshemes
    use {"rose-pine/neovim"}
    use {"ellisonleao/gruvbox.nvim"}

    -- Basic tools setup
    use ('nvim-treesitter/nvim-treesitter', {run = ':TSUpdate'})
    use ('nvim-treesitter/playground')
    use ('theprimeagen/harpoon')
    use ('mbbill/undotree')
    use ('tpope/vim-fugitive')

    -- LSP
    use {
        'VonHeikemen/lsp-zero.nvim',
        branch = 'v1.x',
        requires = {
            -- LSP Support
            {'neovim/nvim-lspconfig'},             -- Required
            {'williamboman/mason.nvim'},           -- Optional
            {'williamboman/mason-lspconfig.nvim'}, -- Optional

            -- Autocompletion
            {'hrsh7th/nvim-cmp'},         -- Required
            {'hrsh7th/cmp-buffer'},       -- Optional
            {'hrsh7th/cmp-path'},         -- Optional
            {'saadparwaiz1/cmp_luasnip'}, -- Optional
            {'hrsh7th/cmp-nvim-lsp'},     -- Required
            {'hrsh7th/cmp-nvim-lua'},     -- Optional

            -- Snippets
            {'L3MON4D3/LuaSnip'},             -- Required
            {'rafamadriz/friendly-snippets'}, -- Optional
        }
    }

    use { "mfussenegger/nvim-jdtls", ft = { "java" } }

    -- Comments
    use ('numToStr/Comment.nvim')
    -- Lualine
    use ('nvim-lualine/lualine.nvim')
    -- Transparent background
    use ('xiyaowong/nvim-transparent')

    use {
        'nvim-tree/nvim-tree.lua',
        requires = {
            'nvim-tree/nvim-web-devicons', -- optional, for file icons
        },
        tag = 'nightly' -- optional, updated every week. (see issue #1193)
    }

    -- Debugging
    use ('mfussenegger/nvim-dap')
    use ('leoluz/nvim-dap-go')
    use ('rcarriga/nvim-dap-ui')
    use ('theHamsta/nvim-dap-virtual-text')
    use ('nvim-telescope/telescope-dap.nvim')

    -- Tmux Navigation
    use {"alexghergh/nvim-tmux-navigation"}

    -- Startup splashscreen
    -- use {
    --     'goolord/alpha-nvim',
    --     config = function ()
    --         require'alpha'.setup(require'alpha.themes.dashboard'.config)
    --     end
    -- }
    --
    -- TODOs highlighting
    use { "folke/todo-comments.nvim", requires = "nvim-lua/plenary.nvim" }

    -- Rust tools
    use('simrat39/rust-tools.nvim')
    use('nvim-lua/plenary.nvim')

    -- Diagnostics display
    use { "folke/trouble.nvim", requires = "nvim-tree/nvim-web-devicons" }

end)
