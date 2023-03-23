require'colorizer'.setup({
    filetypes = {
        'html', 'css', 'javascript', 'typescript', 'typescriptreact',
        'javascriptreact', 'lua', 'scss', 'sass', 'yaml', 'markdown', 'json',
        'python', 'go', 'rust', 'c', 'cpp', 'java'

    },
    user_default_options = {
        mode = "background",
        tailwind = false -- Enable tailwind colors
    }
})
