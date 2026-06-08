-- 禁用netrw， 避免和nvim-tree冲突
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

local function on_attach(bufnr)
    local api = require("nvim-tree.api")

    local function opts(desc)
      return {
        desc = "nvim-tree: " .. desc,
        buffer = bufnr,
        noremap = true,
        silent = true,
        nowait = true,
      }
    end

    -- 保留nvim-tree 默认快捷键
    api.config.mappings.default_on_attach(bufnr)

    -- 自定义常用快捷键
    vim.keymap.set("n", "?", api.tree.toggle_help, opts("Help"))
    vim.keymap.set("n", "l", api.node.open.edit, opts("Open"))
    vim.keymap.set("n", "h", api.node.navigate.parent_close, opts("Close Directory"))
    vim.keymap.set("n", "v", api.node.open.vertical, opts("Open Vertical Split"))
    vim.keymap.set("n", "s", api.node.open.horizontal, opts("Open Horizontal Split"))

    vim.keymap.set("n", "a", api.fs.create, opts("Create"))
    vim.keymap.set("n", "d", api.fs.remove, opts("Delete"))
    vim.keymap.set("n", "r", api.fs.rename, opts("Rename"))
    vim.keymap.set("n", "x", api.fs.cut, opts("Cut"))
    vim.keymap.set("n", "c", api.fs.copy.node, opts("Copy"))
    vim.keymap.set("n", "p", api.fs.paste, opts("Paste"))

    vim.keymap.set("n", "R", api.tree.reload, opts("Refresh"))
    vim.keymap.set("n", "H", api.tree.toggle_hidden_filter, opts("Toggle Hidden"))
    vim.keymap.set("n", "q", api.tree.close, opts("Close"))
end
    
      
      
require("nvim-tree").setup({
    on_attach = on_attach,

    view = {
        width = 30,
        side = "left",
        signcolumn = "yes",
    },

    update_focused_file = {
        enable = true,
        update_root = false,
    },

    sync_root_with_cwd = true,

    renderer = {
        group_empty = true,
        highlight_git = true,
        highlight_opened_files = "name",

        indent_markers = {
            enable = true,
        },

        icons = {
            show = {
                file = true,
                folder = true,
                folder_arrow = true,
                git = true,
            },
        },
    },

    git = {
        enable = true,
        ignore = false,
    },

    diagnostics = {
        enable = true,
        show_on_dirs = true,
    },

    filters = {
        dotfiles = false,
        git_ignored = false,
        custom = {
            "^.git$",
            "node_modules",
            ".cache",
        },
    },

    actions = {
        open_file = {
            quit_on_open = false,
            resize_window = true,
        },
    },
})
