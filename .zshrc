# ===========
# ZSH Settings
# ===========

# vi mode
bindkey -v

source ~/.zsh/config.zsh

# directory navigation stack
setopt auto_pushd

# Z config
source /usr/local/Cellar/z/1.9/etc/profile.d/z.sh

# HISTORY
HISTSIZE=10000
SAVEHIST=9000
HISTFILE=~/.zsh_history

# ============
# Shell Settings
# =============

# PATH
export PATH="/Users/samarjeet/Desktop/Development/Repos/misc-cli/scripts:$HOME/.npm-packages/bin:/usr/local/sbin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"
export NODE_PATH="/usr/local/lib/node_modules"
export ARCH_DIR="/Users/samarjeet/Desktop/Archives"

# vim
# alias for gcc
alias gcc='gcc-10'
alias g++='g++-10'
alias c++='c++-10'

# pnpm alias
alias pm='pnpm'
alias px='pnpx'

export GIT_EDITOR=vim

test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"
export NPM_PACKAGES=/Users/samarjeet/.npm-packages
export NODE_PATH="$NPM_PACKAGES/lib/node_modules:$HOME/.config/yarn/global/node_modules:$NODE_PATH"

export DS2_DIR="/Users/samarjeet/Desktop/Development/Tools/ds2/bin/db_test"

# Android SDK
export PATH=~/Library/Android/sdk/tools:$PATH
export PATH=~/Library/Android/sdk/platform-tools:$PATH

function fcd {
	if [[ -d "$1" ]]; then
		cd $1
	else
		dn=$(dirname "$1")
		cd $dn
	fi 
}

function h {
	`cat ~/.zsh_history | fzf`
}

function pdfcompress { 
	gs -sDEVICE=pdfwrite -dCompatibilityLevel=1.4 -dPDFSETTINGS=/screen -dNOPAUSE -dQUIET -dBATCH  -sOutputFile=$1.compressed.pdf $1; 
}

# Calculate lines of code in a git repository
function loc {
	git ls-files | xargs wc -l
}
# syntax highlight
source "/usr/local/Cellar/zsh-syntax-highlighting/0.7.1/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh" 

# for clangd
export PATH="/usr/local/opt/llvm/bin:$PATH"
#export PATH="$PATH":"/usr/local/Caskroom/flutter/latest/flutter/.pub-cache/bin"
export PATH="$PATH":"/usr/local/Caskroom/flutter/latest/flutter/bin"
export PATH="$PATH":"/usr/local/Caskroom/flutter/latest/flutter/bin/cache/dart-sdk/bin"


function zerotier-up {
	sudo launchctl load /Library/LaunchDaemons/com.zerotier.one.plist
}
function zerotier-down {
	sudo launchctl unload /Library/LaunchDaemons/com.zerotier.one.plist
}

export PATH="$PATH":"/usr/local/opt/python@3.7/bin" 

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && . "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
VIRTUALENVWRAPPER_PYTHON=$(which python3)
