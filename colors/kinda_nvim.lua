local UC = require("util.color")

local hi = vim.api.nvim_set_hl

if vim.g.syntax_on then
	vim.cmd.syntax("reset")
end

vim.cmd("highlight clear")
vim.cmd("highlight clear Search")
vim.cmd("highlight clear CurSearch")
vim.cmd("highlight clear Pmenu")
vim.cmd("highlight clear PmenuSel")
vim.cmd("highlight clear PmenuThumb")
vim.cmd("highlight clear Statement")
vim.cmd("highlight clear MatchParen")
vim.cmd("highlight clear NormalFloat")
vim.cmd("highlight clear FloatBorder")
vim.cmd("highlight clear Todo")

local fg = {
	dark = UC.hsv_to_dec({ 160, 5, 75 }),
	light = UC.hsv_to_dec({ 160, 15, 30 }),
}
local fg_1 = { dark = UC.brighter(fg.dark, -9), light = UC.brighter(fg.light, 15) }
local fg_2 = { dark = UC.brighter(fg.dark, -13), light = UC.brighter(fg.light, 23) }
local fg_3 = { dark = UC.brighter(fg.dark, -21), light = UC.brighter(fg.light, 36) }
local fg_4 = { dark = UC.saturate(UC.brighter(fg.dark, -40), 10), light = UC.saturate(UC.brighter(fg.light, 51), -7) }
local fg_err = { dark = UC.hsv_to_dec({ 350, 41, 76 }), light = UC.hsv_to_dec({ 350, 100, 75 }) }
local fg_warn = { dark = UC.hsv_to_dec({ 43, 41, 72 }), light = UC.hsv_to_dec({ 43, 100, 71 }) }
local fg_info = { dark = UC.hsv_to_dec({ 208, 41, 72 }), light = UC.hsv_to_dec({ 208, 100, 67 }) }
local fg_hint = { dark = UC.hsv_to_dec({ 185, 65, 56 }), light = UC.hsv_to_dec({ 185, 90, 66 }) }
local fg_primary = { dark = UC.hsv_to_dec({ 160, 90, 70 }), light = UC.hsv_to_dec({ 160, 100, 55 }) }
local fg_secondary = { dark = UC.hsv_to_dec({ 208, 47, 76 }), light = UC.hsv_to_dec({ 208, 80, 70 }) }
local fg_tertiary = { dark = UC.hsv_to_dec({ 285, 50, 70 }), light = UC.hsv_to_dec({ 285, 60, 70 }) }
local fg_primary_variant = {
	dark = UC.brighter(fg_primary.dark, -10),
	light = UC.saturate(UC.brighter(fg_primary.light, 6), -30)
}
local fg_secondary_variant = {
	dark = UC.saturate(UC.brighter(fg_secondary.dark, -25), -19),
	light = UC.saturate(UC.brighter(fg_secondary.light, 3), -43)
}
local fg_tertiary_variant = {
	dark = UC.saturate(UC.brighter(fg_tertiary.dark, -5), -7),
	light = UC.saturate(UC.brighter(fg_tertiary.light, 5), -10)
}

local bg = { dark = UC.hsv_to_dec({ 160, 100, 7 }), light = UC.hsv_to_dec({ 160, 1, 96 }) }
local bg_1 = { dark = UC.brighter(bg.dark, 5), light = UC.brighter(bg.light, -2) }
local bg_2 = { dark = UC.brighter(bg.dark, 4), light = UC.brighter(bg.light, 4) }
local bg_3 = { dark = UC.brighter(bg_2.dark, 7), light = UC.brighter(bg_2.light, -2) }
local bg_4 = { dark = UC.brighter(bg.dark, 14), light = UC.brighter(bg.light, -5) }
local bg_5 = { dark = UC.brighter(bg_4.dark, 18), light = UC.brighter(bg_4.light, -11) }
local bg_err = { dark = UC.hsv_to_dec({ 350, 41, 22 }), light = UC.hsv_to_dec({ 350, 7, 91 }) }
local bg_warn = { dark = UC.hsv_to_dec({ 43, 41, 22 }), light = UC.hsv_to_dec({ 43, 7, 91 }) }
local bg_info = { dark = UC.hsv_to_dec({ 208, 41, 22 }), light = UC.hsv_to_dec({ 208, 7, 89 }) }
local bg_hint = { dark = UC.hsv_to_dec({ 185, 41, 22 }), light = UC.hsv_to_dec({ 185, 7, 89 }) }

