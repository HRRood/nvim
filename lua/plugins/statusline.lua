return {
  "nvim-lualine/lualine.nvim",
  event = "VeryLazy",
  init = function()
    vim.g.lualine_laststatus = vim.o.laststatus
    if vim.fn.argc(-1) > 0 then
      -- set an empty statusline till lualine loads
      vim.o.statusline = " "
    else
      -- hide the statusline on the starter page
      vim.o.laststatus = 0
    end
  end,
  opts = function()
    -- PERF: we don't need this lualine require madness 🤷
    local lualine_require = require("lualine_require")
    lualine_require.require = require

    -- Define icons locally instead of using LazyVim.config.icons
    local icons = {
      diagnostics = {
        Error = " ",
        Warn = " ",
        Info = " ",
        Hint = "󰌵 ",
      },
      git = {
        added = "",
        modified = "",
        removed = "",
      },
    }

    vim.o.laststatus = vim.g.lualine_laststatus

    -- Helper function to get root directory (replaces LazyVim.lualine.root_dir())
    local function root_dir()
      return function()
        local root = vim.fs.find({'.git', 'package.json', 'Cargo.toml', 'pyproject.toml', 'Makefile'}, {
          upward = true,
          stop = vim.loop.os_homedir(),
          path = vim.fs.dirname(vim.api.nvim_buf_get_name(0)),
        })[1]
        if root then
          return vim.fs.dirname(root)
        end
        return vim.fn.getcwd()
      end
    end

    -- Helper function for pretty path (replaces LazyVim.lualine.pretty_path())
    local function pretty_path()
      return function()
        local path = vim.fn.expand("%:~:.")
        if path == "" then return "[No Name]" end
        
        -- Truncate long paths
        local max_len = 40
        if #path > max_len then
          path = "..." .. path:sub(-(max_len - 3))
        end
        
        return path
      end
    end

    -- Helper function to get color (replaces Snacks.util.color())
    local function get_color(group)
      local hl = vim.api.nvim_get_hl(0, { name = group })
      if hl.fg then
        return string.format("#%06x", hl.fg)
      end
      return nil
    end

    local opts = {
      options = {
        theme = "auto",
        globalstatus = vim.o.laststatus == 3,
        disabled_filetypes = { statusline = { "dashboard", "alpha", "ministarter", "snacks_dashboard" } },
      },
      sections = {
        lualine_a = { "mode" },
        lualine_b = { "branch" },

        lualine_c = {
          root_dir(),
          {
            "diagnostics",
            symbols = {
              error = icons.diagnostics.Error,
              warn = icons.diagnostics.Warn,
              info = icons.diagnostics.Info,
              hint = icons.diagnostics.Hint,
            },
          },
          { "filetype", icon_only = true, separator = "", padding = { left = 1, right = 0 } },
          { pretty_path() },
        },
        lualine_x = {
          -- Remove Snacks.profiler.status() as it's LazyVim specific
          
          -- Noice command status (only if noice is available)
          {
            function() 
              if package.loaded["noice"] then
                return require("noice").api.status.command.get() 
              end
              return ""
            end,
            cond = function() 
              return package.loaded["noice"] and require("noice").api.status.command.has() 
            end,
            color = function() return { fg = get_color("Statement") } end,
          },
          
          -- Noice mode status (only if noice is available)
          {
            function() 
              if package.loaded["noice"] then
                return require("noice").api.status.mode.get() 
              end
              return ""
            end,
            cond = function() 
              return package.loaded["noice"] and require("noice").api.status.mode.has() 
            end,
            color = function() return { fg = get_color("Constant") } end,
          },
          
          -- DAP status (only if dap is available)
          {
            function() 
              if package.loaded["dap"] then
                return "  " .. require("dap").status() 
              end
              return ""
            end,
            cond = function() 
              return package.loaded["dap"] and require("dap").status() ~= "" 
            end,
            color = function() return { fg = get_color("Debug") } end,
          },
          
          -- Lazy updates status (only if lazy is available)
          {
            function()
              if package.loaded["lazy"] then
                return require("lazy.status").updates()
              end
              return ""
            end,
            cond = function()
              return package.loaded["lazy"] and require("lazy.status").has_updates()
            end,
            color = function() return { fg = get_color("Special") } end,
          },
          
          {
            "diff",
            symbols = {
              added = icons.git.added,
              modified = icons.git.modified,
              removed = icons.git.removed,
            },
            source = function()
              local gitsigns = vim.b.gitsigns_status_dict
              if gitsigns then
                return {
                  added = gitsigns.added,
                  modified = gitsigns.changed,
                  removed = gitsigns.removed,
                }
              end
            end,
          },
        },
        lualine_y = {
          { "progress", separator = " ", padding = { left = 1, right = 0 } },
          { "location", padding = { left = 0, right = 1 } },
        },
        lualine_z = {
          function()
            return " " .. os.date("%R")
          end,
        },
      },
      extensions = { "neo-tree", "lazy", "fzf" },
    }

    -- Optional: Add trouble symbols if trouble.nvim is available
    -- (removed LazyVim.has() dependency)
    if vim.g.trouble_lualine and package.loaded["trouble"] then
      local trouble = require("trouble")
      local symbols = trouble.statusline({
        mode = "symbols",
        groups = {},
        title = false,
        filter = { range = true },
        format = "{kind_icon}{symbol.name:Normal}",
        hl_group = "lualine_c_normal",
      })
      table.insert(opts.sections.lualine_c, {
        symbols and symbols.get,
        cond = function()
          return vim.b.trouble_lualine ~= false and symbols.has()
        end,
      })
    end

    return opts
  end,
}