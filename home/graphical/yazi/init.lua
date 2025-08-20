require("bunny"):setup({
  hops = {
    { key = "/",          path = "/",                                                   },
    { key = "t",          path = "/tmp",                                                },
    { key = "n",          path = "~/dotfiles",       desc = "doftiles!"                 },
    { key = "~",          path = "~",                desc = "Home"                      },
    { key = "m",          path = "~/Music",          desc = "Music"                     },
    { key = "v",          path = "~/Videos",          desc = "Videos"                   },
    { key = "d",          path = "~/Desktop",        desc = "Desktop"                   },
    { key = "D",          path = "~/Documents",      desc = "Documents"                 },
    { key = "c",          path = "~/.config",        desc = "Config files"              },
    { key = { "l", "s" }, path = "~/.local/share",   desc = "Local share"               },
    { key = { "l", "b" }, path = "~/.local/bin",     desc = "Local bin"                 },
    { key = { "l", "t" }, path = "~/.local/state",   desc = "Local state"               },
    { key = "s",          path = "~/.local/share/Steam/steamapps/common", desc = "Steam"},
    -- key and path attributes are required, desc is optional
  },
  desc_strategy = "path", -- If desc isn't present, use "path" or "filename", default is "path"
  ephemeral = true, -- Enable ephemeral hops, default is true
  tabs = true, -- Enable tab hops, default is true
  notify = false, -- Notify after hopping, default is false
  fuzzy_cmd = "fzf", -- Fuzzy searching command, default is "fzf"
})
