" Dark color scheme canvas to get started on your own color scheme.

hi clear

set background=dark

if exists("syntax_on")
    syntax reset
endif

if !has("gui_running") && &t_co != 256
    finish
endif

let colors_name = "dark_canvas"

let s:text = ['#f8f8f2', 15]
let s:text_bg = ['#1c1b1a', 234]

let s:white = ['#ffffff', 15]
let s:black = ['#000000', 0]
let s:greys = [['#bebebe', 250], ['#808080', 244], ['#696969', 242], ['#545454', 240], ['#343434', 236], ['#080808', 232]]

let s:cerise = ['#ff0033', 197]

let s:lime = ['#aeee00', 154]

let s:gold = ['#ffb829', 214]

let s:brick = ['#cb4154', 167]

let s:lilac = ['#ae81ff', 141]

let s:frost = ['#2C89C7', 68] 

let s:sunny = ['#FFFC7F', 228]

let s:mordant = ['#AE0C00', 124]

let s:auburn = ['#7C0A02', 88]
let s:moss = ['#004225', 22]

" pass empty string for defaults: guifg - fg, guibg - bg, gui - none, guisp - fg
function! s:Highlight(group_name, guifg, guibg, gui, guisp)
    if !empty(a:guifg)
        let guifg = a:guifg
    else
        let guifg = ['fg', 'fg']
    endif
    if !empty(a:guibg)
        let guibg = a:guibg
    else
        let guibg = ['bg', 'bg']
    endif
    if !empty(a:gui)
        let gui = a:gui
    else
        let gui = 'none'
    endif
    if !empty(a:guisp)
        let guisp = a:guisp
    else
        let guisp = ['fg', 'fg']
    endif

    if has("gui_running")
        exe 'hi ' . a:group_name . ' guifg=' . guifg[0] . ' guibg=' . guibg[0] . ' gui=' . gui . ' guisp=' . guisp[0]
    else
        exe 'hi ' . a:group_name . ' ctermfg=' . guifg[1] . ' ctermbg=' . guibg[1] . ' cterm=' . gui
    endif
endfunction

" highlight, no defaults
function! s:HighlightND(group_name, guifg, guibg, gui, guisp)
    if empty(a:guifg) && empty(a:guibg) && empty(a:gui) && !has("gui_running")
        return
    endif

    let hi_str = 'hi ' . a:group_name

    if !empty(a:guifg)
        if has("gui_running")
            let hi_str = hi_str . ' guifg=' . a:guifg[0]
        else
            let hi_str = hi_str . ' ctermfg=' . a:guifg[1]
        endif
    endif

    if !empty(a:guibg)
        if has("gui_running")
            let hi_str = hi_str . ' guibg=' . a:guibg[0]
        else
            let hi_str = hi_str . ' ctermbg=' . a:guibg[1]
        endif
    endif

    if !empty(a:gui)
        if has("gui_running")
            let hi_str = hi_str . ' gui=' . a:gui
        else
            let hi_str = hi_str . ' cterm=' . a:gui
        endif
    endif

    if !empty(a:guisp) && has("gui_running")
        let hi_str = hi_str . ' guisp=' . a:guisp[0]
    endif

    exe hi_str
endfunction

call s:Highlight('Normal', s:text, s:text_bg, '', '')

call s:Highlight('Statement',   s:cerise, '', 'bold', '')
call s:Highlight('Keyword',     s:cerise, '', 'bold', '')
call s:Highlight('Conditional', s:cerise, '', 'bold', '')
call s:Highlight('Operator',    s:cerise, '', '', '')
call s:Highlight('Label',       s:cerise, '', '', '')
call s:Highlight('Repeat',      s:cerise, '', 'bold', '')

call s:Highlight('Type',            s:brick, '', '', '')
call s:Highlight('StorageClass',    s:cerise, '', '', '')
call s:Highlight('Structure',       s:cerise, '', '', '')
call s:Highlight('TypeDef',         s:cerise, '', 'bold', '')

call s:Highlight('Exception',       s:lime, '', 'bold', '')
call s:Highlight('Include',         s:lime, '', 'bold', '')

call s:Highlight('PreProc',         s:lime, '', '', '')
call s:Highlight('Macro',           s:lime, '', '', '')
call s:Highlight('Define',          s:lime, '', '', '')
call s:Highlight('Delimiter',       s:lime, '', '', '')
call s:Highlight('Ignore',          s:lime, '', '', '')
call s:Highlight('PreCondit',       s:lime, '', 'bold', '')
call s:Highlight('Debug',           s:lime, '', 'bold', '')

