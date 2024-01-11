# Export PATH
PATH="$PATH:/opt/homebrew/bin:$HOME/.docker/bin"

# homebrew autocomplete
if type brew &>/dev/null
then
  FPATH="$(brew --prefix)/share/zsh/site-functions:${FPATH}"

  autoload -Uz compinit
  compinit
fi

# tmux
[[ -z "$TMUX" && -z "$INTELLIJ_ENVIRONMENT_READER" ]] && exec tmux new-session -A -s default

# alias
alias ls='ls -lh --color=auto'
alias dir='dir --color=auto'
alias vdir='vdir --color=auto'
alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'

# public ip
alias pubip="dig +short TXT o-o.myaddr.l.google.com @ns1.google.com | tr -d '\"'"


# Save type history for completion and easier life
HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000
setopt appendhistory

# switch between arm and x64
alias arm="exec env /usr/bin/arch -arm64 /bin/zsh --login"
alias intel="exec env /usr/bin/arch -x86_64 /bin/zsh --login"

# start Starship
export STARSHIP_CONFIG=~/.dotfile/starship.toml
eval "$(starship init zsh)"

