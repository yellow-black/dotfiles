function nordvpn_status
    if test -d "/mnt/c/Program Files/NordVPN"
        set -l protected (curl -s --connect-timeout 0.3 --max-time 1 "https://web-api.nordvpn.com/v1/ips/info" | jq '. | .protected')
        if test "$protected" = true
            echo "NordVPN is currently active and protecting your connection."
            return 0
        else
            echo "NordVPN is installed but not currently active."
            return 1
        end
    else
        echo "NordVPN is not installed on this system."
        return 1
    end
end
