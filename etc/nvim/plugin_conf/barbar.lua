--
-- barbar.nvim configuration
--

-- Set barbar's options
vim.g.bufferline = {
  animation     = true,         -- animations
  auto_hide     = false,        -- auto-hiding the tab bar when there is a single buffer
  tabpages      = true,         -- current/total tabpages indicator (top right corner)
  closable      = true,         -- close button
  clickable     = true,         -- clickable tabs
  icons         = both,         -- icons (true/false/numbers/both)
  no_name_title = "Empty file", -- empty buffer title

  -- Configure icons on the bufferline.
  icon_separator_active   = '', -- '',  -- '▎',
  icon_separator_inactive = '', -- '',  -- '▎',
  icon_close_tab          = '',
  icon_close_tab_modified = '●',
  icon_pinned             = '車',

  -- Sets the maximum padding width with which to surround each tab
  maximum_padding = 1,

  -- Sets the maximum buffer name length.
  maximum_length = 30,

  -- If set, the letters for each buffer in buffer-pick mode will be
  -- assigned based on their name. Otherwise or in case all letters are
  -- already assigned, the behavior is to assign letters in order of
  -- usability (see order below)
  semantic_letters = true,

  -- New buffer letters are assigned in this order. This order is
  -- optimal for the qwerty keyboard layout but might need adjustement
  -- for other layouts.
  letters = 'asdfjkl;ghnmxcvbziowerutyqpASDFJKLGHNMXCVBZIOWERUTYQP',
}
