#!/bin/bash
printf "Memory\t\tDisk\t\tCPU\n"
SECONDS=$(date +'%S')
end=$((SECONDS+3600))
while [ $SECONDS -lt $end ];
do
m=$(free -m | awk 'NR==2{printf "%.2f%%\t\t", $3*100/$2 }')
d=$(df -h | awk 'NR==2{printf "%s%%\t\t", $5}')
c=$(top -bn1 | greep load |awk '{printf "%.2f%%\t\t\n/', $(NF-2)}')
echo "$m$d$c"
sleep 5
done