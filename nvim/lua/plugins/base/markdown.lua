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
                hooks = {
                    -- Called when following links. Provided the following options:
                    -- * 'dest' (string): the link destination
                    -- * 'use_default_app' (boolean|nil): whether to open the destination with default application
                    --   (refer to documentation on <Plug> mappings for explanation of when this option is used)
                    follow_link = function(opts, _)
                        vim.cmd("e " .. opts['dest'])
                    end
                },
            },
        }
    }
}

return plugins
