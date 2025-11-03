-- A config for flutter development
return {
  {
    "akinsho/flutter-tools.nvim",
    lazy = false,
    dependencies = {
      "nvim-lua/plenary.nvim",
      "stevearc/dressing.nvim",
    },
    config = function()
      local map = LazyVim.safe_keymap_set

      -- Function to load .env file
      local function load_env_file(file_path)
        local env_vars = {}
        local file = io.open(file_path, "r")
        if file then
          for line in file:lines() do
            if line:match("^[^#]") and line:match("=") then
              local key, value = line:match("([^=]+)=(.+)")
              if key and value then
                env_vars[key] = value
              end
            end
          end
          file:close()
        end
        return env_vars
      end

      -- Load environment variables
      local env_file = vim.fn.getcwd() .. "/.env"
      local env_vars = load_env_file(env_file)

      require("flutter-tools").setup({
        dart_define = env_vars, -- Use loaded .env variables
      })

      map("n", "<leader>r", "", { desc = "Flutter" })
      map("n", "<leader>rr", ":FlutterRun<cr>", { desc = "Flutter Run" })
      map("n", "<leader>rd", ":FlutterDebug<cr>", { desc = "Flutter Debug" })
      map("n", "<leader>rp", ":FlutterHotReload<cr>", { desc = "Flutter Hot Reload" })
      map("n", "<leader>rf", ":FlutterFlutterClean<cr>", { desc = "Flutter Flutter Clean" })
      map("n", "<leader>rc", ":FlutterCreateProject<cr>", { desc = "Flutter Create Project" })
      map("n", "<leader>ri", ":FlutterInspect<cr>", { desc = "Flutter Inspect" })
      map("n", "<leader>rb", ":FlutterBuild<cr>", { desc = "Flutter Build" })
      map("n", "<leader>rh", ":FlutterHotReloadApp<cr>", { desc = "Flutter Hot Reload App" })
      map("n", "<leader>re", ":FlutterEmulators<cr>", { desc = "Flutter Emulators" })
    end,
  },
  {
    "dart-lang/dart-vim-plugin",
  },
}
