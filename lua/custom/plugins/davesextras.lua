return {
    "mbbill/undotree",
    "ibhagwan/fzf-lua",
    --{ 'folke/which-key.nvim', cond = false}, -- disable which-key plugin

    -- colour scheme hould be  available  when starting neovim
    {
        "ellisonleao/gruvbox.nvim",
        priority = 500, -- make sure to load this before all the other start plugins
        config = function()
            require("gruvbox").setup({
                -- palette_overrides = {
                --     bright_green = "#990000",
                -- }
            })
        vim.cmd([[colorscheme gruvbox]])
        end
    },
    -- The colorscheme should be available when starting Neovim
    --   {
    --     "folke/tokyonight.nvim",
    --     lazy = false, -- make sure we load this during startup if it is your main colorscheme
    --     priority = 1000, -- make sure to load this before all the other start plugins
    --     config = function()
    --       -- load the colorscheme here
    --       vim.cmd([[colorscheme tokyonight]])
    --     end,
    --   },




    -- Surround Plugin
    -- :h nvim-surround.usage
    --     Old text                    Command         New text
    --------------------------------------------------------------------------------
    --    surround me                 VizSelect + S)  (surround me)
    --    surr*ound_words             ysiw)           (surround_words)
    --    *make strings               ys$"            "make strings"
    --    [delete ar*ound me!]        ds]             delete around me!
    --    remove <b>HTML t*ags</b>    dst             remove HTML tags
    --    'change quot*es'            cs'"            "change quotes"
    --    <b>or tag* types</b>        csth1<CR>       <h1>or tag types</h1>
    --    delete(functi*on calls)     dsf             function calls
    {
        "kylechui/nvim-surround",
        version = "*", -- Use for stability; omit to use `main` branch for the latest features
        event = "VeryLazy",
        config = function()
            require("nvim-surround").setup({
                -- Configuration here, or leave empty to use defaults
            })
        end
    }
}
