#!/bin/bash

warning='\e[01;31m'
hint='\e[01;32m'
cmd='\e[00;00m'
endTag='\e[0m'

#Make sure that user gave required parameters
if [[ ! -n "$1" ]]; then
   echo -e "${warning}Not all required parameters has been specified.${endTag}"
   echo -e "${hint}The correct syntax:${endTag}"
   echo -e "${cmd}$0 yourExecutableNameInCurrentDirectory${endTag}"
   exit 1
fi

currentDirectory="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
date=`date`
executableFile=$1
while [ true ]; do
   echo -e "[${date}]\t${hint}Server is starting...${endTag}"
   cd ${currentDirectory} && ./${executableFile}
done
echo -e "[${date}]\t${warning}Server won't start. This warning should NOT never appear.${endTag}"
