# enigma2_kodi_repo
enigma2 kodi repo script

📺 Enigma2 – Kodi automatikus telepítő script (Magyar repo támogatással)

Ez a script Enigma2 alapú set-top boxokon automatikusan telepíti a Kodi médialejátszót, amennyiben az adott image tárolójában elérhető a Kodi csomag.

A telepítés során a script:

feltelepíti a Kodi-t,

2 magyar Kodi repository ZIP-et telepít,

létrehoz / frissít egy sources.xml fájlt a Kodi userdata mappában,

hozzáad 2 magyar repo forrást, valamint egy saját kodirepo tárhelyet, ahová később több repository kerül feltöltésre.

Így a Kodi-ban a repók és kiegészítők egyszerűen, egy forrásból telepíthetők.

✅ Főbb funkciók

✔ Kodi automatikus telepítése Enigma2-n

✔ Magyar Kodi repository ZIP-ek telepítése

✔ Előre konfigurált sources.xml

✔ Saját Kodi repo tárhely használata

✔ Telnetes, egyparancsos futtatás

✔ Image-független (ha van Kodi a feedben)

🔧 Telepítés (ajánlott – Telnet / SSH)

Lépj be az Enigma2 eszközre telneten vagy SSH-n, majd futtasd az alábbi parancsot:

wget -q "--no-check-certificate" http://gosathu.nhely.hu/Enigma2_KODI_install_movieshark_repo_Hungary.sh -O - | /bin/sh


A script automatikusan lefut, nincs szükség további beavatkozásra.

📦 Használt Kodi repository tárhely

Saját Kodi repo tárhely (forrásként használható):

http://kodirepo.nhely.hu/


Forrásként használható sources.xml fájl:

http://kodirepo.nhely.hu/repo/sources.xml

🔁 Csak sources.xml használata (opcionális)

Ha csak a Kodi forrásokat szeretnéd hozzáadni (Kodi már telepítve van), akkor az alábbi parancsokkal külön is letölthető a sources.xml.

📍 Belső flash tárhely esetén:
wget -O /home/root/.kodi/userdata/sources.xml http://gosathu.nhely.hu/sources.xml

📍 USB pendrive / HDD (Kodi ezt hdd-nek látja):
wget -O /media/hdd/.kodi/userdata/sources.xml http://gosathu.nhely.hu/sources.xml

📁 FTP használata (kézi másolás)

Ha valaki FTP-n keresztül szeretné bemásolni a fájlt, ide kell elhelyezni:

🔹 Belső flash:
/home/root/.kodi/userdata/sources.xml

🔹 USB / HDD:
/media/hdd/.kodi/userdata/sources.xml

ℹ️ Fontos megjegyzések

A script nem módosít image-specifikus beállításokat

Kodi csak akkor települ, ha elérhető az adott image csomagtárolójában

A repo tárhely bővíthető, később további repository ZIP-ek kerülnek fel

A forrás egy helyen kezelhető, egyszerű karbantartással

🎉 Jó használatot!

Ha hibát találsz, vagy bővítenéd a megoldást (pl. új repo, új image támogatás), a projekt később GitHubon is bővíthető lesz.
