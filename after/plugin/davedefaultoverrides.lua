-- Dave's customisations that override the Kickstart defaults. 
vim.o.wrap = true
-- Remap for dealing with word wrap
vim.keymap.set('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
vim.keymap.set('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })


-- Decrease update time
vim.o.updatetime = 250
--
-- Note, don't introduce keymaps that use leader in insert mode, you can get a nasty little delay otherwise. You can check with the following (imap for 'insert map'): 
--    :verbose imap <leader>

vim.wo.signcolumn = 'yes'
-- Set completeopt to have a better completion experience
vim.o.completeopt = 'menuone,noselect'

-- FZF (not via telescope) 
vim.api.nvim_set_keymap('n', '<C-p>', "<cmd>lua require('fzf-lua').files()<CR>", { noremap = true, silent = true })

-- Enable folding with Treesitter, open all folds by default
vim.wo.foldmethod = 'expr'
vim.wo.foldexpr = 'nvim_treesitter#foldexpr()'
vim.o.foldlevelstart = 99

-- bootstrap bufferline (moved to lazy spec)
-- require("bufferline").setup{}


-- UndoTree
--vim.keymap.set({'n', 'i', 'v'}, '<F5>', ':UndotreeToggle<CR>', {noremap=true, silent=true})
vim.keymap.set({'n'}, '<leader>u', ':UndotreeToggle<CR>', {noremap=true, silent=true})


-- Shortcut to my preferred file explorer
--  (note that <localleader>t is often set to  open the terminal)
--
--   Nvim.tree
--     disable netrw at the very start of your init.lua (strongly advised if using nvim.tree)
--     vim.g.loaded_netrw = 1
--     vim.g.loaded_netrwPlugin = 1
--     vim.keymap.set('n', '<leader>x', ':NvimTreeToggle<CR>', {noremap=true, silent=true})
--
--  Neotree
vim.keymap.set('n', '<leader>t', ':Neotree toggle position=left<CR>', {noremap=true, silent=true})
-- reveal current file in file exporer window
vim.keymap.set({'n'}, '<leader>rt', ':Neotree filesystem reveal left<CR>', {noremap=true, silent=true})



vim.o.spelllang='en_gb'

-- Remap Esc. You need to map these to some infrequent key pair, 
-- but if you need to type jj in sentences, then you can but just do it slowly. 
-- Old vimrc version: 
--vim.inoremap = 'jj' '<Esc>'
vim.keymap.set('i', 'jj', '<ESC>', {noremap = true, silent = false})


-- Split navigagtion (use christoomey plugin instead)
-- ==================
-- Jump between splits, old vimrc version:
-- nnoremap <leader>h :wincmd h<CR>
-- nnoremap <leader>j :wincmd j<CR>
-- nnoremap <leader>k :wincmd k<CR>
-- nnoremap <leader>l :wincmd l<CR>
--vim.keymap.set('n', '<leader>h', ':wincmd h<CR>', {noremap=true, silent=true})
--vim.keymap.set('n', '<leader>j', ':wincmd j<CR>', {noremap=true, silent=true})
--vim.keymap.set('n', '<leader>k', ':wincmd k<CR>', {noremap=true, silent=true})
--vim.keymap.set('n', '<leader>l', ':wincmd l<CR>', {noremap=true, silent=true})

-- Resize splits, old vimrc version:
-- nnoremap <leader>[ :vertical resize +5<CR>
-- nnoremap <leader>] :vertical resize -5<CR>
-- nnoremap <leader>+ :resize +5<CR>
-- nnoremap <leader>- :resize -5<CR>
-- vim.keymap.set('n', '<leader>]', ':vertical resize +5<CR>', {noremap=true, silent=true})
-- vim.keymap.set('n', '<leader>[', ':vertical resize -5<CR>', {noremap=true, silent=true})
-- vim.keymap.set('n', '<leader>=', ':resize +5<CR>', {noremap=true, silent=true})
-- vim.keymap.set('n', '<leader>-', ':resize -5<CR>', {noremap=true, silent=true})
--
-- DM: Interpret these commands as moving the 'split postion,' not resizing current pane
vim.keymap.set('n', '<leader>l', ':vertical resize +5<CR>', {noremap=true, silent=true})
vim.keymap.set('n', '<leader>h', ':vertical resize -5<CR>', {noremap=true, silent=true})
vim.keymap.set('n', '<leader>j', ':resize +5<CR>', {noremap=true, silent=true})
vim.keymap.set('n', '<leader>k', ':resize -5<CR>', {noremap=true, silent=true})


-- Tab navigation 
-- ===============
-- Note, this is different to my shell & browser tab navigation remaps (<S-Cmd-]> and <S-Cmd-[>)
-- nnoremap <S-left>  :tabprevious<CR>
-- nnoremap <S-right> :tabnext<CR>
-- nnoremap <C-t>     :tabnew .<CR>
vim.keymap.set('n', '<S-Left>', ':tabprevious<CR>', {noremap=true, silent=true})
vim.keymap.set('n', '<S-Right>', ':tabnext<CR>', {noremap=true, silent=true})
vim.keymap.set('n', '<C-t>', ':tabnew<CR>', {noremap=true, silent=true})



-- Tab between Buffers 
-- ===================
-- nnoremap <TAB>  :bnext<CR>
-- nnoremap <S-TAB>  :bprev<CR>
vim.keymap.set('n', '<Tab>', ':bnext<CR>', {noremap=true, silent=true})
vim.keymap.set('n', '<S-Tab>', ':bprev<CR>', {noremap=true, silent=true})

-- Clean Delete
-- =============
-- Best shortcut ever, delete visual selection into blackhole register without
-- overwriting default register
-- vnoremap <leader>d "_d
vim.keymap.set('v', '<leader>d', [["_d]], {noremap=true})

-- Clean Delete & Paste 
-- =====================
-- Delete visual selection into blackhole register and paste
-- default register before cursor without overwriting the default reg - great !
-- vnoremap <leader>p "_dP
vim.keymap.set('v', '<leader>p', [["_dP]], {noremap=true})

-- Move visual selection up & down
-- =================================
-- so, for J, move (:m) end of visual selection ('>) one line down then enter
-- (<CR> / carridage return) and select previous vis selection
-- vnoremap J :m '>+1<CR>gv=gv
-- vnoremap K :m '<-2<CR>gv=gv
vim.keymap.set('v', 'J', ":m '>+1<CR>gv=gv", {noremap=true})
vim.keymap.set('v', 'K', ":m '<-2<CR>gv=gv", {noremap=true})

-- Yank into clipboard 
-- ====================
-- nnoremap <leader>y "*y
-- vnoremap <leader>y "*y
vim.keymap.set({'n', 'v'}, '<leader>y', [["*y]], {noremap=true})

-- Copy whole file into clipboard
-- nnoremap <leader>Y gg"+yG
vim.keymap.set('n', '<leader>Y', "gg\"*yG", {noremap=true})

-- Disable quote conceal in JSON files
vim.api.nvim_set_var('vim_json_conceal', 0)
vim.api.nvim_set_var('netrw_winsize', 25)

-- Make open file executable (nah, a bit too premature click dangerous)
-- vim.keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true })

--vim.keymap.set("n", "<leader>vpp", "<cmd>e ~/.dotfiles/nvim/.config/nvim/lua/theprimeagen/packer.lua<CR>");

-- Gitsigns
-- See `:help gitsigns.txt`
-- :Gitsigns tab
require('gitsigns').setup {
  signs = {
    add = { text = '+' },
    change = { text = '~' },
    delete = { text = '_' },
    topdelete = { text = '‾' },
    changedelete = { text = '~' },
  },
  on_attach = function(bufnr)
    local gs = package.loaded.gitsigns

    local function map(mode, l, r, opts)
      opts = opts or {}
      opts.buffer = bufnr
      vim.keymap.set(mode, l, r, opts)
    end

    -- Navigation
    map('n', ']v', function()
      if vim.wo.diff then return ']v' end
      vim.schedule(function() gs.next_hunk() end)
      return '<Ignore>'
    end, {expr=true})

    map('n', '[v', function()
      if vim.wo.diff then return '[v' end
      vim.schedule(function() gs.prev_hunk() end)
      return '<Ignore>'
    end, {expr=true})

    -- Gitsigns Actions 
    -- see: https://github.com/omerxx/dotfiles/blob/master/nvim/init.lua 
    -- and: https://www.youtube.com/watch?v=IyBAuDPzdFY&list=WL&index=2  
    -- map({'n', 'v'}, '<leader>hs', ':Gitsigns stage_hunk<CR>')
    -- map({'n', 'v'}, '<leader>hr', ':Gitsigns reset_hunk<CR>')
    -- map('n', '<leader>hS', gs.stage_buffer)
    -- map('n', '<leader>ha', gs.stage_hunk)
    -- map('n', '<leader>hu', gs.undo_stage_hunk)
    -- map('n', '<leader>hR', gs.reset_buffer)
    -- map('n', '<leader>hp', gs.preview_hunk)
    -- map('n', '<leader>hb', function() gs.blame_line{full=true} end)
    -- map('n', '<leader>tb', gs.toggle_current_line_blame)
    -- map('n', '<leader>hd', gs.diffthis)
    -- map('n', '<leader>hD', function() gs.diffthis('~') end)
    -- map('n', '<leader>td', gs.toggle_deleted)
    -- -- Text object
    -- map({'o', 'x'}, 'ih', ':<C-U>Gitsigns select_hunk<CR>')

  end
}

