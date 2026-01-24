# To apply changes, open a new terminal or restart your shell.

##
# Source Znap at the start of your .zshrc file.
#
[[ -r ~/.zsh-plugins/znap/znap.zsh ]] ||
    git clone --depth 1 -- https://github.com/marlonrichert/zsh-snap.git ~/.zsh-plugins/znap
source ~/.zsh-plugins/znap/znap.zsh


# `znap prompt` also supports Oh-My-Zsh themes. Just make sure you load the
# required libs first:
znap source ohmyzsh/ohmyzsh

# znap prompt sindresorhus/pure
znap prompt ohmyzsh/ohmyzsh themes/gnzh

##
# Load your plugins with `znap source`.
#
# You can also choose to load one or more files specifically:
znap source sorin-ionescu/prezto modules/{environment,history}

# No special syntax is needed to configure plugins. Just use normal Zsh
# statements:

znap source marlonrichert/zsh-hist
bindkey '^[q' push-line-or-edit
bindkey -r '^Q' '^[Q'

ZSH_AUTOSUGGEST_STRATEGY=( history )
znap source zsh-users/zsh-autosuggestions

ZSH_HIGHLIGHT_HIGHLIGHTERS=( main brackets )
znap source zsh-users/zsh-syntax-highlighting

znap source marlonrichert/zsh-autocomplete
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

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
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
