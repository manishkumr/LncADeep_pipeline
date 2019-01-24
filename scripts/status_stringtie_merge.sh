#bin/bash
while ping -c1 stringtie_merge &>/dev/null
do
     	echo "waiting for stringtie merge run to complete"
	sleep 1
done
echo "stringtie merge complete!"
