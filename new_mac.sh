#!/bin/bash

##############---------#
#                      #
# CHANGE MAC ADDRESS.  #
#                      #
#-------------##########
# Using native commands.

# 1.) Get current MAC
# 2.) Randomly Generate some nums (e.g. last 2 hexs)
# 3.) Write the new MAC [sed 's/pattern/replacement/flags']
# 4.) Assign the new MAC
# 5.) Let the user know.
# *Optional.) Add Aliases

# -- -- -- --
sudo networksetup -setairportpower en0 off
sudo networksetup -setairportpower en0 on
current_mac=$(sudo ifconfig en0 | grep ether | awk '{print $2}') #1
random_num=$(printf '%02x' $((RANDOM % 256))) #2
new_mac=$(echo "$current_mac" | sed -E "s/:[0-9a-fA-F]{2}$/:$random_num/") #3
sudo ifconfig en0 ether $new_mac #4
echo "$current_mac changed to $new_mac" #5

# -- #2 DISCUSSION --: 
# RANDOM: Generates random integer from 0 to 32767
# % 256: Module to ensures the random num is between 0 and 255; fits in one byte.
# a.) 1 byte = 8 bits
# b.) 8 bits can represent 2^8=256 different values.
# c.) These values are numbered from 0 to 255.
# d.) In BINARY: 
# ..  255 is 11111111 (8 bits, fitting 1 byte)
# ..  256 is 100000000 (9 bits, requires 2 bytes)
 
# printf '%02x': %x converts to hexidecimal; 02 ensures it's always two digits, 
# .. padded with a leading 0.


# --  DISCONNECT FROM WIFI -- -- :
#sudo /System/Library/PrivateFrameworks/Apple80211.framework/Versions/Current/Resources/airport -z

# *) -- -- -- --
#add_alias(){
 #   local alias_name=$1
  #  local alias_command=$2
   # if ! grep -q "alias $alias_name=" ~/.bash_aliases; then
    #    echo "alias $alias_name='$alias_command'" >> ~/.bash_aliases
   # fi
#}

#add_alias chgmac '. ~/SCRIPTS/new_mac.sh'
#add_alias chkmac 'sudo ifconfig en0 | grep ether | awk "{print \$2}"'

