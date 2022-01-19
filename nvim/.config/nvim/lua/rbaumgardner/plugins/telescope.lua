local status_ok, telescope = pcall(require, "telescope")
if not status_ok then
  return
end

local actions = require "telescope.actions"

telescope.setup {
  pickers = {
    buffers = {
      show_all_buffers = true,
      sort_lastused = true,
      defaults = {
        prompt_prefix = " ",
        selection_caret = " ",
        path_display = { "smart" },
      },
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
}

telescope.load_extension("fzy_native")
