return {
  {
    "ibhagwan/fzf-lua",
    dependencies = { "echasnovski/mini.icons" },
    keys = {
      {
        "<leader>se",
        function()
          require("fzf-lua").lgrep_curbuf({ resume = true })
        end,
        desc = "Grep Current Buffer",
      },
    },
  },
}
