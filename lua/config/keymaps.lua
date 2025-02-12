vim.g.mapleader = " "
vim.g.maplocalleader = " "

local km = vim.keymap.set

km({ "n", "i", "v" }, "<C-q>", vim.cmd.q, { desc = "exit" })
km({ "n", "i", "v" }, "<C-s>", "<Esc>:w<CR>", { desc = "Save Buffer" })
km({ "n", "i", "v" }, "<C-z>", "<Esc>:wq<CR>", { desc = "Save Buffer and Exit" })

km({ "n", "x", "o" }, "H", "^", { desc = "Start of line" })
km({ "n", "x", "o" }, "L", "g_", { desc = "End of line" })

km({ "n", "i" }, "<M-K>", ":m .-2<CR>==", { desc = "Move line up" })
km({ "n", "i" }, "<M-J>", ":m .+1<CR>==", { desc = "Move line down" })
km({ "n", "i" }, "<C-Y>", "<ESC><S-v>yp", { desc = "Copy line down" })

km("n", "Y", "Yg_", { desc = "Yank line without whitespace" })
km("n", "<leader>tl", vim.cmd.tabn, { desc = "Next tab" })
km("n", "<leader>th", vim.cmd.tabp, { desc = "Previous tab" })
km("n", "<leader>xo", vim.cmd.so, { desc = "Source file" })
km("n", "<leader>xp", ":Lazy reload ", { desc = "Reload plugin" })
km("n", "<leader>n", vim.cmd.bn, { desc = "Buffer next" })
km("n", "<leader>p", vim.cmd.bp, { desc = "Buffer previous" })
km("n", "<leader>bd", vim.cmd.bd, { desc = "Buffer delete" })
km("n", "<M-left>", ":vertical resize +1<CR>", { desc = "Resize wider" })
km("n", "<M-right>", ":vertical resize -1<CR>", { desc = "Resize narrower" })
km("n", "<M-up>", ":resize +1<CR>", { desc = "Resize taller" })
km("n", "<M-down>", ":resize -1<CR>", { desc = "Resize shorter" })
km("n", "n", "nzz", { desc = "Center on search" })
km("n", "N", "Nzz", { desc = "Center on search" })
km("n", "<leader>W", ":lua vim.wo.wrap = not vim.wo.wrap<CR>", { desc = "Toggle word wrap" })

km("i", "<M-k>", "<Esc>O", { desc = "Open to line above" })
km("i", "<M-j>", "<Esc>o", { desc = "Open to line below" })
km("i", ",", ",<C-g>u", { desc = "Create undo breakpoint at ," })
km("i", ".", ".<C-g>u", { desc = "Create undo breakpoint at ." })
km("i", "!", "!<C-g>u", { desc = "Create undo breakpoint at !" })
km("i", "?", "?<C-g>u", { desc = "Create undo breakpoint at ?" })
km("i", "{", "{<C-g>u", { desc = "Create undo breakpoint at {" })
km("i", "[", "[<C-g>u", { desc = "Create undo breakpoint at [" })

km("x", "p", [["_dP]], { desc = "Keep copied text in register" })
