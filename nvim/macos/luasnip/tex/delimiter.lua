local helpers = require('zerogtiger.luasnip_helper_funcs')
local get_visual = helpers.get_visual

-- Return snippet tables
return
{
  -- LEFT/RIGHT ABSOLUTE VALUE
  s({trig = "l%|", regTrig = true, wordTrig = false, snippetType="autosnippet"},
    fmta(
      "\\left|<>\\right|",
      {
        d(1, get_visual),
      }
    ),
    {condition = helpers.line_begin_or_non_letter_and_math}
  ),
  -- LEFT/RIGHT PARENTHESES
  s({trig = "l%(", regTrig = true, wordTrig = false, snippetType="autosnippet"},
    fmta(
      "\\left(<>\\right)",
      {
        d(1, get_visual),
      }
    ),
    {condition = helpers.line_begin_or_non_letter_and_math}
  ),
  -- LEFT/RIGHT SQUARE BRACES
  s({trig = "l%[", regTrig = true, wordTrig = false, snippetType="autosnippet"},
    fmta(
      "\\left[<>\\right]",
      {
        d(1, get_visual),
      }
    ),
    {condition = helpers.line_begin_or_non_letter_and_math}
  ),
  -- LEFT/RIGHT CURLY BRACES
  s({trig = "l%{", regTrig = true, wordTrig = false, snippetType="autosnippet"},
    fmta(
      "\\left\\{<>\\right\\}",
      {
        d(1, get_visual),
      }
    ),
    {condition = helpers.line_begin_or_non_letter_and_math}
  ),
  -- BIG PARENTHESES
  -- s({trig = "([^%a])b%(", regTrig = true, wordTrig = false, snippetType="autosnippet"},
  --   fmta(
  --     "<>\\big(<>\\big)",
  --     {
  --       f( function(_, snip) return snip.captures[1] end ),
  --       d(1, get_visual),
  --     }
  --   )
  -- ),
  -- BIG SQUARE BRACES
  -- s({trig = "([^%a])b%[", regTrig = true, wordTrig = false, snippetType="autosnippet"},
  --   fmta(
  --     "<>\\big[<>\\big]",
  --     {
  --       f( function(_, snip) return snip.captures[1] end ),
  --       d(1, get_visual),
  --     }
  --   )
  -- ),
  -- BIG CURLY BRACES
  -- s({trig = "([^%a])b%{", regTrig = true, wordTrig = false, snippetType="autosnippet"},
  --   fmta(
  --     "<>\\big\\{<>\\big\\}",
  --     {
  --       f( function(_, snip) return snip.captures[1] end ),
  --       d(1, get_visual),
  --     }
  --   )
  -- ),
  -- ESCAPED PARENTHESES
  s({trig = "%(%(", regTrig = true, wordTrig = false, snippetType="autosnippet", priority=2000},
    fmta(
    "\\(<>\\)",
      {
        d(1, get_visual),
      }
    ),
    {condition = helpers.line_begin_or_non_letter_and_text}
  ),
  -- ESCAPED SQUARE BRACES
  s({trig = "%[%[", regTrig = true, wordTrig = false, snippetType="autosnippet", priority=2000},
    fmta(
      [[
      \[
        <>
      \]
      ]],
      {
        d(1, get_visual),
      }
    ),
    {condition = helpers.line_begin_or_non_letter_and_text}
  ),
  -- ESCAPED CURLY BRACES
  s({trig = "%{%{", regTrig = true, wordTrig = false, snippetType="autosnippet", priority=2000},
    fmta(
      "\\{<>\\}",
      {
        d(1, get_visual),
      }
    ),
    {condition = helpers.line_begin_or_non_letter}
  ),
  -- LATEX QUOTATION MARK
  s({trig = "``", snippetType="autosnippet"},
    fmta(
      "``<>''",
      {
        d(1, get_visual),
      }
    )
  ),
}

