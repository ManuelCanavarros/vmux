config_read_file() {
    (grep -E "^${2}=" -m 1 "${1}" 2>/dev/null || echo "VAR=__UNDEFINED__") | head -n 1 | cut -d '=' -f 2-;
}

config_get() {
    val="$(config_read_file $VMUXCLI_WORKDIR/vmux_config.cfg "${1}")";
    if [ "${val}" = "__UNDEFINED__" ]; then
        val="$(config_read_file $VMUXCLI_WORKDIR/vmux_config.cfg.defaults "${1}")";
    fi
    printf -- "%s" "${val}";
}

read_config(){
    VMUX_SESSION_PREFIX="$(config_get vmux_session_prefix)"
}
get_all_session(){
    read_config
    mapfile -t sessions_long < <( abduco -l | grep -ow "$VMUX_SESSION_PREFIX.*" )
    VMUX_SESSIONS=()
    for i in "${!sessions_long[@]}"; do
        VMUX_SESSIONS+=( "${sessions_long[i]:${#VMUX_SESSION_PREFIX}}" )
    done
}

_vmux_completion(){
    if [ "${#COMP_WORDS[@]}" != "2" ]; then
        return
    fi
    get_all_session
    local vmux_session_words=$"${VMUX_SESSIONS[@]}"
    local suggestions=( $(compgen -W "${vmux_session_words}" -- "${COMP_WORDS[1]}") )
    if [ "${#suggestions[@]}" -gt 0 ]; then
        COMPREPLY=("${suggestions[@]}")
    else
        COMPREPLY=()
    fi
}

complete -F _vmux_completion vmux
