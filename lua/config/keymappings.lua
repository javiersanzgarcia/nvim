local keymap = vim.keymap.set
local silent = {silent = true}

-- Better window movement
keymap("n", "<C-h>", "<C-w>h", silent)
keymap("n", "<C-j>", "<C-w>j", silent)
keymap("n", "<C-k>", "<C-w>k", silent)
keymap("n", "<C-l>", "<C-w>l", silent)

-- H to move to the first non-blank character of the line
keymap("n", "H", "^", silent)

-- Keep visual mode indenting
keymap("v", "<", "<gv", silent)
keymap("v", ">", ">gv", silent)

-- Case change in visual mode
keymap("v", "`", "u", silent)
keymap("v", "<A-`>", "U", silent)

-- Save file by CTRL-S
keymap("n", "<C-s>", ":w<CR>", silent)
keymap("i", "<C-s>", "<ESC> :w<CR>", silent)

-- Telescope
keymap("n", "<C-p>", "<CMD>lua require('plugins.telescope').project_files()<CR>")
keymap("n", "<S-p>",
       "<CMD>lua require('plugins.telescope.pickers.multi-rg')()<CR>")

-- Remove highlights
keymap("n", "<CR>", ":noh<CR><CR>", silent)

-- Buffers
keymap("n", "<Tab>", ":BufferNext<CR>", silent)
keymap("n", "gn", ":bn<CR>", silent)
keymap("n", "<S-Tab>", ":BufferPrevious<CR>", silent)
keymap("n", "gp", ":bp<CR>", silent)
keymap("n", "<S-q>", ":BufferClose<CR>", silent)

-- Move between barbar buffers
keymap("n", "<Space>1", ":BufferGoto 1<CR>", silent)
keymap("n", "<Space>2", ":BufferGoto 2<CR>", silent)
keymap("n", "<Space>3", ":BufferGoto 3<CR>", silent)
keymap("n", "<Space>4", ":BufferGoto 4<CR>", silent)
keymap("n", "<Space>5", ":BufferGoto 5<CR>", silent)
keymap("n", "<Space>6", ":BufferGoto 6<CR>", silent)
keymap("n", "<Space>7", ":BufferGoto 7<CR>", silent)
keymap("n", "<Space>8", ":BufferGoto 8<CR>", silent)
keymap("n", "<Space>9", ":BufferGoto 9<CR>", silent)
keymap("n", "<A-1>", ":BufferGoto 1<CR>", silent)
keymap("n", "<A-2>", ":BufferGoto 2<CR>", silent)
keymap("n", "<A-3>", ":BufferGoto 3<CR>", silent)
keymap("n", "<A-4>", ":BufferGoto 4<CR>", silent)
keymap("n", "<A-5>", ":BufferGoto 5<CR>", silent)
keymap("n", "<A-6>", ":BufferGoto 6<CR>", silent)
keymap("n", "<A-7>", ":BufferGoto 7<CR>", silent)
keymap("n", "<A-8>", ":BufferGoto 8<CR>", silent)
keymap("n", "<A-9>", ":BufferGoto 9<CR>", silent)

-- Don't yank on delete char
keymap("n", "x", '"_x', silent)
keymap("n", "X", '"_X', silent)
keymap("v", "x", '"_x', silent)
keymap("v", "X", '"_X', silent)

-- Don't yank on visual paste
keymap("v", "p", '"_dP', silent)

-- Avoid issues because of remapping <c-a> and <c-x> below
vim.cmd [[
  nnoremap <Plug>SpeedDatingFallbackUp <c-a>
  nnoremap <Plug>SpeedDatingFallbackDown <c-x>
]]

-- Quickfix
keymap("n", "<Space>,", ":cp<CR>", silent)
keymap("n", "<Space>.", ":cn<CR>", silent)

-- Toggle quicklist
keymap("n", "<Leader>t", "<cmd>lua require('utils').toggle_quicklist()<CR>",
       silent)

-- Manually invoke speeddating in case switch.vim didn't work
keymap("n", "<C-a>",
       ":if !switch#Switch() <bar> call speeddating#increment(v:count1) <bar> endif<CR>",
       silent)
keymap("n", "<C-x>",
       ":if !switch#Switch({'reverse': 1}) <bar> call speeddating#increment(-v:count1) <bar> endif<CR>",
       silent)

-- Open links under cursor in browser with gx
if vim.fn.has('macunix') == 1 then
    keymap("n", "gx",
           "<cmd>silent execute '!open ' . shellescape('<cWORD>')<CR>", silent)
else
    keymap("n", "gx",
           "<cmd>silent execute '!xdg-open ' . shellescape('<cWORD>')<CR>",
           silent)
end

-- Refactor with spectre
keymap("n", "<leader>pr",
       "<cmd>lua require('spectre').open_visual({select_word=true})<CR>", silent)
keymap("v", "<leader>pr", "<cmd>lua require('spectre').open_visual()<CR>")

-- LSP

