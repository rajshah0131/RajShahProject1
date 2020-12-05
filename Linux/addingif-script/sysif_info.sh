#!/bin/bash

if [ $UID -ne 0 ]
then
  echo "run script with sudo"
  exit
fi

output=$HOME/research/sysif_info.txt
ip=$(ip addr | grep inet | tail -2 | head -1)
execs=$(find /home i type f -perm 777 2> /dev/null)

if [ ! -d $HOME/research ]
then 
  mkdir $HOME/research 
fi

if [ -f $output ]
then 
  rm $output
fi

echo "Quick system audit script" >> $output
date >> $output
echo "" >> $output
echo "machine type info:" >> $output
echo -e "$MACHTYPE /n" >> $output
echo -e "Uname info: $uname -a) /n" >> $output
echo -e "IP Info:" >> $output
echo -e "$ip \n" >> $output
echo -e "Hostname: $(hostname -s) \n" >> $output
echo "DNS Servers: " >> $output
cat /etc/resolv.conf >> $output
echo -e "\nMemory Info:" >> $output
free >> $output
echo -e "\nCPU Info:" >> $output
lscpu | grep CPU >> $output
echo -e "\nDisk Usage:" >> $output
df -H | head -2 >> $output
echo -e "\nWho is logged in: \n $(who -a) \n" >> $output
echo -e "\nexec Files:" >> $output
echo $execs >> $output
echo -e "\nTop 10 Processes" >> $output

ps aux --sort -%mem | awk {'print $1, $2, $3, $4, $11'} | head >> $output
