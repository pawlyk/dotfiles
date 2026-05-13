-- ========================================================================== --
--                              BASIC SETTINGS                                --
-- ========================================================================== --
vim.g.mapleader = ","
vim.g.maplocalleader = ","

-- STARTUP SPEEDUP: Disable auto-lookup
vim.g.python3_host_prog = '/opt/homebrew/bin/python3' -- Ensure the path is correct
vim.g.loaded_ruby_provider = 0
vim.g.loaded_node_provider = 0
vim.g.loaded_perl_provider = 0

local opt = vim.opt

opt.number = true
opt.relativenumber = true
opt.tabstop = 4
opt.shiftwidth = 4
opt.expandtab = true
opt.smartindent = true
opt.wrap = false
opt.ignorecase = true
opt.smartcase = true
opt.cursorline = true
opt.termguicolors = true
opt.termguicolors = true    
opt.cursorline = true       
opt.scrolloff = 8
opt.signcolumn = "yes"
opt.clipboard = "unnamedplus"
opt.colorcolumn = "80,120"

-- ========================================================================== --
--                              PLUGIN MANAGER (LAZY)                         --
-- ========================================================================== --
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable",
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

-- ========================================================================== --
--                              PLUGINS                                       --
-- ========================================================================== --
require("lazy").setup({

  -- 1. Colorscheme (The only thing loaded instantly)
  {
    "rebelot/kanagawa.nvim",
    lazy = false,
    priority = 1000,
    config = function()
      vim.cmd("colorscheme kanagawa")
    end,
  },

  -- 2. Status line
  {
    'nvim-lualine/lualine.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    config = function()
      require('lualine').setup {
        options = {
          icons_enabled = true,
          theme = 'auto',
          component_separators = { left = '', right = ''},
          section_separators = { left = '', right = ''},
          disabled_filetypes = {
            statusline = {},
            winbar = {},
          },
          ignore_focus = {},
          always_divide_middle = true,
          always_show_tabline = true,
          globalstatus = false,
          refresh = {
            statusline = 1000,
            tabline = 1000,
            winbar = 1000,
            refresh_time = 16, -- ~60fps
            events = {
              'WinEnter',
              'BufEnter',
              'BufWritePost',
              'SessionLoadPost',
              'FileChangedShellPost',
              'VimResized',
              'Filetype',
              'CursorMoved',
              'CursorMovedI',
              'ModeChanged',
            },
          }
        },
        sections = {
          lualine_a = {'mode'},
          lualine_b = {'branch', 'diff', 'diagnostics'},
          lualine_c = {'filename'},
          lualine_x = {'encoding', 'fileformat', 'filetype'},
          lualine_y = {'progress'},
          lualine_z = {'location'}
        },
        inactive_sections = {
          lualine_a = {},
          lualine_b = {},
          lualine_c = {'filename'},
          lualine_x = {'location'},
          lualine_y = {},
          lualine_z = {}
        },
        tabline = {},
        winbar = {},
        inactive_winbar = {},
        extensions = {}
      }
    end,
  },

  -- 3. File Manager (Loads only on <leader>n)
  {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    cmd = "Neotree",
    keys = {
      { "<leader>n", "<cmd>Neotree toggle<cr>", desc = "Toggle NeoTree" },
    },
    dependencies = { "nvim-lua/plenary.nvim", "nvim-tree/nvim-web-devicons", "MunifTanjim/nui.nvim" }
  },

  -- 4. Search (Loads only on call)
  {
    "nvim-telescope/telescope.nvim",
    cmd = "Telescope",
    keys = {
      { "<leader>f", "<cmd>Telescope find_files<cr>", desc = "Find Files" },
      { "<leader>g", "<cmd>Telescope live_grep<cr>", desc = "Live Grep" },
    },
    dependencies = { "nvim-lua/plenary.nvim" }
  },

  -- 5. Treesitter (SPEED FIX: Load AFTER opening file)
  {
    "nvim-treesitter/nvim-treesitter",
    event = { "BufReadPost", "BufNewFile" },
    build = ":TSUpdate",
    config = function()
      local status_ok, configs = pcall(require, "nvim-treesitter.configs")
      if status_ok then
        configs.setup({
          ensure_installed = { "c", "lua", "vim", "vimdoc", "query", "python", "rust", "go", "bash", "markdown" },
          highlight = { enable = true },
        })
      end
    end,
  },

  -- 6. Autocompletion (Loads only when you start typing)
  {
    "hrsh7th/nvim-cmp",
    event = "InsertEnter",
    dependencies = { "L3MON4D3/LuaSnip", "saadparwaiz1/cmp_luasnip" },
    config = function()
      local cmp = require("cmp")
      cmp.setup({
        snippet = { expand = function(args) require("luasnip").lsp_expand(args.body) end },
        mapping = cmp.mapping.preset.insert({
          ["<C-Space>"] = cmp.mapping.complete(),
          ["<CR>"] = cmp.mapping.confirm({ select = true }),
          ["<Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then cmp.select_next_item() else fallback() end
          end, { "i", "s" }),
        }),
        sources = cmp.config.sources({
          { name = "nvim_lsp" },
          { name = "luasnip" },
        }, {
          { name = "buffer" },
        })
      })
    end,
  },

  -- 7. LSP (Native, no UI blocking)
  {
    "neovim/nvim-lspconfig",
    event = { "BufReadPre", "BufNewFile" },
    config = function()
      local capabilities = vim.lsp.protocol.make_client_capabilities()
      capabilities.textDocument.completion.completionItem.snippetSupport = true

      local function get_python_path()
        local venv = os.getenv("VIRTUAL_ENV")
        if venv then return venv .. "/bin/python" end
        return "/opt/homebrew/bin/python3" 
      end

      vim.lsp.config('*', {
        capabilities = capabilities
      })

      vim.lsp.config('pylsp', {
        cmd = { "pylsp" }, -- Explicitly specify command to avoid system-wide search
        settings = {
          pylsp = {
            plugins = {
              pycodestyle = { enabled = false },
              pyflakes = { enabled = false },
              mccabe = { enabled = false },
              pylsp_mypy = { enabled = true, live_mode = true, dmypy = true },
              python_lsp_ruff = { enabled = true, format = { "I" } },
              jedi = { environment = get_python_path() }
            }
          }
        }
      })

      vim.lsp.enable('pylsp')
      vim.lsp.enable('rust_analyzer')
      vim.lsp.enable('gopls')

      vim.api.nvim_create_autocmd('LspAttach', {
        callback = function(args)
          local opts = { buffer = args.buf }
          vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
          vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
          vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, opts)
          vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, opts)
          vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
          vim.keymap.set('n', '<leader>fm', function()
            vim.lsp.buf.format { async = true }
          end, opts)
        end,
      })
    end
  },
  
  -- 8. Indent guides
  { "lukas-reineke/indent-blankline.nvim", main = "ibl", opts = {} },

  -- 9. Rainbow delimiters
  { "HiPhish/rainbow-delimiters.nvim" },

  -- 10. Auto-close brackets
  { "windwp/nvim-autopairs", event = "InsertEnter", config = true },

  -- 11. Tabs (Bufferline)
  {
    "akinsho/bufferline.nvim",
    version = "*",
    dependencies = "nvim-tree/nvim-web-devicons",
    config = function()
      require("bufferline").setup({
        options = {
          mode = "buffers",
          diagnostics = "nvim_lsp",
          show_buffer_close_icons = false,
          show_close_icon = false,
          offsets = {
            {
              filetype = "neo-tree",
              text = "File Explorer",
              text_align = "center",
              separator = true
            }
          }
        }
      })
    end
  },
})

