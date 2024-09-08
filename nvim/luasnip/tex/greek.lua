local helpers = require('zerogtiger.luasnip_helper_funcs')
-- Return snippet tables
return
{
  s({trig=";a", snippetType="autosnippet"},
    {
      t("\\alpha"),
  },
  { condition = helpers.line_begin_or_non_letter_and_math }),
  s({trig=";b", snippetType="autosnippet"},
    {
      t("\\beta"),
  },
  { condition = helpers.line_begin_or_non_letter_and_math }),
  s({trig=";g", snippetType="autosnippet"},
    {
      t("\\gamma"),
  },
  { condition = helpers.line_begin_or_non_letter_and_math }),
  s({trig=";G", snippetType="autosnippet"},
    {
      t("\\Gamma"),
  },
  { condition = helpers.line_begin_or_non_letter_and_math }),
  s({trig=";d", snippetType="autosnippet"},
    {
      t("\\delta"),
  },
  { condition = helpers.line_begin_or_non_letter_and_math }),
  s({trig=";D", snippetType="autosnippet"},
    {
      t("\\Delta"),
  },
  { condition = helpers.line_begin_or_non_letter_and_math }),
  s({trig=";e", snippetType="autosnippet"},
    {
      t("\\epsilon"),
  },
  { condition = helpers.line_begin_or_non_letter_and_math }),
  s({trig=";ve", snippetType="autosnippet"},
    {
      t("\\varepsilon"),
  },
  { condition = helpers.line_begin_or_non_letter_and_math }),
  s({trig=";z", snippetType="autosnippet"},
    {
      t("\\zeta"),
  },
  { condition = helpers.line_begin_or_non_letter_and_math }),
  s({trig=";h", snippetType="autosnippet"},
    {
      t("\\eta"),
  },
  { condition = helpers.line_begin_or_non_letter_and_math }),
  s({trig=";o", snippetType="autosnippet"},
    {
      t("\\theta"),
  },
  { condition = helpers.line_begin_or_non_letter_and_math }),
  s({trig=";vo", snippetType="autosnippet"},
    {
      t("\\vartheta"),
  },
  { condition = helpers.line_begin_or_non_letter_and_math }),
  s({trig=";O", snippetType="autosnippet"},
    {
      t("\\Theta"),
  },
  { condition = helpers.line_begin_or_non_letter_and_math }),
  s({trig=";k", snippetType="autosnippet"},
    {
      t("\\kappa"),
  },
  { condition = helpers.line_begin_or_non_letter_and_math }),
  s({trig=";l", snippetType="autosnippet"},
    {
      t("\\lambda"),
  },
  { condition = helpers.line_begin_or_non_letter_and_math }),
  s({trig=";L", snippetType="autosnippet"},
    {
      t("\\Lambda"),
  },
  { condition = helpers.line_begin_or_non_letter_and_math }),
  s({trig=";m", snippetType="autosnippet"},
    {
      t("\\mu"),
  },
  { condition = helpers.line_begin_or_non_letter_and_math }),
  s({trig=";n", snippetType="autosnippet"},
    {
      t("\\nu"),
  },
  { condition = helpers.line_begin_or_non_letter_and_math }),
  s({trig=";x", snippetType="autosnippet"},
    {
      t("\\xi"),
  },
  { condition = helpers.line_begin_or_non_letter_and_math }),
  s({trig=";X", snippetType="autosnippet"},
    {
      t("\\Xi"),
  },
  { condition = helpers.line_begin_or_non_letter_and_math }),
  s({trig=";i", snippetType="autosnippet"},
    {
      t("\\pi"),
  },
  { condition = helpers.line_begin_or_non_letter_and_math }),
  s({trig=";I", snippetType="autosnippet"},
    {
      t("\\Pi"),
  },
  { condition = helpers.line_begin_or_non_letter_and_math }),
  s({trig=";r", snippetType="autosnippet"},
    {
      t("\\rho"),
  },
  { condition = helpers.line_begin_or_non_letter_and_math }),
  s({trig=";s", snippetType="autosnippet"},
    {
      t("\\sigma"),
  },
  { condition = helpers.line_begin_or_non_letter_and_math }),
  s({trig=";S", snippetType="autosnippet"},
    {
      t("\\Sigma"),
  },
  { condition = helpers.line_begin_or_non_letter_and_math }),
  s({trig=";t", snippetType="autosnippet"},
    {
      t("\\tau"),
  },
  { condition = helpers.line_begin_or_non_letter_and_math }),
  s({trig=";f", snippetType="autosnippet"},
    {
      t("\\phi"),
  },
  { condition = helpers.line_begin_or_non_letter_and_math }),
  s({trig=";vf", snippetType="autosnippet"},
    {
      t("\\varphi"),
  },
  { condition = helpers.line_begin_or_non_letter_and_math }),
  s({trig=";F", snippetType="autosnippet"},
    {
      t("\\Phi"),
  },
  { condition = helpers.line_begin_or_non_letter_and_math }),
  s({trig=";c", snippetType="autosnippet"},
    {
      t("\\chi"),
  },
  { condition = helpers.line_begin_or_non_letter_and_math }),
  s({trig=";p", snippetType="autosnippet"},
    {
      t("\\psi"),
  },
  { condition = helpers.line_begin_or_non_letter_and_math }),
  s({trig=";P", snippetType="autosnippet"},
    {
      t("\\Psi"),
  },
  { condition = helpers.line_begin_or_non_letter_and_math }),
  s({trig=";w", snippetType="autosnippet"},
    {
      t("\\omega"),
  },
  { condition = helpers.line_begin_or_non_letter_and_math }),
  s({trig=";W", snippetType="autosnippet"},
    {
      t("\\Omega"),
  },
  { condition = helpers.line_begin_or_non_letter_and_math }),
}
