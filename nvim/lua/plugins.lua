-- TODO: 添加插件
-- HACK: 很火

return {
    {
        'MunifTanjim/prettier.nvim',
        dependencies = {
            { 'jose-elias-alvarez/null-ls.nvim' }
        }
    },
    {
        "dense-analysis/ale"
    },
    {
        "mxsdev/nvim-dap-vscode-js", 
        dependencies = {"mfussenegger/nvim-dap"}
    },
    {
        "microsoft/vscode-js-debug",
        lazy = true,
        build = "npm install --legacy-peer-deps && npx gulp vsDebugServerBundle && mv dist out" 
    },
    {
        "folke/neodev.nvim",
        config = function()
            require("neodev").setup({
                library = {
                    enabled = true, 
                    runtime = true, 
                    types = true, 
                    plugins = { "nvim-dap-ui" }, 
                 },
                setup_jsonls = true, 
                override = function(root_dir, options) end,
                                  lspconfig = true,
                  --
                pathStrict = true,
            })
        end
    },
    { 
        "rcarriga/nvim-dap-ui",
        config = function()
            require'dapui'.setup{}
        end,
        dependencies = {"mfussenegger/nvim-dap"} 
    },
    {
        "mfussenegger/nvim-dap"
    },
    {
        "karb94/neoscroll.nvim",
        config = function()
            require('neoscroll').setup()
        end
    },
    {
        "folke/twilight.nvim",
        config = function()
            require("twilight").setup {}
        end
    },
    {
        "folke/todo-comments.nvim",
        dependencies = "nvim-lua/plenary.nvim",
        config = function()
            require("todo-comments").setup {}
        end
    },
    {
        "folke/trouble.nvim",
        dependencies = "nvim-tree/nvim-web-devicons",
        config = function()
            require("trouble").setup {
                auto_open = true,
                auto_close = true
            }
        end
    },
    -- {
    --     "folke/noice.nvim",
    --     config = function()
    --         require("noice").setup({
    --             messages = {
    --                 enabled = false, -- enables the Noice messages UI
    --                 view = "mini", -- default view for messages
    --                 view_error = "mini", -- view for errors
    --                 view_warn = "mini", -- view for warnings
    --                 view_history = "messages", -- view for :messages
    --                 view_search = "virtualtext",
    --             },
    --             notify = {
    --               enabled = false,
    --               view = "mini",
    --             },
    --             popupmenu = {
    --               enabled = false,
    --               backend = "nui",
    --               kind_icons = {},   },
    --         })
    --     end,
    --     dependencies = {
    --         "MunifTanjim/nui.nvim",
    --         "rcarriga/nvim-notify"
    --     }
    -- },
    {-- lspsaga
        "glepnir/lspsaga.nvim",
        event = "BufRead",
        config = function()
        require("lspsaga").setup({})
        end,
        dependencies = {
            {"nvim-tree/nvim-web-devicons"},
            --Please make sure you install markdown and markdown_inline parser
            {"nvim-treesitter/nvim-treesitter"},
        }
    },
    {-- zen-mode
        "folke/zen-mode.nvim",
        config = function()
            require("zen-mode").setup {}
        end
    },
    {-- nightly
        "Alexis12119/nightly.nvim"
    },
    {-- markdown-preview 
        "iamcco/markdown-preview.nvim",
        config = function() vim.fn["mkdp#util#install"]() end,
    },
    {-- live-server
        "aurum77/live-server.nvim",
        config = function()
            require"live_server.util".install()
        end,
        cmd = { "LiveServer", "LiveServerStart", "LiveServerStop" },
    },
    {-- gitsigns
        'lewis6991/gitsigns.nvim',
        config = function()
            require'gitsigns'.setup{}
        end,
    },
    {-- telescope
        'nvim-telescope/telescope.nvim',
        tag = '0.1.1',
        dependencies = {
            {
                'nvim-lua/plenary.nvim'
            },
            {
                'BurntSushi/ripgrep'
            },
            {
                'sharkdp/fd'
            },
        },
        config = function()
            require'telescope'.setup{}
        end
    },
    {-- toggleterm
        'akinsho/toggleterm.nvim',
        -- tag = '*',
        config = function()
            require'toggleterm'.setup{
                direction = 'float',
                open_mapping = [[<leader>z]],
                close_on_exit = true,
            }
        end,
    },
    {-- tokyonight
        -- nvim theme plugin
        'folke/tokyonight.nvim',
        config = function()
            vim.cmd[[colorscheme tokyonight-moon]]
            require'tokyonight'.setup()
        end,
    },
    {-- comment
        -- nvim comment plugin
        'numToStr/Comment.nvim',
        config = function()
            require'Comment'.setup{
                extra = {
                    ---Add comment on the line above
                    above = 'gck',
                    ---Add comment on the line below
                    below = 'gcj',
                    ---Add comment at the end of line
                    eol = 'gcl',
                },
            }
        end,
        lazy = false
    },
    {-- lualine
        -- nvim statu bar plugin
        'nvim-lualine/lualine.nvim',
        config = function()
            require'lualine'.setup{
                options = {
                    -- theme = 'gruvbox_dark'
                    theme = 'horizon'
                }
            }
        end,
    },
    {-- nvim-tree
        -- nvim file picker plugin
        'nvim-tree/nvim-tree.lua',
        dependencies = {
            -- 'nvim-tree/nvim-web-devicons',
        },
        config = function()
            require'nvim-tree'.setup{
                view = {
                    width = 20,
                },
            }
        end
    },
    {-- bufferline
        -- nvim tag view plugin
        'akinsho/bufferline.nvim',
        config = function()
            require'bufferline'.setup{
                options = {
                    numbers = function(opts)
                        return string.format('%s|%s', opts.ordinal, opts.raise(opts.id))
                    end,
                    diagnostics = "nvim_lsp",
                    offsets = {
                        {
                            filetype = "NvimTree",
                            text = "File Explorer",
                            text_align = "left",
                            separator = true
                        }
                    },
                    hover = {
                        enabled = true,
                        delay = 200,
                        reveal = {'close'}
                    },
                    separator_style = "slope"
                },
            }
        end,
    },
    {-- indent-blankline
        -- nvim indent plugin
        'lukas-reineke/indent-blankline.nvim',
        dependencies = {
            {
                "nvim-treesitter/nvim-treesitter",
                build = function()
                    local ts_update = require'nvim-treesitter.install'.update({ with_sync = true })
                    ts_update()
                end,
                config = function()
                    require'nvim-treesitter.configs'.setup{
                        ensure_install = { "lua", "help", "go", "css", "html", "javascript", "org", "markdown"},
                        sync_install = false,
                        auto_install = true,
                        highlight = {
                            enable = true,
                            -- additional_vim_regex_highlighting = false,
                            additional_vim_regex_highlighting = {'org'}
                        },
                    }
                end,
            },
        },
        config = function()
            vim.opt.list = true
            -- vim.opt.listchars:append "space:-"
            vim.opt.listchars:append "eol:↴"
            require("indent_blankline").setup {
                space_char_blankline = " ",
                show_current_context = true,
                show_current_context_start = false,
            }
        end
    },
    {-- lspconfig
        'neovim/nvim-lspconfig',
        config = function() 
        end,
    },
    {
        'hrsh7th/cmp-nvim-lsp',
    },
    {
        'hrsh7th/cmp-buffer',
    },
    {
        'hrsh7th/cmp-path',
    },
    {
        'hrsh7th/cmp-cmdline',
    },
    {
        'hrsh7th/cmp-vsnip',
    },
    {
        'hrsh7th/vim-vsnip',
    },
    {-- cmp
        'hrsh7th/nvim-cmp',
        dependencies = {
            'onsails/lspkind.nvim'
        },
        config = function()
            local t = function(str)
                return vim.api.nvim_replace_termcodes(str, true, true, true)
            end
            local cmp = require'cmp'
            cmp.setup{
                snippet = {
                    expand = function(args)
                        vim.fn["vsnip#anonymous"](args.body)
                    end,
                },
                formatting = {
                    format = require'lspkind'.cmp_format()
                },
                view = {
                    entries = { name = 'custom', selection_order = 'near_cursor' },
                },
                mapping = {
                    ["<Down>"] = cmp.mapping(function(fallback)
                        if cmp.visible() then
                            cmp.select_next_item({ behavior = cmp.SelectBehavior.Insert })
                        elseif vim.fn["vsnip#available"](1) == 1 then
                            vim.api.nvim_feedkeys(t("<Plug>(vsnip-expand-or-jump)"), "i", true)
                        else
                            fallback()
                        end
                    end, { "i", "s"}),
                    ["<Up>"] = cmp.mapping(function(fallback)
                        if cmp.visible() then
                            cmp.select_prev_item({ behavior = cmp.SelectBehavior.Insert })
                        elseif vim.fn["vsnip#jumpable"](-1) == 1 then
                            vim.api.nvim_feedkeys(t("<Plug>(vsnip-jump-prev)"), "i", true)
                        else
                            fallback()
                        end
                    end, { "i", "s"}),
                    ["<CR>"] = cmp.mapping({
                        i = cmp.mapping.confirm {
                            behavior = cmp.ConfirmBehavior.Replace,
                            select = true,
                        }
                    }),
                    ["<C-Space>"] = cmp.mapping(
                        cmp.mapping.complete(), { "i", "c"}
                    ),
                },
                sources = cmp.config.sources({
                    { name = 'nvim_lsp' },
                    { name = 'vsnip' },
                    { name = 'path' }
                    -- { name = 'neorg' },
                    -- { name = 'orgmode' },
                }, {
                    { name = 'buffer' }
                })
            }
            cmp.setup.cmdline(':', {
                mapping = cmp.mapping.preset.cmdline(),
                sources = cmp.config.sources({
                    { name = 'path' }
                }, {
                    { name = 'cmdline' }
                })
            })
        end
    },
    {-- autopairs
        'windwp/nvim-autopairs',
        config = function()
            require'nvim-autopairs'.setup()
        end,
    },
}

