#!/usr/bin/env bash
this_script_path="$HOME/.config/argos/""$(basename "$0")"
status=$(tlp stat -s  | grep Mode | awk '{ print $3 }')
ac_icon="battery-full-charging-symbolic"
battery_icon="battery-symbolic"
get_status_icon_name(){
	if [ "$status" = "battery" ] 
	then 
        echo $battery_icon
	elif [  "$status" = "AC" ]
	then
		echo $ac_icon
	fi
}
active_mode_icon=$(get_status_icon_name)
tlp_ac="\"pkroot 'tlp ac'; $this_tlp_script_path\""
tlp_bat="\"pkroot 'tlp bat'; $this_tlp_script_path\""
status=$(tlp stat -s  | grep Mode | awk '{ print $3 }')
echo "| iconName=$active_mode_icon"
echo "---"
echo "On Power | iconName=$ac_icon bash=$tlp_ac terminal=false"
echo "On Battery | iconName=$battery_icon bash=$tlp_bat  terminal=false"
echo "---"
echo "Status: $status |  bash=$this_tlp_script_path terminal=false iconName=$active_mode_icon"
