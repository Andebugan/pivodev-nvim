return {
    'akinsho/toggleterm.nvim',
    version = '*',
    config = function()
        require('toggleterm').setup({
            size = function(term)
                if term.direction == "horizontal" then
                    return 20
                elseif term.direction == "vertical" then
                    return vim.o.columns * 0.5
                end
            end,
            terminal_mappings = true,
        })

        vim.keymap.set('n', '<leader>th', '<cmd>1ToggleTerm name=1 direction=horizontal size=10<cr>', {})
        vim.keymap.set('n', '<leader>tv', '<cmd>1ToggleTerm name=1 direction=vertical<cr>', {})
        vim.keymap.set('n', '<leader>tf', '<cmd>1ToggleTerm name=1 direction=float<cr>', {})
        vim.keymap.set('n', '<leader>tt', '<cmd>1ToggleTerm name=1 direction=tab<cr>', {})

        vim.keymap.set('n', '<leader>2th', '<cmd>2ToggleTerm name=2 direction=horizontal size=10<cr>', {})
        vim.keymap.set('n', '<leader>2tv', '<cmd>2ToggleTerm name=2 direction=vertical<cr>', {})
        vim.keymap.set('n', '<leader>2tf', '<cmd>2ToggleTerm name=2 direction=float<cr>', {})
        vim.keymap.set('n', '<leader>2tt', '<cmd>2ToggleTerm name=2 direction=tab<cr>', {})

        vim.keymap.set('n', '<leader>3th', '<cmd>3ToggleTerm name=3 direction=horizontal size=10<cr>', {})
        vim.keymap.set('n', '<leader>3tv', '<cmd>3ToggleTerm name=3 direction=vertical<cr>', {})
        vim.keymap.set('n', '<leader>3tf', '<cmd>3ToggleTerm name=3 direction=float<cr>', {})
        vim.keymap.set('n', '<leader>3tt', '<cmd>3ToggleTerm name=3 direction=tab<cr>', {})

        vim.keymap.set('n', '<leader>ts', '<cmd>TermSelect<cr>', {})

        local trim_spaces = true
        vim.keymap.set("v", "<space>s", function()
            require("toggleterm").send_lines_to_terminal("visual_selection", trim_spaces, { args = vim.v.count })
        end)
        -- For use as an operator map:
        -- Send motion to terminal
        vim.keymap.set("n", [[<leader><c-\>]], function()
            set_opfunc(function(motion_type)
                require("toggleterm").send_lines_to_terminal(motion_type, false, { args = vim.v.count })
            end)
            vim.api.nvim_feedkeys("g@", "n", false)
        end)
        -- Double the command to send line to terminal
        vim.keymap.set("n", [[<leader><c-\><c-\>]], function()
            set_opfunc(function(motion_type)
                require("toggleterm").send_lines_to_terminal(motion_type, false, { args = vim.v.count })
            end)
            vim.api.nvim_feedkeys("g@_", "n", false)
        end)
        -- Send whole file
        vim.keymap.set("n", [[<leader><leader><c-\>]], function()
            set_opfunc(function(motion_type)
                require("toggleterm").send_lines_to_terminal(motion_type, false, { args = vim.v.count })
            end)
            vim.api.nvim_feedkeys("ggg@G''", "n", false)
        end)

        function _G.set_terminal_keymaps()
            local opts = { buffer = 0 }
            vim.keymap.set('t', '<esc>', [[<C-\><C-n>]], opts)
            vim.keymap.set('t', 'jk', [[<C-\><C-n>]], opts)
            vim.keymap.set('t', '<C-h>', [[<Cmd>wincmd h<CR>]], opts)
            vim.keymap.set('t', '<C-j>', [[<Cmd>wincmd j<CR>]], opts)
            vim.keymap.set('t', '<C-k>', [[<Cmd>wincmd k<CR>]], opts)
            vim.keymap.set('t', '<C-l>', [[<Cmd>wincmd l<CR>]], opts)
            vim.keymap.set('t', '<C-w>', [[<C-\><C-n><C-w>]], opts)
        end

        -- if you only want these mappings for toggle term use term://*toggleterm#* instead
        vim.cmd('autocmd! TermOpen term://* lua set_terminal_keymaps()')
    end
}
