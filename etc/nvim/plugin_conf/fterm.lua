--
-- fterm.nvim configuration
--

require'FTerm'.setup(
{
    ft = 'FTerm',             -- Filetype of the terminal buffer
    cmd = os.getenv('SHELL'), -- Command to run inside the terminal. It could be a `string` or `table`
    border = 'double',        -- Window border. See `:h nvim_open_win` for more configuration options
    auto_close = true,        -- Close the terminal as soon as shell/command exits
    hl = 'Normal',            -- Highlight group for the terminal. See `:h winhl`
    blend = 10,               -- Transparency of the floating window. See `:h winblend`
    dimensions =              -- Terminal window dimensions (`0 - 1`)
    {
        height = 0.9,         -- Height of the terminal window
        width = 0.9,          -- Width of the terminal window
        x = 0.5,              -- X axis of the terminal window
        y = 0.5,              -- Y axis of the terminal window
    },

    on_exit = nil,            -- Callback invoked when the terminal exits. See `:h jobstart-options`
    on_stdout = nil,          -- Callback invoked when the terminal emits stdout data. See `:h jobstart-options`
    on_stderr = nil,          -- Callback invoked when the terminal emits stderr data. See `:h jobstart-options`
})
