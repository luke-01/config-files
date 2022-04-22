local ok, autopairs = pcall(require, 'nvim-autopairs')
if not ok then
  return
end

autopairs.setup({
  check_ts = true,
})

-- If you want insert `(` after select function or method item
local cmp_autopairs = require('nvim-autopairs.completion.cmp')
local cmp = require('cmp')
cmp.event:on( 'confirm_done', cmp_autopairs.on_confirm_done({  map_char = { tex = '' } }))


local cond = require('nvim-autopairs.conds')
local Rule = require('nvim-autopairs.rule')

autopairs.add_rule(Rule("$$", "$$", "tex"))

autopairs.add_rules({
  Rule("$", "$", { "tex", "latex" })
      -- don't add a pair if the next character is %
      :with_pair(cond.not_after_regex("%%"))
      -- don't add a pair if  the previous character is xxx
      :with_pair(cond.not_before_regex("xxx", 3))
      -- don't move right when repeat character
      :with_move(cond.none())
      -- don't delete if the next character is xx
      :with_del(cond.not_after_regex("xx"))
      -- disable adding a newline when you press <cr>
      :with_cr(cond.none())
})

autopairs.add_rules({
  Rule("$$", "$$", "tex")
      :with_pair(function(opts)
        print(vim.inspect(opts))
        if opts.line == "aa $$" then
          -- don't add pair on that line
          return false
        end
      end)
})
