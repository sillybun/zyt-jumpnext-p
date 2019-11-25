function s:JUMPTONEXTP() abort
if has("python3")
python3 << EOF
import vim
import re
right = vim.eval("getline('.')[col('.')-1:]")
next_p = re.search(r"[\]})]", right)
cw = vim.current.window
pos = cw.cursor
if next_p:
    cw.cursor = (pos[0], pos[1] + next_p.span()[0])
EOF
endif
endfunction

function s:JUMPTOPREVIOUSP() abort
if has("python3")
python3 << EOF
import vim
import re
left = vim.eval("getline('.')[:col('.')-1]")
previous_p = re.search(r"[\[({]", left)
cw = vim.current.window
pos = cw.cursor
if previous_p:
    cw.cursor = (pos[0], previous_p.span()[0])
EOF
endif
endfunction

command! JUMPTONEXTP call s:JUMPTONEXTP()
command! JUMPTOPREVIOUSP call s:JUMPTOPREVIOUSP()

inoremap <C-L> <C-O>:JUMPTONEXTP<Cr><C-O>a
inoremap <C-H> <C-O>:JUMPTOPREVIOUSP<Cr><C-o>i
