# ------------------------------
# Basic shell options
# ------------------------------
setopt AUTO_CD
setopt HIST_IGNORE_DUPS
setopt SHARE_HISTORY
setopt EXTENDED_HISTORY
HISTSIZE=5000
SAVEHIST=5000
HISTFILE=~/.zsh_history

# Source Znap at the start of your .zshrc file.
[[ -d ~/.zsh-plugins ]] || mkdir ~/.zsh-plugins
[[ -r ~/.zsh-plugins/znap/znap.zsh ]] ||
    git clone --depth 1 -- https://github.com/marlonrichert/zsh-snap.git ~/.zsh-plugins/znap
# znap will handle pulling all required plugins itself
source ~/.zsh-plugins/znap/znap.zsh

# ------------------------------
# Load your plugins with `znap source`.
# ------------------------------
znap source marlonrichert/zsh-hist
bindkey '^[q' push-line-or-edit
bindkey -r '^Q' '^[Q'

ZSH_AUTOSUGGEST_STRATEGY=( history )
znap source zsh-users/zsh-autosuggestions

ZSH_HIGHLIGHT_HIGHLIGHTERS=( main brackets )
znap source zsh-users/zsh-syntax-highlighting

znap source marlonrichert/zsh-autocomplete
znap source marlonrichert/zsh-edit

# ------------------------------
# Prompt (bira-inspired)
# ------------------------------

autoload -U colors vcs_info
colors
setopt prompt_subst

# Git info
zstyle ':vcs_info:git:*' formats '%F{yellow}‹%b%u›%f'
zstyle ':vcs_info:git:*' actionformats '%F{yellow}‹%b|%a%u›%f'
zstyle ':vcs_info:git:*' unstagedstr '*'
zstyle ':vcs_info:git:*' stagedstr '+'
zstyle ':vcs_info:*' enable git
zstyle ':vcs_info:*' check-for-changes true

precmd() { vcs_info }

build_prompt() {
  local user_color host_color arrow_color

  # Root vs normal user
  if [[ $EUID -eq 0 ]]; then
    user_color='%F{red}'
    arrow_color='%F{red}'
  else
    user_color='%F{green}'
    arrow_color='%f'
  fi

  # SSH detection
  if [[ -n "$SSH_CONNECTION" ]]; then
    host_color='%F{red}'
  else
    host_color='%F{green}'
  fi

  local user_host="${user_color}%n%f%F{cyan}@${host_color}%m%f"
  local current_dir="%B%F{blue}%~%f%b"
  local git_branch="${vcs_info_msg_0_}"

  local return_code="%(?..%F{red}%? ↵%f)"
  local venv=""
  if [[ -n "$VIRTUAL_ENV" ]]; then
    venv="%F{red}(${VIRTUAL_ENV:t})%f "
  fi

PROMPT="╭─${venv}${user_host} ${current_dir} ${git_branch}
╰─${arrow_color}➤  %f"

  RPROMPT="${return_code}"
}

precmd_functions+=(build_prompt)

# ------------------------------
# Cache the output of slow commands with `znap eval`.
# ------------------------------

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

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
if [[ -d '${HOME}/miniconda3' ]]; then
__conda_setup="$('${HOME}/miniconda3/bin/conda' 'shell.bash' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "$HOME/miniconda3/etc/profile.d/conda.sh" ]; then
        . "$HOME/miniconda3/etc/profile.d/conda.sh"
    else
        export PATH="$HOME/miniconda3/bin:$PATH"
    fi
fi
unset __conda_setup
fi
# <<< conda initialize <<<
# History Ignore
export HISTORY_IGNORE="pwd:ls"

# Install Ruby Gems to local
export GEM_HOME=$HOME/gems
export PATH=$HOME/gems/bin:$PATH

[ -f "/home/ba13/.ghcup/env" ] && . "/home/ba13/.ghcup/env" # ghcup-env

export NVM_DIR="$HOME/.config/nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

. "$HOME/.local/share/../bin/env"
