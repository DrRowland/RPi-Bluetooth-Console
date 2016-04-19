#!/bin/bash -e

echo Script for Linux raspberrypi 4.1.19-v7+ #858

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

echo Pair and "screen /dev/cu.raspberrypi-SerialPort 115200"

