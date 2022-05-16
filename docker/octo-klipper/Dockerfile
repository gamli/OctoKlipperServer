FROM raspi-os

ARG PRINTER

ENV TERM xterm

RUN apt-get update && apt-get install -y git

# klipper install and update helper
RUN git clone https://github.com/th33xitus/kiauh.git &&\
    # remove "script must not be run as root" errors
    find ./kiauh/scripts/ -type f | xargs sed -i 's/"\$EUID" -eq 0/"$EUID" -eq 4711/g' &&\
    # remove all sudo calls since we are root
    find ./kiauh/scripts/ -type f | xargs sed -i 's/sudo//g' &&\
    # change exit code auf the main script to 0 on succes
    sed -i 's/exit -1/exit 0/g' ./kiauh/scripts/ui/main_menu.sh

RUN echo "installing klipper" && sleep 10
# klipper installation
RUN mkdir ./klipper_config &&\
   (\
   # installation menu
   echo 1;\
   # clipper installation
   echo 1;\
   # clipper config directory: set config folder
   echo ./klipper_config;\
   # confirm
   echo Y;\
   # install a single klipper instance
   echo 1;\
   # confirm
   echo Y;\
   # navigate to main menu
   sleep 10;\
   echo B;\
   # quit kiauh
   echo Q;\
   ) | ./kiauh/kiauh.sh

COPY ./klipper-configs/$PRINTER/printer.cfg ./klipper_config/printer.cfg
COPY ./klipper-configs/$PRINTER/firmware.cfg ./klipper/.config

RUN echo "building klipper firmware" && sleep 10
# build klipper firmware
RUN  (\
   # advanced menu
   echo 4;\
   # build only 
   echo 3;\
   # navigate to main menu
   sleep 10;\
   echo B;\
   # quit kiauh
   echo Q;\
   ) | ./kiauh/kiauh.sh && echo "alias flash='./kiauh/kiauh.sh'" >> ./.bashrc    
   
RUN echo "installing octoprint" && sleep 10
# octoprint installation
RUN (\
   # installation menu
   echo 1;\
   # octoprint installation
   echo 7;\
   # confirm to create a single octoprint instance for our single Klipper instance
   echo Y;\
   # navigate to main menu
   sleep 10;\
   echo B;\
   # quit kiauh
   echo Q;\
   ) | ./kiauh/kiauh.sh
   
RUN echo "installing PrettyGCode plugin for octoprint" && sleep 10    
# PrettyGCode installation
RUN (\
   # installation menu
   echo 1;\
     # PrettyGCode installation
   echo 8;\
   # confirm to use default port 7136
   echo;\
   # navigate to main menu
   sleep 10;\
   echo B;\
   # quit kiauh
   echo Q;\
   ) | ./kiauh/kiauh.sh  
   
CMD /bin/bash    
