#!/bin/bash

# Function to get CPU temperature (assumes /sys/class/thermal/thermal_zone0/temp exists)
get_cpu_temp() {
    echo $(sensors | grep 'Tctl' | awk '{print $2}')
}

# Function to get CPU usage percentage
get_cpu_usage() {
    cpu_usage=$(top -bn1 | grep "Cpu(s)" | sed "s/.*, *\([0-9.]*\)%* id.*/\1/" | awk '{print 100 - $1}')
    printf "%.1f%%" "$cpu_usage"
}

# Function to get RAM usage percentage, total and used
get_ram_info() {
    mem_total=$(free -h | awk '/Mem:/ {print $2}')
    mem_used=$(free -h | awk '/Mem:/ {print $3}')
    ram_usage=$(free | grep Mem | awk '{printf "%.1f", $3/$2 * 100}')
    echo "${mem_used} / ${mem_total} (${ram_usage}%)"
}

# Function to get Disk usage percentage, total and used (default root filesystem)
get_disk_info() {
    disk_usage_percent=$(df -h / | awk 'NR==2 {print $5}' | tr -d '%')
    disk_total=$(df -h / | awk 'NR==2 {print $2}')
    disk_used=$(df -h / | awk 'NR==2 {print $3}')
    echo "${disk_used} / ${disk_total} (${disk_usage_percent}%)"
}

# Function to get number of running threads
get_thread_count() {
    thread_count=$(ps -eLf | wc -l)
    echo $((thread_count - 1)) # Subtract header line
}

get_sound_volumn() {
    echo $(wpctl get-volume @DEFAULT_AUDIO_SINK@)
}

get_brightness() {
    echo $(brightnessctl info | sed -n '2p')
}

get_network() {
    echo -e $(nmcli connection show --active | awk '$4 != "lo" && NR>1 {printf "%s[%s]: %s\t", $3, $4, $1}')
}

spaces="\u00A0\u00A0"
# Output all stats line by line
echo -e "󰻠${spaces}CPU Usage: $(get_cpu_usage)"
echo -e "${spaces}CPU temp: $(get_cpu_temp)"
echo -e "󰍛${spaces}RAM Usage: $(get_ram_info)"
echo -e "󰋊${spaces}Disk Usage: $(get_disk_info)"
echo -e "󱡛${spaces}Threads: $(get_thread_count)"
echo -e "${spaces}$(get_sound_volumn)"
echo -e "󰖨${spaces}$(get_brightness)"
echo -e "${spaces}$(get_network)"
