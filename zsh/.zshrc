
autoload -U colors && colors

#set history settings
HISTSIZE=10000
SAVEHIST=10000
HISTFILE=~/.cache/zsh/history

autoload -U compinit
zstyle ':completion:*' menu select
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
zmodload zsh/complist
compinit

#aliases
alias ls='exa'
alias la='exa -a'
alias ll='exa -la'
alias df='df -h'
alias vi=nvim
alias yay='yay --sudoloop --editmenu'
alias luamake=/home/luke/sumneko_lua/3rd/luamake/luamake #generado por sumneko

# variables
export EDITOR=/usr/bin/nvim
export MANPAGER="nvim +Man!"
export PATH="$(go env GOPATH)/bin:$HOME/Odin:$HOME/.local/bin:$PATH"

neofetch

source $HOME/dev/vulkan/1.2.198.1/setup-env.sh
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
[[ -s /etc/profile.d/autojump.sh ]] && source /etc/profile.d/autojump.sh
eval "$(starship init zsh)"

