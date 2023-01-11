mdadm --zero-superblock --force /dev/sd{b,c,d,e,f}
mdadm --create --verbose /dev/md0 -l 1 -n 5 /dev/sd{b,c,d,e,f}
mkdir /etc/mdadm/
touch /etc/mdadm/mdadm.conf
bash -c 'echo "DEVICE partitions" > /etc/mdadm/mdadm.conf'
bash -c 'mdadm --detail --scan --verbose | awk '/ARRAY/{print}' >> /etc/mdadm/mdadm.conf'
