# ============================================================
# arg-cycle.fish – automatic key bindings for argument cycling
# ============================================================

# Initialize global state (if not already set)
set -q __last_args; or set -g __last_args ""
set -q __arg_index; or set -g __arg_index 0

# ------------------------------------------------------------------
# 1. Let users override the key bindings by setting these variables
#    in their config.fish *before* this plugin loads.
# ------------------------------------------------------------------
set -q arg_cycle_forward_key;  or set -g arg_cycle_forward_key  \ek   # Alt+k
set -q arg_cycle_backward_key; or set -g arg_cycle_backward_key \ej   # Alt+j

# ------------------------------------------------------------------
# 2. Detect if vi-mode is active
# ------------------------------------------------------------------
function __is_vi_mode
    test "$fish_key_bindings" = fish_vi_key_bindings
end

# ------------------------------------------------------------------
# 3. Apply bindings – only if user didn't set a skip variable
# ------------------------------------------------------------------
if not set -q arg_cycle_skip_bindings
    if __is_vi_mode
        # In vi-mode, we bind only in insert mode
        bind -M insert $arg_cycle_forward_key  arg_cycle_forward
        bind -M insert $arg_cycle_backward_key arg_cycle_backward
    else
        # In emacs mode (default), we bind globally
        bind $arg_cycle_forward_key  arg_cycle_forward
        bind $arg_cycle_backward_key arg_cycle_backward
    end
end

# Clean up helper function (not needed after binding)
functions -e __is_vi_mode

