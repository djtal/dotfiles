# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
[ -z "$PS1" ] && return




# don't put duplicate lines in the history. See bash(1) for more options
# ... or force ignoredups and ignorespace
HISTCONTROL=ignoredups:ignorespace

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"



# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi


# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if [ -f /etc/bash_completion ] && ! shopt -oq posix; then
    . /etc/bash_completion
fi

if [ -f /etc/bash_completion.d/git ]; then
  source /etc/bash_completion.d/git
fi


umask 0002


if [ $(uname -s) = "Darwin" ]; then
  # use completion script provided by brew if available
  if [ -f `/usr/local/bin/brew --prefix`/etc/bash_completion ]; then
      . `/usr/local/bin/brew --prefix`/etc/bash_completion
  fi

  # Add tab completion for SSH hostnames based on ~/.ssh/config, ignoring wildcards
  [ -e "$HOME/.ssh/config" ] && complete -o "default" -o "nospace" -W "$(grep "^Host" ~/.ssh/config | grep -v "[?*]" | cut -d " " -f2)" scp sftp ssh

  # Add tab completion for `defaults read|write NSGlobalDomain`
  # You could just use `-g` instead, but I like being explicit
  complete -W "NSGlobalDomain" defaults
fi

# Mac OS X uses path_helper to preload PATH, clear it out first
if [ -x /usr/libexec/path_helper ]; then
    PATH=''
    eval `/usr/libexec/path_helper -s`
fi


export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"

# Load the shell dotfiles, and then some:
# * ~/.path can be used to extend `$PATH`.
# * ~/.extra can be used for other settings you don’t want to commit.
for file in ~/.{path,bash_prompt,exports,aliases,functions}; do
	[ -r "$file" ] && source "$file"
done
unset file



#define some color based on the molokai them see http://stevelosh.com/blog/2009/03/candy-colored-terminal/
# D=$'\e[0;37;40m'
# PINK=$'\e[0;35;40m'
# #GREEN=$'\e[32;40m'
# GREEN=$'\e[1;32;40m'
# ORANGE=$'\e[0;33;40m'

# #PS1='\[\033[33m\][\w$(__git_ps1)]@\[\033[32m\]\h:\[\033[0m\] \$ '
# PS1='[\[${GREEN}\]\w\[${D}\]$(__git_ps1)\[${D}\]]@\[${ORANGE}\]\h: \[${D}\] \$ '

complete -F _projs oproj

# Base16 Shell
BASE16_SHELL="$HOME/.bin/base16-ocean.dark.sh"
[[ -s $BASE16_SHELL ]] && source $BASE16_SHELL
