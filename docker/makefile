


run-octo-klipper: build-octo-klipper
	docker-compose up -d TODO

build-octo-klipper:
	$(MAKE) -C ./raspi-os
	$(MAKE) -C ./octo-klipper


	
run-samba: build-samba
	docker-compose up -d samba	

build-samba:
	$(MAKE) -C ./samba




