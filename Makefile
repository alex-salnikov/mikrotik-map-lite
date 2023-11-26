# common scenarios

download:
	wget -P downloads https://download.mikrotik.com/routeros/7.12.1/netinstall-7.12.1.tar.gz
	tar -xzf downloads/netinstall-7.12.1.tar.gz netinstall-cli
	wget -P downloads https://download.mikrotik.com/routeros/7.12.1/routeros-7.12.1-mipsbe.npk
	wget -P downloads https://download.mikrotik.com/routeros/7.12.1/all_packages-mipsbe-7.12.1.zip
	unzip -d downloads downloads/all_packages-mipsbe-7.12.1.zip

upload:
	sudo ./netinstall-cli -a 192.168.1.222 -s custom.scr downloads/routeros-7.12.1-mipsbe.npk
