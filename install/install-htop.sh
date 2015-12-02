#!/bin/bash
echo ; echo This script will install htop to your WD My Cloud ; echo 
# check for root since root is needed to install
echo [ Checking for root... ]
case "$EUID" in
    0) ;;
    *) echo [ Installation must be run as ROOT user]; exit 1 ;;
esac
echo [ Running as root!.... ]; echo   ##############

# check for firmware version ########
#
#   if firmware is not 4.xx.xx,  msg: can't run, then exit 
#
#################

# check if htop is already installed ########
echo [ Checking for htop... ]
case "$(dpkg-query -s -f='${Status}' htop 2>/dev/null | grep -c "ok installed")" in
    0) ;;
	*) echo [ htop is already installed, now exiting! ]; exit 1 ;;
esac ; echo     ################

# check for man folder owner permission bug #####
#
#   if bug exists, fix it ; else continue
#
#
##################

#  check for htop deb file #########
#
#   if file not exists, msg: missing file,... else Install htop
#
#
#
#dpkg -i ../Files/htop*.deb
##########################

#  if you got this far, htop was installed properly
#
#
echo Success EOF

