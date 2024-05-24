--
-- Built with,
--
--        ,gggg,
--       d8" "8I                         ,dPYb,
--       88  ,dP                         IP'`Yb
--    8888888P"                          I8  8I
--       88                              I8  8'
--       88        gg      gg    ,g,     I8 dPgg,
--  ,aa,_88        I8      8I   ,8'8,    I8dP" "8I
-- dP" "88P        I8,    ,8I  ,8'  Yb   I8P    I8
-- Yb,_,d88b,,_   ,d8b,  ,d8b,,8'_   8) ,d8     I8,
--  "Y8P"  "Y888888P'"Y88P"`Y8P' "YY8P8P88P     `Y8
--

-- This is a starter colorscheme for use with Lush,
-- for usage guides, see :h lush or :LushRunTutorial

--
-- Note: Because this is a lua file, vim will append it to the runtime,
--       which means you can require(...) it in other lua code (this is useful),
--       but you should also take care not to conflict with other libraries.
--
--       (This is a lua quirk, as it has somewhat poor support for namespacing.)
--
--       Basically, name your file,
--
--       "super_theme/lua/lush_theme/super_theme_dark.lua",
--
--       not,
--
--       "super_theme/lua/dark.lua".
--
--       With that caveat out of the way...
--

-- Enable lush.ify on this file, run:
--
--  `:Lushify`
--
--  or
--
--  `:lua require('lush').ify()`

local lush = require "lush"
local hsl = lush.hsl
local c = {
	ui = {
		contrast = "#FFFFFF",
		accent = "#fff017",
		background = "#090A0F",
		foreground = "#8E95B4",
		borders = "#090A0F",
		shade1 = "#212431",
		shade2 = "#2C303F",
		shade3 = "#35394B",
		shade4 = "#3F445A",
		shade5 = "#555B77",
		shade6 = "#6B7394",
	},
	base = {
		white = "#ffffff",
		black = "#000000",
		red = "#E75A5A",
		orange = "#E19235",
		yellow = "#FEE17C",
		green = "#A9EFA3",
		cyan = "#70E3EB",
		blue = "#4C71F6",
		paleblue = "#69A7D3",
		purple = "#5654BC",
		brown = "#AB633B",
		pink = "#E382BC",
		violet = "#A18EEF",
	},
}

-- LSP/Linters mistakenly show `undefined global` errors in the spec, they may
-- support an annotation like the following. Consult your server documentation.
---@diagnostic disable: undefined-global
local theme = lush(function(injected_functions)
	local sym = injected_functions.sym
	return {
		-- The following are the Neovim (as of 0.8.0-dev+100-g371dfb174) highlight
		-- groups, mostly used for styling UI elements.
		-- Comment them out and add your own properties to override the defaults.
		-- An empty definition `{}` will clear all styling, leaving elements looking
		-- like the 'Normal' group.
		-- To be able to link to a group, it must already be defined, so you may have
		-- to reorder items as you go.
		--
		-- See :h highlight-groups
		--
		-- ColorColumn    { }, -- Columns set with 'colorcolumn'
		-- Conceal        { }, -- Placeholder characters substituted for concealed text (see 'conceallevel')
		-- Cursor ({ fg = c.base.ye }), -- Character under the cursor
		-- CurSearch      { }, -- Highlighting a search pattern under the cursor (see 'hlsearch')
		-- lCursor        { }, -- Character under the cursor when |language-mapping| is used (see 'guicursor')
		-- CursorIM       { }, -- Like Cursor, but used when in IME mode |CursorIM|
		CursorColumn { fg = c.base.red }, -- Screen-column at the cursor, when 'cursorcolumn' is set.
		CursorLine { bg = c.ui.shade1 }, -- Screen-line at the cursor, when 'cursorline' is set. Low-priority if foreground (ctermfg OR guifg) is not set.
		Directory { fg = c.base.violet }, -- Directory names (and other special names in listings)
		-- DiffAdd        { }, -- Diff mode: Added line |diff.txt|
		-- DiffChange     { }, -- Diff mode: Changed line |diff.txt|
		DiffDelete { fg = c.base.red }, -- Diff mode: Deleted line |diff.txt|
		DiffText { bg = c.base.blue, fg = c.base.white }, -- Diff mode: Changed text within a changed line |diff.txt|
		-- EndOfBuffer    { }, -- Filler lines (~) after the end of the buffer. By default, this is highlighted like |hl-NonText|.
		-- TermCursor     { }, -- Cursor in a focused terminal
		-- TermCursorNC   { }, -- Cursor in an unfocused terminal
		ErrorMsg { fg = c.base.red }, -- Error messages on the command line
		-- VertSplit      { }, -- Column separating vertically split windows
		Folded { fg = c.ui.foreground }, -- Line used for closed folds
		-- FoldColumn     { fg = c.ui.shade4}, -- 'foldcolumn'
		-- SignColumn     { }, -- Column where |signs| are displayed
		-- IncSearch      { }, -- 'incsearch' highlighting; also used for the text replaced with ":s///c"
		-- Substitute     { }, -- |:substitute| replacement text highlighting
		LineNr { fg = c.ui.shade2 }, -- Line number for ":number" and ":#" commands, and when 'number' or 'relativenumber' option is set.
		-- LineNrAbove    { }, -- Line number for when the 'relativenumber' option is set, above the cursor line
		-- LineNrBelow    { }, -- Line number for when the 'relativenumber' option is set, below the cursor line
		CursorLineNr { fg = c.base.orange }, -- Like LineNr when 'cursorline' or 'relativenumber' is set for the cursor line.
		-- CursorLineFold { }, -- Like FoldColumn when 'cursorline' is set for the cursor line
		-- CursorLineSign { }, -- Like SignColumn when 'cursorline' is set for the cursor line
		-- MatchParen     { }, -- Character under the cursor or just before it, if it is a paired bracket, and its match. |pi_paren.txt|
		ModeMsg { fg = c.base.white, bg = c.ui.shade4 }, -- 'showmode' message (e.g., "-- INSERT -- ")
		-- MsgArea        { }, -- Area for messages and cmdline
		MsgSeparator { bg = c.base.paleblue, fg = c.ui.contrast }, -- Separator for scrolled messages, `msgsep` flag of 'display'
		-- MoreMsg {}, -- |more-prompt|
		-- NonText        { }, -- '@' at the end of the window, characters from 'showbreak' and other characters that do not really exist in the text (e.g., ">" displayed when a double-wide character doesn't fit at the end of the line). See also |hl-EndOfBuffer|.
		Normal { bg = c.ui.background, fg = hsl "#8e95b4" }, -- Normal text
		-- NormalFloat    { }, -- Normal text in floating windows.
		-- FloatBorder    { }, -- Border of floating windows.
		-- FloatTitle     { }, -- Title of floating windows.
		-- NormalNC       { }, -- normal text in non-current windows
		-- Pmenu          { }, -- Popup menu: Normal item.
		-- PmenuSel       { }, -- Popup menu: Selected item.
		-- PmenuKind      { }, -- Popup menu: Normal item "kind"
		-- PmenuKindSel {}, -- Popup menu: Selected item "kind"
		-- PmenuExtra {}, -- Popup menu: Normal item "extra text"
		-- PmenuExtraSel {}, -- Popup menu: Selected item "extra text"
		-- PmenuSbar      { }, -- Popup menu: Scrollbar.
		-- PmenuThumb     { }, -- Popup menu: Thumb of the scrollbar.
		Question { fg = c.base.paleblue }, -- |hit-enter| prompt and yes/no questions
		QuickFixLine {}, -- Current |quickfix| item in the quickfix window. Combined with |hl-CursorLine| when the cursor is there.
		-- Search         { }, -- Last search pattern highlighting (see 'hlsearch'). Also used for similar items that need to stand out.
		-- SpecialKey     { }, -- Unprintable characters: text displayed differently from what it really is. But not 'listchars' whitespace. |hl-Whitespace|
		-- SpellBad       { }, -- Word that is not recognized by the spellchecker. |spell| Combined with the highlighting used otherwise.
		-- SpellCap       { }, -- Word that should start with a capital. |spell| Combined with the highlighting used otherwise.
		-- SpellLocal     { }, -- Word that is recognized by the spellchecker as one that is used in another region. |spell| Combined with the highlighting used otherwise.
		-- SpellRare      { }, -- Word that is recognized by the spellchecker as one that is hardly ever used. |spell| Combined with the highlighting used otherwise.
		StatusLine { bg = c.ui.borders }, -- Status line of current window
		-- StatusLineNC   { }, -- Status lines of not-current windows. Note: If this is equal to "StatusLine" Vim will use "^^^" in the status line of the current window.
		TabLine { fg = c.ui.shade3 }, -- Tab pages line, not active tab page label
		-- TabLineFill    { }, -- Tab pages line, where there are no labels
		TabLineSel { fg = c.ui.shade4 }, -- Tab pages line, active tab page label
		-- Title          { }, -- Titles for output from ":set all", ":autocmd" etc.
		-- Visual         { }, -- Visual mode selection
		-- VisualNOS      { }, -- Visual mode selection when vim is "Not Owning the Selection".
		WarningMsg { fg = c.base.yellow }, -- Warning messages
		-- Whitespace     {fg = hsl("#090a0f")}, -- "nbsp", "space", "tab" and "trail" in 'listchars'
		Winseparator { fg = c.ui.background }, -- Separator between window splits. Inherts from |hl-VertSplit| by default, which it will replace eventually.
		-- WildMenu {}, -- Current match in 'wildmenu' completion
		-- WinBar         { }, -- Window bar of current window
		-- WinBarNC       { }, -- Window bar of not-current windows

		-- Common vim syntax groups used for all kinds of code and markup.
		-- Commented-out groups should chain up to their preferred (*) group
		-- by default.
		--
		-- See :h group-name
		--
		-- Uncomment and edit if you want more specific syntax highlighting.

		Comment { link = hsl "#3f445a" }, -- Any comment

		Constant { fg = c.base.yellow }, -- (*) Any constant
		String { fg = c.base.green }, --   A string constant: "this is a string"
		Character { String }, --   A character constant: 'c', '\n'
		Number { fg = c.base.orange }, --   A number constant: 234, 0xff
		Boolean { fg = c.base.pink }, --   A boolean constant: TRUE, false
		Float { Number }, --   A floating point constant: 2.3e10

		Identifier { fg = c.ui.foreground }, -- (*) Any variable name
		Function { fg = c.base.yellow }, --   Function name (also: methods for classes)

		Statement { fg = c.base.red }, -- (*) Any statement
		-- Conditional { fg = c.base.red }, --   if, then, else, endif, switch, etc.
		-- Repeat { fg = c.base.red }, --   for, do, while, etc.
		-- Label { fg = c.base.red }, --   case, default, etc.
		Operator { fg = c.base.red }, --   "sizeof", "+", "*", etc.
		Keyword { fg = c.base.cyan }, --   any other keyword
		-- Exception { Label }, --   try, catch, throw

		PreProc { fg = c.base.red }, -- (*) Generic Preprocessor
		Include { fg = c.base.red }, --   Preprocessor #include
		Define { fg = c.base.red }, --   Preprocessor #define
		-- Macro          { }, --   Same as Define
		-- PreCondit      { }, --   Preprocessor #if, #else, #endif, etc.

		Type { fg = c.base.pink },
		StorageClass { fg = c.base.violet }, --   static, register, volatile, etc.
		Structure { fg = c.base.paleblue }, --   struct, union, enum, etc.
		Typedef { fg = c.base.pink }, --   A typedef

		Special { fg = c.base.violet }, -- (*) Any special symbol
		-- SpecialChar {}, --   Special character in a constant
		Tag { fg = c.yellow }, --   You can use CTRL-] on this
		Delimiter { fg = c.base.red }, --   Character that needs attention
		-- SpecialComment { Identifier }, --   Special things inside a comment (e.g. '\n')
		-- Debug          { }, --   Debugging statements

		-- Underlined     { gui = "underline" }, -- Text that stands out, HTML links
		-- Ignore         { }, -- Left blank, hidden |hl-Ignore| (NOTE: May be invisible here in template)
		Error { bg = c.base.red }, -- Any erroneous construct
		Todo { bg = c.base.blue, fg = c.base.white }, -- Anything that needs extra attention; mostly the keywords TODO FIXME and XXX

		-- These groups are for the native LSP client and diagnostic system. Some
		-- other LSP clients may use these groups, or use their own. Consult your
		-- LSP client's documentation.

		-- See :h lsp-highlight, some groups may not be listed, submit a PR fix to lush-template!
		--
		-- LspReferenceText            { } , -- Used for highlighting "text" references
		-- LspReferenceRead            { } , -- Used for highlighting "read" references
		-- LspReferenceWrite           { } , -- Used for highlighting "write" references
		-- LspCodeLens                 { } , -- Used to color the virtual text of the codelens. See |nvim_buf_set_extmark()|.
		-- LspCodeLensSeparator        { } , -- Used to color the seperator between two or more code lens.
		-- LspSignatureActiveParameter { } , -- Used to highlight the active parameter in the signature help. See |vim.lsp.handlers.signature_help()|.

		-- See :h diagnostic-highlights, some groups may not be listed, submit a PR fix to lush-template!
		--
		DiagnosticError { fg = c.base.red }, -- Used as the base highlight group. Other Diagnostic highlights link to this by default (except Underline)
		DiagnosticWarn { fg = c.base.yellow }, -- Used as the base highlight group. Other Diagnostic highlights link to this by default (except Underline)
		DiagnosticInfo { fg = c.base.paleblue }, -- Used as the base highlight group. Other Diagnostic highlights link to this by default (except Underline)
		DiagnosticHint { fg = c.base.cyan }, -- Used as the base highlight group. Other Diagnostic highlights link to this by default (except Underline)
		DiagnosticOk { fg = c.base.green }, -- Used as the base highlight group. Other Diagnostic highlights link to this by default (except Underline)
		-- DiagnosticVirtualTextError { } , -- Used for "Error" diagnostic virtual text.
		-- DiagnosticVirtualTextWarn  { } , -- Used for "Warn" diagnostic virtual text.
		-- DiagnosticVirtualTextInfo  { } , -- Used for "Info" diagnostic virtual text.
		-- DiagnosticVirtualTextHint  { } , -- Used for "Hint" diagnostic virtual text.
		-- DiagnosticVirtualTextOk    { } , -- Used for "Ok" diagnostic virtual text.
		-- DiagnosticUnderlineError   { } , -- Used to underline "Error" diagnostics.
		-- DiagnosticUnderlineWarn    { } , -- Used to underline "Warn" diagnostics.
		-- DiagnosticUnderlineInfo    { } , -- Used to underline "Info" diagnostics.
		-- DiagnosticUnderlineHint    { } , -- Used to underline "Hint" diagnostics.
		-- DiagnosticUnderlineOk      { } , -- Used to underline "Ok" diagnostics.
		-- DiagnosticFloatingError    { } , -- Used to color "Error" diagnostic messages in diagnostics float. See |vim.diagnostic.open_float()|
		-- DiagnosticFloatingWarn     { } , -- Used to color "Warn" diagnostic messages in diagnostics float.
		-- DiagnosticFloatingInfo     { } , -- Used to color "Info" diagnostic messages in diagnostics float.
		-- DiagnosticFloatingHint     { } , -- Used to color "Hint" diagnostic messages in diagnostics float.
		-- DiagnosticFloatingOk       { } , -- Used to color "Ok" diagnostic messages in diagnostics float.
		-- DiagnosticSignError        { } , -- Used for "Error" signs in sign column.
		-- DiagnosticSignWarn         { } , -- Used for "Warn" signs in sign column.
		-- DiagnosticSignInfo         { } , -- Used for "Info" signs in sign column.
		-- DiagnosticSignHint         { } , -- Used for "Hint" signs in sign column.
		-- DiagnosticSignOk           { } , -- Used for "Ok" signs in sign column.

		-- Tree-Sitter syntax groups.
		--
		-- See :h treesitter-highlight-groups, some groups may not be listed,
		-- submit a PR fix to lush-template!
		--
		-- Tree-Sitter groups are defined with an "@" symbol, which must be
		-- specially handled to be valid lua code, we do this via the special
		-- sym function. The following are all valid ways to call the sym function,
		-- for more details see https://www.lua.org/pil/5.html
		--
		-- sym("@text.literal")
		-- sym('@text.literal')
		-- sym"@text.literal"
		-- sym'@text.literal'
		--
		-- For more information see https://github.com/rktjmp/lush.nvim/issues/109

		-- sym"@text.literal"      { }, -- Comment
		-- sym"@text.reference"    { }, -- Identifier
		-- sym"@text.title"        { }, -- Title
		-- sym"@text.uri"          { }, -- Underlined
		-- sym"@text.underline"    { }, -- Underlined
		-- sym"@text.todo"         { }, -- Todo
		sym "@comment" { Comment }, -- Comment
		sym "@punctuation" { fg = c.base.pink }, -- Delimiter
		sym "@constant" { Constant }, -- Constant
		sym "@constant.builtin" { fg = c.base.yellow }, -- Special
		-- sym"@constant.macro"    { }, -- Define
		-- sym "@define" {}, -- Define
		-- sym"@macro"             { }, -- Macro
		sym "@string" { fg = c.base.green }, -- String
		sym "@string.content" { fg = c.base.green },
		sym "@string.fragment" { fg = c.base.green },
		-- sym"@string.escape"     { }, -- SpecialChar
		-- sym"@string.special"    { }, -- SpecialChar
		sym "@character" { Character }, -- Character
		-- sym"@character.special" { }, -- SpecialChar
		sym "@number" { Number }, -- Number
		-- sym"@boolean"           { }, -- Boolean
		-- sym"@float"             { }, -- Float
		-- sym"@function"          { }, -- Function
		-- sym"@function.builtin"  { }, -- Special
		-- sym"@function.macro"    { }, -- Macro
		-- sym"@parameter"         { }, -- Identifier
		-- sym"@method"            { },-- Function
		-- sy"@field"             { }, -- Identifier
		-- sym"@property"          { }, -- Identifier
		-- sym"@constructor"       { }, -- Special
		sym "@keyword" { Keyword }, -- Keyword
		sym "@keyword.conditional" { Statement }, -- Conditional
		sym "@keyword.coroutine" { Type },
		sym "@keyword.repeat" { Statement }, -- Repeat
		-- sym"@label"             { }, -- Label
		sym "@keyword.import" { Statement },
		sym "@keyword.operator" { Statement }, -- Operator
		sym "@keyword.return" { Statement }, -- Operator
		sym "@punctuation.delimiter" {},
		-- sym"@exception"         { }, -- Exception
		sym "@variable" { Identifier }, -- Identifier
		sym "@variable.builtin" { Statement }, -- Identifier
		sym "@type" { Type }, -- Type
		-- sym"@type.definition"   { }, -- Typedef
		-- sym"@storageclass"      { }, -- StorageClass
		-- sym"@structure"         { }, -- Structure
		-- sym"@namespace"         { }, -- Identifier
		-- sym"@include"           { }, -- Include
		-- sym"@preproc"           { }, -- PreProc
		-- sym"@debug"             { }, -- Debug
		sym "@tag" { fg = c.base.yellow }, -- Tag
		sym "@tag.delimiter" { fg = c.base.red },
		sym "@tag.builtin" { fg = c.base.cyan }, -- Tag Builtin
		sym "@tag.attribute" { fg = c.base.cyan },
		-- sym "@markup.quote" { fg = c.base.pink },
	}
end)

-- Return our parsed theme for extension or use elsewhere.
return theme

-- vi:nowrap
