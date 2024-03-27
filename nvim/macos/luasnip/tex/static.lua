local helpers = require('zerogtiger.luasnip_helper_funcs')
local get_visual = helpers.get_visual

local line_begin = require("luasnip.extras.expand_conditions").line_begin

-- Return snippet tables
return
  {
    s({trig="qq", snippetType="autosnippet"},
      {
        t("\\qquad "),
      }
    ),
    s({trig="npp", snippetType="autosnippet"},
      {
        t({"\\newpage", ""}),
      },
      {condition = line_begin}
    ),
    s({trig="which", snippetType="autosnippet"},
      {
        t("\\text{ for which } "),
      },
      {condition = helpers.in_mathzone}
    ),
    s({trig="all", snippetType="autosnippet"},
      {
        t("\\text{ for all } "),
      },
      {condition = helpers.in_mathzone}
    ),
    s({trig="and", snippetType="autosnippet"},
      {
        t("\\text{ and } "),
      },
      {condition = helpers.in_mathzone}
    ),
    -- s({trig="forall", snippetType="autosnippet"},
    --   {
    --     t("\\text{ for all } "),
    --   },
    --   {condition = tex.in_mathzone}
    -- ),
    s({trig = "toc", snippetType="autosnippet"},
      {
        t("\\tableofcontents"),
      },
      { condition = line_begin }
    ),
    s({trig="ii", snippetType="autosnippet"},
      {
        t("\\item"),
      },
      { condition = line_begin }
    ),
    s({trig = "--", snippetType="autosnippet"},
      {t('% --------------------------------------------- %')},
      {condition = line_begin}
    ),
    -- HLINE WITH EXTRA VERTICAL SPACE
    s({trig = "hl"},
      {t('\\hline {\\rule{0pt}{2.5ex}} \\hspace{-7pt}')},
      {condition = line_begin}
    ),
  }
