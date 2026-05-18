if status is-interactive
    set fish_greeting

    alias cleanup="pacman -Qdtq | sudo ifne pacman -Rns -"

    starship init fish | source
end

function fix-dns
    set iface (ip route get 1.1.1.1 | awk 'NR==1{print $5}')
    set conn (nmcli -g GENERAL.CONNECTION device show $iface)
    nmcli connection modify $conn ipv4.ignore-auto-dns yes ipv6.ignore-auto-dns yes
    nmcli device reapply $iface
    echo "Done: $conn ($iface)"
end
