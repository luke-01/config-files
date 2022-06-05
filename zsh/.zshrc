
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
alias clion=/opt/clion-2022.1.1/bin/clion.sh

# variables
export EDITOR=/usr/bin/nvim
export GEM_HOME="$(ruby -e 'puts Gem.user_dir')"
export MANPAGER="nvim +Man!"
export PATH="$GEM_HOME/bin:$(go env GOPATH)/bin:$HOME/Odin:$HOME/.local/bin:$PATH"
export PKG_CONFIG_PATH="$PKG_CONFIG_PATH:/usr/local/lib/pkgconfig"

neofetch

source $HOME/dev/vulkan/1.3.211.0/setup-env.sh
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
[[ -s /etc/profile.d/autojump.sh ]] && source /etc/profile.d/autojump.sh
eval "$(starship init zsh)"

