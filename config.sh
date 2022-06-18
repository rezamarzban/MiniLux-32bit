
#Config ... 
reset
cd
mount -t proc proc /proc
mount -t sysfs sys /sys
mount -t tmpfs tmpfs /run
busybox mdev -s
mount -t devpts devpts /dev/pts || bash /devpts.sh
swapon /dev/sdb || bash /swap.sh
echo nameserver 10.0.2.3 > /etc/resolv.conf
busybox modprobe e1000 || bash /mod.sh
busybox ifconfig eth0 10.0.2.15
busybox route add default gw 10.0.2.2
