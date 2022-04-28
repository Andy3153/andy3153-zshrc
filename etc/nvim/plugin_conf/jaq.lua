require('jaq-nvim').setup
{
  cmds =
  {
    default  = "float",           -- Default UI (see `Usage` for options)
    external =                   -- Uses external commands such as 'g++' and 'cargo'
    {
      typescript = "deno run %",
      javascript = "node %",
      markdown   = "glow %",
      python     = "python3 %",
      rust       = "rustc % && ./$fileBase && rm $fileBase",
      cpp        = "g++ % -o $fileBase && ./$fileBase",
      go         = "go run %",
      sh         = "sh %",
      bash       = "bash %",
      zsh        = "zsh %"
    },
    internal =                   -- Uses internal commands such as 'source' and 'luafile'
    {
      lua        = "luafile %",
      vim        = "source %"
    }
  },

  ui =
  {
    startinsert  = true,         -- Start in insert mode
    wincmd       = false,        -- Switch back to current file after using Jaq
    float = -- FTerm settings
    {
      border     = "double",       -- Floating window border (see ':h nvim_open_win')

      -- Nr from `0 - 1` for measurements
      height     = 0.8,
      width      = 0.8,
      x          = 0.5,
      y          = 0.5,

      -- Highlight group for floating window/border (see ':h winhl')
      border_hl  = "FloatBorder",
      float_hl   = "Normal",
      blend      = 0             -- Floating Window Transparency (see ':h winblend')
    },
    terminal =
    {
      position   = "bot",        -- Position of terminal
      line_no    = false,        -- Open the terminal without line numbers
      size       = 10            -- Size of terminal
    },
    toggleterm =
    {
      position   = "horizontal", -- Position of terminal (vertical|horizontal|window|float)
      size       = 10            -- Size of terminal
    },
    quickfix =
    {
      position   = "bot",        -- Position of quickfix window
      size       = 10            -- Size of quickfix window
    }
  }
}
