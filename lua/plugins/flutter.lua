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
      require("flutter-tools").setup({})

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
