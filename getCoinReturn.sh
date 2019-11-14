#!/bin/bash
step=5
for (( i = 0; i < 60; i=(i+step) ));
do
php /home/wwwroot/tpToken/think GetCoinReturn
sleep $step
done
exit 0
