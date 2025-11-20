# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ Settings ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

setopt globdots
setopt appendhistory
setopt sharehistory

# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ ENVs ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="robbyrussell"
FPATH="$HOME/.docker/completions:$FPATH"
DOTFILES="$HOME/.dotfiles"

# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ FZF-TAB ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

# Ensure colors match by using FZF_DEFAULT_OPTS.
zstyle ":fzf-tab:*" use-fzf-default-opts yes

# complete `ls` / `cat` / etc
zstyle ':fzf-tab:complete:(|/|*/)(ls|gls|bat|cat|cd|rm|cp|mv|ln|vim|code|open|tail|tree|source):*' \
  fzf-preview \
  '[[ -d $realpath ]] && ls --color=always "$realpath" ||
  bat --color=always --style=numbers --bind shift-up:preview-up,shift-down:preview-down "$realpath" 2>/dev/null'

# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ Plugins ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

plugins=(git mise direnv fzf-tab kubectl poetry-env poetry pre-commit
asdf encode64 fast-syntax-highlighting zsh-autosuggestions colorize )

source $ZSH/oh-my-zsh.sh
source <(fzf --zsh)

# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ Aliases ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

alias aws-poetry-login="$DOTFILES/scripts/aws-poetry-login"
alias path="$DOTFILES/scripts/path"

function poetry() {
  if [[ "$1" == "install" || "$1" == "update" || "$1" == "lock" ]]; then
    echo "🔐 Running aws-poetry-login before poetry $1..."
    aws-poetry-login
  fi

  command poetry "$@"
}

# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ Path ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

# Add custom paths after mise activation to ensure proper order
path=(
  $HOME/.local/bin
  $HOME/bin
  $HOME/.rd/bin
  $HOME/.local/share/mise/shims
  /Applications/PyCharm.app/Contents/MacOS
  $path
)

# Remove duplicates and non-existent directories
typeset -U path
path=($^path(N-/))
export PATH

# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ Completions ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

eval "$(mise activate zsh)"

# Generate uv completions (now that uv is in PATH)
eval "$(uv generate-shell-completion zsh)"

autoload -Uz compinit
compinit
