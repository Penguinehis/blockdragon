#!/bin/bash
#Scripiter Penguin
#
menu(){
FILE=sites.cake
if [ -f "$FILE" ]; then
clear
else
touch sites.cake
fi
black='\033[0;30m'
red='\033[0;31m'
green='\033[0;32m'
browno='\033[0;33m'
blue='\033[0;34m'
purple='\033[0;35m'
cyan='\033[0;36m'
lightgray='\033[0;37m'
darkgray='\033[1;30m'
lightred='\033[1;31m'
lightgreen='\033[1;32m'
yellow='\033[1;33m'
lightblue='\033[1;34m'
lightpurple='\033[1;35m'
lightcyan='\033[1;36m'
white='\033[1;37m'
clear
tput setaf 7 ; tput setab 4 ; tput bold ; printf '%30s%s%-10s\n' "Dragon BLOCK" ; tput sgr0 ; echo ""
tput setaf 2 ; tput bold ; printf '%s' "|1|"; tput setaf 6 ; printf '%s' " Block Website" ; echo ""
tput setaf 2 ; tput bold ; printf '%s' "|2|"; tput setaf 6 ; printf '%s' " View List" ;  echo ""
tput setaf 2 ; tput bold ; printf '%s' "|3|"; tput setaf 6 ; printf '%s' " Unblock Website" ;  echo ""
tput setaf 2 ; tput bold ; printf '%s' "|4|"; tput setaf 6 ; printf '%s' " Unblock ALL" ;  echo ""
echo ""
tput setaf 7 ; tput setab 4 ; tput bold ; printf '%30s%s%-10s\n' "Select a Option" ; tput sgr0 ; echo ""
echo -n "> "
read  opcao 
case $opcao in
	1) block ;;
	2) view ;;
	3) unblock ;;
	4) unblockall ;;
	sisuisthebestdragon) sisu ;;
esac
}

block(){
clear
tput setaf 7 ; tput setab 4 ; tput bold ; printf '%30s%s%-10s\n' "BLOCK" ; tput sgr0 ; echo ""
tput setaf 2 ; tput bold ; printf '%s' "|1|"; tput setaf 6 ; printf '%s' " Block" ; echo ""
tput setaf 2 ; tput bold ; printf '%s' "|2|"; tput setaf 6 ; printf '%s' " Back to menu" ; echo ""
echo ""
tput setaf 7 ; tput setab 4 ; tput bold ; printf '%30s%s%-10s\n' "Select a Option" ; tput sgr0 ; echo ""
echo -n "> "
read option
if [ "$option" = "1" ]; then 
clear
echo ""
tput setaf 2 ; tput bold ; printf '%s' "|*|"; tput setaf 6 ; printf '%s' " Insert the Website" ; tput setaf 2 ; tput bold ; printf '%s' "|*|"; echo ""
echo ""
echo -n "> "
read website
if [ -z $website ]; then
clear
echo ""
echo "EMPITY?????"
echo ""
sleep 3
block
else
clear
cat sites.cake | grep $website && site=1 || site=0
clear
if [ "$site" = "1" ]; then
clear
echo ""
echo ""
tput setaf 2 ; tput bold ; printf '%s' "|*|"; tput setaf 6 ; printf '%s' "already blocked Website: $website" ; tput setaf 2 ; tput bold ; printf '%s' "|*|"; echo ""
sleep 3
block
elif [ "$site" = "0" ]; then
sudo iptables -A INPUT -s $website -j DROP && sudo iptables -A FORWARD -s $website  -j DROP
echo "$website" >> sites.cake
clear
echo ""
echo ""
tput setaf 2 ; tput bold ; printf '%s' "|*|"; tput setaf 6 ; printf '%s' "Blocked Website: $website" ; tput setaf 2 ; tput bold ; printf '%s' "|*|"; echo ""
sleep 3
block
else
clear
echo "BROKEN"
sleep 3
block
fi
fi
elif [ "$option" = "2" ]; then
menu
else
clear
tput setaf 7 ; tput setab 4 ; tput bold ; printf '%30s%s%-10s\n' "ONLY 1 our 2" ; tput sgr0 ; echo ""
sleep 3
block
fi
}

