" thinkpad.vim
"
" Maintainer:   Leandro Torres < oroverdino AT gmail DOT com >
" Last Change:
" 161210161210161210161210161210161210161210161210161210161210161210161210161210161210161210161210 

set background=dark
hi clear
if exists("syntax_on")
    syntax reset
endif
let g:colors_name="thinkpad"

" Vim >= 7.0 specific colors
if version >= 700
    hi CursorLine                       guibg=#000000
    hi CursorColumn                     guibg=#2d2d2d
    hi MatchParen       guifg=#ffffff   guibg=#333333   gui=bold
    hi Pmenu            guifg=#ffffff   guibg=#666666
    hi PmenuSel         guifg=#ffffff   guibg=#93b5bf
endif

" gui
hi Normal       guifg=gray           guibg=black      gui=none
hi Cursor       guifg=black          guibg=red        gui=none
hi CurrentLine                                        gui=bold
hi ErrorMsg     guifg=white          guibg=red        gui=none
hi VertSplit    guifg=black          guibg=black      gui=none
hi Folded       guifg=red            guibg=black      gui=italic
hi FoldColumn   guifg=red            guibg=black      gui=none
hi IncSearch    guifg=black          guibg=grey       gui=none
hi LineNr       guifg=grey           guibg=black      gui=none
hi ModeMsg      guifg=grey           guibg=black      gui=none
hi MoreMsg      guifg=grey           guibg=black      gui=none
hi NonText      guifg=black          guibg=black      gui=none
hi Question     guifg=red            guibg=black      gui=none
hi Search       guifg=black          guibg=grey30     gui=none
hi StatusLine   guifg=black          guibg=grey       gui=bold
hi StatusLineNC guifg=black          guibg=grey30     gui=none
hi Title        guifg=red            guibg=black      gui=none
hi Visual       guifg=black          guibg=red        gui=none
hi WarningMsg   guifg=grey           guibg=red        gui=none
hi Pmenu        guifg=black          guibg=red        gui=none
hi PmenuSel     guifg=red            guibg=black      gui=none
hi WildMenu     guifg=gray           guibg=gray17     gui=none
hi MatchParen   guifg=red            guibg=black      gui=bold
hi DiffAdd      guifg=black          guibg=grey       gui=none
hi DiffChange   guifg=black          guibg=skyblue1   gui=none
hi DiffText     guifg=black          guibg=hotpink1   gui=none
hi DiffDelete   guifg=gray50         guibg=black      gui=none
hi Comment      guifg=grey40         guibg=black      gui=italic
hi Constant     guifg=#00BFFF        guibg=black      gui=none
hi String       guifg=#00BFFF        guibg=black      gui=none
hi Character    guifg=#00BFFF        guibg=black      gui=none
hi Number       guifg=#00BFFF        guibg=black      gui=none
hi Identifier   guifg=#00BFFF        guibg=black      gui=none
hi Function     guifg=grey           guibg=black      gui=none
hi Statement    guifg=#00D15B        guibg=black      gui=none
hi PreProc      guifg=grey           guibg=black      gui=underline
hi Type         guifg=red3                            gui=none
hi Special      guifg=grey                            gui=none
hi Ignore       guifg=grey40                          gui=none
hi Todo         guifg=black          guibg=red        gui=none

" cterm
hi Normal       ctermfg=grey                          cterm=none
hi Cursor       ctermfg=black        ctermbg=red      cterm=none
hi CurrentLine                                        cterm=bold
hi ErrorMsg     ctermfg=white        ctermbg=red      cterm=none
hi VertSplit    ctermfg=black                         cterm=none
hi Folded       ctermfg=red          ctermbg=none     cterm=none
hi FoldColumn   ctermfg=red          ctermbg=none     cterm=none
hi IncSearch    ctermfg=black        ctermbg=grey     cterm=none
hi LineNr       ctermfg=grey                          cterm=none
hi ModeMsg      ctermfg=grey                          cterm=none
hi MoreMsg      ctermfg=grey                          cterm=none
hi NonText      ctermfg=grey                          cterm=none
hi Question     ctermfg=red                           cterm=none
hi Search       ctermfg=black        ctermbg=grey     cterm=none
hi StatusLine   ctermfg=yellow       ctermbg=none     cterm=none
hi StatusLineNC ctermfg=grey         ctermbg=none     cterm=none
hi Title        ctermfg=red                           cterm=none
hi Visual       ctermfg=black        ctermbg=red      cterm=none
hi WarningMsg   ctermfg=grey         ctermbg=red      cterm=none
hi Pmenu        ctermfg=black        ctermbg=red      cterm=none
hi PmenuSel     ctermfg=red                           cterm=none
hi WildMenu     ctermfg=gray         ctermbg=none     cterm=none
hi MatchParen   ctermfg=red          ctermbg=black    cterm=none
hi DiffAdd      ctermfg=black        ctermbg=grey     cterm=none
hi DiffChange   ctermfg=black        ctermbg=cyan     cterm=none
hi DiffText     ctermfg=black        ctermbg=green    cterm=none
hi DiffDelete   ctermfg=gray                          cterm=none
hi Comment      ctermfg=blue                          cterm=none
hi Constant     ctermfg=cyan                          cterm=none
hi String       ctermfg=cyan                          cterm=none
hi Character    ctermfg=cyan                          cterm=none
hi Number       ctermfg=cyan                          cterm=none
hi Identifier   ctermfg=cyan                          cterm=none
hi Function     ctermfg=white                         cterm=none
hi Statement    ctermfg=green                         cterm=none
hi PreProc      ctermfg=grey                          cterm=none
hi Type         ctermfg=red                           cterm=none
hi Special      ctermfg=white                         cterm=none
hi Ignore       ctermfg=grey                          cterm=none
hi Todo         ctermfg=white        ctermbg=red      cterm=none

" - languages --------------------------------------------------------------------------------- <<< -

" c++
hi! link cppAccess		Type
hi! link cppStatement	Special

" html
hi! link htmlArg		Statement
hi! link htmlTag		Special
hi! link htmlTagName	Normal
hi! link htmlTitle		Type

" java
hi! link javaTypeDef	Special

" markdown
hi! link markdownH1		Type

" nerdtree
hi! link NERDTreeCWD	WarningMsg
hi! link NERDTreeExecFile	PreProc
hi! link NERDTreeLinkDir	Type
hi! link NERDTreeLinkFile	Special
hi! link NERDTreeLinkTarget	Normal

" netrw
hi! link netrwSymLink	Special

" pascal
hi! link pascalStatement	Type

" python
hi! link pythonStatement	Type

" ruby
hi! link rubyConstant	Special
hi! link rubyDefine		Type

" sh
hi! link shDerefVar		Special
hi! link shFunction		Type
hi! link shLoop			Statement
hi! link shStatement	Special

" vim
hi! link vimCommand		Statement
hi! link vimEnvVar		Special
hi! link vimFuncKey		Type
hi! link vimOption		Special
hi! link vimSyntax		Special
hi! link vimSynType		Special

" php
hi! link phpIdentifier        Normal
hi! link phpComment           Comment
hi! link phpClasses           Type
hi! link phpSpecial           Special
hi! link phpMethodsVar        Statement

" md
hi! link mdSyntax   Normal
hi! link mdSpecial      Special

" --------------------------------------------------------------------------------------------- >>> -

" vim: foldmarker=<<<,>>>