local brightness = vim.o.background

hi(0, "Normal", { fg = fg[brightness], bg = bg[brightness], })
hi(0, "NonText", { fg = fg_4[brightness] })
hi(0, "Comment", { fg = fg_secondary_variant[brightness], italic = true })
hi(0, "Title", { fg = fg[brightness], bold = true })
hi(0, "ErrorMsg", { fg = fg_err[brightness] })
hi(0, "WarningMsg", { fg = fg_warn[brightness] })
hi(0, "ModeMsg", { fg = fg_info[brightness] })
hi(0, "Search", { bg = bg_4[brightness] })
hi(0, "CurSearch", { bg = bg_5[brightness] })
hi(0, "CursorLine", { bg = bg_1[brightness] })
hi(0, "Visual", { bg = bg_4[brightness] })
hi(0, "Folded", { fg = fg_3[brightness], bg = bg_1[brightness] })
hi(0, "Added", { fg = fg_primary[brightness], bg = bg_hint[brightness] })
hi(0, "Changed", { bg = bg_3[brightness] })
hi(0, "Removed", { fg = fg_err[brightness], bg = bg_err[brightness] })
hi(0, "SpellBad", { cterm = { underline = true }, undercurl = true, sp = fg_err[brightness] })
hi(0, "SpellCap", { cterm = { underline = true }, underline = true, sp = fg_warn[brightness] })
hi(0, "SpellRare", { cterm = { underline = true }, underline = true, sp = fg_info[brightness] })
hi(0, "SpellLocal", { cterm = { underline = true }, underline = true, sp = fg_hint[brightness] })

hi(0, "DiagnosticError", { fg = fg_err[brightness] })
hi(0, "DiagnosticWarn", { fg = fg_warn[brightness] })
hi(0, "DiagnosticInfo", { fg = fg_info[brightness] })
hi(0, "DiagnosticHint", { fg = fg_hint[brightness] })
hi(0, "DiagnosticOk", { link = "DiagnosticInfo" })
hi(0, "DiagnosticUnderlineError", { link = "SpellBad" })
hi(0, "DiagnosticUnderlineWarn", { link = "SpellCap" })
hi(0, "DiagnosticUnderlineInfo", { link = "SpellRare" })
hi(0, "DiagnosticUnderlineHint", { link = "SpellLocal" })
hi(0, "DiagnosticUnderlineOk", { link = "DiagnosticUnderlineHint" })

hi(0, "Pmenu", { fg = fg_1[brightness], bg = bg_2[brightness] })
hi(0, "PmenuSel", { bg = bg_3[brightness] })
hi(0, "Type", { fg = fg_primary[brightness] })
hi(0, "Statement", { fg = fg_tertiary[brightness], nocombine = true })
hi(0, "Identifier", { fg = fg_hint[brightness] })
hi(0, "Constant", { fg = fg_primary_variant[brightness], bold = true })
hi(0, "@variable", { fg = fg[brightness], bg = "NONE" })
hi(0, "Function", { fg = fg_secondary[brightness] })
hi(0, "String", { fg = fg_2[brightness] })
hi(0, "Number", { fg = fg_err[brightness] })
hi(0, "Delimiter", { fg = fg_1[brightness] })
hi(0, "Operator", { fg = fg_2[brightness] })
hi(0, "Special", { fg = fg_tertiary_variant[brightness] })
hi(0, "DaignosticDeprecated", { sp = fg_err[brightness], strikethrough = true })
hi(0, "FloatBorder", { fg = "NONE", bg = bg_2[brightness], nocombine = true })
hi(0, "FloatShadow", { bg = fg_4[brightness], blend = 80 })
hi(0, "FloatShadowThrough", { bg = fg_4[brightness], blend = 100 })
hi(0, "ColorColumn", { bg = bg_1[brightness] })

