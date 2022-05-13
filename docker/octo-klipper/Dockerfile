FROM raspi-os

ARG PRINTER

ENV TERM xterm

RUN apt-get update && apt-get install -y git

RUN useradd -g root -G sudo,tty,dialout -m -d /home/printer -s /bin/bash printer && echo 'printer ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers
USER printer
ENV USER=printer
WORKDIR /home/printer

    # klipper install and update helper
RUN git clone https://github.com/th33xitus/kiauh.git &&\
    # change exit code auf the main script to 0 on succes
    sed -i 's/exit -1/exit 0/g' /home/printer/kiauh/scripts/ui/main_menu.sh

# klipper installation
RUN mkdir /home/printer/klipper_config &&\
   (\
   # installation menu
   echo 1;\
   # clipper installation
   echo 1;\
   # clipper config directory: set config folder
   echo /home/printer/klipper_config;\
   # confirm
   echo Y;\
   # install a single klipper instance
   echo 1;\
   # confirm
   echo Y;\
   # navigate to main menu
   echo B;\
   # quit kiauh
   echo Q;\
   ) | /home/printer/kiauh/kiauh.sh

COPY ./klipper-configs/$PRINTER/printer.cfg /home/printer/klipper_config/printer.cfg
COPY ./klipper-configs/$PRINTER/firmware.cfg /home/printer/klipper/.config

# build klipper firmware
RUN  (\
   # advanced menu
   echo 4;\
   # build only 
   echo 3;\
   # navigate to main menu
   echo B;\
   # quit kiauh
   echo Q;\
   ) | /home/printer/kiauh/kiauh.sh && echo "alias flash='/home/printer/kiauh/kiauh.sh'" >> /home/printer/.bashrc
    

# octoprint installation
RUN (\
   # installation menu
   echo 1;\
   # octoprint installation
   echo 7;\
   # confirm to create a single octoprint instance for our single Klipper instance
   echo Y;\
   # navigate to main menu
   echo B;\
   # quit kiauh
   echo Q;\
   ) | /home/printer/kiauh/kiauh.sh
    
# PrettyGCode installation
RUN (\
   # installation menu
   echo 1;\
     # PrettyGCode installation
   echo 8;\
   # confirm to use default port 7136
   echo;\
   # navigate to main menu
   echo B;\
   # quit kiauh
   echo Q;\
   ) | /home/printer/kiauh/kiauh.sh  
    
# Update everything
RUN (\
   # update menu
   echo 2;\
     # update everything
   echo a;\
   # navigate to main menu
   echo B;\
   # quit kiauh
   echo Q;\
   ) | /home/printer/kiauh/kiauh.sh  