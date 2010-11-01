#!/bin/bash
COPY="Copyright (C) 2007-2009 Juan Manuel Rodríguez"
LICENSE="Licensed under GNU GPL version 3 or (at your option) any later version."

VERSION="0.2"
DATE="2009/09/12"

DESCRIPTION="Serves as a shell application template."

HISTORY=<<ENDHISTORY
2007 Nov 29: App template created - console_app2.sh v1
2008 Sep 17: App template heavily revised - console_rich.sh v1
2009 Sep 12: App template modified - sh_console_app4.sh
ENDHISTORY


##app housekeeping info
MYNAME=`basename $0`
VERBOSE=1	# levels: 0 quiet, 1 normal, 2 verbose, 3 very verbose

RETURN_ERROR_USAGE=2
RETURN_ERROR_OTHER=1


## FUNCTIONS --------------------------------------------------------


function f_helplong()	#args: none
##shows help message
{
	cat <<ENDHELP
$MYNAME -- v$VERSION $DATE $COPY
$LICENSE

$DESCRIPTION

Usage:   $MYNAME [options] [commands] [arguments]

Common options: 
	-h | --help, --version,	-v |--verbose, -q | --quiet, --
Other options:

Examples:

ENDHELP
}


function f_error	#args: args_to_echo
##prints an error to stderr and exit
{
	[[ $VERBOSE -gt 0 ]] && echo "$MYNAME: $@" 1>&2
}


function f_msg	#args: verbose_level args_to_echo
##echoes debug info to stderr
{
	[[ $VERBOSE -ge $1 ]] && shift;echo "$@"
}


## PARSING ----------------------------------------------------------


#process options and shift to arguments
while [ -n "$1" ]; do
	case $1 in
		-h | --help | -\?) f_helplong; exit 0;;
		-v | --verbose ) let VERBOSE+=1; shift;;
		-q | --quiet ) let VERBOSE-=1; shift;;
		--version ) echo $MYNAME -- $VERSION -- $DATE; exit 0;;
		#-o | --option) VARNAME=1; shift 1;;	#option to activate
		#-o | --option) VARNAME="$2"; shift 1;; #option with arguments
		--) shift; break;;		#end of options
		-*) f_error "no such option -- $1, use -h for help";exit $RETURN_ERROR_USAGE;;
		*) break;;
	esac
done


##check for mandatary actions or arguments in the buffer:
#[ "$#" -ne 1 ] && f_error "no whatever specified";exit $RETURN_ERROR_USAGE

##Testing parsing...
#echo "VERBOSE=$VERBOSE"
#f_msg 1 "Remaining Args:" $@


## MAIN -------------------------------------------------------------

##check inmediate errors
##check for existence of directories or files before using them:
#[ ! -d "$VARDIR" ] && f_error "directory doesn't exist: $VARDIR";exit $RETURN_ERROR_OTHER
#[ ! -f "$VARFILE" ] && f_error "file doesn't exist: $VARFILE";exit $RETURN_ERROR_OTHER


echo Done.

