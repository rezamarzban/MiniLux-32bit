#Step1: Download latest binary busybox from its official website.
wget https://busybox.net/downloads/binaries/1.31.0-defconfig-multiarch-musl/busybox-i686

#Step2: Download latest famous linux Kernel from ubuntu official website.
wget http://archive.ubuntu.com/ubuntu/dists/bionic-updates/main/installer-i386/current/images/netboot/ubuntu-installer/i386/linux

#Step3: Download latest famous linux distribution base archived file (Ubuntu 18.04 LTS) from its official website.
wget http://cdimage.ubuntu.com/ubuntu-base/releases/18.04/release/ubuntu-base-18.04.5-base-i386.tar.gz

#Step4: Download linux modules installer package according to linux Kernel version and linux distribution version from its official website.
wget http://security.ubuntu.com/ubuntu/pool/main/l/linux/linux-modules-4.15.0-112-generic_4.15.0-112.113_i386.deb

#Step5: Make initramfs image!
install -Dm0755 busybox-i686 initramfs/bin/busybox
install -Dm0755 init.sh initramfs/init
cp rootfs.sh initramfs/
cd initramfs
find . | sort | cpio -o -H newc -R 0:0 | gzip -9 > ../initramfs.gz
cd ..

#Step6: Make rootfs on hard.img image file (for virtual machines). Increase hard disk image size by changing 1G to 2G and more at last command.
mkdir ubunturootfs
tar -xf *ubuntu*base*.tar.gz -C ubunturootfs
install -Dm0755 busybox-i686 ubunturootfs/bin/busybox
cp *.deb ubunturootfs/root/
cp mod.sh ubunturootfs/
cp config.sh ubunturootfs/
cp devpts.sh ubunturootfs/
cp swap.sh ubunturootfs/
cp OpenGL.sh ubunturootfs/
mke2fs -L '' -N 0 -O ^64bit -d "ubunturootfs" -m 5 -r 1 -t ext2 "hard.img" 1G

#Step7: Create hard2.img image file for linux swap memory (at virtual machines), You can increase it by changing 512MB to 1GB and more.
qemu-img create -f raw hard2.img 512M

#Step8: Run qemu ...
echo 
echo Run bash qemu.sh
echo 
echo If make fail then run bash remake.sh
echo 
echo 
