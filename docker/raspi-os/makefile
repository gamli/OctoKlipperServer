
RASPI_OS_IMAGE_URL = "https://downloads.raspberrypi.org/raspios_lite_arm64/images/raspios_lite_arm64-2022-04-07/2022-04-04-raspios-bullseye-arm64-lite.img.xz"

build-raspi-os: ../../tmp/raspi-os.img Dockerfile
	mkdir -p ./mnt-raspi-os-img
	if mountpoint ./mnt-raspi-os-img; then echo image is already mounted; else mount -r -t auto -o loop,offset=272629760 "../../tmp/raspi-os.img" ./mnt-raspi-os-img; fi
	docker build --progress=plain --pull --rm -t raspi-os:latest .
	umount ./mnt-raspi-os-img
	rmdir ./mnt-raspi-os-img
	touch build-raspi-os
	
../../tmp/raspi-os.img: ../../tmp/raspi-os.img.xz
	unxz --keep --stdout "../../tmp/raspi-os.img.xz" > "../../tmp/raspi-os.img"

../../tmp/raspi-os.img.xz:
	mkdir -p ../../tmp/
	curl -o "../../tmp/raspi-os.img.xz" $(RASPI_OS_IMAGE_URL)
