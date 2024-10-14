local packages = {}

if LANG_INSTALL_CONFIG.markdown_latex then
    table.insert(packages, {
        -- to generate tree-sitter grammer - install tree-sitter-cli externally
        -- sudo npm install -g tree-sitter
        -- sudo npm install -g tree-sitter-cli
        -- sudo npx tree-sitter-cli generate latex
        "iurimateus/luasnip-latex-snippets.nvim",
        requires = { "L3MON4D3/LuaSnip" },
        config = function()
            require 'luasnip-latex-snippets'.setup( { use_treesitter = true } )
            require("luasnip").config.setup { enable_autosnippets = true }
        end,
    })
end

return packages