-- ========================================================================== --
--                             KEYBINDINGS                                    --
-- ========================================================================== --

local keymap = vim.keymap.set

-- Neo-tree
keymap('n', '<leader>n', '<cmd>Neotree toggle<cr>')

-- Formatting and Saving
local format_and_save = function()
  vim.lsp.buf.format({ 
    async = false,
    filter = function(client) return client.name ~= "pyright" end 
  })
  vim.cmd("write")
end
keymap('n', '<leader>w', format_and_save, { desc = "Format code and Save" })


-- ========================================================================== --
--                        WORKING WITH TABS (BUFFERS)                         --
-- ========================================================================== --

keymap('n', '<Tab>', '<cmd>BufferLineCycleNext<cr>', { desc = "Next tab" })
keymap('n', '<S-Tab>', '<cmd>BufferLineCyclePrev<cr>', { desc = "Previous tab" })
keymap('n', '<leader>]', '<cmd>BufferLineMoveNext<cr>', { desc = "Move tab right" })
keymap('n', '<leader>[', '<cmd>BufferLineMovePrev<cr>', { desc = "Move tab left" })
keymap('n', '<leader>c', '<cmd>bdelete<cr>', { desc = "Close tab" })
keymap('n', '<leader>C', '<cmd>bdelete!<cr>', { desc = "Force close tab" })


-- ========================================================================== --
--                                SEARCH                                       --
-- ========================================================================== --

keymap('n', '<C-p>', '<cmd>Telescope find_files<cr>', { desc = "Find file" })
keymap('n', '<leader>f', '<cmd>Telescope live_grep<cr>', { desc = "Find text (grep)" })
keymap('n', '<leader>*', '<cmd>Telescope grep_string<cr>', { desc = "Find word under cursor" })
keymap('n', '<leader>b', '<cmd>Telescope buffers<cr>', { desc = "List of open tabs" })

-- Commenting a line: ,c
vim.keymap.set("n", "<leader>c", "gcc", { remap = true, desc = "Toggle Comment Line" })

-- Commenting a block: highlight text + ,c
vim.keymap.set("v", "<leader>c", "gc", { remap = true, desc = "Toggle Comment Block" })

-- Shift code Right and Left in the visual mode
vim.keymap.set("v", "<Tab>", ">gv")
vim.keymap.set("v", "<S-Tab>", "<gv")
