#!/bin/bash
#echo > dscp.txt
for i in {0..63}
do
        TOS=$(($i * 4))
        ping -W 1 -c 1 -Q $TOS google.com.au > /dev/null
        RETVAL=$?
        if [ $RETVAL -eq 0 ]; then
                echo "DSCP $i ToS $TOS: Passed!" # >> dscp.txt
        else
                echo "DSCP $i ToS $TOS: FAILED!" # >> dscp.txt
        fi
done
