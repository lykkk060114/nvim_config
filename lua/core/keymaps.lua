vim.g.mapleader = " "

local keymap = vim.keymap

-- ---------- 插入模式 ---------- ---
keymap.set("i", "jk", "<ESC>", { desc = "quit i"})
keymap.set("i", "kj", "<ESC>", { desc = "quit i"})

--keymap.set("i", "<leader><leader>", "<ESC>")

-- ---------- 视觉模式 ---------- ---

-- 单行或多行移动
keymap.set("v", "J", ":m '>+1<CR>gv=gv" , {desc = "move it down"})
keymap.set("v", "K", ":m '<-2<CR>gv=gv" , {desc = "move it down"})

-- ---------- 正常模式 ---------- ---
-- 窗口
keymap.set("n", "<leader>sv", "<C-w>v") -- 垂直新增窗口 
keymap.set("n", "<leader>sh", "<C-w>s") -- 水平新增窗口
-- 退出
keymap.set("n", "<leader>q", "<cmd>q<CR>", {desc = "quit"})
keymap.set("n", "<leader>wq", "<cmd>wq<CR>", {desc = "save && quit"})
-- 保存
keymap.set({ "n", "i", "v", "x", "s", "c" }, "<C-s>", "<cmd>w<CR>", { desc = "Save file" })
-- 取消高亮
keymap.set("n", "<leader>nh", ":nohl<CR>")

-- 切换buffer
keymap.set("n", "<C-h>", "<C-w>h", { desc = "Move to left window" })
keymap.set("n", "<C-j>", "<C-w>j", { desc = "Move to lower window" })
keymap.set("n", "<C-k>", "<C-w>k", { desc = "Move to upper window" })
keymap.set("n", "<C-l>", "<C-w>l", { desc = "Move to right window" })

-- ---------- 插件 ---------- ---
-- nvim-tree
keymap.set("n", "<leader>e", "<cmd>NvimTreeToggle<CR>", { desc = "Toggle file tree" })
