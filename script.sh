cd /home/pi
sudo apt-get update
sudo apt-get remove node nodejs nodejs-legacy -y
sudo apt-get install git-core libnss-mdns libavahi-compat-libdnssd-dev -y
if uname -m | grep -q "armv6l"; then
    clear
    echo "legacy Raspberry Pi detected"
    sleep 1
    sudo wget http://node-arm.herokuapp.com/node_latest_armhf.deb
    sudo dpkg -i node_latest_armhf.deb
    sudo rm -rf node_latest_armhf.deb
    sudo npm install -g n
    sudo rm /usr/local/bin/node
    sudo rm -rf /usr/local/lib/node_modules/npm
    sudo n prune
    sudo n stable
else
    sudo curl -sL https://deb.nodesource.com/setup_12.x | sudo -E bash -
    sudo apt-get install nodejs -y
    sudo npm install -g n
    sudo rm /usr/local/bin/node
    sudo rm -rf /usr/local/lib/node_modules/npm
    sudo n prune
    sudo n stable
fi
sudo apt-get install gcc g++ make -y
sudo npm install -g node-gyp
sudo git clone --branch v0.4.27 https://github.com/KhaosT/HAP-NodeJS.git
cd HAP-NodeJS/
sudo rm -rf accessories/AirConditioner_accessory.js
sudo npm install
