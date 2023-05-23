# Created by Zap installer
[ -f "${XDG_DATA_HOME:-$HOME/.local/share}/zap/zap.zsh" ] && source "${XDG_DATA_HOME:-$HOME/.local/share}/zap/zap.zsh"

export PATH="$HOME/.config/bin:$HOME/.config/neovim/bin:$HOME/go/bin:$HOME/dotfiles/bin:$PATH"

# Path to your zsh file
export ZSH="$HOME/.zshrc"

plug "zsh-users/zsh-autosuggestions"
plug "zap-zsh/supercharge"
plug "zap-zsh/exa"
plug "spaceship-prompt/spaceship-prompt"
plug "zsh-users/zsh-syntax-highlighting"
plug "agkozak/zsh-z"

fpath=(~/.zsh.d/ $fpath)

# aliases
alias yw="yarn workspace"
alias cat="bat"
alias vim="nvim"
alias t="tmux"
alias ts="tmux-sessionizer"
alias e="exit"
alias mv="mv -iv"
alias tmuxrc="vim ~/.tmux.conf"
alias vimrc="vim ~/.config/nvim/init.vim"
alias zshrc="vim ~/.zshrc"
alias szshrc="exec zsh"
alias packer="cd $HOME/.local/share/nvim/site/pack/packer"
alias inkdrop="cd $HOME/Library/Application\ Support/inkdrop"

eval "$(fnm env --use-on-cd)"

if [ -f $HOME/.zsh_private ]; then
    source ~/.zsh_private
else
    print "404: ~/.zsh_private not found."
fi

source "$HOME/.zsh/functions.zsh"

# Load and initialise completion system
autoload -Uz compinit
compinit

