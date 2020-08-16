install:
	cp bin/shest /usr/bin/shest
	mkdir -p /etc/shest
	cp config/defaults.example /etc/shest/defaults
	cp config/overrides.example /etc/shest/overrides

uninstall:
	rm /usr/bin/shest
	rm -Rf /etc/shest
