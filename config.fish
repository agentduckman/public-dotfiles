function fish_greeting
    # Set variables for dynamic content
    set uptime (uptime -p | awk -F " " '{print $2" "$3" "$4" "$5" "$6" "$7}')
    set private_ip (ip -4 addr show | grep inet | grep -v '127.0.0.1' | awk '{print $2}' | cut -d'/' -f1 | head -n 1)
    set public_ip (curl -s https://api.ipify.org)
    set tunnel_ip (ip -4 addr show tun0 2>/dev/null | grep inet | awk '{print $2}' | cut -d'/' -f1)

    # Display the greeting with colors and bold text using printf (fish echo does not support -e)
    printf "\033[1;32mSystem uptime:\033[0m \033[1;36m%s\033[0m\n" $uptime
    printf "\033[1;33mPrivate IP:\033[0m \033[1;35m%s\033[0m\n" $private_ip
    printf "\033[1;33mPublic IP:\033[0m \033[1;35m%s\033[0m\n" $public_ip

    # Check if Tunnel IP exists and display it
    if test -n "$tunnel_ip"
        echo -e "\033[1;33mTunnel IP:\033[0m \033[1;36m$tunnel_ip\033[0m"
    end
end

if status is-interactive
    # Commands to run in interactive sessions can go here
end

# Vim mode
fish_vi_key_bindings

# Functions
function gc --description 'Git commit with a message'
    git commit -m "$argv"
end

# Set default editor to lvim
set -Ux EDITOR nvim
set -Ux VISUAL nvim


# Aliases
alias gst="git status"
alias gsw="git switch"
alias gcl="git clone"
alias ga="git add"
alias gps="git push"
alias gpl="git pull"
alias update="sudo pacman -Sy"
alias upgrade="sudo pacman -Su"
alias vim=~/.local/bin/lvim
alias nvim=~/.local/bin/lvim
alias v=~/.local/bin/lvim
alias lsa="ls -als"
alias ff="fastfetch"
alias grep='grep --color=auto'
alias ports='sudo lsof -i -P -n | grep LISTEN'
alias myip='curl ipinfo.io/ip'
alias la='ls -A'
alias l='ls -CF'
alias ..='cd ..'
alias services='systemctl list-units --type=service --state=running'
alias i3config='nvim ~/.config/i3/config'
alias newvenv='python3 -m venv .venv && source .venv/bin/activate.fish'
alias activate='source .venv/bin/activate.fish'
alias y='yazi'
alias projects='cd ~/Projects/'
alias downloads='cd ~/Downloads/ && ls -alsh'
alias fishconfig='nvim ~/.config/fish/config.fish'
