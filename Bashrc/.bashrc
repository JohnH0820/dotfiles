# =============================================================================
# ~/.bashrc — WSL Ubuntu configuration
# =============================================================================

# ── Don't run for non-interactive shells ─────────────────────────────────────
case $- in
    *i*) ;;
      *) return;;
esac

# =============================================================================
# HISTORY
# =============================================================================
HISTCONTROL=ignoreboth        # ignore duplicates and lines starting with space
HISTSIZE=5000
HISTFILESIZE=10000
shopt -s histappend           # append to history file, don't overwrite
shopt -s cmdhist              # save multi-line commands as one entry

# =============================================================================
# SHELL OPTIONS
# =============================================================================
shopt -s checkwinsize         # update LINES/COLUMNS after each command
shopt -s globstar             # enable ** glob patterns
shopt -s autocd               # type a dir name to cd into it
shopt -s cdspell              # auto-correct minor typos in cd

# =============================================================================
# PROMPT  (git branch shown when inside a repo)
# =============================================================================
_git_branch() {
    local branch
    branch=$(git symbolic-ref --short HEAD 2>/dev/null) || return
    echo " ($branch)"
}

# Colors
_RESET='\[\e[0m\]'
_GREEN='\[\e[1;32m\]'
_CYAN='\[\e[1;36m\]'
_YELLOW='\[\e[1;33m\]'
_RED='\[\e[1;31m\]'

# Format: user@host:~/path (branch) $
PS1="${_GREEN}\u@\h${_RESET}:${_CYAN}\w${_YELLOW}\$(_git_branch)${_RESET} \$ "

# =============================================================================
# PATH
# =============================================================================
# Local binaries
export PATH="$HOME/.local/bin:$HOME/bin:$PATH"

# AWS CLI (if installed to default location)
export PATH="/usr/local/aws-cli/v2/current/bin:$PATH"

# =============================================================================
# ENVIRONMENT
# =============================================================================
export EDITOR=vim
export VISUAL=vim
export PAGER=less
export LESS='-R --quit-if-one-screen --no-init'

# Color support
export CLICOLOR=1
export TERM=xterm-256color

# =============================================================================
# ALIASES — Navigation
# =============================================================================
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias ~='cd ~'
alias ll='ls -alF --color=auto'
alias la='ls -A --color=auto'
alias ls='ls --color=auto'
alias lt='ls -lth --color=auto'     # sort by newest first
alias grep='grep --color=auto'
alias mkdir='mkdir -pv'             # make parent dirs, verbose
alias df='df -h'
alias du='du -h'
alias free='free -h'

# =============================================================================
# ALIASES — Git
# =============================================================================
alias g='git'
alias gs='git status'
alias ga='git add'
alias gaa='git add -A'
alias gc='git commit -m'
alias gca='git commit --amend'
alias gp='git push'
alias gpl='git pull'
alias gl='git log --oneline --graph --decorate --all'
alias gd='git diff'
alias gco='git checkout'
alias gcb='git checkout -b'
alias gb='git branch'
alias gst='git stash'
alias gstp='git stash pop'

# =============================================================================
# ALIASES — Docker
# =============================================================================
alias d='docker'
alias dps='docker ps'
alias dpsa='docker ps -a'
alias di='docker images'
alias drm='docker rm'
alias drmi='docker rmi'
alias dex='docker exec -it'
alias dlogs='docker logs -f'
alias dstop='docker stop $(docker ps -q)'      # stop all running containers
alias dprune='docker system prune -f'          # clean up unused resources

# Docker Compose
alias dc='docker compose'
alias dcu='docker compose up -d'
alias dcd='docker compose down'
alias dcl='docker compose logs -f'
alias dcb='docker compose build'

# =============================================================================
# ALIASES — AWS
# =============================================================================
alias awswho='aws sts get-caller-identity'     # check your current identity/role
alias awsregion='aws configure get region'
alias ec2ls='aws ec2 describe-instances \
    --query "Reservations[*].Instances[*].{Name:Tags[?Key==\`Name\`]|[0].Value,ID:InstanceId,State:State.Name,IP:PublicIpAddress}" \
    --output table'                            # list EC2 instances as a table

# =============================================================================
# ALIASES — Misc
# =============================================================================
alias c='clear'
alias h='history'
alias path='echo -e ${PATH//:/\\n}'           # print PATH one entry per line
alias ports='ss -tulnp'                        # show listening ports
alias myip='curl -s ifconfig.me && echo'       # public IP
alias reload='source ~/.bashrc && echo "Reloaded!"'

# =============================================================================
# FUNCTIONS
# =============================================================================

# mkcd — make a directory and cd into it
mkcd() {
    mkdir -p "$1" && cd "$1"
}

# extract — universal archive extractor
extract() {
    if [ -f "$1" ]; then
        case "$1" in
            *.tar.bz2)   tar xjf "$1"    ;;
            *.tar.gz)    tar xzf "$1"    ;;
            *.tar.xz)    tar xJf "$1"    ;;
            *.bz2)       bunzip2 "$1"    ;;
            *.gz)        gunzip "$1"     ;;
            *.tar)       tar xf "$1"     ;;
            *.tbz2)      tar xjf "$1"    ;;
            *.tgz)       tar xzf "$1"    ;;
            *.zip)       unzip "$1"      ;;
            *.Z)         uncompress "$1" ;;
            *)           echo "'$1' cannot be extracted automatically" ;;
        esac
    else
        echo "'$1' is not a valid file"
    fi
}

# sshjump — connect to a private AWS instance via a bastion/proxy host
# Usage: sshjump <private-ip> <bastion-public-ip> [identity-file]
sshjump() {
    local target="$1"
    local bastion="$2"
    local key="${3:-$HOME/.ssh/id_rsa}"
    if [[ -z "$target" || -z "$bastion" ]]; then
        echo "Usage: sshjump <private-ip> <bastion-ip> [key-path]"
        return 1
    fi
    ssh -i "$key" -o ProxyJump="ubuntu@${bastion}" "ubuntu@${target}"
}

# gitignore — fetch a .gitignore template from gitignore.io
# Usage: gitignore python node >> .gitignore
gitignore() {
    curl -sL "https://www.toptal.com/developers/gitignore/api/$*"
}

# =============================================================================
# SSH AGENT  (starts agent if not already running — useful for ProxyJump)
# =============================================================================
if [ -z "$SSH_AUTH_SOCK" ]; then
    eval "$(ssh-agent -s)" > /dev/null
    ssh-add ~/.ssh/id_rsa 2>/dev/null
fi

# =============================================================================
# LOAD .bash_aliases if it exists (for machine-specific overrides)
# =============================================================================
if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# =============================================================================
# COMPLETIONS
# =============================================================================
if ! shopt -oq posix; then
    if [ -f /usr/share/bash-completion/bash_completion ]; then
        . /usr/share/bash-completion/bash_completion
    elif [ -f /etc/bash_completion ]; then
        . /etc/bash_completion
    fi
fi

# AWS CLI tab completion (if installed)
if command -v aws_completer &>/dev/null; then
    complete -C aws_completer aws
fi

