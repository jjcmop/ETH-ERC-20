#!/bin/bash
step=10
for (( i = 0; i < 60; i=(i+step) ));
do 
php /home/wwwroot/tpToken/think Task
sleep $step 
done
exit 0
