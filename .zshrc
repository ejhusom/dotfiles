# Visual configuration
# PROMPT='%F{blue} %# '
PROMPT='%B%F{blue}%n@%m %~ %# %f%b'

if [ -r ~/dotfiles/.shrc ]; then
   source ~/dotfiles/.shrc
fi

# export PATH="$(brew --prefix coreutils)/libexec/gnubin:/usr/local/bin:$PATH"
