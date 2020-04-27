source $HOME/.profile

export ZSH="$HOME/.config/oh-my-zsh"

if [ -f $HOME/.config/personal/pre.zshrc ]; then
  source $HOME/.config/personal/pre.zshrc
fi

if [ -f $HOME/.config/hackistan/private/hackistan.rc ]; then
  source $HOME/.config/hackistan/private/hackistan.rc
fi

source $ZSH/oh-my-zsh.sh

if [ -f $HOME/.config/personal/post.zshrc ]; then
  source $HOME/.config/personal/post.zshrc
fi
