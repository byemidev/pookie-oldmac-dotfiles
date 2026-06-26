require("config.lazy")

-- Opciones básicas de nvim
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.mouse = "a"
vim.opt.clipboard = "unnamedplus"
vim.opt.breakindent = true
vim.opt.undofile = true
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.signcolumn = "yes"
vim.opt.updatetime = 250
vim.opt.timeoutlen = 300
vim.opt.splitright = true
vim.opt.splitbelow = true
vim.opt.list = true
vim.opt.listchars = { tab = "» ", trail = "·", nbsp = "␣" }
vim.opt.inccommand = "split"
vim.opt.cursorline = true
vim.opt.scrolloff = 10
vim.opt.hlsearch = true

-- Navegación entre paneles de nvim
vim.keymap.set("n", "<C-h>", "<C-w>h", { desc = "Ir al panel izquierdo" })
vim.keymap.set("n", "<C-j>", "<C-w>j", { desc = "Ir al panel de abajo" })
vim.keymap.set("n", "<C-k>", "<C-w>k", { desc = "Ir al panel de arriba" })
vim.keymap.set("n", "<C-l>", "<C-w>l", { desc = "Ir al panel derecho" })

-- Atajos Clipboard
vim.keymap.set("v", "<C-c>", '"+y', { desc = "Copiar al clipboard"})
vim.keymap.set("n", "<C-v>", '"+p', { desc = "Pegar desde clipboard"})
vim.keymap.set("i", "<C-v>", '<C-r>+', { desc = "Insertar desde clipboard"})

-- Atajos básicos
vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>")
vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, { desc = "Ir al anterior diagnostic" })
vim.keymap.set("n", "]d", vim.diagnostic.goto_next, { desc = "Ir al siguiente diagnostic" })
vim.keymap.set("n", "<leader>q", vim.diagnostic.setloclist, { desc = "Abrir lista de diagnostics" })
