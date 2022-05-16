
PRINTER = cr6-se

build-octo-klipper-cr6-se: Dockerfile ./klipper-configs/$(PRINTER)/* ../raspi-os/build-raspi-os
	docker buildx build --allow security.insecure --build-arg PRINTER=$(PRINTER) --progress=plain --rm -t octo-klipper:latest .
