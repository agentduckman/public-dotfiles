# fish_config theme choose "Dracula Official"
set fish_greeting

# function fish_prompt
#   echo (set_color magenta)(whoami)@(hostname)(set_color white)"::"(set_color green)(pwd)" " 
# end

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
