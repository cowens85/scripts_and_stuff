#------------------------------
# Coloring and other Fancyness
#------------------------------
function set_colors {
  local user="\[\e[38;5;90m\]\u\[\e[39m\]"
  local at="\[\e[38;5;238m\]@\[\e[m\]"
  local server="\[\e[38;5;30m\]\h\[\e[39m\]"
  local directory="\[\e[38;5;136m\][\W]\[\e[39m\]"
  local curr_git_branch=" \$(git branch 2>/dev/null | grep '^*' | colrm 1 2)"
  local end="\[\e[38;5;238m\]>\[\e[m\]"
  export PS1="$user$at$server$directory$curr_git_branch$end \[\e[m\]"
}
set_colors

#------------------------------
# System Aliases and Functions
#------------------------------

# Yum
function yum { sudo `which yum` $@; }
function yum-no-sudo { `which yum $@`; }

function silent-bg { nohup "$($@)" &> /dev/null & }

function proc { ps -ef | grep -v grep | grep $1; }

function ssh2 { ssh -A -o StrictHostKeyChecking=no $@; }


# others
alias ll='ls -lash'

# bashrc
alias vrc='vim ~/.bashrc'
alias src='source ~/.bashrc'
function vbash { vim $GIT_HOME/scripts-and-stuff/bash/$1; }
function complete_bashrc_names {
    local curw=${COMP_WORDS[COMP_CWORD]}
    COMPREPLY=($(ls -lash $GIT_HOME/scripts-and-stuff/bashrd | awk '{print $NF}' | grep .bashrc | egrep "^${curw}"))
}
complete complete_bashrc_names vbash

#bash_profile
# alias vprofile='vim ~/.bash_profile'
# alias sprofile='source ~/.bash_profile'

