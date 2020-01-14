# zsh configuration

# common shell config (bash + zsh){{{
if [ -r ~/dotfiles/.shrc ]; then
   source ~/dotfiles/.shrc
fi
#}}}

# prompt{{{
# PROMPT='%B%F{#cc0000}%m%f %F{#4e79af}%~%f %# %b'
PROMPT='%B%F{#af5b4e}%m%f %F{#4e79af}%~%f %# %b'
#}}}

# add gnu coreutils{{{
# export PATH="$(brew --prefix coreutils)/libexec/gnubin:/usr/local/bin:$PATH"
#}}}

# git status{{{
autoload -Uz vcs_info
precmd_vcs_info() { vcs_info }
precmd_functions+=( precmd_vcs_info )
setopt prompt_subst
RPROMPT+=\$vcs_info_msg_0_
zstyle ':vcs_info:git:*' formats '%F{#af8c4e}(%b)%r%f '
zstyle ':vcs_info:*' enable git
#}}}

# aliases{{{
alias xdg-open="open"
#}}}

# vim bindings{{{
#bindkey -v
#}}}

# ls colors{{{
export CLICOLOR=1
export TERM=xterm-color 
#}}}
