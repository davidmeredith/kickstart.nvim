return {
    -- TODO
    -- https://github.com/github/copilot.vim

    -- Session Management 
    -- Auto-Session by default stores sessions in vim.fn.stdpath('data').."/sessions/"
    -- 1. When starting nvim with NO args, auto-session will try to restore an existing 
    --    session for the cwd if one exists.
    -- 2. When starting nvim WITH an arg 'nvim .', auto-session will do nothing.
    --   3. After starting nvim with an arg, a session can still be manually restored by running :SessionRestore.
    -- 3. Any session saving and restoration takes into consideration the current working directory cwd.
    -- 4. When piping to nvim, e.g: cat myfile | nvim, auto-session behaves like #2.
    --
    -- Now when the user changes the cwd with :cd some/new/dir auto-session handles it gracefully, 
    -- saving the current session so there aren't losses and loading the session for the upcoming cwd if it exists.
    {
        'rmagatti/auto-session',
        config = function()
            require("auto-session").setup {
                log_level = "error",
                auto_session_suppress_dirs = { "~/", "~/Downloads", "/"},
                auto_session_use_git_branch = false,
                auto_session_enable_last_session = false,
                pre_save_cmds = {"tabdo Neotree close"},
                save_extra_cmds = {
                    function()
                        return [[echo "Session Saved"]]
                    end
                }
            }
        end
    },

    ---- Buferchad similar to harpoon for selecting open & marked buffers
    ---- Don't need, can use Telescope to show buffers
    --{
    --"mrquantumcodes/bufferchad.nvim",
    ---- uncomment if you want fuzzy search with telescope and a modern ui
    ---- dependencies = {
    ----    {"nvim-lua/plenary.nvim"},
    ----    {"MunifTanjim/nui.nvim"},
    ----    {"stevearc/dressing.nvim"},
    ----    {"nvim-telescope/telescope.nvim"} -- needed for fuzzy search, but should work fine even without it
    ---- }
    --},


    -- auto-save (nah, gets in the way of editing autoloaded config files)
    -- For triggering events, see
    -- :h events
    -- ASToggle: toggle auto-save
    -- {
    --     "Pocco81/auto-save.nvim",
    --     config = function()
    --         require("auto-save").setup {
    --         }
    --     end,
    -- },

    "mbbill/undotree",
    "ibhagwan/fzf-lua",
    --{ 'folke/which-key.nvim', cond = false},

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
    },

}
