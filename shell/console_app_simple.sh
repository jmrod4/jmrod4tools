#!/bin/bash
#
# coded by jmrod4 and released to the public domain
#
# how to use:
# * modify OPTS variable to include your options
# * add your options and the appropiate code before the ones for \?
# * modify function _help to give the appropiate usage msg
# * finally... do something with them all!
#
# known quirks/features:
# * options after non-option arguments will pass unprocessed
#     example: myapp.sh myargument -j
#
# conventions used:
# * internal functions start with an underscore and are lowercase
# * internal variables are uppercase
#

VERSION="0.1"
DATE="2010-11-01"
MYNAME="`basename "${0}"`"

function _msg
{
	echo "$MYNAME -- ${@}"
}

function _fatal
{
	_msg "${@:2}" 1>&2
	exit $1
}

function _exitusage
{
	_fatal 1 "${@}, use -h for help"
}

function _help
{
	echo "Usage: $MYNAME [-h -v -f FILE] [ARGS]"
}



# make sure the variables that are not set everytime are empty
unset FILE

OPTS=":hvxf:"
while getopts $OPTS OP; do
	case $OP in
		h	) _help;exit 0;;
		v	) echo $VERSION;exit 0;;
		f	) FILE="${OPTARG}";;
		\?	) _exitusage "invalid option ${OPTARG}";;
		\:	) _exitusage "option ${OPTARG} requires an argument";;
		*	) _exitusage "unimplemented ${OP}";;
	esac
done
shift $(($OPTIND - 1))


# Now DO something wonderful with all the options and args! :)

if [ ! -z "${1}" ]; then
	_msg "arguments left to process: ${@}"
else
	_msg "no arguments left to process"
fi

_msg "done"
exit 0



