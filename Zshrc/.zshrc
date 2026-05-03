# ============================================================
# .zshrc - John's Shell Configuration
# ============================================================

# ----
# History
# ----
HISTSIZE=10000
SAVEHIST=10000
setopt HIST_IGNORE_DUPS
setopt HIST_IGNORE_SPACE

# ----
# Git Aliases
# ----
alias gs="git status"
alias ga="git add ."
alias gc="git commit -m"
alias gp="git push"
alias gpl="git pull"

# ----
# Navigation
# ----
alias ll="ls -la"
alias ..="cd .."
alias ...="cd ../.."

# ----
# Homebrew
# ----
export PATH="/opt/homebrew/bin:$PATH"

# ----
# Starship Prompt
# ----
eval "$(starship init zsh)"

# ----
# Plugins
# ----
source /opt/homebrew/share/zsh-autosuggestions/zsh-autosuggestions.zsh
source /opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh


