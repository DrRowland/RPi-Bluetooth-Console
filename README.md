# RPi-Bluetooth-Console

Script to setup Raspberry Pi to expose console via bluetooth.
N.B. There is no security implemented here (no pin etc...),
and the device always remains discoverable via bluetooth.
This can be turned off with bluetoothctl ("discoverable off").

Note, to make terminal interactive:
su pi -
ssh localhost
