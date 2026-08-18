function arg_cycle_backward --description "Insert the previous argument from the last command"
    set -l current (commandline -t)
    
    if test -z "$__last_args" -o $__arg_index -eq 0
        __refresh_args
    else if test "$current" != "$__last_args[$__arg_index]"
        __refresh_args
    end
    
    if test (count $__last_args) -gt 0
        set -g __arg_index (math $__arg_index - 1)
        if test $__arg_index -lt 1
            set -g __arg_index (count $__last_args)
        end
        commandline -t -- $__last_args[$__arg_index]
        commandline -f repaint
    else
        echo "No arguments in last command" >&2
    end
end

