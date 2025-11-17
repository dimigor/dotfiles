export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="robbyrussell"

# Ensure colors match by using FZF_DEFAULT_OPTS.
zstyle ":fzf-tab:*" use-fzf-default-opts yes
# Preview file contents when tab completing directories.
zstyle ":fzf-tab:complete:cd:*" fzf-preview "ls --color=always \${realpath}"

plugins=(git mise direnv fzf-tab kubectl poetry-env poetry pre-commit
asdf encode64 fast-syntax-highlighting zsh-autosuggestions )

source $ZSH/oh-my-zsh.sh

alias aws-poetry-login="~/.aws-poetry-login.sh"

function poetry() {
  if [[ "$1" == "install" || "$1" == "update" || "$1" == "lock" ]]; then
    echo "🔐 Running aws-poetry-login before poetry $1..."
    aws-poetry-login
  fi

  command poetry "$@"
}

export PATH="$HOME/.local/bin:$PATH"
export PATH="/Applications/PyCharm.app/Contents/MacOS:$PATH"
export PATH="/Users/d.gorbachevskyy/.rd/bin:$PATH"

source <(fzf --zsh)
eval "$(/Users/d.gorbachevskyy/.local/bin/mise activate zsh)"
eval "$(uv generate-shell-completion zsh)"

FPATH="$HOME/.docker/completions:$FPATH"
autoload -Uz compinit
compinit
