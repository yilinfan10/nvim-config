-- Setup keybindings for gp.nvim

vim.api.nvim_set_keymap('n', 't', ':GpChatToggle<CR>', { noremap = true})
vim.api.nvim_set_keymap('n', '<leader>n', ':GpChatNew<CR>', { noremap = true})
vim.api.nvim_set_keymap('n', '<leader>p', ':GpChatPaste<CR>', { noremap = true})
vim.api.nvim_set_keymap('n', '<leader>d', ':GpChatDelete<CR>', { noremap = true})
