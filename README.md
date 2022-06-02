# MiniLux-32bit
simple Minimum Linux shell script initramfs and rootfs images builder with Windows 32bit, OpenGL and network support from official x86 sources

MiniLux, Building and launching linux from 40MB latest official sources and booting just in one minute!

MiniLux, Linux x86 on ARM devices (Android phones and tablets, Raspberries Pi 1,2,3,...).

MiniLux, Quick way to Windows x86 98,XP, 7, ... .

Install required packages by running below command at Ubuntu shell:

sudo apt install wget cpio

Making and launching instruction:

1- Run "git clone https://github.com/marzban2030/MiniLux-32bit".

2- Run "bash make.sh" in the project directory. Run "bash remake.sh" (Remake without again sources downloading) if running make.sh failed.

3- Run "bash qemu.sh". It use qemu-system-i386 command, So install its package in the host OS before everything.

4- Enter to the root RAM filesystem mode with username "root" and no password.

5- Run "sh /rootfs.sh" in the RAM filesystem mode to changing to real root filesystem mode.

6- Run "bash /config.sh" in the real root filesystem mode at every boot to configuring the system and network.

7- Run "bash /OpenGL.sh" in the real root filesystem mode to installing OpenGL and GLX if you need these.

8- Run "apt install wine-stable" in the real root filesystem mode to installing windows 32bit in linux if you need this. Do not forget: A- Increase hard.img size from 1G to 2G in the make.sh and remake.sh files before making images. B- apt should be updated by running "apt-get update" in real root filesystem mode before running this command.

9- Run "busybox reboot" in the real root filesystem mode to exiting.
