return
{
    {
        'axkirillov/hbac.nvim',
        dependencies = { 'nvim-telescope/telescope.nvim' },
        config = function()
            local actions = require("hbac.telescope.actions")
            require("hbac").setup({
                autoclose                  = true, -- set autoclose to false if you want to close manually
                threshold                  = 10,   -- hbac will start closing unedited buffers once that number is reached
                close_command              = function(bufnr)
                    vim.api.nvim_buf_delete(bufnr, {})
                end,
                close_buffers_with_windows = false, -- hbac will close buffers with associated windows if this option is `true`
                telescope                  = {
                    sort_mru = true,
                    sort_lastused = true,
                    selection_strategy = "row",
                    use_default_mappings = true, -- false to not include the mappings below
                    mappings = {
                        i = {
                            ["<M-c>"] = actions.close_unpinned,
                            ["<M-d>"] = actions.delete_buffer,
                            ["<M-a>"] = actions.pin_all,
                            ["<M-u>"] = actions.unpin_all,
                            ["<M-t>"] = actions.toggle_pin,
                        },
                        n = {
                            -- as above
                        },
                    },
                },
            })

            require('telescope').load_extension('hbac')

            vim.keymap.set('n', '<leader>btp', '<cmd>Hbac toggle_pin<cr>')
            vim.keymap.set('n', '<leader>bcu', '<cmd>Hbac close_unpinned<cr>')
            vim.keymap.set('n', '<leader>bpa', '<cmd>Hbac pin_all<cr>')
            vim.keymap.set('n', '<leader>bua', '<cmd>Hbac unpin_all<cr>')
            vim.keymap.set('n', '<leader>bta', '<cmd>Hbac toggle_autoclose<cr>')

            vim.keymap.set('n', '<leader>fb', '<cmd>Telescope hbac buffers<cr>')
        end
    }
}
