return {
    {
        'L3MON4D3/LuaSnip',
        dependencies = {
            'saadparwaiz1/cmp_luasnip',
            'rafamadriz/friendly-snippets',
        },
        lazy = true,
        config = function()
            vim.keymap.set('i', '<C-K>', function() ls.expand() end, {silent = true})
            vim.keymap.set({'i', 's'}, '<C-L>', function() ls.jump(1) end, {silent = true})
            vim.keymap.set({'i', 's'}, '<C-J>', function() ls.jump(-1) end, {silent = true})

            vim.keymap.set({'i', 's'}, '<C-E>', function()
                if ls.choie_active() then
                    ls.change_choice(1)
                end
            end,
            {silent = true})
        end,
    },
    {
        'hrsh7th/nvim-cmp',
        lazy = true,
        config = function()
            local cmp = require('cmp')
            require('luasnip.loaders.from_vscode').lazy_load()

            cmp.setup({
                snippet = {
                    expand = function(args)
                        require('luasnip').lsp_expand(args.body)
                    end,
                },
                window = {
                    completion = cmp.config.window.bordered(),
                    documentation = cmp.config.window.bordered(),
                },
                mapping= cmp.mapping.preset.insert({
                    ['<C-b>'] = cmp.mapping.scroll_docs(-4),
                    ['<C-f>'] = cmp.mapping.scroll_docs(4),
                    ['<C-space>'] = cmp.mapping.complete(),
                    ['<C-e>'] = cmp.mapping.abort(),
                    ['<CR>'] = cmp.mapping.confirm({ select = true }),
                }),
                sources = cmp.config.sources({
                    { name = 'nvim_lsp' },
                    { name = 'nvim_lsp_signature_help' },
                    { name = 'luasnip' },
                    { name = 'buffer' },
                    { name = 'path' },
                }),
            })
        end
    },
}