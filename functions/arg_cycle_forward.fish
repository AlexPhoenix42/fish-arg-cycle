function arg_cycle_forward --description "Insert the next argument from the last command"
    set -l current (commandline -t)
    
    # Refresh if list empty or index is 0
    if test -z "$__last_args" -o $__arg_index -eq 0
        __refresh_args
    # Refresh if current token changed (only if index is valid)
    else if test "$current" != "$__last_args[$__arg_index]"
        __refresh_args
    end
    
    if test (count $__last_args) -gt 0
        set -g __arg_index (math $__arg_index + 1)
        if test $__arg_index -gt (count $__last_args)
            set -g __arg_index 1
        end
        commandline -t -- $__last_args[$__arg_index]
        commandline -f repaint
    else
        echo "No arguments in last command" >&2
    end
end

