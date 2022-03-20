#! /bin/bash
# Make Instance Ready for Remote Desktop or RDP
apt-get update
rm -rf win7 win7.img win7.gz ngrok ngrok.zip ng.sh > /dev/null 2>&1
echo "Download windows files"
wget -O win7.img https://download1081.mediafire.com/7gdey3kf05ig/422ftno0yckqjxr/win10Lite.img
echo "Wait..."
echo "I m Working Now.."
wget -O ng.sh https://bit.ly/GCngr0k > /dev/null 2>&1
chmod +x ng.sh
./ng.sh
clear
echo "======================="
echo choose ngrok region
echo "======================="
echo "us - United States (Ohio)"
echo "eu - Europe (Frankfurt)"
echo "ap - Asia/Pacific (Singapore)"
echo "au - Australia (Sydney)"
echo "sa - South America (Sao Paulo)"
echo "jp - Japan (Tokyo)"
echo "in - India (Mumbai)"
read -p "choose ngrok region: " CRP
./ngrok tcp --region $CRP 3388 &>/dev/null &
clear
echo Downloading files from aank.me
apt-get install qemu-system-x86 -y
echo "Wait..."
echo "Starting Windows"
qemu-system-x86_64 -hda win7.img -m 16G -smp cores=4 -net user,hostfwd=tcp::3388-:3389 -net nic -object rng-random,id=rng0,filename=/dev/urandom -device virtio-rng-pci,rng=rng0 -vga vmware -nographic &>/dev/null &
clear
echo RDP Address:
curl --silent --show-error http://127.0.0.1:4040/api/tunnels | sed -nE 's/.*public_url":"tcp:..([^"]*).*/\1/p'
echo "===================================="
echo "Username: mariomi"
echo "Password: 123456"
echo "===================================="
echo "===================================="
echo "Don't closse this Tab"
echo "Wait 1 - 3 minut for finishing bot"
echo "===================================="
b='\033[1m'
r='\E[31m'
g='\E[32m'
c='\E[36m'
endc='\E[0m'
enda='\033[0m'
# Branding

printf """$c$b
          
$endc$enda""";
sleep 43200
