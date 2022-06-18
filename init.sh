#!/bin/busybox sh

busybox rm /init
busybox mkdir -p /etc /proc /root /sbin /sys /usr/bin /usr/sbin
echo tty1::respawn:/sbin/getty 0 tty1 > /etc/inittab
echo tty2::respawn:/sbin/getty 0 tty2 >> /etc/inittab
echo tty3::respawn:/sbin/getty 0 tty3 >> /etc/inittab
echo tty4::respawn:/sbin/getty 0 tty4 >> /etc/inittab
echo tty5::respawn:/sbin/getty 0 tty5 >> /etc/inittab
echo tty6::respawn:/sbin/getty 0 tty6 >> /etc/inittab
echo ttyS0::respawn:/sbin/getty -L ttyS0 9600 vt100 >> /etc/inittab
echo Welcome to MiniLux ...
echo After login run sh /rootfs.sh > /etc/issue
echo >> /etc/issue
echo Login with root and no password. >> /etc/issue
echo >> /etc/issue
echo root::0:0:root:/root:/bin/sh > /etc/passwd
busybox mount -t proc proc /proc
busybox mount -t sysfs sys /sys
busybox mdev -s
busybox --install
hostname localhost
ip link set lo up
echo 5 > /proc/sys/kernel/printk
exec /linuxrc
