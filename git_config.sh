#friendly log format (https://coderwall.com/p/euwpig)
git config --global alias.lg "log --color --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit"

#show branch in command prompt (http://stackoverflow.com/questions/15883416/adding-git-branch-on-the-bash-command-prompt)
PS1='[\u@\h \W$(__git_ps1 " (%s)")]\$ '

# Source a git completion script
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
if [ -f $DIR/git-completion.sh ]; then
       . $DIR/git-completion.sh
else
  echo "Could not find git completion script"
fi
 
# Display the current git branch in the command prompt
export PS1='[\u@\h \W$(__git_ps1 " (%s)")]\$ '
