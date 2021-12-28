#!/bin/bash
# This file is part of the https://github.com/Maxximo88
# Copyright (c) 2022 Carofano Massimo Antonio
# 
# This program is free software: you can redistribute it and/or modify  
# it under the terms of the GNU General Public License as published by  
# the Free Software Foundation, version 3.
#
# This program is distributed in the hope that it will be useful, but 
# WITHOUT ANY WARRANTY; without even the implied warranty of 
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU 
# General Public License for more details.
#
# You should have received a copy of the GNU General Public License 
# along with this program. If not, see <http://www.gnu.org/licenses/>.
#
echo -e "\e[1;34m=====================================\e[0m"
echo -e "\e[1;34mSystem analysis..\e[0m"
echo -e "\e[1;34m=====================================\e[0m"
DISTRO=$(lsb_release -i | cut -f 2-)
if [ $DISTRO == "Jingos" ]; then
	echo "You are running $DISTRO "
else
	echo -e "\e[1;31mThis script is not compatible with ($DISTRO)\e[0m"
	exit
fi
echo -e "\e[1;34m=====================================\e[0m"
echo 'Follow me on Caroblog.it and Twitter @Maxximo88'
echo -e "\e[1;34m=====================================\e[0m"
echo ''
PS3='What is your plan? '
options=("Install Android environment" "Install basic Android Apps" "Install GNU/Linux proposed software" "Clean Distro" "Quit")
select opt in "${options[@]}"
do
	case $opt in
		"Install Android environment")
			sudo apt update
			sudo apt install android-compatible-env
			sudo apt install japm
			sudo systemctl enable android-compatible-env --now
			echo ''
			clear
			echo 'Ok, the Android compatibility for JingPad A1 is now installed and ready to work!'
			echo 'I suggest to reboot your device'
			echo -e "\e[1;31mOptions available: 1.Install Android environment; 2.Install basic Android Apps; 3.Install GNU/Linux proposed software; 4.Clean Distro; 5.Quit\e[0m"
		;;
		"Install basic Android Apps")
			echo 'Credit to Cooper eqixcx'
			sudo apt install wget
			echo 'Install F-Droid'
			wget "https://f-droid.org/F-Droid.apk" -O ./fdroid.apk
			sudo japm install -i ./fdroid.apk
			echo 'Install Aurora Store'
			wget "https://files.auroraoss.com/AuroraStore/Nightly/AuroraStore-nightly-signed-202112080000.apk" -O ./aurora.apk
			sudo japm install -i ./aurora.apk
			echo 'Install Amaze File Manager'
			wget "https://github.com/TeamAmaze/AmazeFileManager/releases/download/v3.6.7/app-fdroid-release.apk" -O ./file.apk
			sudo japm install -i ./file.apk
			echo 'Install Open Board'
			wget "https://github.com/dslul/openboard/releases/download/v1.4.3/app-release.apk" -O ./keyboard.apk
			sudo japm install -i ./keyboard.apk
			clear
			echo -e "\e[1;34m=====================================\e[0m"
			echo ''
			echo -e "\e[1;31mOptions available: 1.Install Android environment; 2.Install basic Android Apps; 3.Install GNU/Linux proposed software; 4.Clean Distro; 5.Quit\e[0m"
		;;		
		"Install GNU/Linux proposed software")
			sudo apt update
			sudo apt install -y apt-transport-https apt-xapian-index audacity bleachbit blender bluefish chafa deborphan dirmngr
			clear
			echo '1/5 Apps installed..'
			sudo apt install -y evince filezilla gdebi gimp rawtherapee git htop ifuse inkscape Kdenlive krita libdvd-pkg
			clear
			echo '2/5 Apps installed..'
			sudo apt install -y libgtk-perl libreoffice libreoffice-gtk3 libreoffice-kde5 libreoffice-style-sifr nautilus neofetch
			clear
			echo '3/5 Apps installed..'
			sudo apt install -y openjdk-8-jre openscad openshot python3 rhythmbox snapd software-properties-common software-properties-gtk
			clear
			echo '4/5 Apps installed..'
			sudo apt install -y synaptic stacer tasksel thunderbird ttf-mscorefonts-installer vlc wget
			clear
			echo 'All Apps are now installed..'
			sudo dpkg-reconfigure libdvd-pkg
			sudo apt install -f
			clear
			neofetch
			echo 'Neofetch is nice uh?'
			echo -e "\e[1;34m=====================================\e[0m"
			echo ''
			echo -e "\e[1;31mOptions available: 1.Install Android environment; 2.Install basic Android Apps; 3.Install GNU/Linux proposed software; 4.Clean Distro; 5.Quit\e[0m"
		;;
		"Clean Distro")
			echo ''
			echo 'Verify packages'
			echo ''
			sudo apt update
			sudo apt install -f
			echo ''
			echo 'Remove unuseful depQuitencies'
			echo ''
			sudo apt --purge autoremove
			echo ''
			echo 'Remove obsolete packages'
			echo ''
			sudo apt autoclean
			echo ''
			echo 'Remove obsolete downloaded packages'
			echo ''
			sudo apt clean
			echo ''
			clear
			echo -e "\e[1;34m=====================================\e[0m"
			echo ''
			echo -e "\e[1;31mOptions available: 1.Install Android environment; 2.Install basic Android Apps; 3.Install GNU/Linux proposed software; 4.Clean Distro; 5.Quit\e[0m"
		;;
		"Quit")
			echo 'Remember to follow me on Caroblog.it and Twitter @Maxximo88'
			break
		;;
		*) echo invalid option;;
	esac
done
