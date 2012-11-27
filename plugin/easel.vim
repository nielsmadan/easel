nnoremap <F3> :call <SID>SynStack()<CR>
nnoremap <F4> :call HexHighlight()<CR>

function! <SID>SynStack()
    if !exists("*synstack")
        return
    endif
    let sgroup_list = map(synstack(line('.'), col('.')), 'synIDattr(v:val, "name")')
    echo sgroup_list
    let @s = join(sgroup_list, ' ')
endfunc

let s:HexColored = 0
let s:HexColors = []

function! HexHighlight()
    if has("gui_running")
        if s:HexColored == 0
            let hexGroup = 4
            let lineNumber = 0
            while lineNumber <= line("$")
                let currentLine = getline(lineNumber)
                let hexLineMatch = 1
                while match(currentLine, '#\x\{6}', 0, hexLineMatch) != -1
                    let hexMatch = matchstr(currentLine, '#\x\{6}', 0, hexLineMatch)
                    exe 'hi hexColor'.hexGroup.' guifg='.hexMatch.' guibg='.hexMatch
                    exe 'let m = matchadd("hexColor'.hexGroup.'", "'.hexMatch.'", 25, '.hexGroup.')'
                    let s:HexColors += ['hexColor'.hexGroup]
                    let hexGroup += 1
                    let hexLineMatch += 1
                endwhile
                let lineNumber += 1
            endwhile
            unlet lineNumber hexGroup
            let s:HexColored = 1
            echo "Highlighting hex colors..."
        elseif s:HexColored == 1
            for hexColor in s:HexColors
                exe 'highlight clear '.hexColor
            endfor
            call clearmatches()
            let s:HexColored = 0
            echo "Unhighlighting hex colors..."
        endif
    else
        echo "hexHighlight only works with a graphical version of vim"
    endif
endfunction
