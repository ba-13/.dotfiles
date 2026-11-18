# ------------------------------
# Basic shell options
# ------------------------------
# setopt AUTO_CD
setopt HIST_IGNORE_DUPS
setopt SHARE_HISTORY
setopt EXTENDED_HISTORY
HISTSIZE=50000
SAVEHIST=50000
HISTFILE=~/.zsh_history

# Source Znap at the start of your .zshrc file.
[[ -d ~/.zsh-plugins ]] || mkdir ~/.zsh-plugins
[[ -r ~/.zsh-plugins/znap/znap.zsh ]] ||
    git clone --depth 1 -- https://github.com/marlonrichert/zsh-snap.git ~/.zsh-plugins/znap
# znap will handle pulling all required plugins itself
source ~/.zsh-plugins/znap/znap.zsh

znap source ohmyzsh/ohmyzsh

# you might need to remove the compiled file *.zwc if you see garbled text
# znap prompt sindresorhus/pure
znap prompt spaceship-prompt/spaceship-prompt

##
# Load your plugins with `znap source`.
#
# You can also choose to load one or more files specifically:

# No special syntax is needed to configure plugins. Just use normal Zsh
# statements:

bindkey '^[q' push-line-or-edit
bindkey -r '^Q' '^[Q'

ZSH_AUTOSUGGEST_STRATEGY=( history )
ZSH_AUTOSUGGEST_BUFFER_MAX_SIZE=20
ZSH_AUTOSUGGEST_USE_ASYNC=1
znap source zsh-users/zsh-autosuggestions

ZSH_HIGHLIGHT_HIGHLIGHTERS=( main brackets )
znap source zsh-users/zsh-syntax-highlighting

# Standard completion with cached dump (replaces zsh-autocomplete, which ran on every keystroke)
autoload -Uz compinit
if [[ -n ~/.zcompdump(#qN.mh+24) ]]; then compinit; else compinit -C; fi
znap source marlonrichert/zsh-edit

##
# Cache the output of slow commands with `znap eval`.
#

# If the first arg is a repo, then the command will run inside it. Plus,
# whenever you update a repo with `znap pull`, its eval cache gets regenerated
# automatically.
# znap eval trapd00r/LS_COLORS "$( whence -a dircolors gdircolors ) -b LS_COLORS"

# The cache gets regenerated, too, when the eval command has changed. For
# example, here we include a variable. So, the cache gets invalidated whenever
# this variable has changed.
# znap source marlonrichert/zcolors
# znap eval   marlonrichert/zcolors "zcolors ${(q)LS_COLORS}"

# Combine `znap eval` with `curl` or `wget` to download, cache and source
# individual files:
# znap eval omz-git 'curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/plugins/git/git.plugin.zsh'


##
# Defer initilization code with lazily loaded functions created by
# `znap function`.
#

if [ -f ~/.aliases ]; then
	source ~/.aliases
fi

# Personal paths
export PATH="$HOME/bin:$PATH"
export PATH="$HOME/mybin:$PATH"
export PATH="$HOME/.local/bin:$PATH"
export PATH="$HOME/Applications:$PATH"

# History Ignore
export HISTORY_IGNORE="pwd|ls"

# Install Ruby Gems to local
export GEM_HOME=$HOME/gems
export PATH=$HOME/gems/bin:$PATH


export NVM_DIR="$HOME/.config/nvm"
# ln -sfn .config/nvm/versions/node/vx.y.z to this file
export PATH="$NVM_DIR/current/bin:$PATH"
# Lazy-load nvm on first use
_nvm_lazy() {
  unset -f nvm node npm npx _nvm_lazy
  [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
  [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"
}
for _c in nvm node npm npx; do eval "$_c() { _nvm_lazy; $_c \"\$@\"; }"; done
unset _c

. "$HOME/.local/share/../bin/env"

export SSH_AUTH_SOCK="$XDG_RUNTIME_DIR/ssh-agent.socket"
[ -f "/home/ba13/.ghcup/env" ] && . "/home/ba13/.ghcup/env" # ghcup-env

# Tab completes without expanding $VARS into their values
# (znap defaults the completer to _expand, which offers the expanded path)
zstyle ':completion:*' completer _complete _ignored
bindkey '^I' expand-or-complete

# fzf: fuzzy Ctrl+R history search (and Ctrl+T / Alt+C)
[ -f /usr/share/doc/fzf/examples/key-bindings.zsh ] && source /usr/share/doc/fzf/examples/key-bindings.zsh
export FZF_CTRL_R_OPTS="--height 40% --layout=reverse"
