PATH=/usr/local/bin:/usr/local/sbin:~/bin:/Applications/Racket\ v6.1.1/bin:/usr/local/heroku/bin:~/play/adt-bundle-mac-x86_64-20140702/sdk/tools:~/play/adt-bundle-mac-x86_64-20140702/sdk/platform-tools:$PATH

export PGHOST=localhost

zstyle ':completion:*:*:git:*' script ~/.zsh/git-completion.bash
fpath=(~/.zsh $fpath)
autoload -U compinit && compinit


alias tmux='tmux -2'
alias be="bundle exec "
alias bi="bundle install"
alias reload="source ~/.zshrc"
alias config="vim ~/.zshrc"
alias mongodb="mongod --config /usr/local/etc/mongod.conf"
alias postgres="postgres -D /usr/local/var/postgres"
alias ga='git add'
alias gps='git push'
alias gl='git log'
alias gs='git status'
alias gd='git diff'
alias gdc='git diff --cached'
alias gm='git commit -m'
alias gma='git commit -am'
alias gb='git branch'
alias gc='git checkout'
alias gra='git remote add'
alias grr='git remote rm'
alias gpl='git pull'
alias gpr='git pull --rebase'
alias gcl='git clone'
alias ll='ls -hal | more'
PGDATA=/usr/local/var/postgres


eval "$(rbenv init -)"

autoload colors; colors;
export LSCOLORS="Gxfxcxdxbxegedabagacad"
setopt prompt_subst
setopt autocd

ZSH_THEME_GIT_PROMPT_PREFIX="git:(%{$fg[red]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[blue]%}) %{$fg[yellow]%}✗%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_CLEAN="%{$fg[blue]%})"

local ret_status="%(?:%{$fg_bold[green]%}➜ :%{$fg_bold[red]%}➜ %s)"

PROMPT='${ret_status}%{$fg_bold[green]%}%p %{$fg[cyan]%}%c %{$fg_bold[blue]%}$(git_prompt_info)%{$fg_bold[blue]%} % %{$reset_color%}'

# get the name of the branch we are on
git_prompt_info() {
  ref=$(command git symbolic-ref HEAD 2> /dev/null) || \
  ref=$(command git rev-parse --short HEAD 2> /dev/null) || return
  echo "$ZSH_THEME_GIT_PROMPT_PREFIX${ref#refs/heads/}$(parse_git_dirty)$ZSH_THEME_GIT_PROMPT_SUFFIX"
}

# Checks if working tree is dirty
parse_git_dirty() {
  if command git diff --quiet HEAD 2> /dev/null; then
    echo "$ZSH_THEME_GIT_PROMPT_CLEAN"
  else
    echo "$ZSH_THEME_GIT_PROMPT_DIRTY"
  fi
}
# Parse rake tasks properly http://robots.thoughtbot.com/how-to-use-arguments-in-a-rake-task
unsetopt nomatch

#key bindings
#bindkey "\e[1~" beginning-of-line
#bindkey "\e[4~" end-of-line
#bindkey "^b" beginning-of-line
#bindkey "^E" end-of-line
bindkey "^R" history-incremental-search-backward
bindkey "^S" history-incremental-search-backward
bindkey "^P" history-search-backward
bindkey "^N" history-search-backward
#bindkey "^Y" accept-and-hold