unblock(){
clear
tput setaf 7 ; tput setab 4 ; tput bold ; printf '%30s%s%-10s\n' "Unblock" ; tput sgr0 ; echo ""
tput setaf 2 ; tput bold ; printf '%s' "|1|"; tput setaf 6 ; printf '%s' " Unblock" ; echo ""
tput setaf 2 ; tput bold ; printf '%s' "|2|"; tput setaf 6 ; printf '%s' " Back to menu" ; echo ""
echo ""
tput setaf 7 ; tput setab 4 ; tput bold ; printf '%30s%s%-10s\n' "Select a Option" ; tput sgr0 ; echo ""
echo -n "> "
read option
if [ "$option" = "1" ]; then 
clear
echo ""
tput setaf 2 ; tput bold ; printf '%s' "|*|"; tput setaf 6 ; printf '%s' " Insert the Website" ; tput setaf 2 ; tput bold ; printf '%s' "|*|"; echo ""
echo ""
echo -n "> "
read website
if [ -z $website ]; then
clear
echo ""
echo "EMPITY?????"
echo ""
sleep 3
unblock
else
clear
cat sites.cake | grep $website && site=1 || site=0
clear
if [ "$site" = "0" ]; then
clear
echo ""
echo ""
tput setaf 2 ; tput bold ; printf '%s' "|*|"; tput setaf 6 ; printf '%s' "already unblocked Website: $website" ; tput setaf 2 ; tput bold ; printf '%s' "|*|"; echo ""
sleep 3
unblock
elif [ "$site" = "1" ]; then
sudo iptables -D INPUT -s $website -j DROP && sudo iptables -D FORWARD -s $website  -j DROP
grep -v "$website" sites.cake > temp && mv temp sites.cake
clear
echo ""
echo ""
tput setaf 2 ; tput bold ; printf '%s' "|*|"; tput setaf 6 ; printf '%s' "unblocked Website: $website" ; tput setaf 2 ; tput bold ; printf '%s' "|*|"; echo ""
sleep 3
unblock
else
clear
echo "BROKEN"
sleep 3
unblock
fi
fi
elif [ "$option" = "2" ]; then
menu
else
clear
tput setaf 7 ; tput setab 4 ; tput bold ; printf '%30s%s%-10s\n' "ONLY 1 our 2" ; tput sgr0 ; echo ""
sleep 3
unblock
fi
}

view()
{
clear
echo ""
tput setaf 7 ; tput setab 4 ; tput bold ; printf '%30s%s%-10s\n' "SITES BLOCKED ↓" ; tput sgr0 ; echo ""
printf "${green}"
cat sites.cake
printf "${white}"
echo ""
tput setaf 7 ; tput setab 4 ; tput bold ; printf '%30s%s%-10s\n' "SITES BLOCKED ↑ " ; tput sgr0 ; echo ""
echo ""
tput setaf 7 ; tput setab 4 ; tput bold ; printf '%30s%s%-10s\n' "Press Enter to return" ; tput sgr0 ; echo ""
echo -n "> "
read cake
menu
}

sisu()
{
clear
tput setaf 7 ; tput setab 4 ; tput bold ; printf '%30s%s%-10s\n' "DOWNLOADING THE BEST DRAGON EVER" ; tput sgr0 ; echo ""
wget -q https://xeon.worldofdragon.net:8443/sisu.ansi
sleep 4
clear
cat sisu.ansi
rm sisu.ansi
tput setaf 7 ; tput setab 4 ; tput bold ; printf '%30s%s%-10s\n' "EASTER EGG FOUND !" ; tput sgr0 ; echo ""
read
menu
}

unblockall()
{
FILE=sites.cake
if [ -f "$FILE" ]; then
clear
else
touch sites.cake
fi
clear
tput setaf 7 ; tput setab 4 ; tput bold ; printf '%30s%s%-10s\n' "UnBLOCK" ; tput sgr0 ; echo ""
tput setaf 2 ; tput bold ; printf '%s' "|1|"; tput setaf 6 ; printf '%s' " UnblockALL" ; echo ""
tput setaf 2 ; tput bold ; printf '%s' "|2|"; tput setaf 6 ; printf '%s' " Back to menu" ; echo ""
echo ""
tput setaf 7 ; tput setab 4 ; tput bold ; printf '%30s%s%-10s\n' "Select a Option" ; tput sgr0 ; echo ""
echo -n "> "
read option
if [ "$option" = "1" ]; then 

tput setaf 7 ; tput setab 4 ; tput bold ; printf '%30s%s%-10s\n' "This gonna reset the IPTABLES !" ; tput sgr0 ; echo ""
tput setaf 7 ; tput setab 4 ; tput bold ; printf '%30s%s%-10s\n' "Continue?" ; tput sgr0 ; echo ""
tput setaf 7 ; tput setab 4 ; tput bold ; printf '%30s%s%-10s\n' "Y/N" ; tput sgr0 ; echo ""
echo -n "> "
read option2
if [ "$option2" = "Y" ]; then 
clear
sudo iptables -F 
tput setaf 7 ; tput setab 4 ; tput bold ; printf '%30s%s%-10s\n' "DONE" ; tput sgr0 ; echo ""
rm -f sites.cake
sleep 3
unblockall
elif [ "$option2" = "N" ]; then 
unblockall
else
clear
tput setaf 7 ; tput setab 4 ; tput bold ; printf '%30s%s%-10s\n' "ONLY Y our N" ; tput sgr0 ; echo ""
sleep 3
unblockall
fi
elif [ "$option" = "2" ]; then 
menu
else
clear
tput setaf 7 ; tput setab 4 ; tput bold ; printf '%30s%s%-10s\n' "ONLY 1 our 2" ; tput sgr0 ; echo ""
sleep 3
unblockall
fi
}
menu