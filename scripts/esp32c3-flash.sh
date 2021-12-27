# flash app
make -C ${MICRONODE}/platforms/esp32c3/build flash

# flash 
${MKSPIFFS}/mkspiffs -c ${MICRONODE}/framework -b 4096 -p 256 -s 0x100000 framework.bin
python ${IDF_PATH}/components/esptool_py/esptool/esptool.py --chip esp32c3 --port /dev/ttyUSB0 --baud 1152000 write_flash -z 0x200000 framework.bin
