lua << EOF

local actions = require("telescope.actions")

require("telescope").setup({
  pickers = {
    buffers = {
      show_all_buffers = true,
      sort_lastused = true,
      mappings = {
        i = {
          ["<C-x>"] = "delete_buffer",
          ["<C-q>"] = actions.send_to_qflist
        }
      },
      extensions = {
        fzy_native = {
          override_generic_sorter = false,
          override_file_sorter = true
        }
      }
    }
  }
})

require("telescope").load_extension("fzy_native")
EOF

