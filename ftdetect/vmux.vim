if !exists("g:vmux_active_session")
    let g:vmux_active_session = 0
endif

if g:vmux_active_session
    au TermOpen * VmuxReloadServer
endif
