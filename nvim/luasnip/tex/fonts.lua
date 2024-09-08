local helpers = require('zerogtiger.luasnip_helper_funcs')
local get_visual = helpers.get_visual

-- Return snippet tables
return
{
  -- TYPEWRITER i.e. \texttt
  s({ trig = "tt", regTrig = true, wordTrig = false, snippetType = "autosnippet", priority = 2000 },
    fmta(
      "\\texttt{<>}",
      {
        d(1, get_visual),
      }
    ),
    { condition = helpers.line_begin_or_non_letter_and_text }
  ),
  -- ITALIC i.e. \textit
  s({ trig = "tii", regTrig = true, wordTrig = false, snippetType = "autosnippet" },
    fmta(
      "\\textit{<>}",
      {
        d(1, get_visual),
      }
    ),
    { condition = helpers.line_begin_or_non_letter_and_text }
  ),
  -- UNDERLINE i.e. \underline
  s({ trig = "ull", snippetType = "autosnippet" },
    fmta(
      "\\underline{<>}",
      {
        d(1, get_visual),
      }
    ),
    { condition = helpers.line_begin_or_non_letter_and_text }
  ),
  -- BOLD i.e. \textbf
  s({ trig = "tbb", snippetType = "autosnippet" },
    fmta(
      "\\textbf{<>}",
      {
        d(1, get_visual),
      }
    ),
    { condition = helpers.line_begin_or_non_letter_and_text }
  ),
  -- MATH CALIGRAPHY i.e. \mathcal
  s({ trig = "mcc", regTrig = true, wordTrig = false, snippetType = "autosnippet" },
    fmta(
      "\\mathcal{<>}",
      {
        d(1, get_visual),
      }
    ),
    { condition = helpers.line_begin_or_non_letter_and_math }
  ),
  -- MATH BOLDFACE i.e. \mathbf
  s({ trig = "mbf", regTrig = true, wordTrig = false, snippetType = "autosnippet" },
    fmta(
      "\\mathbf{<>}",
      {
        d(1, get_visual),
      }
    ),
    { condition = helpers.line_begin_or_non_letter_and_math }
  ),
  -- MATH BLACKBOARD i.e. \mathbb
  s({ trig = "mbb", regTrig = true, wordTrig = false, snippetType = "autosnippet" },
    fmta(
      "\\mathbb{<>}",
      {
        d(1, get_visual),
      }
    ),
    { condition = helpers.line_begin_or_non_letter_and_math }
  ),
  -- REGULAR TEXT i.e. \text (in math environments)
  s({ trig = "tee", regTrig = true, wordTrig = false, snippetType = "autosnippet" },
    fmta(
      "\\text{<>}",
      {
        d(1, get_visual),
      }
    ),
    { condition = helpers.line_begin_or_non_letter_and_math }
  ),
}
