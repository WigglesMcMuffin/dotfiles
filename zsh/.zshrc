(( ${+commands[direnv]} )) && emulate zsh -c "$(direnv export zsh)"
if ! pgrep -u "$USER" ssh-agent > /dev/null; then
    ssh-agent -t 4h > "$XDG_RUNTIME_DIR/ssh-agent.env"
fi
if [ ! -f "$SSH_AUTH_SOCK" ]; then
    source "$XDG_RUNTIME_DIR/ssh-agent.env" >/dev/null
fi

# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Nix
if [ -e '/nix/var/nix/profiles/default/etc/profile.d/nix-daemon.sh' ]; then
    . '/nix/var/nix/profiles/default/etc/profile.d/nix-daemon.sh'
fi

(( ${+commands[direnv]} )) && emulate zsh -c "$(direnv hook zsh)"

export ZSH=$HOME/.oh-my-zsh
COMPLETION_WAITING_DOTS="true"
export vim="nvim"
export BROWSER=qutebrowser
plugins=(
  direnv
  eza
  git
  zsh-autosuggestions
  zsh-syntax-highlighting
)
source $ZSH/oh-my-zsh.sh

# =============================================================================
#                                Path Fixing
# =============================================================================

if [ -d "$HOME/programming/go" ]; then
  export GOPATH="$HOME/programming/go"
  export PATH="$GOPATH/bin:$PATH:/usr/local/go/bin"
fi
[ -d "$HOME/bin" ] && export PATH="$HOME/bin:$PATH"
[ -d ${HOME}/.krew/bin ] && export PATH="$PATH:${HOME}/.krew/bin"
[ -d "/opt/chef-workstation/embedded/bin" ] && export PATH="/opt/chef-workstation/embedded/bin:$PATH"
if [ -d "/opt/chef-workstation/bin" ]; then
  export PATH="/opt/chef-workstation/bin:$PATH"
  eval "$(chef shell-init zsh)"
fi

# =============================================================================
#                                   Variables
# =============================================================================

export LANG="en_US.UTF-8"
export LC_ALL="en_US.UTF-8"

# =============================================================================
#                                   Plugins
# =============================================================================
# Check if zplug is installed

[ ! -d ~/.zplug ] && git clone https://github.com/zplug/zplug ~/.zplug
source ~/.zplug/init.zsh

# zplug
zplug 'zplug/zplug', hook-build:'zplug --self-manage'

zplug "plugins/colored-man-pages", from:oh-my-zsh
zplug "plugins/colorize", from:oh-my-zsh
zplug "plugins/tmux", from:oh-my-zsh
zplug "plugins/tmuxinator", from:oh-my-zsh
zplug "plugins/z", from:oh-my-zsh
zplug "plugins/git", from:oh-my-zsh

# plugins

# You should use
zplug "MichaelAquilina/zsh-you-should-use"

# Enhanced cd
zplug "b4b4r07/enhancd", use:enhancd.sh

# Docker completion
zplug "felixr/docker-zsh-completion"

# Simple zsh calculator
zplug "arzzen/calc.plugin.zsh"

# ZSH completions for direnv
zplug "BronzeDeer/zsh-completion-sync", use:zsh-completion-sync.plugin.zsh

# Directory colors
zplug "seebi/dircolors-solarized", ignore:"*", as:plugin

zplug "romkatv/powerlevel10k", as:theme, depth:1


# Install plugins if there are plugins that have not been installed
if ! zplug check --verbose; then
    printf "Install plugins? [y/N]: "
    if read -q; then
        echo; zplug install
    fi
fi

# Then, source plugins and add commands to $PATH
zplug load

# dircolors
if zplug check "seebi/dircolors-solarized"; then
  if which gdircolors &> /dev/null; then
	alias dircolors='() { $(whence -p gdircolors) }'
  fi
  if which dircolors &> /dev/null; then
    scheme="dircolors.256dark"
    eval $(dircolors ~/.zplug/repos/seebi/dircolors-solarized/$scheme)
  fi
fi

# Load zsh-completion-sync
#if zplug check "BronzeDeer/zsh-completion-sync"; then
#
#fi

