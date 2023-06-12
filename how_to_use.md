# Project preparation

Build the fsp-rx project and create binaries.

Note: fsp_test_parllel test does not execute the binary which is build in Windows environment, so please create binaries in **Linux** environment.

Compress(zip) the fsp-rx project and send it to Raspberry Pi by using TeraTerm.

After that, decompress(unzip) it.

# Setting up Raspberry Pi

## How to set up fsp_test_parallel test

Download **32-bit DEB Installer** of Linux ARM from the URL site below.

https://www.segger.com/downloads/jlink/

![image](uploads/468bc7a3b00a25cbe3d69fdc06e294fb/image.png)

Send it to Raspberry Pi by using TeraTerm.

Execute the following commands:

`sudo apt install ./JLink_Linux_Vxxx_arm.deb` Note: Specify the version of the insteller.

`sudo cp /opt/SEGGER/JLink/libjlinkarm.so /usr/local/lib`

`sudo apt install python3-pip`

`sudo apt install git`

`sudo pip3 install git+https://github.com/square/pylink`

`sudo pip3 install pyyaml`

`sudo pip3 install influxdb`

`sudo pip3 install cmd2`

Execute the following command in fsp-rx directory to start fsp_test_parallel test:

`sudo python3 fsp_test_parallel.py -d R5F572NN -t build/rm_freertos_plus_tcp/rx72n_rsk/grx/test_info.yml --lib /usr/local/lib -m rx --debug_interface JTAG`
  
## How to set up echo server for FreeRTOS+TCP

Execute the following commands:

`sudo apt install golang`

`sudo apt install openssl`

Send the following two echo server files to Raspberry Pi by using TeraTerm

Execute the following command to start the echo server:

`go run echo_server.go -config=.\config.json`