return {

    "nvim-neo-tree/neo-tree.nvim",

    opts = {
        sources = {"filesystem", "buffers", "git_status", "document_symbols"},
        open_files_do_not_replace_types = {
            "terminal", "Trouble", "qf", "Outline"
        },
        filesystem = {
            filtered_items = {
                visible = true, -- when true, they will just be displayed differently than normal items
                hide_dotfiles = false,
                hide_gitignored = false,
                hide_hidden = false -- only works on Windows for hidden files/directories
            },
            bind_to_cwd = false,
            follow_current_file = {enabled = true},
            use_libuv_file_watcher = true
        },
        window = {position = "right", mappings = {["<space>"] = "none"}},
        default_component_configs = {
            indent = {
                with_expanders = true, -- if nil and file nesting is enabled, will enable expanders
                expander_collapsed = "",
                expander_expanded = "",
                expander_highlight = "NeoTreeExpander"
            }
        }
    }
}