-- FIXME: test
-- FIX: test
-- NOTE: test
-- TODO: test
-- TEST: test
-- BUG: test
hi(0, "Todo", { fg = "NONE", bold = true, nocombine = true, force = true })
hi(0, "@comment.error",
	{ bold = true, fg = fg_err[brightness], bg = bg_err[brightness], force = true, nocombine = true, })
hi(0, "@comment.warning",
	{ bold = true, fg = fg_warn[brightness], bg = bg_warn[brightness], force = true, nocombine = true, })
hi(0, "@comment.todo",
	{ bold = true, fg = fg_info[brightness], bg = bg_info[brightness], force = true, nocombine = true, })
hi(0, "@comment.note",
	{ bold = true, fg = fg_hint[brightness], bg = bg_hint[brightness], force = true, nocombine = true, })
hi(0, "@comment.error.comment", { link = "@comment.error" })
hi(0, "@comment.warning.comment", { link = "@comment.warning" })
hi(0, "@comment.todo.comment", { link = "@comment.todo" })
hi(0, "@comment.note.comment", { link = "@comment.note" })

hi(0, "IncSearch", { link = "CurSearch" })
hi(0, "LineNr", { link = "NonText" })
hi(0, "LineNrAbove", { link = "LineNr" })
hi(0, "LineNrBelow", { link = "LineNr" })
hi(0, "SignColumn", { link = "NonText" })
hi(0, "Conceal", { link = "NonText" })
hi(0, "Conceal", { link = "NonText" })
hi(0, "CursorColumn", { link = "CursorLine" })
hi(0, "CursorLineNr", { link = "CursorLine" })
hi(0, "CursorLineSign", { link = "CursorLine" })
hi(0, "CursorLineFold", { link = "CursorLine" })
hi(0, "MoreMsg", { link = "Function" })
hi(0, "Question", { link = "Function" })
hi(0, "QuickFixLine", { link = "Function" })
hi(0, "StatusLine", { link = "Normal" })
hi(0, "StatusLineNC", { link = "NonText" })
hi(0, "MsgSeparator", { link = "StatusLine" })
hi(0, "WinSeparator", { link = "NonText" })
hi(0, "VertSplit", { link = "WinSeparator" })
hi(0, "FoldColumn", { link = "NonText" })
hi(0, "PmenuThumb", { link = "Visual" })
hi(0, "NormalFloat", { link = "Pmenu" })
hi(0, "Directory", { link = "Function" })
hi(0, "PreProc", { link = "Statement" })
hi(0, "DiffAdd", { link = "Added" })
hi(0, "DiffChange", { link = "Changed" })
hi(0, "DiffDelete", { link = "Removed" })
hi(0, "DiffText", { link = "CurSearch" })
hi(0, "MatchParen", { link = "Visual" })

-- builtin
hi(0, "@attribute.builtin", { link = "@attribute" })
hi(0, "@constant.builtin", { link = "Constant" })
hi(0, "@function.builtin", { link = "Function" })
hi(0, "@module.builtin", { link = "@module" })
hi(0, "@tag.builtin", { link = "Tag" })
hi(0, "@type.builtin", { link = "Type" })
hi(0, "@variable.builtin", { link = "@variable" })
hi(0, "@variable.parameter.builtin", { link = "@variable" })

hi(0, "@character.special", { link = "SpecialChar" })
hi(0, "@number.float", { link = "Float" })
hi(0, "@punctuation.special", { link = "Special" })
hi(0, "@string.escape", { fg = fg_1[brightness], bold = true })
hi(0, "@string.special", { link = "SpecialChar" })
hi(0, "@string.special.url", { link = "Underlined" })
hi(0, "@string.regexp", { link = "@string.special" })

