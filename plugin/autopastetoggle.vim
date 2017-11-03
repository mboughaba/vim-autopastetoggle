" MIT License
"
" Copyright (c) 2017 Mohamed Boughaba
"
" Permission is hereby granted, free of charge, to any person obtaining a copy
" of this software and associated documentation files (the "Software"), to deal
" in the Software without restriction, including without limitation the rights
" to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
" copies of the Software, and to permit persons to whom the Software is
" furnished to do so, subject to the following conditions:
"
" The above copyright notice and this permission notice shall be included in all
" copies or substantial portions of the Software.
"
" THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
" IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
" FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
" AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
" LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
" OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
" SOFTWARE.
"
if exists('g:autopastetoggle_loaded') || has("gui_running") || &cp || ve < 700
    fini
en

"
" Bracketed paste for ViM in terminal & ViM within GNU Screen
"
let l:screen  = &term =~ 'screen'
let l:xterm   = &term =~ 'xterm'
" TODO: Tmux
if s:screen
    let &t_ti .= "\<Esc>P\<Esc>[?2004h\<Esc>\\"
    let &t_te .= "\<Esc>P\<Esc>[?2004l\<Esc>\\"
elsei s:xterm
    let &t_ti .= "\<Esc>[?2004h"
    let &t_te .= "\<Esc>[?2004l"
en
exe "setl <f28>=\<Esc>[200~"
exe "setl <f29>=\<Esc>[201~"
map <expr> <f28> autopastetoggle#AutoPaste("i")
im <expr> <f28> autopastetoggle#AutoPaste("")
vm <expr> <f28> autopastetoggle#AutoPaste("c")
cm <f28> <NOP>
cm <f29> <NOP>

let g:autopastetoggle_loaded = 1
