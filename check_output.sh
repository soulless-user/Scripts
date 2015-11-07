#!/bin/bash

# check_output.sh by Jesse Carleton
# This is a skeleton to monitor regularly output files from some applications, such as pcap captures. 
# The alert is intended to kick off investigation as to what went wrong, but obviously won't work if it's a network or critical hardware issue.
# This only looks if a file was produced today, you can tweak it if you require hourly checks.
# script uses Mutt to send email, feel free to substitute with whatever you want. 
# add script to cron > 0 7 * * * /usr/scripts/./check_output.sh



DATECUR="$(date +%b%e)"
# depending on your distro, ls -ltr might produce different output compared to what I have for this example (Debian 8.1)
# be sure to review if cut is doing its job correctly, you might need to tweak the fields returned (-f#,#)
DATEFILE="$(ls -ltr /folder/with/files/to_watch | grep "outputfile.series.to.watch" | tail -1 | cut -d" " -f6,8)"
echo "Current date : $DATECUR"
echo "File date    : $DATEFILE"
if [ "$DATEC" = "$DATEF" ]
then    echo "Everything is fine..."
else    echo "something is broken!" > /usr/scripts/chkout.txt && mutt -s "Alert! Something broke today!" your@email.com < /usr/scripts/chkout.txt
fi
exit 0
