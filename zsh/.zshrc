# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="sorin"
DEFAULT_USER="tmoss"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

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
 COMPLETION_WAITING_DOTS="true"

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
plugins=(autopep8 bundler command-not-found docker gem git pip python ruby screen sudo vagrant svn-fast-info zsh-syntax-highlighting)

source $ZSH/oh-my-zsh.sh

# User configuration

export PATH="/usr/bin:/bin:/home/tmoss/.rbenv/bin:/home/tmoss/.rbenv/shims:/usr/bin:/bin:/home/tmoss/.rbenv/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/sbin:/usr/games:/usr/local/games"
# export MANPATH="/usr/local/man:$MANPATH"

source ~/.shell-helpers/environment-variables
source ~/.shell-helpers/aliases
source ~/.shell-helpers/prompt-functions
source ~/.shell-helpers/colors

eval "$(rbenv init -)"
cdpath=(.. ~)

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
 if [[ -n $SSH_CONNECTION ]]; then
   export EDITOR='vim'
 else
   export EDITOR='mvim'
 fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/dsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

alias ls='ls --group-directories-first --indicator-style=file-type --color=auto'
alias -g '...'='../..'
alias -g '....'='../../..'
alias -g BG='& exit'
alias -g G='|grep'
alias -g H='|head'
alias -g L='|less'
alias -g T='|tail'

alias vpn="nmcli con up uuid 1758de93-3a65-4571-9828-97f95707bb03"
alias lock="xscreensaver-command -lock"
alias mkcd=". /home/tmoss/.mkcd"

# Misc.
memusage() {
    ps aux | awk '{if (NR > 1) print $5;
                   if (NR > 2) print "+"}
                   END { print "p" }' | dc
}
alias group_update="exec su -l $USER"
export DYN_CHEF_DATA="${HOME}/work/cookbooks/dyn_chef_data"
export SSL_CERT_FILE="${DYN_CHEF_DATA}/config/cacert.pem"
export DRIVER_PLUGIN="vagrant"

function chpwd() {
	emulate -L zsh
   	ls -A
}
