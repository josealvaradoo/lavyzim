-- A config for flutter development
return {
  {
    "akinsho/flutter-tools.nvim",
    lazy = true,
    event = "VeryLazy",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "stevearc/dressing.nvim",
    },
    config = function()
      require("flutter-tools").setup({
        debugger = {
          -- make these two params true to enable debug mode
          enabled = false,
          run_via_dap = false,

          register_configurations = function(_)
            require("dap").adapters.dart = {
              type = "executable",
              command = vim.fn.stdpath("data") .. "/mason/bin/dart-debug-adapter",
              args = { "flutter" },
            }

            require("dap").configurations.dart = {
              {
                type = "dart",
                request = "launch",
                name = "Launch flutter",
                dartSdkPath = "home/flutter/bin/cache/dart-sdk/",
                flutterSdkPath = "home/flutter",
                program = "${workspaceFolder}/lib/main.dart",
                cwd = "${workspaceFolder}",
              },
            }
          end,
        },
        dev_log = {
          -- toggle it when you run without DAP
          enabled = false,
          open_cmd = "tabedit",
        },
      })
      -- [[ Configure Flutter tools]]
      -- vim.keymap.set(
      --   "n",
      --   "<leader>r",
      --   require("telescope").extensions.flutter.commands,
      --   { desc = "Open command Flutter" }
      -- )
      vim.keymap.set("n", "<leader>br", function()
        vim.cmd("20new")
        vim.cmd("te fvm flutter packages pub run build_runner build --delete-conflicting-outputs")
        vim.cmd("2sleep | normal G")
      end)
    end,
  },
  -- for dart syntax hightling
  {
    "dart-lang/dart-vim-plugin",
  },
}
