#!/usr/bin/bash
percent=$(df -h | grep fscratch | awk '{print $5}')
full=$(echo ${percent%%%})
[[ $full -ge 90 ]] && { 
    /fscratch/chois7/envs/p39/bin/python \
        /rtsess01/juno/home/chois7/bin/send_slack_alarm.py \
        -t /rtsess01/juno/home/chois7/.slack_custom_alarm_token \
        -c custom-alarm \
        -m "`date "+[%m/%d/%Y (%a) %H:%M %Z]"` \`/fscratch\` almost full: ${percent}"
};
