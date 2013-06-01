#!/bin/bash


# assign variables
I=20
let I-=1


# play some sound files...
ls -d ~/flac/ACDC* | while read fname;do
	mp3std "$fname"
done


# some expressions
echo $(ls)
echo `ls`	# same output than previous command
echo $((1+1))
echo $[1+1]	# same output than previous command
echo $[3/4]
echo 3/4|bc -l	# ????


# simple option processing 
# (see console_app_simple.sh file included in this same project)
OPTIONS="A B C"
select opt in $OPTIONS;do 
	echo $opt
done


# simple input
echo Please, enter your firstname and lastname
read FN LN
echo "Hi! ${LN}, ${FN} !"


echo $?		# return value of last program, 0=success normally


# interesting commands !!
man sed
man awk
man grep
man wc
man sort
man bc
man tput


# simple bach processing console commands
tput -S <<!
clear
cup 10 10
bold
!
# restore the terminal
reset


# check if the user running the script has root privileges
ROOT_UID=0     # Only users with $UID 0 have root privileges.
E_NOTROOT=67   # Non-root exit error.
if [ "$UID" -ne "$ROOT_UID" ]
then
  echo "Must be root to run this script."
  exit $E_NOTROOT
fi


# simple checking and error output
E_XCD=66       # can't change directory error
cd /var/logg || {
   echo "Cannot change to necessary directory." >&2
   exit $E_XCD;
}


# more error codes
E_WRONG_ARGS=65


# simple dated logging
echo "`date +'%Y-%m-%d %H:%M:%S'` Some log info" >> log.txt


# provides an empty file
# * if it doesn't exist then it's created empty
# * if it already existed it now it empty with the same permisions it had
: > data.bin
# previous command has the same effect as cat /dev/null >data.xxx
# (jmr: and maybe the same as touch data.xxx)
# the difference is that this does not fork a new process, since ":" is a builtin



#!/bin/bash
# renames.sh
# basic file renamer with regular expressions
criteria=$1
re_match=$2
replace=$3
for i in $( ls *$criteria* ); 
do
	src=$i
	tgt=$(echo $i | sed -e "s/$re_match/$replace/")
	mv $src $tgt
done




# alternative form of checking a command exit code
if COMMAND_WHOSE_EXIT_STATUS_IS_0_UNLESS_ERROR_OCCURRED
then echo "Command succeeded."
else echo "Command failed."
fi