# highlighting
if zplug check "zsh-users/zsh-syntax-highlighting"; then
	ZSH_HIGHLIGHT_HIGHLIGHTERS=(main brackets pattern cursor)
	ZSH_HIGHLIGHT_PATTERNS=('rm -rf *' 'fg=white,bold,bg=red')

	typeset -A ZSH_HIGHLIGHT_STYLES
	ZSH_HIGHLIGHT_STYLES[cursor]='bg=yellow'
	ZSH_HIGHLIGHT_STYLES[globbing]='none'
	ZSH_HIGHLIGHT_STYLES[path]='fg=white'
	ZSH_HIGHLIGHT_STYLES[path_pathseparator]='fg=grey'
	ZSH_HIGHLIGHT_STYLES[alias]='fg=cyan'
	ZSH_HIGHLIGHT_STYLES[builtin]='fg=cyan'
	ZSH_HIGHLIGHT_STYLES[function]='fg=cyan'
	ZSH_HIGHLIGHT_STYLES[command]='fg=green'
	ZSH_HIGHLIGHT_STYLES[precommand]='fg=green'
	ZSH_HIGHLIGHT_STYLES[hashed-command]='fg=green'
	ZSH_HIGHLIGHT_STYLES[commandseparator]='fg=yellow'
	ZSH_HIGHLIGHT_STYLES[redirection]='fg=magenta'
	ZSH_HIGHLIGHT_STYLES[bracket-level-1]='fg=cyan,bold'
	ZSH_HIGHLIGHT_STYLES[bracket-level-2]='fg=green,bold'
	ZSH_HIGHLIGHT_STYLES[bracket-level-3]='fg=magenta,bold'
	ZSH_HIGHLIGHT_STYLES[bracket-level-4]='fg=yellow,bold'
fi

# Theme setup
# =============================================================================
#                                 Theme Setup
# =============================================================================

# Easily switch primary foreground/background colors
DEFAULT_FOREGROUND=006 DEFAULT_BACKGROUND=235
DEFAULT_COLOR=$DEFAULT_FOREGROUND

# =============================================================================
#                                   Options
# =============================================================================

# improved less option
export LESS="--tabs=4 --no-init --LONG-PROMPT --ignore-case --quit-if-one-screen --RAW-CONTROL-CHARS"
export YSU_HARDCORE=1

# History
HISTFILE=~/.zsh_history
HISTSIZE=100000
SAVEHIST=100000

setopt autocd                   # Allow changing directories without `cd`
setopt append_history           # Dont overwrite history
setopt extended_history         # Also record time and duration of commands.
setopt share_history            # Share history between multiple shells
setopt hist_expire_dups_first   # Clear duplicates when trimming internal hist.
setopt hist_find_no_dups        # Dont display duplicates during searches.
setopt hist_ignore_dups         # Ignore consecutive duplicates.
setopt hist_ignore_all_dups     # Remember only one unique copy of the command.
setopt hist_reduce_blanks       # Remove superfluous blanks.
setopt hist_save_no_dups        # Omit older commands in favor of newer ones.

# Changing directories
#setopt auto_pushd
setopt pushd_ignore_dups        # Dont push copies of the same dir on stack.
setopt pushd_minus              # Reference stack entries with "-".

setopt extended_glob

# =============================================================================
#                                Key Bindings
# =============================================================================

# Common CTRL bindings.
bindkey "^a" beginning-of-line
bindkey "^e" end-of-line
bindkey "^f" forward-word
bindkey "^b" backward-word
bindkey "^k" kill-line
bindkey "^d" delete-char
bindkey "^y" accept-and-hold
bindkey "^w" backward-kill-word
bindkey "^u" backward-kill-line

# Do not require a space when attempting to tab-complete.
bindkey "^i" expand-or-complete-prefix

# Fixes for alt-backspace and arrows keys
bindkey '^[^?' backward-kill-word
bindkey "^[[1;5C" forward-word
bindkey "^[[1;5D" backward-word

# =============================================================================
#                                   Startup
# =============================================================================

# Load SSH and GPG agents via keychain.
setup_agents() {
  [[ $UID -eq 0 ]] && return

  if which keychain &> /dev/null; then
	local -a ssh_keys gpg_keys
	for i in ~/.ssh/**/*pub; do test -f "$i(.N:r)" && ssh_keys+=("$i(.N:r)"); done
	gpg_keys=$(gpg -K --with-colons 2>/dev/null | awk -F : '$1 == "sec" { print $5 }')
    if (( $#ssh_keys > 0 )) || (( $#gpg_keys > 0 )); then
	  alias run_agents='() { $(whence -p keychain) --quiet --eval --inherit any-once --agents ssh,gpg $ssh_keys ${(f)gpg_keys} }'
	  #[[ -t ${fd:-0} || -p /dev/stdin ]] && eval `run_agents`
	  unalias run_agents
    fi
  fi
}

setup_agents
unfunction setup_agents

# Source local zsh customizations.
[[ -f ~/.zsh_rclocal ]] && source ~/.zsh_rclocal

# Source functions and aliases.
[[ -f ~/.zsh_functions ]] && source ~/.zsh_functions
[[ -f ~/.zsh_aliases ]] && source ~/.zsh_aliases
[[ -f ~/.zsh_aws ]] && source ~/.zsh_aws
