#--------------------Author: P S Kiran Kundurthi-----------------------------
#! /bin/bash
echo "Enter the Number of APs:"
read ap
echo "Enter the Number of Clients:"
read cl
echo "Enter the Number of Assocs:"
read as
echo "Enter the Association flipping time:"
read fl
echo "Channel Switching interval:"
read sw
while :
do

for i in 1 3
	do
		simulate() {
		echo "Setting channel $j"
                iwconfig ath0 channel $j
                ifconfig ath0 up
                setsid ./ats3_aca ath0 aca $ap $cl $j $as 00:11:22:33:44:55 00:11:22:44:55:66 $fl &
                echo "-------------------After $sw secs simulation will start in a new channel-----------------------------------------------"
                sleep $sw
                killall ats3_aca
		}
		echo "Wait 5 secs to set the card"
		sleep 5
		wlanconfig ath0 destroy
                wlanconfig ath0 create wlandev wifi0 wlanmode monitor
		if [ $i == 1 ]; then
			echo "Setting the Card in 11a band"
			iwpriv ath0 mode $i
			for j in 149 153 157 161
			do
			simulate
			done 
		fi
						
		if [ $i == 3 ]; then
                        echo "Setting the Card in 11bg band"
                        iwpriv ath0 mode $i
                        for j in 1 6 11
                        do
			simulate
			done
		fi
	done
done
