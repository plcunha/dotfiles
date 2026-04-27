#!/usr/bin/env bash
# ═══════════════════════════════════════════════════════════════════════════════
# tmux-status.sh - Shows OpenCode status in tmux status bar
# Called by tmux status-right to display current OpenCode state
# ═══════════════════════════════════════════════════════════════════════════════════════

STATE_FILE="${HOME}/.local/share/opencode/hook-state"
SOCKET_PATH="${HOME}/.opencode/socket"

# ───────────────────────────────────────────────────────────────────────────────
# MAIN
# ───────────────────────────────────────────────────────────────────────────────

main() {
    # Check for state file (from hook if available)
    if [[ -f "$STATE_FILE" ]]; then
        local state
        state=$(cat "$STATE_FILE")

        case "$state" in
            ready)
                echo "#[fg=colour204]◉ INPUT"
                return
                ;;
            thinking)
                echo "#[fg=colour110]◐ THINKING"
                return
                ;;
            done:*)
                local task_id="${state#done:}"
                echo "#[fg=colour141]✓ $task_id"
                return
                ;;
        esac
    fi

    # Check if OpenCode is running via socket
    if [[ -S "$SOCKET_PATH" ]]; then
        echo "#[fg=colour141]● ONLINE"
        return
    fi

    # Check for opencode process
    if pgrep -x "opencode" &>/dev/null; then
        echo "#[fg=colour141]● RUNNING"
        return
    fi

    # Default: empty (no OpenCode activity)
    echo ""
}

main "$@"