-- lsp
hi(0, "@lsp.mod.deprecated", { link = "DiagnosticDeprecated" })
hi(0, "@lsp.type.class", { link = "@type" })
hi(0, "@lsp.type.comment", { link = "@comment" })
hi(0, "@lsp.type.decorator", { link = "@attribute" })
hi(0, "@lsp.type.enum", { link = "Type" })
hi(0, "@lsp.type.enumMember", { link = "Constant" })
hi(0, "@lsp.type.escapeSequence", { link = "@string.escape" })
hi(0, "@lsp.type.event", { link = "@type" })
hi(0, "@lsp.type.formatSpecifier", { link = "Operator" })
hi(0, "@lsp.type.function", { link = "@function" })
hi(0, "@lsp.type.interface", { link = "@type" })
hi(0, "@lsp.type.keyword", { link = "@keyword" })
hi(0, "@lsp.type.macro", { link = "@constant.macro" })
hi(0, "@lsp.type.method", { link = "@function.method" })
hi(0, "@lsp.type.modifier", { link = "@type.qualifier" })
hi(0, "@lsp.type.namespace", { link = "Type" })
hi(0, "@lsp.type.number", { link = "@number" })
hi(0, "@lsp.type.operator", { link = "Operator" })
hi(0, "@lsp.type.parameter", { link = "Identifier" })
hi(0, "@lsp.type.property", { link = "Identifier" })
hi(0, "@lsp.type.regexp", { link = "@string.regexp" })
hi(0, "@lsp.type.string", { link = "@string" })
hi(0, "@lsp.type.struct", { link = "@type" })
hi(0, "@lsp.type.type", { link = "@type" })
hi(0, "@lsp.type.typeParameter", { link = "@type.definition" })
hi(0, "@lsp.type.variable", { link = "@variable" })
hi(0, "@lsp.typemod.keyword.controlFlow", { link = "Delimiter" })
hi(0, "@lsp.typemod.variable.constant", { link = "Constant" })

-- blink
hi(0, "BlinkCmpLabelMatch", { fg = fg[brightness], bold = true })
hi(0, "BlinkCmpMenu", { link = "Pmenu" })
hi(0, "BlinkCmpMenuBorder", { link = "Pmenu" })
hi(0, "BlinkCmpMenuSelection", { link = "PmenuSel" })
hi(0, "BlinkCmpScrollBarThumb", { link = "PmenuThumb" })
hi(0, "BlinkCmpScrollBarGutter", { link = "PmenuSbar" })
hi(0, "BlinkCmpLabel", { fg = fg_1[brightness] })
hi(0, "BlinkCmpLabelDeprecated", { fg = fg_4[brightness], strikethrough = true })
hi(0, "BlinkCmpLabelMatch", { fg = fg[brightness], bold = true })
hi(0, "BlinkCmpLabelDetail", { fg = fg_3[brightness] })
hi(0, "BlinkCmpLabelDescription", { fg = fg_4[brightness] })
hi(0, "BlinkCmpGhostText", { link = "NonText" })
hi(0, "BlinkCmpKind", { link = "Type" })
hi(0, "BlinkCmpKindText", { link = "String" })
hi(0, "BlinkCmpKindMethod", { link = "Function" })
hi(0, "BlinkCmpKindFunction", { link = "Function" })
hi(0, "BlinkCmpKindConstructor", { link = "Function" })
hi(0, "BlinkCmpKindField", { link = "Identifier" })
hi(0, "BlinkCmpKindVariable", { link = "@variable" })
hi(0, "BlinkCmpKindClass", { link = "Type" })
hi(0, "BlinkCmpKindInterface", { link = "Type" })
hi(0, "BlinkCmpKindModule", { link = "Function" })
hi(0, "BlinkCmpKindProperty", { link = "Identifier" })
hi(0, "BlinkCmpKindUnit", { link = "Structure" })
hi(0, "BlinkCmpKindValue", { link = "Constant" })
hi(0, "BlinkCmpKindEnum", { link = "Constant" })
hi(0, "BlinkCmpKindKeyword", { link = "Keyword" })
hi(0, "BlinkCmpKindSnippet", { link = "Special" })
hi(0, "BlinkCmpKindColor", { link = "Label" })
hi(0, "BlinkCmpKindFile", { link = "Directory" })
hi(0, "BlinkCmpKindReference", { link = "StorageClass" })
hi(0, "BlinkCmpKindFolder", { link = "Directory" })
hi(0, "BlinkCmpKindEnumMember", { link = "Constant" })
hi(0, "BlinkCmpKindConstant", { link = "Constant" })
hi(0, "BlinkCmpKindStruct", { link = "Structure" })
hi(0, "BlinkCmpKindEvent", { link = "Repeat" })
hi(0, "BlinkCmpKindOperator", { link = "Operator" })
hi(0, "BlinkCmpKindTypeParameter", { link = "Type" })
hi(0, "BlinkCmpSource", { link = "NonText" })
hi(0, "BlinkCmpDoc", { link = "NormalFloat" })
hi(0, "BlinkCmpDocBorder", { link = "NormalFloat" })
hi(0, "BlinkCmpDocCursorLine", { link = "CursorLine" })
hi(0, "BlinkCmpSignatureHelp", { link = "NormalFloat" })
hi(0, "BlinkCmpSignatureHelpBorder", { link = "NormalFloat" })
hi(0, "BlinkCmpSignatureHelpActiveParameter", { link = "LspSignatureActiveParameter" })

