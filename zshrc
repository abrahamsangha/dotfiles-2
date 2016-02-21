PATH=/usr/local/bin:/usr/local/sbin:~/bin:~/.exenv/bin:/Applications/Racket\ v6.1.1/bin:/usr/local/heroku/bin:~/play/adt-bundle-mac-x86_64-20140702/sdk/tools:~/play/adt-bundle-mac-x86_64-20140702/sdk/platform-tools:$PATH

export PGHOST=localhost
export GOPATH=$HOME/go
export PATH=$PATH:$GOPATH/bin
export PATH=$PATH:/usr/local/opt/go/libexec/bin
export VISUAL=vim
export EDITOR=$VISUAL

zstyle ':completion:*:*:git:*' script ~/.zsh/git-completion.bash
fpath=(~/.zsh $fpath)
autoload -U compinit && compinit


alias tmux='tmux -2'
alias be="bundle exec "
alias bi="bundle install"
alias ber="bundle exec rake"
alias dbm="bundle exec rake db:migrate"
alias dbms="bundle exec rake db:migrate:status"
alias dbd="bundle exec rake db:drop"
alias dbs="bundle exec rake db:seed db:bootstrap"
alias dbb="bundle exec rake db:bootstrap"
alias tpd="RAILS_ENV=test bundle exec rake db:migrate"
alias dbr="ber db:create db:structure:load"
alias srs="be spring rspec"
alias sps="be spring stop"
alias rsp="be rspec"
alias cbg="rake campaign:billing_generate"

#powder commands
alias pr="powder restart"
alias pu="powder up"
alias pd="powder down"
alias pl="powder link"

alias reload="source ~/.zshrc"
alias config="vim ~/.zshrc"

alias vimconfig="vim ~/.vimrc"
alias viminstall="vim +PluginInstall +qall"
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
alias gcm='git commit'
alias gb='git branch'
alias gc='git checkout'
alias gra='git remote add'
alias grr='git remote rm'
alias gf='git fetch'
alias gpl='git pull'
alias gpr='git pull --rebase'
alias gpi='git pull --rebase -i'
alias gri='git rebase -i origin/master'
alias gpm='git pull origin master'
alias gpo='git pull origin'
alias gcl='git clone'
alias gdel= 'git branch -D'
alias gu= 'git reset --soft HEAD~1'
alias grh= 'git reset --hard'

alias ll='ls -hal | more'
alias tl='tail -f log/development.log'
alias rrepl='racket -i -p neil/sicp -l xrepl'

alias et='ls *.exs | entr sh -c "elixir *_test.exs ; date"'


PGDATA=/usr/local/var/postgres


eval "$(rbenv init -)"
eval "$(exenv init -)"

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
bindkey "^b" beginning-of-line
bindkey "^E" end-of-line
bindkey "^R" history-incremental-search-backward
bindkey "^S" history-incremental-search-backward
bindkey "^P" history-search-backward
bindkey "^N" history-search-backward
#bindkey "^Y" accept-and-hold

function cmmstop() {
cat <<EOC | psql cmm_development
SELECT pg_terminate_backend(pg_stat_activity.pid)
FROM pg_stat_activity
WHERE pg_stat_activity.datname = 'cmm_development'
AND pid <> pg_backend_pid();
EOC
}

stty sane
