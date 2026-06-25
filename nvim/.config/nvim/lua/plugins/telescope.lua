return {
  "nvim-telescope/telescope.nvim",
  tag = "0.1.6",
  dependencies = {
    "nvim-lua/plenary.nvim",
  },
  keys = {
    { "<leader>ff", "<cmd>Telescope find_files<cr>", desc = "Buscar archivos" },
    { "<leader>fg", "<cmd>Telescope live_grep<cr>", desc = "Buscar texto" },
    { "<leader>fb", "<cmd>Telescope buffers<cr>", desc = "Buscar buffers" },
    { "<leader>fh", "<cmd>Telescope help_tags<cr>", desc = "Buscar ayuda" },
  },
  config = function()
    require("telescope").setup({
      defaults = {
        prompt_prefix = "  ",
        selection_caret = "  ",
        path_display = { "truncate" },
        sorting_strategy = "ascending",
        layout_config = {
          horizontal = {
            prompt_position = "top",
            preview_width = 0.55,
            results_width = 0.8,
          },
          vertical = {
            mirror = false,
          },
          width = 0.87,
          height = 0.80,
          preview_cutoff = 120,
        },
      },
    })
  end,
}
