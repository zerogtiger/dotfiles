local helpers = require('zerogtiger.luasnip_helper_funcs')
local get_visual = helpers.get_visual

-- Return snippet tables
return
{
  -- SUPERSCRIPT
  s({ trig = "\"", wordTrig = false, regTrig = true, snippetType = "autosnippet" },
    fmta(
      "^{<>}",
      {
        d(1, get_visual),
      }
    ),
    { condition = helpers.alpha_or_brackets_and_math }
  ),
  -- SUBSCRIPT
  s({ trig = ":", wordTrig = false, regTrig = true, snippetType = "autosnippet" },
    fmta(
      "_{<>}",
      {
        d(1, get_visual),
      }
    ),
    { condition = helpers.alpha_or_brackets_and_math }
  ),
  -- SUBSCRIPT AND SUPERSCRIPT
  s({ trig = "__", wordTrig = false, regTrig = true, snippetType = "autosnippet" },
    fmta(
      "^{<>}_{<>}",
      {
        i(1),
        i(2),
      }
    ),
    { condition = helpers.alpha_or_brackets_and_math }
  ),
  -- TEXT SUBSCRIPT
  s({ trig = 'sd', snippetType = "autosnippet", wordTrig = false },
    fmta("_{\\mathrm{<>}}",
      { d(1, get_visual) }
    ),
    { condition = helpers.in_mathzone }
  ),
  -- -- SUPERSCRIPT SHORTCUT
  -- -- Places the first alphanumeric character after the trigger into a superscript.
  -- s({trig = '"([%w])', regTrig = true, wordTrig = false, snippetType="autosnippet"},
  --   fmta(
  --     "^{<>}",
  --     {
  --       f( function(_, snip) return snip.captures[1] end ),
  --     }
  --   ),
  --   {condition = helpers.alpha_or_brackets_and_math}
  -- ),
  -- -- SUBSCRIPT SHORTCUT
  -- -- Places the first alphanumeric character after the trigger into a subscript.
  -- s({trig = '([%w%)%]%}]):([%w])', regTrig = true, wordTrig = false, snippetType="autosnippet"},
  --   fmta(
  --     "<>_{<>}",
  --     {
  --       f( function(_, snip) return snip.captures[1] end ),
  --       f( function(_, snip) return snip.captures[2] end ),
  --     }
  --   ),
  --   {condition = helpers.in_mathzone}
  -- ),
  -- EULER'S NUMBER SUPERSCRIPT SHORTCUT
  s({ trig = 'ee', regTrig = true, wordTrig = false, snippetType = "autosnippet" },
    fmta(
      "e^{<>}",
      {
        d(1, get_visual)
      }
    ),
    { condition = helpers.alpha_or_brackets_and_math }
  ),
  -- ZERO SUBSCRIPT SHORTCUT
  s({ trig = '00', regTrig = true, wordTrig = false, snippetType = "autosnippet" },
    fmta(
      "_{<>}",
      {
        t("0")
      }
    ),
    { condition = helpers.letter_or_brackets_and_math }
  ),
  -- MINUS ONE SUBSCRIPT SHORTCUT
  s({ trig = '11', regTrig = true, wordTrig = false, snippetType = "autosnippet" },
    fmta(
      "_{<>}",
      {
        t("-1")
      }
    ),
    { condition = helpers.letter_or_brackets_and_math }
  ),
  -- J SUBSCRIPT SHORTCUT (since jk triggers snippet jump forward)
  s({ trig = 'JJ', wordTrig = false, regTrig = true, snippetType = "autosnippet" },
    fmta(
      "_{<>}",
      {
        t("j")
      }
    ),
    { condition = helpers.letter_or_brackets_and_math }
  ),
  -- PLUS SUPERSCRIPT SHORTCUT
  s({ trig = '%+%+', regTrig = true, wordTrig = false, snippetType = "autosnippet" },
    fmta(
      "^{<>}",
      {
        t("+")
      }
    ),
    { condition = helpers.letter_or_brackets_and_math }
  ),
  -- COMPLEMENT SUPERSCRIPT
  s({ trig = 'CC', regTrig = true, wordTrig = false, snippetType = "autosnippet" },
    fmta(
      "^{<>}",
      {
        t("\\complement")
      }
    ),
    { condition = helpers.letter_or_brackets_and_math }
  ),
  -- CONJUGATE (STAR) SUPERSCRIPT SHORTCUT
  s({ trig = '%*%*', regTrig = true, wordTrig = false, snippetType = "autosnippet" },
    fmta(
      "^{<>}",
      {
        t("*")
      }
    ),
    { condition = helpers.letter_or_brackets_and_math }
  ),
  -- VECTOR, i.e. \vec
  s({ trig = "vv", wordTrig = false, regTrig = true, snippetType = "autosnippet" },
    fmta(
      "\\vec{<>}",
      {
        d(1, get_visual),
      }
    ),
    { condition = helpers.line_begin_or_non_letter_and_math }
  ),
  -- DEFAULT UNIT VECTOR WITH SUBSCRIPT, i.e. \unitvector_{}
  s({ trig = "ue", wordTrig = false, regTrig = true, snippetType = "autosnippet" },
    fmta(
      "\\unitvector_{<>}",
      {
        d(1, get_visual),
      }
    ),
    { condition = helpers.line_begin_or_non_letter_and_math }
  ),
  -- UNIT VECTOR WITH HAT, i.e. \uvec{}
  s({ trig = "uv", wordTrig = false, regTrig = true, snippetType = "autosnippet" },
    fmta(
      "\\uvec{<>}",
      {
        d(1, get_visual),
      }
    ),
    { condition = helpers.line_begin_or_non_letter_and_math }
  ),
  -- MATRIX, i.e. \mat
  s({ trig = "mt", wordTrig = false, regTrig = true, snippetType = "autosnippet" },
    fmta(
      "\\mat{<>}",
      {
        d(1, get_visual),
      }
    ),
    { condition = helpers.line_begin_or_non_letter_and_math }
  ),
  -- BINOMIAL
  s({ trig = "bo", wordTrig = false, regTrig = true, snippetType = "autosnippet" },
    fmta(
      "\\binom{<>}{<>}",
      {
        d(1, get_visual),
        i(2),
      }
    ),
    { condition = helpers.line_begin_or_non_letter_and_math }
  ),
  -- FRACTION,
  s({ trig = "ff", wordTrig = false, regTrig = true, snippetType = "autosnippet" },
    fmta(
      "\\frac{<>}{<>}",
      {
        d(1, get_visual),
        i(2),
      }
    ),
    { condition = helpers.line_begin_or_non_letter_and_math }
  ),
  -- ANGLE
  s({ trig = "gg", regTrig = true, wordTrig = false, snippetType = "autosnippet" },
    fmta(
      "\\ang{<>}",
      {
        d(1, get_visual),
      }
    ),
    { condition = helpers.line_begin_or_non_letter_and_math }
  ),
  -- ABSOLUTE VALUE
  s({ trig = "aa", regTrig = true, wordTrig = false, snippetType = "autosnippet" },
    fmta(
      "\\abs{<>}",
      {
        d(1, get_visual),
      }
    ),
    { condition = helpers.line_begin_or_non_letter_and_math }
  ),
  -- SQUARE ROOT
  s({ trig = "sq", wordTrig = false, regTrig = true, snippetType = "autosnippet" },
    fmta(
      "\\sqrt{<>}",
      {
        d(1, get_visual),
      }
    ),
    {
      condition = function(line_to_cursor, matched_trigger)
        return line_to_cursor:sub(1, -(#matched_trigger + 1)):match("[^%\\]") and
            helpers.line_begin_or_non_letter_and_math(line_to_cursor, matched_trigger)
      end
    }
  ),
  -- LOGARITHM WITH BASE SUBSCRIPT
  s({ trig = "ll", wordTrig = false, regTrig = true, snippetType = "autosnippet" },
    fmta(
      "\\log_{<>}",
      {
        i(1),
      }
    ),
    {
      condition = function(line_to_cursor, matched_trigger)
        return line_to_cursor:sub(1, -(#matched_trigger + 1)):match("[^%\\]") and
            helpers.line_begin_or_non_letter_and_math(line_to_cursor, matched_trigger)
      end
    }
  ),
  -- -- DERIVATIVE with denominator only
  -- s({ trig = "([^%a])dV", wordTrig = false, regTrig = true, snippetType = "autosnippet" },
  --   fmta(
  --     "<>\\dvOne{<>}",
  --     {
  --       f(function(_, snip) return snip.captures[1] end),
  --       d(1, get_visual),
  --     }
  --   ),
  --   { condition = helpers.in_mathzone }
  -- ),
  -- -- DERIVATIVE with numerator and denominator
  -- s({ trig = "([^%a])dvv", wordTrig = false, regTrig = true, snippetType = "autosnippet" },
  --   fmta(
  --     "<>\\dv{<>}{<>}",
  --     {
  --       f(function(_, snip) return snip.captures[1] end),
  --       i(1),
  --       i(2)
  --     }
  --   ),
  --   { condition = helpers.in_mathzone }
  -- ),
  -- -- DERIVATIVE with numerator, denominator, and higher-order argument
  -- s({ trig = "([^%a])ddv", wordTrig = false, regTrig = true, snippetType = "autosnippet" },
  --   fmta(
  --     "<>\\dvN{<>}{<>}{<>}",
  --     {
  --       f(function(_, snip) return snip.captures[1] end),
  --       i(1),
  --       i(2),
  --       i(3),
  --     }
  --   ),
  --   { condition = helpers.in_mathzone }
  -- ),
  -- -- PARTIAL DERIVATIVE with denominator only
  -- s({ trig = "([^%a])pV", wordTrig = false, regTrig = true, snippetType = "autosnippet" },
  --   fmta(
  --     "<>\\pdvOne{<>}",
  --     {
  --       f(function(_, snip) return snip.captures[1] end),
  --       d(1, get_visual),
  --     }
  --   ),
  --   { condition = helpers.in_mathzone }
  -- ),
  -- -- PARTIAL DERIVATIVE with numerator and denominator
  -- s({ trig = "([^%a])pvv", wordTrig = false, regTrig = true, snippetType = "autosnippet" },
  --   fmta(
  --     "<>\\pdv{<>}{<>}",
  --     {
  --       f(function(_, snip) return snip.captures[1] end),
  --       i(1),
  --       i(2)
  --     }
  --   ),
  --   { condition = helpers.in_mathzone }
  -- ),
  -- -- PARTIAL DERIVATIVE with numerator, denominator, and higher-order argument
  -- s({ trig = "([^%a])ppv", wordTrig = false, regTrig = true, snippetType = "autosnippet" },
  --   fmta(
  --     "<>\\pdvN{<>}{<>}{<>}",
  --     {
  --       f(function(_, snip) return snip.captures[1] end),
  --       i(1),
  --       i(2),
  --       i(3),
  --     }
  --   ),
  --   { condition = helpers.in_mathzone }
  -- ),
  -- SUM with lower limit
  s({ trig = "sM", wordTrig = false, regTrig = true, snippetType = "autosnippet" },
    fmta(
      "\\sum_{<>}",
      {
        i(1),
      }
    ),
    { condition = helpers.line_begin_or_non_letter_and_math }
  ),
  -- PROD with upper and lower limit
  s({ trig = "poo", wordTrig = false, regTrig = true, snippetType = "autosnippet" },
    fmta(
      "\\prod_{<>}^{<>} ",
      {
        i(1),
        i(2),
      }
    ),
    { condition = helpers.line_begin_or_non_letter_and_math }
  ),
  -- SUM with upper and lower limit
  s({ trig = "smm", wordTrig = false, regTrig = true, snippetType = "autosnippet" },
    fmta(
      "\\sum_{<>}^{<>}",
      {
        i(1),
        i(2),
      }
    ),
    { condition = helpers.line_begin_or_non_letter_and_math }
  ),
  -- INTEGRAL with upper and lower limit
  s({ trig = "intt", wordTrig = false, regTrig = true, snippetType = "autosnippet" },
    fmta(
      "\\int_{<>}^{<>}",
      {
        i(1),
        i(2),
      }
    ),
    {
      condition = function(line_to_cursor, matched_trigger)
        return line_to_cursor:sub(1, -(#matched_trigger + 1)):match("[^%\\]") and
            helpers.line_begin_or_non_letter_and_math(line_to_cursor, matched_trigger)
      end
    }
  ),
  -- LIMIT to positive infinity
  s({ trig = "lmm", wordTrig = false, regTrig = true, snippetType = "autosnippet" },
    fmta(
      "\\lim_{<> \\rightarrow <>} ",
      {
        i(1),
        i(2, "\\infty"),
      }
    ),
    { condition = helpers.line_begin_or_non_letter_and_math }
  ),
  -- INTEGRAL from positive to negative infinity
  s({ trig = "intf", wordTrig = false, regTrig = true, snippetType = "autosnippet" },
    fmta(
      "\\int_{-\\infty}^{\\infty}",
      {
      }
    ),
    {
      condition = function(line_to_cursor, matched_trigger)
        return line_to_cursor:sub(1, -(#matched_trigger + 1)):match("[^%\\]") and
            helpers.line_begin_or_non_letter_and_math(line_to_cursor, matched_trigger)
      end
    }
  ),
  -- BOXED command
  s({ trig = "bb", wordTrig = false, regTrig = true, snippetType = "autosnippet" },
    fmta(
      "\\boxed{<>}",
      {
        d(1, get_visual)
      }
    ),
    { condition = helpers.line_begin_or_non_letter_and_math }
  ),
  --
  -- BEGIN STATIC SNIPPETS
  --

  -- ⇐
  s({ trig = "<<", snippetType = "autosnippet", priority = 2000, snippetType = "autosnippet" },
    {
      t("\\impliedby"),
    },
    { condition = helpers.in_mathzone }
  ),
  -- ←
  s({ trig = "<-", snippetType = "autosnippet", priority = 2000, snippetType = "autosnippet" },
    {
      t("\\leftarrow"),
    },
    { condition = helpers.in_mathzone }
  ),
  -- →
  s({ trig = "->", snippetType = "autosnippet", priority = 2000, snippetType = "autosnippet" },
    {
      t("\\rightarrow"),
    },
    { condition = helpers.in_mathzone }
  ),
  -- ≥
  s({ trig = ">=", snippetType = "autosnippet", priority = 2000, snippetType = "autosnippet" },
    {
      t("\\geq"),
    },
    { condition = helpers.in_mathzone }
  ),
  -- ≤
  s({ trig = "<=", snippetType = "autosnippet", priority = 2000, snippetType = "autosnippet" },
    {
      t("\\leq"),
    },
    { condition = helpers.in_mathzone }
  ),
  s({ trig = "...", snippetType = "autosnippet", priority = 2000, snippetType = "autosnippet" },
    {
      t("\\dots"),
    },
    { condition = helpers.in_mathzone }
  ),
  -- DIFFERENTIAL, i.e. \diff
  s({ trig = "df", snippetType = "autosnippet", priority = 2000, snippetType = "autosnippet" },
    {
      t("\\diff"),
    },
    { condition = helpers.in_mathzone }
  ),
  -- BASIC INTEGRAL SYMBOL, i.e. \int
  s({ trig = "in1", snippetType = "autosnippet" },
    {
      t("\\int"),
    },
    { condition = helpers.in_mathzone }
  ),
  -- DOUBLE INTEGRAL, i.e. \iint
  s({ trig = "in2", snippetType = "autosnippet" },
    {
      t("\\iint"),
    },
    { condition = helpers.in_mathzone }
  ),
  -- TRIPLE INTEGRAL, i.e. \iiint
  s({ trig = "in3", snippetType = "autosnippet" },
    {
      t("\\iiint"),
    },
    { condition = helpers.in_mathzone }
  ),
  -- CLOSED SINGLE INTEGRAL, i.e. \oint
  s({ trig = "oi1", snippetType = "autosnippet" },
    {
      t("\\oint"),
    },
    { condition = helpers.in_mathzone }
  ),
  -- CLOSED DOUBLE INTEGRAL, i.e. \oiint
  s({ trig = "oi2", snippetType = "autosnippet" },
    {
      t("\\oiint"),
    },
    { condition = helpers.in_mathzone }
  ),
  -- GRADIENT OPERATOR, i.e. \grad
  s({ trig = "gdd", snippetType = "autosnippet" },
    {
      t("\\grad "),
    },
    { condition = helpers.in_mathzone }
  ),
  -- CURL OPERATOR, i.e. \curl
  s({ trig = "cll", snippetType = "autosnippet" },
    {
      t("\\curl "),
    },
    { condition = helpers.in_mathzone }
  ),
  -- DIVERGENCE OPERATOR, i.e. \divergence
  s({ trig = "DI", snippetType = "autosnippet" },
    {
      t("\\div "),
    },
    { condition = helpers.in_mathzone }
  ),
  -- LAPLACIAN OPERATOR, i.e. \laplacian
  s({ trig = "laa", snippetType = "autosnippet" },
    {
      t("\\laplacian "),
    },
    { condition = helpers.in_mathzone }
  ),
  -- PARALLEL SYMBOL, i.e. \parallel
  s({ trig = "|||", snippetType = "autosnippet" },
    {
      t("\\parallel"),
    },
    { condition = helpers.in_mathzone }
  ),
  -- CDOTS, i.e. \cdots
  s({ trig = "cdd", snippetType = "autosnippet" },
    {
      t("\\cdots"),
    },
    { condition = helpers.in_mathzone }
  ),
  -- LDOTS, i.e. \ldots
  s({ trig = "ldd", snippetType = "autosnippet" },
    {
      t("\\ldots"),
    },
    { condition = helpers.in_mathzone }
  ),
  -- EQUIV, i.e. \equiv
  s({ trig = "eqq", snippetType = "autosnippet" },
    {
      t("\\equiv "),
    },
    { condition = helpers.in_mathzone }
  ),
  -- SETMINUS, i.e. \setminus
  s({ trig = "stm", snippetType = "autosnippet" },
    {
      t("\\setminus "),
    },
    { condition = helpers.in_mathzone }
  ),
  -- SUBSETEQ, i.e., \subseteq
  s({ trig = "sbq", snippetType = "autosnippet" },
    {
      t("\\subseteq "),
    },
    { condition = helpers.in_mathzone }
  ),
  -- SUBSET, i.e. \subset
  s({ trig = "sbb", snippetType = "autosnippet" },
    {
      t("\\subset "),
    },
    { condition = helpers.in_mathzone }
  ),
  -- APPROX, i.e. \approx
  s({ trig = "apx", snippetType = "autosnippet" },
    {
      t("\\approx "),
    },
    { condition = helpers.in_mathzone }
  ),
  -- PROPTO, i.e. \propto
  s({ trig = "pt", snippetType = "autosnippet" },
    {
      t("\\propto "),
    },
    { condition = helpers.in_mathzone }
  ),
  -- COLON, i.e. \colon
  s({ trig = "::", snippetType = "autosnippet" },
    {
      t("\\colon "),
    },
    { condition = helpers.in_mathzone }
  ),
  -- IFF, i.e. \iff
  s({ trig = "<>", snippetType = "autosnippet" },
    {
      t("\\iff "),
    },
    { condition = helpers.in_mathzone }
  ),
  -- IMPLIES, i.e. \implies
  s({ trig = ">>", snippetType = "autosnippet" },
    {
      t("\\implies "),
    },
    { condition = helpers.in_mathzone }
  ),
  -- DOT PRODUCT, i.e. \cdot
  s({ trig = ",.", snippetType = "autosnippet" },
    {
      t("\\cdot "),
    },
    { condition = helpers.in_mathzone }
  ),
  -- CROSS PRODUCT, i.e. \times
  s({ trig = "xx", snippetType = "autosnippet" },
    {
      t("\\times "),
    },
    { condition = helpers.in_mathzone }
  ),
  -- INFINITY, i.e. \infty
  s({ trig = "iff", snippetType = "autosnippet" },
    {
      t("\\infty "),
    },
    {
      condition = function(line_to_cursor, matched_trigger)
        return line_to_cursor:sub(1, -(#matched_trigger + 1)):match("[^%\\]")
      end
    }
  ),

  -- ELLIPSIS
  s({ trig = "ell", wordTrig = false, regTrig = true },
    fmta(
      "\\{<>, <>, \\dots, <> \\}",
      {
        i(1),
        i(2),
        i(3)
      }
    ),
    { condition = helpers.line_begin_or_non_letter_and_math }
  ),

  -- Matrix
  s({ trig = "bmat", wordTrig = false, regTrig = true },
    fmta(
    [[
    \begin{bmatrix}
        <>
    \end{bmatrix}
    ]],
      {
        i(1),
      }
    ),
    { condition = helpers.line_begin_or_non_letter_and_math }
  ),
  s({ trig = "pmat", wordTrig = false, regTrig = true },
    fmta(
    [[
    \begin{pmatrix}
        <>
    \end{pmatrix}
    ]],
      {
        i(1),
      }
    ),
    { condition = helpers.line_begin_or_non_letter_and_math }
  ),
  s({ trig = "dotpmat", wordTrig = false, regTrig = true },
    fmta(
    [[
    \begin{pmatrix}
        \vdots & \cdots & \vdots\\
        <> & \cdots & <>\\
        \vdots & \cdots & \vdots\\
    \end{pmatrix}
    ]],
      {
        i(1),
        i(2),
      }
    ),
    { condition = helpers.line_begin_or_non_letter_and_math }
  ),
  s({ trig = "2dotbmat", wordTrig = false, regTrig = true },
    fmta(
    [[
    \begin{bmatrix}
        \vdots & \cdots & \vdots\\
        <> & \cdots & <>\\
        \vdots & \cdots & \vdots\\
    \end{bmatrix}
    ]],
      {
        i(1),
        i(2),
      }
    ),
    { condition = helpers.line_begin_or_non_letter_and_math }
  ),
  s({ trig = "fullpmat", wordTrig = false, regTrig = true },
    fmta(
    [[
    \begin{pmatrix}
        <>_{11} & <>_{12} & \cdots & <>_{1<>}\\
        <>_{21} & <>_{22} & \cdots & <>_{2<>}\\
        \vdots & \vdots & \ddots & \vdots\\
        <>_{<>1} & <>_{<>2} & \cdots & <>_{<><>}\\
    \end{pmatrix}
    ]],
      {
        i(1),
        rep(1),
        rep(1),
        i(2),
        rep(1),
        rep(1),
        rep(1),
        rep(2),
        rep(1),
        i(3),
        rep(1),
        rep(3),
        rep(1),
        rep(3),
        rep(2),
      }
    ),
    { condition = helpers.line_begin_or_non_letter_and_math }
  ),
  s({ trig = "fullbmat", wordTrig = false, regTrig = true },
    fmta(
    [[
    \begin{bmatrix}
        <>_{11} & <>_{12} & \cdots & <>_{1<>}\\
        <>_{21} & <>_{22} & \cdots & <>_{2<>}\\
        \vdots & \vdots & \ddots & \vdots\\
        <>_{<>1} & <>_{<>2} & \cdots & <>_{<><>}\\
    \end{bmatrix}
    ]],
      {
        i(1),
        rep(1),
        rep(1),
        i(2),
        rep(1),
        rep(1),
        rep(1),
        rep(2),
        rep(1),
        i(3),
        rep(1),
        rep(3),
        rep(1),
        rep(3),
        rep(2),
      }
    ),
    { condition = helpers.line_begin_or_non_letter_and_math }
  ),
  s({ trig = "1dotbmat", wordTrig = false, regTrig = true },
    fmta(
    [[
    \begin{bmatrix}
        <>_{1}\\
        \vdots\\
        <>_{<>}
    \end{bmatrix}
    ]],
      {
        i(1),
        rep(1),
        i(2)
      }
    ),
    { condition = helpers.line_begin_or_non_letter_and_math }
  ),

}
