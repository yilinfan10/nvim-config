-- Set colorscheme
-- vim.cmd("colorscheme desert")

require("config.lazy")
require('config.nvim-cmp')
require('config.gp')
require('config.vscode')
-- config.vscode must be called before config.vim-gitgutter because the former will override gitgutter highlight group,
require('config.vim-gitgutter')
require('config.nvim-ufo')

-- Enable line numbers and syntax highlighting
vim.opt.number = true
vim.opt.syntax = 'on'

-- Enable hidden buffers
vim.opt.hidden = true

-- Enable ruler and wildmenu
vim.opt.ruler = true
vim.opt.wildmenu = true

-- Indentation settings
vim.opt.autoindent = true
vim.opt.backspace = 'indent,eol,start'
vim.opt.expandtab = true
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2

-- Auto-indent all with ==
vim.api.nvim_set_keymap('n', '==', 'gg=G', { noremap = true })

-- C++ indentation settings
vim.opt.cinoptions:append('g1')

-- Search settings
vim.opt.incsearch = true
vim.opt.hlsearch = true
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- Use <CR> to cancel highlight
vim.api.nvim_set_keymap('n', '<CR>', ':noh<CR>', { nowait = true, silent = true })

-- Compile and run with <F5>
vim.api.nvim_set_keymap('n', '<F5>', ':!clang++ % && ./a.out<CR>', { noremap = true })

-- Netrw settings
vim.api.nvim_set_keymap('n', ';;', ':Lexplore<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '_', ':Ex<bar>:sil! /<C-R>=expand("%:t")<CR><CR>:noh<CR>', { silent = true })

vim.g.netrw_liststyle = 3
vim.g.netrw_sort_sequence = ''
vim.g.netrw_banner = 0
-- disable netrw_list_hide because netrw_gitignore is very slow in certain case
-- vim.cmd("let g:netrw_list_hide = netrw_gitignore#Hide()")

-- Window size shortcuts
vim.api.nvim_set_keymap('n', '-', '10<C-W>-', { noremap = true })
vim.api.nvim_set_keymap('n', '+', '10<C-W>+', { noremap = true })
vim.api.nvim_set_keymap('n', '>', '20<C-W><', { noremap = true })
vim.api.nvim_set_keymap('n', '<', '20<C-W>>', { noremap = true })

-- Folding settings
vim.opt.foldmethod = 'syntax'

vim.g.cpp_member_highlight = 1

-- Airline settings
vim.cmd("let g:airline#extensions#tabline#enabled = 1")
vim.cmd("let g:airline#extensions#tabline#formatter = 'unique_tail'")
vim.cmd("let g:airline#extensions#tabline#buffer_idx_mode = 1")

for i = 0, 9 do
  vim.api.nvim_set_keymap('n', '<leader>' .. tostring(i), '<Plug>AirlineSelectTab' .. tostring(i), { noremap = true })
end
vim.api.nvim_set_keymap('n', '<leader>-', '<Plug>AirlineSelectPrevTab', { noremap = true })
vim.api.nvim_set_keymap('n', '<leader>+', '<Plug>AirlineSelectNextTab', { noremap = true })
-- Fzy integration
local function FzyCommand(choice_command, vim_command)
  local output = io.popen(choice_command .. " | fzf --preview='bat --color=always {}'")
  if output then
    local result = output:read("*a")
    output:close()
    if result and result ~= "" then
      vim.cmd(vim_command .. ' ' .. result)
    end
  end
end

vim.api.nvim_set_keymap('n', '<leader>e', ':call v:lua.FzyCommand("plocate $PWD", ":e")<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<leader>v', ':call v:lua.FzyCommand("plocate $PWD", ":vs")<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<leader>s', ':call v:lua.FzyCommand("plocate $PWD", ":sp")<CR>', { noremap = true })

-- Close buffer but keep window
vim.api.nvim_set_keymap('n', '<leader>q', ':bp<bar>sp<bar>bn<bar>bd<CR>', { noremap = true })

-- code navigation
vim.api.nvim_buf_set_keymap(0, "n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", { noremap = true, silent = true })
