return {
  {
    "vyfor/cord.nvim",
    build = "sh -c './build || .\\build'", -- I use fish
    event = "VeryLazy",
    opts = {
      editor = {
        client = "neovim",
        tooltip = "Shishu's Workspace",
      },

      text = {
        workspace = [[
Pain is Temporary,
Pride is Permanenet

				]],
      },
      idle = {
        enable = true,
        text = "in DND",
        tooltip = "Having a quality time",
      },
    }, -- calls require('cord').setup()
  },
}
