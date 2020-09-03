# File:         .zsh
# Author:       Erik Johannes Husom
# Description:  zsh configuration
# ============================================================================

# Common shell config (bash + zsh){{{
if [ -r ~/dotfiles/.shrc ]; then
   source ~/dotfiles/.shrc
fi
#}}}

# Tab completion for listing files and shell commands{{{
autoload -U compinit
zstyle ':completion:*' menu select
zmodload zsh/complist
compinit
_comp_options+=(globdots)
# }}}

# Prompt{{{
# PS1='%B%F{#af5b4e}%n%f@%F{#4eaf82}%m %F{#4e79af}%~%f %# %b'
PS1='%B%F{green}%n%f@%F{green}%m %F{green}%~%f %# %b'
alias simpleprompt="PS1='%~'"

# Enable themes
autoload -Uz promptinit
promptinit

# git status{{{
# Info: https://arjanvandergaag.nl/blog/customize-zsh-prompt-with-vcs-info.html
# %s    The current version control system, like git or svn.
# %r    The name of the root directory of the repository
# %S    The current path relative to the repository root directory
# %b    Branch information, like master
# %m    In case of Git, show information about stashes
# %u    Show unstaged changes in the repository
# %c    Show staged changes in the repository

autoload -Uz vcs_info

precmd_vcs_info() { vcs_info }
precmd_functions+=( precmd_vcs_info )

setopt prompt_subst

zstyle ':vcs_info:git:*' stagedstr '%F{yellow}●%f'
zstyle ':vcs_info:git:*' unstagedstr '%F{red}●%f'
zstyle ':vcs_info:git:*' check-for-changes true
# zstyle ':vcs_info:git:*' formats '%F{#af8c4e}(%b)%u%c%F{#af8c4e}%r%f '
zstyle ':vcs_info:git:*' formats '(%b)%u%c%r'
zstyle ':vcs_info:*' enable git

RPS1+=\$vcs_info_msg_0_
#}}}
#}}}

# add gnu coreutils{{{
# export PATH="$(brew --prefix coreutils)/libexec/gnubin:/usr/local/bin:$PATH"
#}}}

# aliases{{{
alias xdg-open="open"
alias chrome="open -a 'Google Chrome'"
alias chromium="open -a 'Chromium'"
alias vscode="open -a 'Visual Studio Code'"
alias vscodium="open -a 'VSCodium'"
#}}}

# vim bindings{{{
# bindkey -v
#}}}

# ls colors{{{
export CLICOLOR=1
export TERM=xterm-color 
#}}}

# escape brackets{{{
alias rake='noglob rake'
#}}}

# pyenv{{{
# eval "$(pyenv init -)"
#}}}

# ctags{{{
alias ctags="`brew --prefix`/bin/ctags"
#}}}

# adb fastboot{{{
if [ -d "$HOME/Downloads/platform-tools" ] ; then
 export PATH="$HOME/Downloads/platform-tools:$PATH"
fi
#}}}

# Ruby and Jekyll
export PATH="/usr/local/opt/ruby/bin:$PATH"
export PATH="$HOME/.gem/ruby/X.X.0/bin:$PATH"
export PATH="/Users/erikjohannes/.gem/ruby/2.7.0/bin:$PATH"
