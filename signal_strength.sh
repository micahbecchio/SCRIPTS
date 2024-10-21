#!/bin/bash

#--------------------------------#
#                                #
# AGGREGATE CONTROL RECEIVED     #
# SIGNAL STRENGTH INDICATOR.     #
#                                #
#--------------------------------#

signal="/System/Library/PrivateFrameworks/Apple80211.framework/Versions/Current/Resources/airport -I"

while true; do
    rssi_value=$($signal | grep agrCtlRSSI | awk '{print $2}')
    echo -ne "\rRSSI: $rssi_value"
    sleep 1
done
    