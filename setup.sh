#!/bin/bash -e

echo Script for Raspberry Pi Zero W 1.1
echo Linux raspberrypi 4.4.50+ #970 Mon Feb 20 19:12:50 GMT 2017
echo Run once, reboot, and do not run again.
echo Running...

sudo bluetoothctl <<EOF > /dev/null
discoverable on
EOF

sudo sed -i: 's|^Exec.*toothd$| \
ExecStart=/usr/lib/bluetooth/bluetoothd -C \
ExecStartPost=/usr/bin/sdptool add SP \
ExecStartPost=/bin/hciconfig hci0 piscan \
|g' /lib/systemd/system/bluetooth.service

sudo cat <<EOF | sudo tee /etc/systemd/system/rfcomm.service > /dev/null
[Unit]
Description=RFCOMM service
After=bluetooth.service
Requires=bluetooth.service
 
[Service]
ExecStart=/usr/bin/rfcomm watch hci0 1 getty rfcomm0 115200 vt100 -a pi
 
[Install]
WantedBy=multi-user.target
EOF

sudo systemctl enable rfcomm

echo Now reboot, pair and connect.
echo E.g. In OSX, pair and in a terminal type:
echo screen /dev/cu.raspberrypi-SerialPort 115200

