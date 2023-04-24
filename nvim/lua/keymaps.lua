-- plugins keymapping

function ckeymap(mode, qk, fn, opts)
  vim.api.nvim_set_keymap(mode, qk, fn, opts or { noremap = true } )	
end

ckeymap('i', '<leader>\\', '<esc>')

-- 关于nvimtree
ckeymap('n', '<leader>t', ':NvimTreeToggle<CR>')
ckeymap('i', '<leader>t', '<esc>:NvimTreeToggle<CR>')

-- 保存
ckeymap('n', '<leader>s', ':w<CR>')
ckeymap('i', '<leader>s', '<esc>:w<CR>')

-- 光标移动
ckeymap('n', '<leader>l', '<C-w>l')
ckeymap('n', '<leader>h', '<C-w>h')
ckeymap('n', '<leader>k', '<C-w>k')
ckeymap('n', '<leader>j', '<C-w>j')
ckeymap('i', '<leader>l', '<esc><C-w>l')
ckeymap('i', '<leader>h', '<esc><C-w>h')
ckeymap('i', '<leader>k', '<esc><C-w>k')
ckeymap('i', '<leader>j', '<esc><C-w>j')

-- buffer
ckeymap('n', '<leader>n', ':bn<CR>')
ckeymap('n', '<leader>m', ':bp<CR>')
ckeymap('i', '<leader>n', '<esc>:bn<CR>')
ckeymap('i', '<leader>m', '<esc>:bp<CR>')

-- lspsaga
ckeymap('n', 'gf', '<cmd>Lspsaga lsp_finder<CR>')
ckeymap('n', 'gr', '<cmd>Lspsaga rename<CR>')

-- buffer
ckeymap('n', '<leader>bd', ':bd<CR>')
ckeymap('i', '<leader>bd', '<cmd>bd<CR>')
ckeymap('n', '<leader>q', '<cmd>q!<CR>')
ckeymap('i', '<leader>q', '<cmd>q!<CR>')

local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})


-- terminal
vim.keymap.set('t', '<esc>', [[<C-\><C-n>]], {buffer = 0})
function _G.set_terminal_keymaps()
  local opts = {buffer = 0}
  vim.keymap.set('t', '<esc>', [[<C-\><C-n>]], opts)
  vim.keymap.set('t', 'jk', [[<C-\><C-n>]], opts)
  vim.keymap.set('t', '<leader>h', [[<Cmd>wincmd h<CR>]], opts)
  vim.keymap.set('t', '<leader>j', [[<Cmd>wincmd j<CR>]], opts)
  vim.keymap.set('t', '<leader>k', [[<Cmd>wincmd k<CR>]], opts)
  vim.keymap.set('t', '<leader>l', [[<Cmd>wincmd l<CR>]], opts)
end
vim.cmd('autocmd! TermOpen term://* lua set_terminal_keymaps()')

local dap = require'dap'

vim.keymap.set('n', '<F5>', function() dap.continue() end)
vim.keymap.set('n', '<F10>', function() dap.step_over() end)
vim.keymap.set('n', '<F11>', function() dap.step_into() end)
vim.keymap.set('n', '<F12>', function() dap.step_out() end)
vim.keymap.set('n', '<Leader>b', function() dap.toggle_breakpoint() end)
vim.keymap.set('n', '<Leader>B', function() dap.set_breakpoint() end)
-- vim.keymap.set('n', '<Leader>lp', function() dap.set_breakpoint(nil, nil, vim.fn.input('Log point message: ')) end)
-- vim.keymap.set('n', '<Leader>dr', function() dap.repl.open() end)
vim.keymap.set('n', '<Leader>dl', function() dap.run_last() end)
-- vim.keymap.set({'n', 'v'}, '<Leader>dh', function()
--   require('dap.ui.widgets').hover()
-- end)
-- vim.keymap.set({'n', 'v'}, '<Leader>dp', function()
--   require('dap.ui.widgets').preview()
-- end)
-- vim.keymap.set('n', '<Leader>df', function()
--   local widgets = require('dap.ui.widgets')
--   widgets.centered_float(widgets.frames)
-- end)
-- vim.keymap.set('n', '<Leader>ds', function()
--   local widgets = require('dap.ui.widgets')
--   widgets.centered_float(widgets.scopes)
-- end)

local dapui = require'dapui'
dap.listeners.after.event_initialized["dapui_config"] = function()
    dapui.open()
end
dap.listeners.before.event_terminated["dapui_config"] = function()
  dapui.close()
end
dap.listeners.before.event_exited["dapui_config"] = function()
  dapui.close()
end 
