#.bashrc

bash_files_loc=$GIT_HOME/scripts_and_stuff/bash
bash_files=`ls -a $bash_files_loc/bashrc* | grep -v main`

for file in $bash_files; do
  #ensure this is actually a file
  if [[ -f "$file" ]]; then
    source $file
  fi
done

#------------------
#  Start Apps
#------------------

# Nothing for now
