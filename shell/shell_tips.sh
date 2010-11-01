#!/bin/bash


I=20
let I-=1



ls -d flac/ACDC* | while read fname;do
	mp3std "$fname"
done 



echo $(ls)
echo $((1+1)) 
echo $[1+1] 
echo $[3/4]
echo 3/4|bc -l



OPTIONS="A B C"
select opt in $OPTIONS;do 
	echo $opt
done



echo Please, enter your firstname and lastname
read FN LN 
echo "Hi! $LN, $FN !"



echo $?		# return value of last program, 0=success normally



man sed
man awk
man grep
man wc
man sort
man bc
man tput



tput -S <<!
clear
cup 10 10
bold
!
echo kkfuti



# Run as root, of course.
ROOT_UID=0     # Only users with $UID 0 have root privileges.
E_NOTROOT=67   # Non-root exit error.
if [ "$UID" -ne "$ROOT_UID" ]
then
  echo "Must be root to run this script."
  exit $E_NOTROOT
fi 



E_XCD=66       # Can't change directory?
cd /var/logg || {
   echo "Cannot change to necessary directory." >&2
   exit $E_XCD;
}



E_WRONG_ARGS=65



echo "`date +'%Y-%m-%d %H:%M:%S'` Some log info" >> log.txt



: > data.xxx   # File "data.xxx" now empty (created if not exist, empty with same permisions if already existed)	      
# Same effect as   cat /dev/null >data.xxx
# (jmr: and maybe the same as touch data.xxx)
# However, this does not fork a new process, since ":" is a builtin.



#!/bin/bash
# renames.sh
# basic file renamer
criteria=$1
re_match=$2
replace=$3
for i in $( ls *$criteria* ); 
do
	src=$i
	tgt=$(echo $i | sed -e "s/$re_match/$replace/")
	mv $src $tgt
done



if COMMAND_WHOSE_EXIT_STATUS_IS_0_UNLESS_ERROR_OCCURRED
then echo "Command succeeded."
else echo "Command failed."
fi

