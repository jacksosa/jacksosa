
# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:$HOME/.local/bin:/usr/local/bin:$PATH

# Path to your Oh My Zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time Oh My Zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="powerlevel10k/powerlevel10k"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in $ZSH/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment one of the following lines to change the auto-update behavior
# zstyle ':omz:update' mode disabled  # disable automatic updates
# zstyle ':omz:update' mode auto      # update automatically without asking
# zstyle ':omz:update' mode reminder  # just remind me to update when it's time

# Uncomment the following line to change how often to auto-update (in days).
# zstyle ':omz:update' frequency 13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# You can also set it to another string to have that shown instead of the default red dots.
# e.g. COMPLETION_WAITING_DOTS="%F{yellow}waiting...%f"
# Caution: this setting can cause issues with multiline prompts in zsh < 5.7.1 (see #5765)
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git z fzf sudo extract jsontools colored-man-pages zsh-autosuggestions zsh-syntax-highlighting zsh-history-substring-search)

# Keep the zsh completion cache out of $HOME
ZSH_COMPDUMP="$HOME/.cache/zsh/.zcompdump-${ZSH_VERSION}"

source $ZSH/oh-my-zsh.sh

# User configuration

# ssh-agent — cache SSH key passphrase for the session so git push/pull
# and commit signing don't prompt every time. Reuses an existing agent
# socket if present; otherwise starts a fresh one and loads the key.
if ! pgrep -u "$USER" ssh-agent > /dev/null; then
    eval "$(ssh-agent -s)" > /dev/null
fi
ssh-add -q ~/.ssh/id_ed25519 2>/dev/null

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='nvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch $(uname -m)"

# Set personal aliases, overriding those provided by Oh My Zsh libs,
# plugins, and themes. Aliases can be placed here, though Oh My Zsh
# users are encouraged to define aliases within a top-level file in
# the $ZSH_CUSTOM folder, with .zsh extension. Examples:
# - $ZSH_CUSTOM/aliases.zsh
# - $ZSH_CUSTOM/macos.zsh
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# Basic listings
alias ls='eza -alh --color=always'
alias ll='eza -lh --color=always'
alias la='eza -a --color=always'
alias l='eza -alh --color=always'
alias lt='eza -T --color=always'  # tree view
alias lsd='eza --group-directories-first'  # dirs first

# Viewing
alias cat='batcat'  # safer, colored cat
alias bcat='batcat' # alternative
alias less='batcat -p' # use bat for paging

# Navigation
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias ~='cd ~'
alias c='clear'
alias h='history'
alias j='z' # if z plugin is enabled, quick directory jump

# System & Package Management
alias update='sudo apt update && sudo apt upgrade -y'
alias upgrade='sudo apt upgrade -y'
alias install='sudo apt install'
alias remove='sudo apt remove'
alias autoremove='sudo apt autoremove -y'
alias reboot='sudo reboot'
alias shutdown='sudo shutdown now'

# Git Shortcuts
alias gs='git status'
alias ga='git add'
alias gc='git commit'
alias gca='git commit -a'
alias gp='git push'
alias gl='git log --oneline --graph --decorate --all'
alias gd='git diff'
alias gco='git checkout'

# Other
alias mkdir='mkdir -pv'  # verbose + create parent dirs
alias cp='cp -iv'        # interactive copy
alias mv='mv -iv'        # interactive move
alias rm='rm -iv'        # interactive remove
alias df='df -h'          # human-readable disk usage
alias du='du -h --max-depth=1' # human-readable folder sizes
alias ping='ping -c 5'    # default 5 pings
alias src='source ~/.zshrc'
alias myip='curl ifconfig.me'
alias update='sudo apt update && sudo apt upgrade && sudo apt autoremove --purge'
alias wezterm='flatpak run org.wezfurlong.wezterm'


# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# The Fuck
# eval "$(thefuck --alias)"

# SDKMAN
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"
alias antpm='antpm-downloader'

# Maven heap cap — prevents builds consuming unconstrained RAM
export MAVEN_OPTS="-Xmx768m -XX:+TieredCompilation"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

export PATH="$HOME/.local/bin:$PATH"

# Reasonix session history helpers

reasonix-shell-history() {
  local filter="$1"

  jq -r '
  select(.tool_calls) |
  .tool_calls[] |
  select(.name=="bash") |
  (.arguments | fromjson).command
  ' ~/.reasonix/projects/*/sessions/*.jsonl |
  if [[ -n "$filter" ]]; then
    grep -i "$filter"
  else
    cat
  fi
}

reasonix-history() {
  jq -r '
  select(.tool_calls) |
  .tool_calls[] |
  "\(.name): \(.arguments | fromjson)"
  ' ~/.reasonix/projects/*/sessions/*.jsonl
}

# Short aliases
alias rh='reasonix-history'
alias rsh='reasonix-shell-history'
