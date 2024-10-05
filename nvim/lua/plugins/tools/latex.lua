local packages = {}

if LANG_INSTALL_CONFIG.markdown_latex then
    table.insert(packages, {
        "iurimateus/luasnip-latex-snippets.nvim",
        requires = { "L3MON4D3/LuaSnip" },
        config = function()
            require 'luasnip-latex-snippets'.setup( { use_treesitter = true } )
            require("luasnip").config.setup { enable_autosnippets = true }
        end,
    })
end

return packages
