#Install software accelerated OpenGL, GLX and so on from official sources at MiniLux ...
echo 
echo 
echo It all take about half a hour to be completed automatically ...
echo 
echo 
apt-get update
apt install libc-bin wget -y
cd
wget http://security.debian.org/debian-security/pool/updates/main/m/mesa/libgl1-mesa-swx11_10.3.2-1+deb8u2_i386.deb
apt install /root/*mesa*swx11*.deb -y
cd
wget http://mirrors.kernel.org/ubuntu/pool/universe/m/mesa-demos/mesa-utils_8.4.0-1_i386.deb
apt install /root/mesa*utils*.deb -y
echo 
echo OpenGL and GLX installation has been completed. After exporting DISPLAY and PULSED_... to correct XSDL server, run glxinfo to viewing OpenGL informations. Run glxdemos to testing it.
echo 
echo 
