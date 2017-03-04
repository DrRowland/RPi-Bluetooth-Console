# RPi-Bluetooth-Console

Script to setup Raspberry Pi to expose console via bluetooth.
N.B. There is no security implemented here (no pin etc...),
and the device always remains discoverable via bluetooth.
This can be turned off with bluetoothctl ("discoverable off").

To access, open a terminal (e.g. OSX)
```
screen /dev/cu.raspberrypi-SerialPort 115200
```
Optional note, to make terminal interactive:
```
pi@raspberrypi:~$ su pi - -c "ssh localhost"
Password: ********
pi@localhost's password: ********
```

For reference as to why this works:  
http://serverfault.com/questions/411307/cannot-set-terminal-process-group-during-su-to-another-user-as-login-shell
