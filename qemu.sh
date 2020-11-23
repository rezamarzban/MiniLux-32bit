
#Run qemu. You can increase qemu virtual machine RAM size by changing 128M to 192M and more.
qemu-system-i386 -cpu athlon -smp $(nproc) -m 128M -kernel linux -initrd initramfs.gz -hda hard.img -hdb hard2.img -net user -net nic -nographic -append "console=ttyS0" -no-reboot
