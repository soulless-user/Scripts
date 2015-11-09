#!/bin/bash

# check_output.sh by Jesse Carleton
# This is a skeleton to monitor regularly output files from some applications, such as pcap captures. 
# The alert is intended to kick off investigation as to what went wrong, but obviously won't work if it's a network or critical hardware issue.
# This only looks if a file was produced today, you can tweak it if you require hourly checks.
# script uses Mutt to send email, feel free to substitute with whatever you want. 
# add script to cron > 0 7 * * * /usr/scripts/./check_output.sh

DATEC="$(date +%Y"-"%m"-"%d)"
DATEFILE="$(ls -lrt --time-style=long-iso /folder/to/watch | grep "outputfile.series.to.watch" | tail -1 | head -n 1 | tr -s '  ' | cut -d" " -f6)"
echo "Current date : $DATECUR"
echo "File date    : $DATEFILE"
if [ "$DATEC" = "$DATEF" ]
then    echo "Everything is fine..."
else    echo "something is broken!" > /usr/scripts/out.txt && mutt -s "Alert! Something broke today!" your@email.com < /usr/scripts/out.txt
fi
exit 0