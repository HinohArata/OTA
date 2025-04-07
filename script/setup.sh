#!/bin/bash

# Color setup
cyan="\033[96m"
green="\033[92m"
red="\033[91m"
orange="\e[1;35m"
blue="\033[94m"
yellow="\033[93m"
def="\033[0m"

# Directory setup
TERM_DIR="/data/data/com.termux"
tsu="$TERM_DIR/files/usr/bin/sudo"
CMODE_PATH="$TERM_DIR/files/usr/bin/cmode"
PVP="$TERM_DIR/files/usr/bin/pv"
WG="$TERM_DIR/files/usr/bin/wget"

if ! [ -f $PVP ]; then
    apt -qq update && apt -qq -y upgrade
    apt install -y pv > /dev/null 2>&1
fi

typing() {
    echo -e "$1" | pv -qL 100
}

function setting_up() {
    if ! [ $WG ]; then
       apt install -y wget > /dev/null 2>&1
    fi
    su -c "$WG -q -O $CMODE_PATH https://raw.githubusercontent.com/HinohArata/OTA/main/script/cmode"
    if [ -f $CMODE_PATH ]; then
        typing "[+] ${green}Succesfully install depencies${def}"
        sleep 1
        typing "[i] ${yellow}Setup permissions...${def}"
        sleep 2
        su -c chmod +x $CMODE_PATH
        if [ -x $CMODE_PATH ]; then
            typing "[+] ${green}Permissions setup sucessfully${def}"
            sleep 2
            typing "[i] ${yellow}You can use ${green}'cmode' ${yellow}command to set your charge mode${def}"
        else
            typing "[!] ${red}Can't setup permissions${def}"
            typing "[i] ${yellow}aborting...${def}"
            exit 1
        fi
    else
        typing "[!] ${red}Failed to install dependencies, aborting...${def}"
        sleep 1
        exit 1
    fi
}

if ! [ -f $tsu ]; then
    typing "[i] ${yellow}sudo not found, installing now...${def}"
    sleep 1
    apt install -y tsu > /dev/null 2>&1
    if [ -f $tsu ]; then
        typing "[+] ${green}sudo succesfully installed${def}"
        sleep 1
        if ! [ -f $CMODE_PATH ]; then
            setting_up
        else
            typing "[i] ${red}$CMODE_PATH ${def}found! Delete it first"
        fi
    else
        typing "[!] ${red}Failed to install sudo, aborting...${def}"
        sleep 1
        exit 1
    fi
else
    typing "[i] ${yellow}sudo already installed, no need to install again${def}"
    typing "[i] ${yellow}Continuing to next step${def}"
    sleep 2
    if ! [ -f $CMODE_PATH ]; then
        setting_up
    else
        typing "[i] ${red}$CMODE_PATH ${def}found! Delete it first"
    fi
fi

