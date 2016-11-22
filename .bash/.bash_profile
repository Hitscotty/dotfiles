# custom colors section 

txtblk='\e[0;30m' # Black - Regular
txtred='\e[0;31m' # Red
txtgrn='\e[0;32m' # Green
txtylw='\e[0;33m' # Yellow
txtblu='\e[0;34m' # Blue
txtpur='\e[0;35m' # Purple
txtcyn='\e[0;36m' # Cyan
txtwht='\e[0;37m' # White

bldblk='\e[1;30m' # Black - Bold
bldred='\e[1;31m' # Red
bldgrn='\e[1;32m' # Green
bldylw='\e[1;33m' # Yellow
bldblu='\e[1;34m' # Blue
bldpur='\e[1;35m' # Purple
bldcyn='\e[1;36m' # Cyan
bldwht='\e[1;37m' # White

unkblk='\e[4;30m' # Black - Underline
undred='\e[4;31m' # Red
undgrn='\e[4;32m' # Green
undylw='\e[4;33m' # Yellow
undblu='\e[4;34m' # Blue
undpur='\e[4;35m' # Purple
undcyn='\e[4;36m' # Cyan
undwht='\e[4;37m' # White

bakblk='\e[40m'   # Black - Background
bakred='\e[41m'   # Red
badgrn='\e[42m'   # Green
bakylw='\e[43m'   # Yellow
bakblu='\e[44m'   # Blue
bakpur='\e[45m'   # Purple
bakcyn='\e[46m'   # Cyan
bakwht='\e[47m'   # White

txtrst='\e[0m'    # Text Reset


parse_git_branch() {
    git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}

prompt_git() {
	local s='';
	local branchName='';

	# Check if the current directory is in a Git repository.
	if [ $(git rev-parse --is-inside-work-tree &>/dev/null; echo "${?}") == '0' ]; then

		# check if the current directory is in .git before running git checks
		if [ "$(git rev-parse --is-inside-git-dir 2> /dev/null)" == 'false' ]; then

			# Ensure the index is up to date.
			git update-index --really-refresh -q &>/dev/null;

			# Check for uncommitted changes in the index.
			if ! $(git diff --quiet --ignore-submodules --cached); then
				s+='+';
			fi;

			# Check for unstaged changes.
			if ! $(git diff-files --quiet --ignore-submodules --); then
				s+='!';
			fi;

			# Check for untracked files.
			if [ -n "$(git ls-files --others --exclude-standard)" ]; then
				s+='?';
			fi;

			# Check for stashed files.
			if $(git rev-parse --verify refs/stash &>/dev/null); then
				s+='$';
			fi;

		fi;

		# Get the short symbolic ref.
		# If HEAD isn’t a symbolic ref, get the short SHA for the latest commit
		# Otherwise, just give up.
		branchName="$(git symbolic-ref --quiet --short HEAD 2> /dev/null || \
			git rev-parse --short HEAD 2> /dev/null || \
			echo '(unknown)')";

		[ -n "${s}" ] && s=" [${s}]";

		echo -e "${1}${branchName}${2}${s}";
	else
		return;
	fi;
}

print_before_the_prompt () {
    printf "\n$txtred%s: $txtgrn%s  $txtylw%s \n$txtrst" "$USER" "$PWD" "$(prompt_git)"
}

PROMPT_COMMAND=print_before_the_prompt

# added fer Java
JAVA_HOME=/home/username/jdk1.6.0_23
PATH=$JAVA_HOME/bin:$PATH
CLASSPATH=$JAVA_HOME/lib:.



export PATH=~/bin:$PATH
# Setting PATH for Python 3.5
# The orginal version is saved in .bash_profile.pysave
PATH="/Library/Frameworks/Python.framework/Versions/3.5/bin:${PATH}"
export PATH

# Setting PATH for Python 2.7
# The orginal version is saved in .bash_profile.pysave
PATH="/Library/Frameworks/Python.framework/Versions/2.7/bin:${PATH}"
export PATH

# Setting PATH for Python 3.5
# The orginal version is saved in .bash_profile.pysave
PYTHONPATH="/Library/Frameworks/Python.framework/Versions/3.5/bin:${PATH}"
export PYTHONPATH

# emacs
alias emacs="emacs-24.5 -nw"

# customize my terminal here
export USER="Scotty"
export PS1="\W\ \e[1;34mλ> \e[0m"

#place where I put my alias's
alias shots='cd ~/Documents/Screenshots/'
alias resume='cd ~/Documents/Resumes'
alias down='cd ~/Downloads'
alias gitrep='cd ~/Documents/Repositories/'
alias mysqlstart='/usr/local/mysql/bin/mysql -uroot'
alias eclipse='cd /Users/Scotty/Documents/workspace'
alias pycharm='cd /Users/Scotty/PycharmProjects'
alias webodin='cd /Users/Scotty/Documents/Scratch/the_odin_project'
alias subl='open /Applications/Sublime\ Text.app/Contents/SharedSupport/bin/subl'
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*

#Set shortcut subl for sublime text editor
export PATH=export PATH=$PATH:/Applications/Sublime\ Text\ 2.app/Contents/SharedSupport/bin


# Setting PATH for Python 3.5
# The original version is saved in .bash_profile.pysave
PATH="/Library/Frameworks/Python.framework/Versions/3.5/bin:${PATH}"
export PATH

##
# Your previous /Users/Scotty/.bash_profile file was backed up as /Users/Scotty/.bash_profile.macports-saved_2016-08-02_at_12:08:09
##

# MacPorts Installer addition on 2016-08-02_at_12:08:09: adding an appropriate PATH variable for use with MacPorts.
export PATH="/opt/local/bin:/opt/local/sbin:$PATH"
# Finished adapting your PATH environment variable for use with MacPorts.

# ghc-pkg-reset
# Removes all installed GHC/cabal packages, but not binaries, docs, etc.
# Use this to get out of dependency hell and start over, at the cost of some rebuilding time.
function ghc-pkg-reset() {
read -p 'erasing all your user ghc and cabal packages - are you sure (y/n) ? ' ans
test x$ans == xy && ( \
    echo 'erasing directories under ~/.ghc'; rm -rf `find ~/.ghc -maxdepth 1 -type d`; \
    echo 'erasing ~/.cabal/lib'; rm -rf ~/.cabal/lib; \
    # echo 'erasing ~/.cabal/packages'; rm -rf ~/.cabal/packages; \
    # echo 'erasing ~/.cabal/share'; rm -rf ~/.cabal/share; \
    )
}
# added by Anaconda2 4.1.1 installer
export PATH="/Users/Scotty/anaconda2/bin:$PATH"
# added by Anaconda2 4.1.1 installer
export PATH="//anaconda/bin:$PATH"

