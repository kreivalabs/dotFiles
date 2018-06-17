# @file: .bash_profile
# @author: brendanhogan
# @update: 2018-06-15

# with inspiration from https://github.com/mathiasbynens and https://github.com/geerlingguy

# ---------------------------------------------------------------
# Change Prompt - Make Nicer
# ---------------------------------------------------------------
export PS1="\[\033[36m\]\u\[\033[m\]@\[\033[32m\]\h:\[\033[33;1m\]\w\[\033[m\]\> "

# Set default blocksize for ls, df, du
# ---------------------------------------------------------------
export BLOCKSIZE=1k

# Set PATH
# ---------------------------------------------------------------
export PATH="/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin"

# Include alias files (if present) containing alias for ssh, etc.
# ---------------------------------------------------------------

if [ -f ~/.bash_aliases ]
then
  source ~/.bash_aliases
fi

# Include bashrc file (if present).

if [ -f ~/.bashrc ]
then
  source ~/.bashrc
fi

# Add color to terminal - pretty it up a bit
export CLICOLOR=1
export LSCOLORS=ExFxBxDxCxegedabagacad

# Always enable colored `grep` output
alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'

# Always use color output for `ls`
alias ls='ls -GFh'

# Add better aliases
# ----------------------------------------------------------------------------------
# Go back 1 directory level
alias cd..='cd ../'				                        

# Go bak 1 directory level (alternate)
alias ..='cd ../'				                          

# Go back 2 dir levels
alias ...='cd ../../'				                      

# Go back 3 dir levels
alias .3='cd ../../../'				                    

# Go back 4 dir levels
alias .4='cd ../../../../'			                  

# Go back 5 dir levels
alias .5='cd ../../../../../'

# Go back 6 dir levels
alias .6='cd ../../../../../../'

# f: Opens current directory in Finder
alias f='open -a Finder ./'

# home: Go to Home folder
alias home='cd ~'

# root: go to root folder
alias root='cd /'

# open: Send `open` command
alias o='open'

# c: Clear the terminal window
alias c='clear'

# q: Quit the shell
alias q='exit'

# k: send `kill`
alias k='kill'

# ka: send `killall`
alias ka='killall'

# DT: Pipe content to file on Desktop
alias DT='tee ~/Desktop/terminalOutput.txt'

# dt: Go to Desktop
alias dt='cd ~/Desktop'

# dl: Go to Downloads folder
alias dl='cd ~/Downloads'

# dbox: Go to Dropbox folder
alias dbox='cd ~/Dropbox'

# code: Go to Dropbox `code` folder
alias code='cd ~/Dropbox/code'

# py3: Use Python 3 interpreter
alias py3='python3'

# bashpro: open .bash_profile in nano
alias bashpro='nano ~/.bash_profile'

# loadbash: update the .bash_profile in current shell
alias loadbash='source .bash_profile

# afk: lock the screen when going away from keyboard
alias afk="/System/Library/CoreServices/Menu\ Extras/User.menu/Contents/Resources/CGSession -suspend"

#reload the shell
alias reload="exec ${SHELL} -l"

# Empty the trash
alias empty='rm -rf ~/.Trash/*'

# Show/hide dotfiles
alias show="defaults write com.apple.finder AppleShowAllFiles -bool true && killall Finder"	
alias hide="defaults write com.apple.finder AppleShowAllFiles -bool false && killall Finder"	

# Fix typos
# --------------------------------------------------------------
alias cta='cat'
alias gerp='grep'
alias sl='ls'

# lr: Full Recursive Directory Listing
alias lr='ls -R | grep ":$" | sed -e '\''s/:$//'\'' -e '\''s/[^-][^\/]*\//--/g'\'' -e '\''s/^/   /'\'' -e '\''s/-/|/'\'' | less'


# cdf: 'Cd's to frontmost window of Finder
# ---------------------------------------------------------------
    cdf () {
        currFolderPath=$( /usr/bin/osascript <<EOT
            tell application "Finder"
                try
            set currFolder to (folder of the front window as alias)
                on error
            set currFolder to (path to desktop folder as alias)
                end try
                POSIX path of currFolder
            end tell
EOT
        )
        echo "cd to \"$currFolderPath\""
        cd "$currFolderPath"
    }

				           

# SYSTEM RESOURCES
# ---------------------------------------------------------------

# memHogsTop, memHogsPs: Find memory hogs
# ---------------------------------------------------------------
alias memHogsTop='top -l 1 -o rsize | head -20'
alias memHogsPs='ps wwaxm -o pid,stat,vsize,rss,time,command | head -10'


# cpuHogs: Find CPU hogs
# ---------------------------------------------------------------
alias cpu_hogs='ps wwaxr -o pid,stat,%cpu,time,command | head -10'


# NETWORKING Functions
# ---------------------------------------------------------------

# myip:		Public facing IP address
alias myip="dig +short myip.opendns.com @resolver1.opendns.com"			

# netCons:	Show all open TCP/IP sockets
alias netCons='lsof -i'									

# flushDNS:	Flush out the DNS cache
alias flushDNS='dscacheutil -flushcache'						

# lsock:	Display open sockets
alias lsock='sudo /usr/sbin/lsof -i -P'							

# lsockU:	Display only open UDP sockets
alias lsockU='sudo /usr/sbin/lsof -nP | grep UDP'					

# lsockT:	Display only open TCP sockets
alias lsockT='sudo /usr/sbin/lsof -nP | grep TCP'					

# ipInfo0:	Get info on connections for en0
alias ipInfo0='ipconfig getpacket en0'							

# ipInfo1:	Get info on connections for en1
alias ipInfo1='ipconfig getpacket en1'							

# openPorts:	All listening connections
alias openPorts='sudo lsof -i | grep LISTEN'						

# showBlocked:	All ipfw rules inc/ blocked IPs
alias showBlocked='sudo ipfw list'							

# Show active network interfaces
alias ifactive="ifconfig | pcregrep -M -o '^[^\t:]+:([^\n]|\n\t)*status: active'"	


# ii: display useful host-related info
# ---------------------------------------------------------------
    ii() {
        echo -e "\nYou are logged on ${RED}$HOST"
        echo -e "\nAdditionnal information:$NC " ; uname -a
        echo -e "\n${RED}Users logged on:$NC " ; w -h
        echo -e "\n${RED}Current date :$NC " ; date
        echo -e "\n${RED}Machine stats :$NC " ; uptime
        echo -e "\n${RED}Current network location :$NC " ; scselect
        echo -e "\n${RED}Public facing IP Address :$NC " ;myip
        #echo -e "\n${RED}DNS Configuration:$NC " ; scutil --dns
        echo
    }

# ---------------------------------------------------------------
# SYSTEMS OPERATIONS AND INFORMATION
# ---------------------------------------------------------------


# cleanupLS: Clean up LaunchServices to remove duplicates in the "Open With" menu
alias cleanupLS="/System/Library/Frameworks/CoreServices.framework/Frameworks/LaunchServices.framework/Support/lsregister -kill -r -domain local -domain system -domain user && killall Finder"
		
# ll: Set 'll' behavior
alias ll='ls -lG'

# Tell Homebrew to not autoupdate every time it is run (just once a week)
export HOMEBREW_AUTO_UPDATE_SECS=604800
