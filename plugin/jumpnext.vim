function s:JUMPTONEXT() abort
if has("python3")
python3 << EOF
import vim
import re
right = vim.eval("getline('.')[col('.'):]")
next_p = re.search(r"[\]})]", right)
cw = vim.current.window
pos = cw.cursor
if next_p:
    cw.cursor = (pos[0], pos[1] + next_p.span()[0])
EOF
endif
endfunction

command JUMPTONEXT call s:JUMPTONEXT()
