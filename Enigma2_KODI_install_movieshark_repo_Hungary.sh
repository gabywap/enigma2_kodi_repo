#!/bin/sh
###############################################################################
## Enigma2 - Kodi automatikus telepítő és magyar repository beállító script
##
## - Ellenőrzi, hogy a Kodi elérhető-e az image csomagtárolójában
## - Telepíti a Kodi-t
## - Ellenőrzi, hogy létezik-e a Kodi userdata mappa
## - Letölti a sources.xml fájlt a meglévő userdata könyvtárba
## - Letölti a magyar Kodi repository ZIP-eket
## - Elhelyezi őket az /etc/enigma2 könyvtárban
##
## Készítette: Gabywap
## Verzió: 2.2
## Dátum: 2026.01.05
## telnet script command: wget -q "--no-check-certificate" http://gosathu.nhely.hu/Enigma2_KODI_install_movieshark_repo_Hungary.sh -O - | /bin/sh
###############################################################################

## Enigma2 - Kodi automatikus telepío és magyar repository beallito script ##

echo "Enigma2 - Kodi automatikus telepito es magyar repository beallito script" 
sleep 2
GREEN="\e[32m"
RED="\e[31m"
WHITE="\e[0;37m"

 echo -e $RED " 
#######                                #####  
#       #    # #  ####  #    #   ##   #     # 
#       ##   # # #    # ##  ##  #  #        # 
#####   # #  # # #      # ## # #    #  #####  
#       #  # # # #  ### #    # ###### #       
#       #   ## # #    # #    # #    # #       
####### #    # #  ####  #    # #    # ####### " 
   sleep 3
  echo -e $WHITE " 
##    ##  #######  ########  #### 
##   ##  ##     ## ##     ##  ##  
##  ##   ##     ## ##     ##  ##  
#####    ##     ## ##     ##  ##  
##  ##   ##     ## ##     ##  ##  
##   ##  ##     ## ##     ##  ##  
##    ##  #######  ########  #### 
"  
sleep 3
echo -e $GREEN " 
########  ######## ########   #######  
##     ## ##       ##     ## ##     ## 
##     ## ##       ##     ## ##     ## 
########  ######   ########  ##     ## 
##   ##   ##       ##        ##     ## 
##    ##  ##       ##        ##     ## 
##     ## ######## ##         #######  
" 
sleep 3
	 
echo -e $RED    "##     ##-##     ## ##    ##"
echo -e $RED    "##     ##-##     ## ###   ##"
echo -e $WHITE  "##     ##-##     ## ####  ##" 
echo -e $WHITE  "######### ##     ## ## ## ##"
echo -e $WHITE  "##     ## ##     ## ##  ####" 
echo -e $GREEN  "##     ## ##     ## ##   ###" 
echo -e $GREEN  "##     ##  #######  ##    ##" 
    sleep 3


KODI_PKG="enigma2-plugin-extensions-kodi"

SOURCES_URL="http://gosathu.nhely.hu/sources.xml"
MREPO_URL="http://gosathu.nhely.hu/repository.movieshark-2.7.2.zip"
SREPO_URL="http://gosathu.nhely.hu/repository.streamshark-1.0.1.zip"
KODISCRIPT="Enigma2_KODI_install_movieshark_repo_Hungary.sh"
KODI="http://gosathu.nhely.hu/Enigma2_KODI_install_movieshark_repo_Hungary.sh"

MREPO_ZIP="repository.movieshark-2.7.2.zip"
SREPO_ZIP="repository.streamshark-1.0.1.zip"
echo -e $WHITE 
echo "============================================================"
echo " Enigma2 - Kodi telepíto script (v2.2)"
echo "============================================================"
echo

###############################################################################
## 1. Feed frissítés
###############################################################################
echo ">> Csomagtarolok frissitese..."
opkg update
echo
###############################################################################
## 2. Script letoltese & telepitese /usr/script ala
###############################################################################

echo "=============================="
echo " KODI movieshark repo installer"
echo "=============================="
echo

echo "KODI movieshark - repo script letoltese!"
echo

wget -O /tmp/$KODISCRIPT $KODI
echo
echo "$KODISCRIPT letoltese kesz"
echo

cp -pr /tmp/$KODISCRIPT /usr/script/$KODISCRIPT
echo
echo "$KODISCRIPT /usr/script masolasa kesz"
echo

chmod 755 /usr/script/$KODISCRIPT
echo
###############################################################################
## 3. Kodi elérhetőség ellenőrzése
###############################################################################
echo ">> Kodi ellenorzese a repository-ban..."
if ! opkg info "$KODI_PKG" >/dev/null 2>&1 ; then
    echo "HIBA: Kodi nem erheto el ebben az image-ben!"
    exit 1
fi
echo "OK: Kodi elerheto."
echo

###############################################################################
## 4. Kodi telepítése
###############################################################################
echo ">> Kodi telepitese..."
if ! opkg install "$KODI_PKG"; then
    echo "HIBA: Kodi telepitese sikertelen!"
    exit 1
fi
echo "OK: Kodi telepitve."
echo

###############################################################################
## 5. Kodi userdata ellenőrzése
###############################################################################
if [ -d "/media/hdd/.kodi/userdata" ]; then
    KODI_USERDATA="/media/hdd/.kodi/userdata"
    echo ">> Kodi userdata: HDD"
elif [ -d "/home/root/.kodi/userdata" ]; then
    KODI_USERDATA="/home/root/.kodi/userdata"
    echo ">> Kodi userdata: belso flash"
else
    echo "HIBA: Kodi userdata mappa nem talalhato!"
    echo "Indítsd el egyszer a Kodi-t, majd futtasd ura a scriptet."
    exit 1
fi
echo

###############################################################################
## 6. sources.xml letöltése
###############################################################################
echo ">> sources.xml beallitasa..."
if ! wget -O "$KODI_USERDATA/sources.xml" "$SOURCES_URL"; then
    echo "HIBA: sources.xml letoltese sikertelen!"
    exit 1
fi
echo "OK: sources.xml kesz elhelyezve."
echo

###############################################################################
## 7. Repository ZIP-ek letöltése
###############################################################################
echo ">> Repository ZIP-ek letoltese..."
wget -O "/tmp/$MREPO_ZIP" "$MREPO_URL"
wget -O "/tmp/$SREPO_ZIP" "$SREPO_URL"

if [ ! -f "/tmp/$MREPO_ZIP" ] || [ ! -f "/tmp/$SREPO_ZIP" ]; then
    echo "HIBA: ZIP fajl(ok) letoltese sikertelen!"
    exit 1
fi
echo "OK: ZIP-ek letoltve."
echo

###############################################################################
## 8. ZIP-ek másolása
###############################################################################
cp -f "/tmp/$MREPO_ZIP" /etc/enigma2/
cp -f "/tmp/$SREPO_ZIP" /etc/enigma2/

rm -f "/tmp/$MREPO_ZIP" "/tmp/$SREPO_ZIP"

echo "OK: Repository ZIP-ek elhelyezve."
echo

###############################################################################
## 9. Enigma2 újraindítása
###############################################################################
echo "Telepites kesz. Enigma2 Ujrainditasa..."
sleep 3
killall enigma2 >/dev/null 2>&1

exit 0
