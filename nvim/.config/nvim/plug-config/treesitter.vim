lua <<EOF
require'nvim-treesitter.configs'.setup {
  ensure_installed = "maintained" , -- one of "all", "maintained" (parsers with maintainers), or a list of languages
  playground = {
    enable = true
  },
  highlight = {
    enable = true,              -- false will disable the whole extension
  },
  indent = {
    enable = true
  },
  query_linter = {
    enable = true,
    use_virtual_text = true,
    lint_events = {"BufWrite"}
  },
  context_commenting = {
    enable = true
  }
}
EOF


nnoremap <leader>tp :TSPlayground<CR>
