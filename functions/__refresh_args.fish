function __refresh_args --description "Extract arguments from the last command"
    set -l last_cmd $history[1]
    set -l tokens (string split ' ' -- $last_cmd)
    set -g __last_args $tokens[2..-1]
    
    if test (count $__last_args) -eq 0
        set -g __last_args ""
        set -g __arg_index 0
    else
        set -g __arg_index 1   # always start at 1
    end
end

