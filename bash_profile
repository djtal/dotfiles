unset file

# Case-insensitive globbing (used in pathname expansion)
shopt -s nocaseglob

# Append to the Bash history file, rather than overwriting it
shopt -s histappend

# Autocorrect typos in path names when using `cd`
shopt -s cdspell

umask 0002


if [ -f `brew --prefix`/etc/bash_completion ]; then
    . `brew --prefix`/etc/bash_completion
fi

# Add tab completion for SSH hostnames based on ~/.ssh/config, ignoring wildcards
[ -e "$HOME/.ssh/config" ] && complete -o "default" -o "nospace" -W "$(grep "^Host" ~/.ssh/config | grep -v "[?*]" | cut -d " " -f2)" scp sftp ssh

# Add tab completion for `defaults read|write NSGlobalDomain`
# You could just use `-g` instead, but I like being explicit
complete -W "NSGlobalDomain" defaults

if [ -f /usr/local/git/contrib/completion/git-completion.bash ]; then
  . /usr/local/git/contrib/completion/git-completion.bash
fi

export GIT_PS1_SHOWDIRTYSTATE=1 GIT_PS1_SHOWUNTRACKEDFILES=1 GIT_PS1_SHOWSTASHSTATE=1

# Export

export EDITOR='mvim -f --nomru -c "au VimLeave * !open -a iTerm"'
# Don’t clear the screen after quitting a manual page
export MANPAGER="less -X"
# Highlight section titles in manual pages

# Larger bash history (allow 32³ entries; default is 500)
export HISTSIZE=32768
export HISTFILESIZE=$HISTSIZE
export HISTCONTROL=ignoredups
# Make some commands not show up in history
export HISTIGNORE="ls:ls *:cd:cd -:pwd;exit:date:* --help"

# overide git path by /usr/local/git/bin to avoid using the apple installed one at /usr/bin/git
export PATH="/usr/local/bin:/usr/local/sbin:/usr/local/git/bin:/usr/local/mongodb/bin:/usr/local/mysql/bin:~/bin:$PATH"
export PATH="$HOME/.rbenv/bin:$PATH"
export ARDUINO_SDK_PATH="/Applications/Arduino.app/Contents/Resources/Java"

# Functions

function cdproj() {
  dir=$(find ~/ciblo/projets -type d -mindepth 1 -maxdepth 2 -name "$1" | head -n 1)
  if [ "$dir" ]; then
    cd "$dir"
    { [ -d 'trunk' ] && cd trunk; } || { [ -d 'webapp' ] && cd webapp; }
  else
    echo "Aucun projet '$1' trouvé..." >&2
    return 1
  fi
}

function _projects() {
  local cur
  cur=${COMP_WORDS[COMP_CWORD]}
  COMPREPLY=( $(find ~/ciblo/projets -type d -mindepth 0 -maxdepth 1 ! -name '.*' -name "$cur*" -exec basename {} \;) )
}
complete -F _projects cdproj

function rdm() { rake db:migrate "$@"; }
function rsc() { ruby script/console "$@"; }
function rsg() { ruby script/generate "$@"; }
function rss() { ruby script/server "$@"; }
function sdc() { ./script/dbconsole -p "$@"; }
function tlf() { tail -f log/${RAILS_ENV:-development}.log; }


# Alias

alias ls="ls -la -G"
alias l="ls -l -G -a"
alias be="bundle exec"
alias git=hub
eval "$(rbenv init - --no-rehash)"

# Prompt

#define some color based on the molokai them see http://stevelosh.com/blog/2009/03/candy-colored-terminal/
D=$'\e[37;40m'
PINK=$'\e[35;40m'
GREEN=$'\e[32;40m'
ORANGE=$'\e[33;40m'

export LESS_TERMCAP_md="$ORANGE"

export PS1='[\W\[${GREEN}\]$(__git_ps1)\[${D}\]]@\[${ORANGE}\]\h\[${D}\] \$ '

cd

