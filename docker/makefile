

run-octo-klipper: build-octo-klipper
	docker-compose up -d TODO

build-octo-klipper: build-raspi-os
	$(MAKE) -C ./octo-klipper

	
run-samba: build-samba
	docker-compose up -d samba	

build-samba: build-raspi-os
	$(MAKE) -C ./samba


build-raspi-os:
	$(MAKE) -C ./raspi-os