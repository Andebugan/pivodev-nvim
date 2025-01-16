return {
    {
        'nvim-treesitter/nvim-treesitter',
        config = function ()
            require('nvim-treesitter.configs').setup({
                ensure_installed = {
                    -- required parsers
                    "lua",
                    "vim",
                    "vimdoc",
                    "query",
                    "c",
                },
                auto_install = true,
                highlight = {
                    enable = true,
                    additional_vim_regex_highlighting = true
                },
            })
        end
        -- to install latex
        -- 1. install tree-sitter-cli - sudo npm install -g tree-sitter tree-sitter-cli
        -- 2. :TSInstallFromGrammar latex
    },
}
