
raspi-os-image-url = "https://downloads.raspberrypi.org/raspios_lite_arm64/images/raspios_lite_arm64-2022-04-07/2022-04-04-raspios-bullseye-arm64-lite.img.xz"

build-raspi-os: download-raspi-os-image raspi-os.img.xz Dockerfile
	if [ ! -d "./mnt-raspi-os-img" ]; then mkdir ./mnt-raspi-os-img; else echo "mount point already exists"; fi
	mount -r -t auto -o loop,offset=272629760 "../tmp/raspi-os.img.xz" ./mnt-raspi-os-img
	docker build --progress=plain --pull --rm -t raspi-os:latest .
	umount ./mnt-raspi-os-img
	rmdir ./mnt-raspi-os-img
	
extract-raspi-os-image: download-raspi-os-image ./tmp/raspi-os.img.xz
	if [ ! -f "raspi-os.img" ]; then unxz --stdout "../tmp/raspi-os.img.xz" > "../tmp/raspi-os.img.xz"; else echo "image already extracted"; fi

download-raspi-os-image:
	if [ ! -f "raspi-os.img.xz" ]; then curl -o "../tmp/raspi-os.img.xz" $(raspi-os-image-url); else echo "image already downloaded"; fi
