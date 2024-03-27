-- ~/.config/nvim/lua/luasnip-helper-funcs.lua
local M = {}

-- Be sure to explicitly define these LuaSnip node abbreviations!
local ls = require("luasnip")
local sn = ls.snippet_node
local i = ls.insert_node

-- Math context detection 
M.in_mathzone = function() return vim.fn['vimtex#syntax#in_mathzone']() == 1 end
M.in_text = function() return not M.in_mathzone() end
-- Environment/syntax context detection 
M.in_tikz = function()
  local is_inside = vim.fn['vimtex#env#is_inside']("tikzpicture")
  return (is_inside[1] > 0 and is_inside[2] > 0)
end

function M.get_visual(args, parent)
  if (#parent.snippet.env.LS_SELECT_RAW > 0) then
    return sn(nil, i(1, parent.snippet.env.LS_SELECT_RAW))
  else
    return sn(nil, i(1, ''))
  end
end

function M.alphanumeric(line_to_cursor, matched_trigger)
    return line_to_cursor:sub(-(#matched_trigger + 1), -(#matched_trigger + 1)):match("[%w]")
end
function M.brackets(line_to_cursor, matched_trigger)
    return line_to_cursor:sub(-(#matched_trigger + 1), -(#matched_trigger + 1)):match("[%)%]%}]");
end
function M.line_begin(line_to_cursor, matched_trigger)
    return line_to_cursor:sub(1, -(#matched_trigger + 1)):match("^%s*$")
end
function M.letter(line_to_cursor, matched_trigger)
    return line_to_cursor:sub(-(#matched_trigger + 1), -(#matched_trigger + 1)):match("[%a]")
end
function M.non_letter(line_to_cursor, matched_trigger)
    return line_to_cursor:sub(-(#matched_trigger + 1), -(#matched_trigger + 1)):match("[^%a]")
end
function M.lowercase(line_to_cursor, matched_trigger)
    return line_to_cursor:sub(-(#matched_trigger + 1), -(#matched_trigger + 1)):match("[^%l]")
end
function M.line_begin_or_non_letter(line_to_cursor, matched_trigger)
  return M.line_begin(line_to_cursor, matched_trigger) or M.non_letter(line_to_cursor, matched_trigger)
end
function M.in_text_and_lowercase(line_to_cursor, matched_trigger)
  return M.line_begin(line_to_cursor, matched_trigger) or M.non_letter(line_to_cursor, matched_trigger)
end
function M.letter_or_brackets_and_math(line_to_cursor, matched_trigger)
  return (M.brackets(line_to_cursor, matched_trigger) or M.letter(line_to_cursor, matched_trigger)) and M.in_mathzone()
end
function M.alpha_or_brackets_and_math(line_to_cursor, matched_trigger)
  return (M.alphanumeric(line_to_cursor, matched_trigger) or M.brackets(line_to_cursor, matched_trigger)) and M.in_mathzone()
end
function M.line_begin_or_non_letter_and_math(line_to_cursor, matched_trigger)
  return M.in_mathzone() and M.line_begin_or_non_letter(line_to_cursor, matched_trigger)
end
function M.line_begin_or_non_letter_and_text(line_to_cursor, matched_trigger)
  return M.in_text() and M.line_begin_or_non_letter(line_to_cursor, matched_trigger)
end

return M
