function zellij_pane_size
    if not set -q ZELLIJ_PANE_ID
        return 1
    end

    # zellij action list-panes --json | jq -r --argjson id "$ZELLIJ_PANE_ID" '.[] | select(.id == $id) | "\(.pane_columns) \(.pane_rows)"'
    zellij action list-panes --json | jq -r --argjson id "$ZELLIJ_PANE_ID" '.[] | select(.id == $id) | "\(.pane_content_columns) \(.pane_content_rows)"'
end

function smart_fastfetch
    set -l size (zellij_pane_size)
    if test -n "$size"
        set -l parts (string split ' ' -- $size)
        set cols $parts[1]
        set lines $parts[2]
    end

    if test -z "$cols"
        set cols (tput cols 2>/dev/null)
    end
    if test -z "$lines"
        set lines (tput lines 2>/dev/null)
    end

    # echo "cols: $cols, lines: $lines"
    if test $cols -lt 150 -o $lines -lt 30
        return
    end

    fastfetch
end

function fish_greeting
    smart_fastfetch
end
