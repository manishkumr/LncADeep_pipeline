#bin/bash
while ping -c1 stringtie &>/dev/null
do
     	echo "waiting for stringtie run to complete"
	sleep 1m
done
echo "strintie run complete!"
