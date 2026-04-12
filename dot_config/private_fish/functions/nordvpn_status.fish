function nordvpn_status
    if not test -d "/mnt/c/Program Files/NordVPN"
        echo "NordVPN is not installed on this system."
        return 1
    end

    set -l cache_file "/tmp/nordvpn_status.txt"
    set -l max_age 300 # 5 minutes
    set -l refresh 0

    if test (count $argv) -gt 0
        switch $argv[1]
            case --force -f
                set refresh 1
        end
    end

    if test -f "$cache_file"
        set -l mtime (date -r "$cache_file" +%s)
        set -l now (date +%s)
        set -l age (math "$now - $mtime")
        if test $age -gt $max_age
            set refresh 1
        end
    else
        set refresh 1
    end

    set -l protected ""
    if test $refresh -eq 1
        set protected (curl -s --max-time 1 "https://web-api.nordvpn.com/v1/ips/info" | jq '. | .protected')
        echo "$protected" >"$cache_file"
    else
        set protected (cat "$cache_file")
    end

    if test "$protected" = true
        echo "NordVPN is currently active and protecting your connection."
        return 0
    else
        echo "NordVPN is installed but not currently active."
        return 1
    end
end
