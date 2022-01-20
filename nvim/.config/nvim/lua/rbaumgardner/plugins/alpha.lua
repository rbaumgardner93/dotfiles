local status_ok, alpha = pcall(require, "alpha")
if not status_ok then
  return
end

local dashboard = require('alpha.themes.dashboard')

local function pick_color()
  local colors = { "String", "Identifier", "Keyword", "Number" }
  return colors[math.random(#colors)]
end

local function footer()
  local total_plugins = #vim.tbl_keys(packer_plugins)
  local datetime = os.date(" %m-%d-%Y  %H:%M:%S")
  return "\n"
    .. datetime
    .. "  "
    .. total_plugins
    .. " plugins"
    .. "  v"
    .. vim.version().major
    .. "."
    .. vim.version().minor
    .. "."
    .. vim.version().patch
end

dashboard.section.header.val = {
  [[     / | / /__  ____| |  / (_)___ ___   ]],
  [[    /  |/ / _ \/ __ \ | / / / __ `__ \  ]],
  [[   / /|  /  __/ /_/ / |/ / / / / / / /  ]],
  [[  /_/ |_/\___/\____/|___/_/_/ /_/ /_/   ]],
  [[                                        ]],
  [[         [ @rbaumgardner93 ]            ]],
  [[                                        ]]
}

dashboard.section.header.opts.hl = pick_color()

dashboard.section.buttons.val = {
  dashboard.button("e", "  New file", ":ene <BAR> startinsert <CR>"),
  dashboard.button("<Leader>pv", "  File Explorer"),
  dashboard.button("<Leader>ff", "  Find File"),
  dashboard.button("<Leader>fg", "  Find Word"),
  dashboard.button("<Leader>ps", "  Settings", ":e $MYVIMRC<CR>"),
  dashboard.button("<Leader>fo", "  Recent Files", ":Telescope oldfiles<CR>"),
  dashboard.button("q", "  Quit", ":qa<cr>"),
}

dashboard.section.footer.val = footer()
dashboard.section.footer.opts.hl = "Constant"

alpha.setup(dashboard.opts)
