DEFAULT_USER=Mac
# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh
export TERM="xterm-256color"
# it'll load a random theme each time that oh-my-zsh is loaded.
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
# ZSH_THEME="agnoster"
ZSH_THEME="powerlevel9k/powerlevel9k"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git git-open)

source $ZSH/oh-my-zsh.sh

# User configuration
# ----------------------------------------------------------------------------------

# Path
export PATH="$HOME/.rbenv/bin:$PATH"
  if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi

export PATH=$PATH:/Applications/Postgres.app/Contents/Versions/latest/bin

# export PATH="$HOME/bin/cc-test-reporter"

# Potentially useful path in the future
# export PATH="/usr/local/opt/qt@5.5/bin:$PATH"
# export PATH="/usr/local/Cellar/chromedriver/2.30/bin:$PATH"
# ----------------------------------------------------------------------------------

# Git Editor setting (won't work without having macvim installed)
# export GIT_EDITOR='/Applications/MacVim.app/Contents/MacOS/Vim -f '
export GIT_EDITOR='nvim'
# ----------------------------------------------------------------------------------

# Alias
alias aadrop='cd $HOME/Dropbox/AppAcademy'
alias dev='cd ~/practicaldeveloper'
alias be='bundle exec'
alias bs='bin/rails s'
alias bc='bin/rails c'
alias bt='bin/rspec'
alias br='bin/rake'
alias bgu='bin/guard'
alias mvim='/Applications/MacVim.app/Contents/MacOS/Vim'
alias vimrc='nvim ~/.vimrc'
alias zshrc='nvim ~/.zshrc'
alias dot='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'
# ----------------------------------------------------------------------------------

# NVM
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm
# ----------------------------------------------------------------------------------

# disabling flow controler
stty -ixon
# ----------------------------------------------------------------------------------

# FZF
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
# ----------------------------------------------------------------------------------
