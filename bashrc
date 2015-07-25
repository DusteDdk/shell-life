# .bashrc extra stuff, you can append this file to your ~/,bashrc file
# Comment out stuff you don't want

# Fancy two line prompt.
# * Shows current time
# * Shows username in red if previous command returned error
# * Gives you more room for long commands even if your cwd is long
PS1='\[\033[01;33m\]`O=$?; D=\`date +"%H:%M:%S"\`; if [ $O == 0 ]; then echo $D \[\e[32m\]; else echo $D \e[31m ;fi`\u\[\033[01;34m\]@\[\033[01;32m\]\h\[\033[01;37m\]:\[\033[01;34m\]\w\[\033[00m\]\n\$ '


#Make bash aware of windowsize - this is needed at least for xterm on arch
shopt -s checkwinsize


# Useful for keeping track of music tracks you discover during your day
# Show tracks you've added to ~/nicetracks.txt
alias lstrack="cat ~/nicetracks.txt"
# Adds a track (prefixes timestamp) to ~/nicetracks.txt
function addtrack() { echo [`date +"%Y-%m-%d %H:%M:%S"`] "$@" >> ~/nicetracks.txt; }

# Requires whatis and ponysay
# Display a glorious colorful picture of a pony telling you about a random util
TVAR=`whatis \`ls /usr/bin/ | shuf -n 1\` 2> /dev/null` &&  echo "$TVAR"|ponysay || true
unset TVAR

# Requires executable v.sh in ~/opt/ or change the path.
# v - because lazy - an improvement wrapper for cd.
# v /path/thing - If thing is a dir, cd to it
# v /path/thing - If thing is a text file, open in vim
# v             - go to ~
# v -           - go to previous dir (if any)
alias v='. ~/opt/v.sh'

alias l='ls -lah --color=auto'

# Requires the usejava script installed in ~/opt/ or change the path.
# mkdir /opt/jdk/ and extract desired jdk versions into it.
# edit USEJAVA_JDK_DIR in usejava if you want to keep JDKs in another location.
#alias usejava='. ~/opt/usejava.sh'

# For VIM to display correctly, tmux needs to be started in 256 color mode.
alias tmux="TERM=screen-256color-bce tmux"
