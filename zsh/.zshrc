
autoload -U colors && colors

#set history settings
export HISTSIZE=10000
export SAVEHIST=10000
export HISTFILE=~/.cache/zsh/history

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
alias gvim='neovide'
alias yay='yay --sudoloop --editmenu'
alias luamake=/home/luke/sumneko_lua/3rd/luamake/luamake #generado por sumneko
alias clion=/opt/clion-2022.1.1/bin/clion.sh

# variables
export EDITOR=/usr/bin/nvim
export MANPAGER="nvim +Man!"
export PATH="$HOME/.cargo/bin:$HOME/.rbenv/plugins/ruby-build/bin:$HOME/.rbenv/bin:$(go env GOPATH)/bin:$HOME/dev/4coder:$HOME/Odin:$HOME/.local/bin:$PATH"
export PKG_CONFIG_PATH="$PKG_CONFIG_PATH:/usr/local/lib/pkgconfig"


# because rust is so good you need env variables to make it work properly
export WINIT_UNIX_BACKEND=x11

# sympy optimized backend
set USE_SYMENGINE=1

# xdg directories
export XDG_DATA_HOME=$HOME/.local/share
export XDG_CONFIG_HOME=$HOME/.config
export XDG_STATE_HOME=$HOME/.local/state
export XDG_CACHE_HOME=$HOME/.local/cache

source $HOME/Documents/dev/vulkansdk/1.3.239.0/setup-env.sh

source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
[[ -s /etc/profile.d/autojump.sh ]] && source /etc/profile.d/autojump.sh
eval "$(starship init zsh)"
eval "$(fnm env --use-on-cd)"