call s:Highlight('Function',        s:gold, '', '', '')
call s:Highlight('Identifier',      s:gold, '', '', '')

call s:Highlight('Comment',         s:frost, '', '', '')
call s:Highlight('CommentEmail',    s:frost, '', 'underline', '')
call s:Highlight('CommentUrl',      s:frost, '', 'underline', '')
call s:Highlight('SpecialComment',  s:frost, '', 'bold', '')
call s:Highlight('Todo',            s:frost, '', 'bold', '')

call s:Highlight('String',          s:sunny, '', '', '') 
call s:Highlight('SpecialKey',      s:lilac, '', 'bold', '')
call s:Highlight('Special',         s:lilac, '', 'bold', '')
call s:Highlight('SpecialChar',     s:lilac, '', 'bold', '')

call s:Highlight('Boolean',         s:lilac, '', 'bold', '')
call s:Highlight('Character',       s:lilac, '', 'bold', '')
call s:Highlight('Number',          s:lilac, '', 'bold', '')
call s:Highlight('Constant',        s:lilac, '', 'bold', '')
call s:Highlight('Float',           s:lilac, '', 'bold', '')

call s:Highlight('FoldColumn',      s:greys[1], s:black, '', '')
call s:Highlight('Folded',          s:greys[1], s:black, '', '')

call s:Highlight('MatchParen',      s:black, s:gold, 'bold', '')

call s:Highlight('LineNr',          s:greys[2], '', '', '')
call s:Highlight('NonText',         s:greys[2], '', '', '')
call s:HighlightND('CursorColumn',   '', s:greys[5], '', '')
call s:HighlightND('CursorLine',     '', s:greys[5], '', '')
call s:Highlight('SignColumn',      '', s:greys[5], '', '')
call s:HighlightND('ColorColumn',    '', s:greys[5], '', '')

call s:Highlight('Error',           s:mordant, s:greys[5], 'bold', '')
call s:Highlight('ErrorMsg',        s:mordant, '', 'bold', '')
call s:Highlight('WarningMsg',      s:mordant, '', '', '')

call s:Highlight('Cursor',          s:greys[5], s:white, '', '')
call s:Highlight('vCursor',         s:greys[5], s:white, '', '')
call s:Highlight('iCursor',         s:greys[5], s:white, '', '')

call s:Highlight('StatusLine',      s:white, s:black, 'bold', '')
call s:Highlight('StatusLineNC',    s:greys[1], s:greys[5], 'bold', '')
call s:Highlight('VertSplit',       s:greys[1], s:greys[5], 'bold', '')

call s:Highlight('ModeMsg',         s:sunny, '', 'bold', '')

if has("spell")
    call s:HighlightND('SpellBad',    '', '', 'undercurl', s:mordant)
    call s:HighlightND('SpellCap',    '', '', 'undercurl', s:auburn)
    call s:HighlightND('SpellLocal',  '', '', 'undercurl', s:auburn)
    call s:HighlightND('SpellRare',   '', '', 'undercurl', s:white)
endif

call s:HighlightND('VisualNOS',      '', s:greys[4], '', '')
call s:HighlightND('Visual',         '', s:greys[4], '', '')
call s:Highlight('Search',          s:black, s:gold, '', '')
call s:Highlight('IncSearch',       s:black, s:sunny, '', '')

call s:Highlight('Pmenu',           s:black, s:gold, '', '')
call s:Highlight('PmenuSel',        s:gold, s:black, 'bold', '')
call s:Highlight('Pmenu',           '', s:greys[5], '', '')
call s:Highlight('Pmenu',           s:frost, '', '', '')

call s:HighlightND('DiffDelete',     s:auburn, s:auburn, '', '')
call s:HighlightND('DiffText',       '', s:greys[3], '', '')
call s:HighlightND('DiffChange',     '', s:greys[4], '', '')
call s:HighlightND('DiffAdd',        '', s:moss, '', '')

call s:HighlightND('Underlined',     '', '', 'underline', '')

call s:Highlight('Directory',       s:lime, '', '', '')
call s:Highlight('Question',        s:lime, '', '', '')
call s:Highlight('MoreMsg',         s:lime, '', '', '')
  
call s:Highlight('WildMenu',        s:black, s:lilac, 'bold', '')

call s:Highlight('Title',           '', '', 'underline', '')

call s:HighlightND('Tag',            '', '', 'bold', '')
