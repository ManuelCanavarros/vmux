if !exists("g:vmux_active_session")
    let g:vmux_active_session = 0
endif

" If vmux session is on enable confirm quit
let g:confirm_quit_nomap = 1
if g:vmux_active_session
    let g:confirm_quit_nomap = 0
endif

if g:vmux_active_session
    au TermOpen * VmuxReloadServer
endif
function! VmuxDoneEditing()
  execute(":x")
  let l:s = system("touch " . g:vmux_done_file_path)
endfunction
