--
-- nvim-gomove configuration
--

require("gomove").setup {
  map_defaults = false,      -- map default key bindings
  reindent = true,           -- reindent lines moved vertically
  undojoin = true,           -- undojoin same direction moves
  move_past_end_col = false, -- move past end column when moving blocks horizontally
}
