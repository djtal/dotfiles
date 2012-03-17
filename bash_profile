# enable bash completion in interactive shells
if [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
fi

if [ -f /usr/local/git/contrib/completion/git-completion.bash ]; then
  . /usr/local/git/contrib/completion/git-completion.bash
fi

export GIT_PS1_SHOWDIRTYSTATE=1 GIT_PS1_SHOWUNTRACKEDFILES=1 GIT_PS1_SHOWSTASHSTATE=1



# Prompt setting

#export PS1='[\T]\h\[\033[33m[\W]\033[m\]\$ '

export EDITOR='mate -w'
# overide git path by /usr/local/git/bin to avoid using the apple installed one at /usr/bin/git
export PATH="/usr/local/bin:/usr/local/sbin:/usr/local/git/bin:/usr/local/mongodb/bin:/usr/local/mysql/bin:~/bin:$PATH" 
export PATH="$HOME/.rbenv/bin:$PATH"


alias ls="ls -la -G"
alias l="ls -l -G -a"
alias be="bundle exec"
alias git=hub
eval "$(rbenv init -)"
# En fait l'important ici c'est le "\033[1;32m\]$(__git_ps1)\[\033[0m\]", le reste c'est mon prompt usuel…
export PS1='\[\033[33m[\W\[\033[0m\]$(__git_ps1)\[\033[33m]@\[\033[0m\]\h:\[\033[0m\] \$ '


cd
