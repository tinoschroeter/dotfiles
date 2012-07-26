#!/bin/bash
BATTERY_DIR=/proc/acpi/battery/BAT0
AC_DIR=/proc/acpi/ac_adapter/AC

if grep -q 'last full capacity' ${BATTERY_DIR}/info ; then
FULL_BATTERY=$( awk '/last full capacity/ {print $4}' ${BATTERY_DIR}/info )
CURRENT_BATTERY=$( awk '/remaining capacity/ {print $3}' ${BATTERY_DIR}/state )
PERCENT=$(( ${CURRENT_BATTERY} * 100 / ${FULL_BATTERY} ))

if [ $PERCENT -gt "90" ] ; then
    color="tput setaf 2"
    bar="[########]"
    elif [ $PERCENT -gt "80" ] ; then
    color="tput setaf 2"
    bar="[####### ]"
    elif [ $PERCENT -gt "70" ] ; then
    color="tput setaf 2"
    bar="[######  ]"
    elif [ $PERCENT -gt "60" ] ; then
    color="tput setaf 3"
    bar="[#####   ]"
    elif [ $PERCENT -gt "50" ] ; then
    color="tput setaf 3"
    bar="[####    ]"
    elif [ $PERCENT -gt "40" ] ; then
    color="tput setaf 3"
    bar="[###     ]"
    elif [ $PERCENT -gt "15" ] ; then
    color="tput setaf 3"
    bar="[##      ]"
    else
    color="tput setaf 1"
    bar="[#       ]"
    fi
$color    
if grep -q on-line ${AC_DIR}/state; then
echo "$bar Netz $PERCENT%"
else
echo "$bar Akku $PERCENT%"
fi
else
echo "Ohne Akku"
fi
