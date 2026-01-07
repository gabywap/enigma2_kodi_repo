# Enigma2 – Kodi automatikus telepítő és magyar repository beállító script

Ez a script **Enigma2 alapú set-top boxokon** automatikusan telepíti a **Kodi médialejátszót**, majd beállítja a szükséges **magyar Kodi repository-kat** és a `sources.xml` fájlt.

A script **image-független**, amennyiben az adott Enigma2 image csomagtárolójában elérhető a Kodi.

---

## 📌 Fő funkciók

- ✔ Ellenőrzi, hogy a Kodi elérhető-e az image repository-jában  
- ✔ Automatikusan telepíti a Kodi-t (`opkg`)  
- ✔ Ellenőrzi a Kodi `userdata` mappát (belső flash vagy HDD)  
- ✔ Letölti és beállítja a `sources.xml` fájlt  
- ✔ Letölti a magyar Kodi repository ZIP-eket  
- ✔ Elhelyezi a ZIP-eket az `/etc/enigma2` könyvtárban  
- ✔ A script saját magát bemásolja az `/usr/script` könyvtárba  
- ✔ Enigma2 újraindítással zárja a folyamatot  

---

## 🧰 Követelmények

- Enigma2 alapú rendszer
- Internet kapcsolat
- `opkg` csomagkezelő
- Olyan image, amely tartalmazza a Kodi csomagot:
enigma2-plugin-extensions-kodi

yaml
Kód másolása

---

## 🚀 Gyors telepítés (ajánlott)

Futtasd **telneten vagy SSH-n** az alábbi parancsot:

```sh
wget -q "--no-check-certificate" http://gosathu.nhely.hu/Enigma2_KODI_install_movieshark_repo_Hungary.sh -O - | /bin/sh
📂 Mit csinál pontosan a script?
1️⃣ Feed frissítés
sh
Kód másolása
opkg update
2️⃣ Script öntelepítés
A script letölti saját magát, majd bemásolja ide:

text
Kód másolása
/usr/script/Enigma2_KODI_install_movieshark_repo_Hungary.sh
Jogosultság beállítása:

sh
Kód másolása
chmod 755 /usr/script/Enigma2_KODI_install_movieshark_repo_Hungary.sh
Ez biztosítja, hogy frissítés esetén mindig az új verzió fusson.

3️⃣ Kodi elérhetőség ellenőrzése
Ha a Kodi nem elérhető az adott image repository-jában, a script leáll:

text
Kód másolása
HIBA: Kodi nem érhető el ebben az image-ben!
4️⃣ Kodi telepítése
sh
Kód másolása
opkg install enigma2-plugin-extensions-kodi
Sikertelenség esetén a script megszakad.

5️⃣ Kodi userdata mappa ellenőrzése
A script nem hoz létre mappát, csak ellenőriz:

Elsőbbségi sorrend:

HDD:

text
Kód másolása
/media/hdd/.kodi/userdata
Belső flash:

text
Kód másolása
/home/root/.kodi/userdata
⚠ Ha egyik sem létezik:

a Kodi még nem lett elindítva

a script leáll

indítsd el egyszer a Kodi-t, majd futtasd újra a scriptet

6️⃣ sources.xml beállítása
A következő fájl kerül letöltésre:

text
Kód másolása
http://gosathu.nhely.hu/sources.xml
Ide másolva:

text
Kód másolása
.kodi/userdata/sources.xml
A fájl tartalmazza:

magyar Kodi repo-kat

saját Kodi repo tárhelyet

7️⃣ Magyar Kodi repository ZIP-ek
Letöltött ZIP-ek:

repository.movieshark-2.7.2.zip

repository.streamshark-1.0.1.zip

Célkönyvtár:

text
Kód másolása
/etc/enigma2/
Ezeket Kodi-ból ZIP fájlból telepítés módszerrel lehet felvenni.

8️⃣ Enigma2 újraindítása
A telepítés végén a rendszer újraindul:

sh
Kód másolása
killall enigma2
🌐 Használt linkek
Script:

arduino
Kód másolása
http://gosathu.nhely.hu/Enigma2_KODI_install_movieshark_repo_Hungary.sh
Kodi repo tárhely:

arduino
Kód másolása
http://kodirepo.nhely.hu/
ℹ️ Verzió információ
Verzió: 2.2

Dátum: 2026.01.05

Készítette: Gabywap

⚠️ Megjegyzés
Ez a script nem módosít image specifikus beállításokat, kizárólag:

Kodi telepítés

Kodi userdata konfigurálás

repository előkészítés

Használata saját felelősségre történik.

✅ Jó szórakozást és jó Kodi használatot!