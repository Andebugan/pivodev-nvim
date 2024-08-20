return {
    'nvim-neo-tree/neo-tree.nvim',
    branch = 'v3.x',
    dependencies = {
        'nvim-lua/plenary.nvim',
        'nvim-tree/nvim-web-devicons',
        'MunifTanjim/nui.nvim',
    },
    config = function()
        vim.keymap.set('n', '<leader>no', '<cmd>Neotree filesystem reveal left<cr>', {}) 
        vim.keymap.set('n', '<leader>nc', '<cmd>Neotree close<cr>', {})
    end
}