keymap("n", "<leader>ca", "<cmd>lua vim.lsp.buf.code_action()<CR>", silent)
keymap("v", "<leader>ca", "<cmd>'<,'>lua vim.lsp.buf.code_action()<CR>", silent)
keymap("n", "<leader>cr", "<cmd>lua vim.lsp.buf.rename()<CR>", silent)
keymap("n", "<leader>cl",
       "<cmd>lua vim.diagnostic.open_float({ border = 'rounded', max_width = 100 })<CR>",
       silent)
keymap("n", "gl",
       "<cmd>lua vim.diagnostic.open_float({ border = 'rounded', max_width = 100 })<CR>",
       silent)
keymap("n", "L", "<cmd>lua vim.lsp.buf.signature_help()<CR>", silent)
keymap("n", "]g",
       "<cmd>lua vim.diagnostic.goto_next({ float = { border = 'rounded', max_width = 100 }})<CR>",
       silent)
keymap("n", "[g",
       "<cmd>lua vim.diagnostic.goto_prev({ float = { border = 'rounded', max_width = 100 }})<CR>",
       silent)
keymap("n", "K", function()
    local winid = require('ufo').peekFoldedLinesUnderCursor()
    if not winid then vim.lsp.buf.hover() end
end)

-- Comment Box
keymap("n", "<leader>ac", "<cmd>lua require('comment-box').lbox()<CR>", silent)
keymap("v", "<leader>ac", "<cmd>lua require('comment-box').lbox()<CR>", silent)

--  Pracker Maps
keymap("n", "<Leader>q", ":q!<cr>")
keymap("n", "<Leader>w", ":w<cr>")
keymap("n", "<Leader>x", ":x<cr>")
keymap("n", "<Leader>tv", ":botright vnew <Bar> :terminal<cr>")
keymap("n", "<Leader>th", ":botright new <Bar> :terminal<cr>")
-- keymap("n", "<Leader>qq", ":q!<cr>", silent)

-- Toggle Tree

keymap("n", "<leader>n", "<cmd>lua require('nvim-tree.api').tree.toggle()<CR>",
       silent)

-- EOL & BOL
keymap("n", '<S-right>', '$', silent)
keymap("n", '<S-left>', '^', silent)

-- Move Lines

keymap("n", '<S-down>', ':m .+1<CR>==gi', silent)
keymap("n", '<S-up>', ':m .-2<CR>==gi', silent)

keymap("i", '<S-down>', '<Esc>:m .+1<CR>==gi', silent)
keymap("i", '<S-up>', '<Esc>:m .-2<CR>==gi', silent)

keymap("v", '<S-down>', ":m '>+1<CR>gv=gv", silent)
keymap("v", '<S-up>', ":m ':m .-2<CR>==gi", silent)

-- Move around splits

keymap("n", '<A-left>', '<C-w>h', silent)
keymap("n", '<A-down>', '<C-w>j', silent)
keymap("n", '<A-up>', '<C-w>k', silent)
keymap("n", '<A-right>', '<C-w>l', silent)

-- Copy all: :%y+
-- Duplicate line NVIM: yy p

-- Format piece

keymap("n", "<leader>fd", "<cmd>lua vim.lsp.buf.format({ async = true })<CR>",
       silent)
keymap("v", "<leader>fd", "<cmd>'<.'>lua vim.lsp.buf.range_formatting()<CR>",
       silent)

-- Go to Definition / References / Code Action

keymap("n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", silent)
keymap("n", "gr",
       "<cmd>lua vim.lsp.buf.references({ includeDeclaration = false })<CR>",
       silent)
keymap("n", "<C-Space>", "<cmd>lua vim.lsp.buf.code_action()<CR>", silent)

-- Minimap

keymap("n", "<Leader>m", MiniMap.open)
keymap("n", "<Leader>mc", MiniMap.close)
keymap("n", "<Leader>mf", MiniMap.toggle_focus)
keymap("n", "<Leader>mr", MiniMap.refresh)
keymap("n", "<Leader>ms", MiniMap.toggle_side)
keymap("n", "<Leader>mt", MiniMap.toggle)

-- Telescope -> $ brew install ripgrep (engine search should be installed)

keymap("n", "<leader>ff",
       "<CMD>lua require('telescope.builtin').find_files()<CR>")

keymap("n", "<leader>fg",
       "<CMD>lua require('telescope.builtin').live_grep()<CR>")

keymap("n", "<leader>fc",
       "<CMD>lua require('telescope.builtin').live_grep({grep_open_files=true})<CR>")

keymap("n", "<leader>fb", "<CMD>lua require('telescope.builtin').buffers()<CR>")

keymap("n", "<leader>fn",
       "<CMD>lua require('telescope.builtin').help_tags()<CR>")

keymap("n", "<leader>fw",
       "<CMD>lua require('telescope.builtin').grep_string()<CR>")

keymap("n", "<Leader>pf",
       "<CMD>lua require('plugins.telescope').project_files({ default_text = vim.fn.expand('<cword>'), initial_mode = 'normal' })<CR>")

keymap("n", "<Leader>pw",
       "<CMD>lua require('telescope.builtin').grep_string({ initial_mode = 'normal' })<CR>")

