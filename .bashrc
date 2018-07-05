# @file: .bashrc
# @author: Brendan Hogan
# @update: 2018-07-05

# hat tip: http://osxdaily.com/2011/10/03/add-a-separator-time-stamp-between-terminal-commands-to-increase-readability/
# Customize the appearance of the prompt

# Fill with minuses for readability
# (this is recalculated every time the prompt is shown in function prompt_command):

fill="--- "

reset_style='\[\033[00m\]'

status_style=$reset_style'\[\033[0;90m\]' # gray color; use 0;37m for lighter color

prompt_style=$reset_style

command_style=$reset_style'\[\033[1;29m\]' # bold black

# Prompt variable:

PS1="$status_style"'$fill \t\n'"$prompt_style"'${debian_chroot:+($debian_chroot)}\u@\h:\w\>'"$command_style"

# Reset color for command output

# (this one is invoked every time before a command is executed):

trap 'echo -ne "\033[00m"' DEBUG

function prompt_command {

# create a $fill of all screen width minus the time string and a space:

let fillsize=${COLUMNS}-9

fill=""

while [ "$fillsize" -gt "0" ]

do

fill="-${fill}" # fill with underscores to work on

let fillsize=${fillsize}-1

done

# If this is an xterm set the title to user@host:dir

case "$TERM" in

xterm*|rxvt*)

bname=`basename "${PWD/$HOME/~}"`

echo -ne "\033]0;${bname}: ${USER}@${HOSTNAME}: ${PWD/$HOME/~}\007"

;;

*)

;;

esac

}

PROMPT_COMMAND=prompt_command


# -----------------------------------------------------------------------------

# Add color to terminal LS behavior - pretty it up a bit
export CLICOLOR=1
export LSCOLORS=ExFxBxDxCxegedabagacad

# Always enable colored `grep` output
alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'

# Always use color output for `ls` and make it human readable
alias ls='ls -GFh'


# ----------------------------------------------------------------------------- 

# Tell Homebrew to not autoupdate every time it is run (just once a week)
export HOMEBREW_AUTO_UPDATE_SECS=604800
export PATH="/usr/local/sbin:$PATH"
