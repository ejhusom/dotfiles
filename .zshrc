# zsh configuration

# common shell config (bash + zsh){{{
if [ -r ~/dotfiles/.shrc ]; then
   source ~/dotfiles/.shrc
fi
#}}}

# prompt{{{
# PROMPT='%B%F{blue}%n@%m %~ %# %f%b'
PROMPT='%B%F{blue}%m %~ %# %f%b'
#}}}

# add gnu coreutils{{{
# export PATH="$(brew --prefix coreutils)/libexec/gnubin:/usr/local/bin:$PATH"
#}}}

# git status{{{
autoload -Uz vcs_info
precmd_vcs_info() { vcs_info }
precmd_functions+=( precmd_vcs_info )
setopt prompt_subst
PROMPT+=\$vcs_info_msg_0_
zstyle ':vcs_info:git:*' formats '%F{230}(%b)%r%f '
zstyle ':vcs_info:*' enable git
#}}}
