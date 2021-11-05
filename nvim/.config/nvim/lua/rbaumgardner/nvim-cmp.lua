local cmp = require('cmp')
local lspkind = require('lspkind')

cmp.setup({
  mapping = {
    ['<C-u>'] = cmp.mapping.scroll_docs(-4),
    ['<C-d>'] = cmp.mapping.scroll_docs(4),
    ['<C-y>'] = cmp.mapping.confirm {
      behavior = cmp.ConfirmBehavior.Insert,
      select = true
    },
    ['<C-Space>'] = cmp.mapping.complete()
  },
  sources = {
    { name = 'nvim_lsp' },
    { name = 'luasnip' },
    { name = 'path' },
    { name = 'buffer', keyword_length = 5 }
  },
  snippet = {
    expand = function(args)
      require('luasnip').lsp_expand(args.body)
    end
  },
  formatting = {
    format = lspkind.cmp_format({
      with_text = true,
      menu = {
        buffer='[buf]',
        nvim_lsp='[LSP]',
        path='[path]',
        vsnip='[vsnip]'
      }
    })
  },
  experimental = {
    native_menu = false
  }
})
