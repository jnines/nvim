vim.g.mapleader = " "
vim.g.maplocalleader = " "

local km = vim.keymap

km.set({ "n", "i", "v" }, "<C-q>", vim.cmd.q, { desc = "exit" })
km.set({ "n", "i", "v" }, "<C-s>", "<Esc>:w<CR>", { desc = "Save Buffer" })
km.set({ "n", "i", "v" }, "<C-z>", "<Esc>:wq<CR>", { desc = "Save Buffer and Exit" })

km.set({ "n", "x", "o" }, "H", "^", { desc = "Start of line" })
km.set({ "n", "x", "o" }, "L", "g_", { desc = "End of line" })

km.set({ "n", "i" }, "<A-k>", ":m .-2<CR>==", { desc = "Move line up" })
km.set({ "n", "i" }, "<A-j>", ":m .+1<CR>==", { desc = "Move line down" })
km.set({ "n", "i" }, "<C-down>", "<ESC><S-v>yp", { desc = "Copy line down" })

km.set("n", "Y", "Yg_", { desc = "Yank line without whitespace" })
km.set("n", "<leader>sl", "<C-w>l", { desc = "Move to split right" })
km.set("n", "<leader>sh", "<C-w>h", { desc = "Move to split left" })
km.set("n", "<leader>sj", "<C-w>j", { desc = "Move to split down" })
km.set("n", "<leader>sk", "<C-w>k", { desc = "Move to split right" })
km.set("n", "<leader>tl", vim.cmd.tabn, { desc = "Next tab" })
km.set("n", "<leader>th", vim.cmd.tabp, { desc = "Previous tab" })
km.set("n", "<leader>xo", vim.cmd.so, { desc = "Source file" })
km.set("n", "<leader>xp", ":Lazy reload ", { desc = "Reload plugin" })
km.set("n", "<leader>n", vim.cmd.bn, { desc = "Buffer next" })
km.set("n", "<leader>p", vim.cmd.bp, { desc = "Buffer previous" })
km.set("n", "<leader>bd", vim.cmd.bd, { desc = "Buffer delete" })
km.set("n", "<M-left>", ":vertical resize +1<CR>", { desc = "Resize wider" })
km.set("n", "<M-right>", ":vertical resize -1<CR>", { desc = "Resize narrower" })
km.set("n", "<M-up>", ":resize +1<CR>", { desc = "Resize taller" })
km.set("n", "<M-down>", ":resize -1<CR>", { desc = "Resize shorter" })
km.set("n", "n", "nzz", { desc = "Center on search" })
km.set("n", "N", "Nzz", { desc = "Center on search" })
km.set("n", "<leader>W", ":lua vim.wo.wrap = not vim.wo.wrap<CR>", { desc = "Toggle word wrap" })

km.set("i", "<C-k>", "<Esc>O", { desc = "Open to line above" })
km.set("i", "<C-j>", "<Esc>o", { desc = "Open to line below" })
km.set("i", ",", ",<C-g>u", { desc = "Create undo breakpoint at ," })
km.set("i", ".", ".<C-g>u", { desc = "Create undo breakpoint at ." })
km.set("i", "!", "!<C-g>u", { desc = "Create undo breakpoint at !" })
km.set("i", "?", "?<C-g>u", { desc = "Create undo breakpoint at ?" })
km.set("i", "{", "{<C-g>u", { desc = "Create undo breakpoint at {" })
km.set("i", "[", "[<C-g>u", { desc = "Create undo breakpoint at [" })

km.set("x", "p", [["_dP]], { desc = "Keep copied text in register" })