-- fzf lua
hi(0, "FzfLuaBorder", { fg = bg_2[brightness], bg = bg_2[brightness] })
hi(0, "FzfLuaTitle", { fg = fg[brightness], bg = bg_2[brightness], bold = true })
hi(0, "FzfLuaPreviewBorder", { fg = bg[brightness], bg = bg[brightness] })
hi(0, "FzfLuaFzfCursorLine", { fg = fg[brightness], bg = bg_3[brightness] })
hi(0, "FzfLuaNormal", { link = "Pmenu" })
hi(0, "FzfLuaPreviewNormal", { link = "Normal" })
hi(0, "FzfLuaPreviewTitle", { link = "Title" })
hi(0, "FzfLuaCursorLineNr", { link = "CursorLineNr" })
hi(0, "FzfLuaScrollBorderFull", { link = "PmenuThumb" })
hi(0, "FzfLuaScrollBorderEmpty", { link = "Pmenu" })
hi(0, "FzfLuaScrollFloatFull", { link = "FzfLuaScrollBorderFull" })
hi(0, "FzfLuaScrollFloatEmpty", { link = "FzfLuaScrollBorderEmpty" })
hi(0, "FzfLuaHeaderBind", { link = "ModeMsg" })
hi(0, "FzfLuaHeaderText", { link = "NonText" })
hi(0, "FzfLuaPathLineNr", { link = "NonText" })
hi(0, "FzfLuaPathColNr", { link = "NonText" })
hi(0, "FzfLuaBufName", { link = "WarningMsg" })
hi(0, "FzfLuaBufNr", { link = "NonText" })
hi(0, "FzfLuaBufFlagCur", { link = "Identifier" })
hi(0, "FzfLuaBufFlagAlt", { link = "ModeMsg" })
hi(0, "FzfLuaTabTitle", { link = "FzfLuaTitle" })
hi(0, "FzfLuaTabMarker", { link = "ModeMsg" })
hi(0, "FzfLuaLiveSym", { link = "NormalFloat" })
hi(0, "FzfLuaFzfMatch", { link = "FzfLuaTitle" })
hi(0, "FzfLuaFzfHeader", { link = "NormalFloat" })
hi(0, "FzfLuaFzfScrollbar", { link = "PmenuSbar" })
hi(0, "FzfLuaFzfSeparator", { link = "NormalFloat" })
hi(0, "FzfLuaFzfGutter", { link = "Pmenu" })
hi(0, "FzfLuaFzfPointer", { link = "Identifier" })
hi(0, "FzfLuaFzfMarker", { link = "Identifier" })
hi(0, "FzfLuaFzfPrompt", { link = "Identifier" })
hi(0, "FzfLuaFzfQuery", { link = "NormalFloat" })


vim.g.colors_name = "kinda_nvim"

