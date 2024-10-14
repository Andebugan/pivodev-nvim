local plugins = {
    {
        -- Install markdown preview, use npx if available.
        "iamcco/markdown-preview.nvim",
        cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
        ft = { "markdown" },
        build = function(plugin)
            if vim.fn.executable "npx" then
                vim.cmd("!cd " .. plugin.dir .. " && cd app && npx --yes yarn install")
            else
                vim.cmd [[Lazy load markdown-preview.nvim]]
                vim.fn["mkdp#util#install"]()
            end
        end,
        init = function()
            if vim.fn.executable "npx" then vim.g.mkdp_filetypes = { "markdown" } end
        end,
        config = function()
            vim.keymap.set('n', '<leader>mt', '<cmd>MarkdownPreviewToggle<cr>')
            vim.keymap.set('n', '<leader>mp', '<cmd>MarkdownPreview<cr>')
            vim.keymap.set('n', '<leader>ms', '<cmd>MarkdownPreviewStop<cr>')
        end
    },
    {
        {
            "tadmccorkle/markdown.nvim",
            ft = "markdown",
            opts = {
                -- configuration here or empty for defaults
            },
        }
    }
}

return plugins
