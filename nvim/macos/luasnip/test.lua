local ls = require("luasnip")
local s = ls.snippet
local sn = ls.snippet_node
local t = ls.text_node
local i = ls.insert_node
local f = ls.function_node
local d = ls.dynamic_node
local fmt = require("luasnip.extras.fmt").fmt
local fmta = require("luasnip.extras.fmt").fmta
local rep = require("luasnip.extras").rep
local line_begin = require("luasnip.extras.expand_conditions").line_begin


-- This is the `get_visual` function I've been talking about.
-- ----------------------------------------------------------------------------
-- Summary: When `LS_SELECT_RAW` is populated with a visual selection, the function
-- returns an insert node whose initial text is set to the visual selection.
-- When `LS_SELECT_RAW` is empty, the function simply returns an empty insert node.

local get_visual=require("zerogtiger.luasnip_helper_funcs").get_visual

-- Place this in ${HOME}/.config/nvim/LuaSnip/all.lua
return {
    s({ trig = "test", dscr = "lsi" },
        fmta("<>lol<>",
            { i(1), d(2, get_visual) }
        )
    ),

    -- Example: italic font implementing visual selection
    s({ trig = "tii", dscr = "Expands 'tii' into LaTeX's textit{} command." },
        fmta("\\textit{<>}",
            {
                d(1, get_visual),
            }
        )
    ),

    -- A snippet that expands the trigger "hi" into the string "Hello, world!".
    require("luasnip").snippet(
        { trig = "hi" },
        { t("Hello, world!") }
    ),

    require("luasnip").snippet(
        { trig = "hi" },
        { t("world hello") }
    ),

    -- To return multiple snippets, use one `return` statement per snippet file
    -- and return a table of Lua snippets.
    require("luasnip").snippet(
        { trig = "foo", snippetType = "autosnippet" },
        { t("Another snippet.") }
    ),

    -- Combining text and insert nodes to create basic LaTeX commands
    s({ trig = "tt", dscr = "Expands 'tt' into '\texttt{}'" },
        {
            t("\\texttt{"), -- remember: backslashes need to be escaped
            i(1),
            t("}"),
        }
    ),
    -- Yes, these jumbles of text nodes and insert nodes get messy fast, and yes,
    -- there is a much better, human-readable solution: ls.fmt, described shortly.
    -- s({ trig = "ff", dscr = "Expands 'ff' into '\frac{}{}'" },
    --     {
    --         t("\\frac{"),
    --         i(1), -- insert node 1
    --         t("}{"),
    --         i(1), -- insert node 2
    --         t("}")
    --     }
    -- ),

    s({ trig = "te", dscr = "a test" },
        fmt(
            [[
            this is a multiline test
                where <> text appears on multiple <>
            lines
            ]],
            { i(1), rep(1) },
            { delimiters = "<>" }
        )
    ),
    s({ trig = "eq", dscr = "Expands 'eq' into an equation environment" },
        fmta(
            [[
       \begin{equation*}
           <>
       \end{equation*}
     ]],
            { i(1) }
        )
    ),

    s({ trig = "([^%a])mm", wordTrig = false, regTrig = true },
        fmta(
            "<>$<>$",
            {
                f(function(_, snip) return snip.captures[1] end),
                d(1, get_visual),
            }
        )
    ),

    s({ trig = '([^%a])ee', regTrig = true, wordTrig = false },
        fmta(
            "<>e^{<>}",
            {
                f(function(_, snip) return snip.captures[1] end),
                d(1, get_visual)
            }
        )
    ),

    s({ trig = '([^%a])ff', regTrig = true, wordTrig = false, snippetType = "autosnippet" },
        fmta(
            [[<>\frac{<>}{<>}]],
            {
                f(function(_, snip) return snip.captures[1] end),
                i(1),
                i(2)
            }
        )
    ),
    s({ trig = '([%a%)%]%}])00', regTrig = true, wordTrig = false, snippetType = "autosnippet" },
        fmta(
            "<>_{<>}",
            {
                f(function(_, snip) return snip.captures[1] end),
                t("0")
            }
        )
    ),

    s({ trig = "h1", dscr = "Top-level section" },
        fmta(
            [[\section{<>}]],
            { i(1) }
        ),
        { condition = line_begin } -- set condition in the `opts` table
    ),

    s({ trig = "new", dscr = "A generic new environmennt" },
        fmta(
            [[
      \begin{<>}
          <>
      \end{<>}
    ]],
            {
                i(1),
                i(2),
                rep(1),
            }
        ),
        { condition = line_begin }
    ),
}

-- -- Include this `in_mathzone` function at the start of a snippets file...
-- local in_mathzone = function()
--     -- The `in_mathzone` function requires the VimTeX plugin
--     return vim.fn['vimtex#syntax#in_mathzone']() == 1
-- end
-- -- Then pass the table `{condition = in_mathzone}` to any snippet you want to
-- -- expand only in math contexts.
--
-- return {
--     -- Another take on the fraction snippet without using a regex trigger
--     s({ trig = "ff" },
--         fmta(
--             "\\frac{<>}{<>}",
--             {
--                 i(1),
--                 i(2),
--             }
--         ),
--         { condition = in_mathzone } -- `condition` option passed in the snippet `opts` table
--     ),
-- }

-- -- Some LaTeX-specific conditional expansion functions (requires VimTeX)
--
-- local tex_utils = {}
-- tex_utils.in_mathzone = function()  -- math context detection
--   return vim.fn['vimtex#syntax#in_mathzone']() == 1
-- end
-- tex_utils.in_text = function()
--   return not tex_utils.in_mathzone()
-- end
-- tex_utils.in_comment = function()  -- comment detection
--   return vim.fn['vimtex#syntax#in_comment']() == 1
-- end
-- tex_utils.in_env = function(name)  -- generic environment detection
--     local is_inside = vim.fn['vimtex#env#is_inside'](name)
--     return (is_inside[1] > 0 and is_inside[2] > 0)
-- end
-- -- A few concrete environments---adapt as needed
-- tex_utils.in_equation = function()  -- equation environment detection
--     return tex_utils.in_env('equation')
-- end
-- tex_utils.in_itemize = function()  -- itemize environment detection
--     return tex_utils.in_env('itemize')
-- end
-- tex_utils.in_tikz = function()  -- TikZ picture environment detection
--     return tex_utils.in_env('tikzpicture')
-- end

