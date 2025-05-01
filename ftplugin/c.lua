vim.keymap.set('n', 'gh', function()
  local filepath = vim.api.nvim_buf_get_name(0)
  local base, ext = filepath:match '^(.*)%.([ch])$'
  if not base or not ext then
    print 'Not a .c or .h file'
    return
  end
  local new_ext = (ext == 'h') and 'c' or 'h'
  local target = base .. '.' .. new_ext
  vim.cmd('edit ' .. target)
end, { desc = 'Swap between [H]eader and C files' })
