# Changes: Review in keymaps in config/keymappings.lua

Based in Neovim configuration of: <https://github.com/ecosse3/nvim>

## Personal Modification

lua/config/keymappings_BackUp.lua

```
Replace for custom keymap shortcut
```

### Theme transparency preference

lua/config/colorscheme.lua

```
    tokyonight.setup({
    style = "storm", -- The theme comes in three styles, `storm`, `moon`, a darker variant `night` and `day`
    transparent = true, -- Enable this to disable setting the background color
    terminal_colors = true, -- Configure the colors used when opening a `:terminal` in Neovim
    styles = {
        -- Style to be applied to different syntax groups
        -- Value is any valid attr-list value `:help attr-list`
        comments = "italic",
        keywords = "italic",
        functions = "NONE",
        variables = "NONE",
        -- Background styles. Can be "dark", "transparent" or "normal"
        sidebars = "transparent", -- style for sidebars, see below
        floats = "transparent" -- style for floating windows
    }
    })
```

### Install Minimap approach and icons

lua/config/plugins.lua

```-- minimap
    {
        'echasnovski/mini.map',
        version = false,
        lazy = false,
        config = function()
            local map = require('mini.map')
            require('mini.map').setup({
                -- Highlight integrations (none by default)
                integrations = nil,
                -- Symbols used to display data
                symbols = {
                    -- Encode symbols. See`:h MiniMap.config`for specification and
                    -- `:h MiniMap.gen_encode_symbols`for pre-built ones.
                    -- Default: solid blocks with 3x2 resolution.
                    encode = map.gen_encode_symbols.block('2x1'),
                    -- Scrollbar parts for view and line. Use empty string to disable any.
                    scroll_line = '█',
                    scroll_view = '┃'
                },
                -- Window options
                window = {
                    -- Whether window is focusable in normal way (with `wincmd`or mouse)
                    focusable = false,
                    -- Side to stick ('left' or 'right')
                    side = 'right',
                    -- Whether to show count of multiple integration highlights
                    show_integration_count = true,
                    -- Total width
                    width = 10,
                    -- Value of 'winblend' option
                    winblend = 25
                }
            })
        end
    }
```

### FZF problem in Linux

lua/config/plugins.lua

```
    -- {"nvim-telescope/telescope-fzf-native.nvim", build = "make"},
```

lua/plugins/telescope/init.lua

```

-- require('telescope').load_extension('fzf')

    extensions = {
        -- fzf = {
        --     override_generic_sorter = false,
        --     override_file_sorter = true,
        --     case_mode = "smart_case"
        -- }
    }
```

### No resize buffer at open file in tree

lua/plugins/tree.lua

```
    open_file = {
        quit_on_open = false,
        -- if true the tree will resize itself after opening a file
        resize_window = true,
        window_picker = {
            enable = true,
            chars = "ABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890",
            exclude = {
                filetype = {
                    "notify", "packer", "qf", "diff", "fugitive",
                    "fugitiveblame"
                },
                buftype = {"nofile", "terminal", "help"}
            }
        }
    }
```
