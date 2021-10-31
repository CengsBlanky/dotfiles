#! /bin/sh bash
# @since   2021-10-30 13:17
# @author  zengshuai
# @version 1.0

# display overall status of network manager
nmcli general status
# displat active connections
nmcli connection show --active
# display all configured connections
nmcli connection show configured
# get wifi  status
nmcli radio wifi
# turn wifi on or off
nmcli radio wifi <on|off>
# refresh previous list
nmcli device wifi rescan
# list available divices and their status
nmcli device status
# Create a new connection to a password protected AP
nmcli device wifi connect <SSID|BSSID> password <password>
