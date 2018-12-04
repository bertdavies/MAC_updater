#!/bin/bash

# User introduction

clear
echo "Mac Spoof"
echo "---------"
echo ""
echo "Scrip will change the MAC address of your chosen interface"
echo ""
echo ""


# Get interface and display curent MAC

echo "Enter interface name : "
read interfaceName
clear
currentMac=$(cat /sys/class/net/$interfaceName/address)
echo "The MAC address of $interfaceName is Currently $currentMac"



# Get new MAC address

echo ""
echo ""
echo "Enter 1 of 6 hex values :"
read hex1
echo "Enter 2 of 6 hex values :"
read hex2
echo "Enter 3 of 6 hex values :"
read hex3
echo "Enter 4 of 6 hex values :"
read hex4
echo "Enter 5 of 6 hex values :"
read hex5
echo "Enter 6 of 6 hex values :"
read hex6
spacerVar=':'
macAddress=$hex1$spacerVar$hex2$spacerVar$hex3$spacerVar$hex4$spacerVar$hex5$spacerVar$hex6



# Assign new mac addres to interface

sudo ip link set dev $interfaceName down
sudo ip link set dev $interfaceName address $macAddress
sudo ip link set dev $interfaceName up


# Confirm new MAC

echo ""
echo ""
echo "-----------------------------------------------------------"
currentMac=$(cat /sys/class/net/$interfaceName/address)
echo "- The MAC address of $interfaceName is Currently $currentMac"
echo "-----------------------------------------------------------"