#!/bin/bash
echo ; echo This script will install htop to your WD My Cloud ; echo 
# check for root since root is needed to install
echo [1] Checking for root...
case "$EUID" in
    0) ;;
    *) echo [ Installation must be run as ROOT user]; exit 1 ;;
esac ; echo    ##############

# check for armv71 hardware (used x86 to test in vm)
echo [2] Checking hardware type...
case "$(uname -m 2>/dev/null | grep -c "x86" )" in
   1) ;;
   *) echo [ Wrong hardware. Not armv71 ]; exit 1 ;;
esac ; echo    ##############

# check for firmware version 04.0x.xx
echo [3] Checking firmware version... 
case "$(head /etc/version 2>/dev/null | grep -c "04.0" )" in
   1) ;;
   *) echo [ Wrong Firmware. Not 04.xx.xx ]; exit 1 ;;
esac ; echo     #################

# check for man folder permission bug
echo [4] Checking for man folder bug...
case "$(ls -l /var/cache/ 2>/dev/null | grep "man" | cut -f 3 -d ' ' )" in
   man) ;;
   *) echo [ Bug found. Fixing man folder ]; echo chown -R man:root /var/cache/man ;; 
esac ; echo    #################

# check if htop is already installed
echo [5] Checking if htop is installed... 
case "$(dpkg-query -s -f='${Status}' htop 2>/dev/null | grep -c "ok installed")" in
   0) ;;
   *) echo [ htop is already installed, now exiting! ]; exit 1 ;;
esac ; echo     ################

#  check for htop deb file
echo [6] Checking htop install file...
echo "$(ls -l ../Files/htop/ 2>/dev/null | grep "htop_*.deb" )"
case "$(ls -l ../Files/htop/ 2>/dev/null | grep -c "htop_*.deb" )" in
   1) ;; 
   *) echo [ htop installation file not found! ]; exit 1 ;;
esac ; echo     ##################

echo Success! Htop id installed

