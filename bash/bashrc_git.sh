# Navigation
alias gdir='cd $GIT_HOME'

#---------------
# Git Commands
#---------------

function ghelp {
    
    sed -n 's/^#help//p' $GIT_HOME/scripts_and_stuff/bash/.bashrc_git
}

#help glog - Pretty git logs
alias glog='git log --pretty=oneline --abbrev-commit --graph --decorate --all'

#help gpull - Pulls and prunes
alias gpull='git pull -p; date'

#help gstat - git status
alias gstat='git status'

#help gslist - lists stash contents
alias gslist='git stash list'

#help gs - stashes workspaces
alias gs='git stash'

#help gspop - pops the first item in stash
alias gspop='git stash pop'

#help gscl - clears out the stash
alias gscl='git stash clear'

#help gclear - clears out working dir
alias gclear='git stash; git stash drop -q; git status'

#help gmd - Pulls and merges develop
alias gmd='aliasgpull; git merge --no-edit origin/develop'

#help gb - Makes a new branch
function gb { git branch $1; }

#help gmkb - creates a branch and pushes it to origin
function gmkb {
    git checkout -b $1
    git push -u origin $1:$1
}

#help grmb - removes branch locally and on remote
function grmb {
    git checkout develop
    git branch -d $1
    if [[ "$1" ]]; then
      git push origin :$1
    fi
}

#help gcam - Adds files and commits working dir. Takes a message as input
function gcam { git commit -am "$*"; date; }

#help gcamp - Commits working dir an pushes to remote. Takes a message as input
function gcamp { git commit -am "$*"; git push; date; }

#help gcm - Commits added changes/files. Takes a message as input
function gcm { git commit -m "$*"; date; }

#help gco - Checkout branch/commit
function gco { git checkout $1; }

function complete_remote_branch_names {
    local crw=${COMP_WORDS[COMP_CWORD]}
    COMPREPLY=($(git branch -r | cut -d " " -f3 | grep -P ".+" | egrep "^${curw}"))
}

function complete_branch_names {
    local crw=${COMP_WORDS[COMP_CWORD]}
    COMPREPLY=($(git branch | cut -d " " -f3 | grep -P ".+" | egrep "^${curw}"))
}

complete -F complete_branch_names gco
complete -F complete_branch_names grmb
