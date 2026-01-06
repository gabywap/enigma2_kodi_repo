# 🎬 Enigma2 – Kodi automatikus telepítő és magyar REPO beállító script

Ez a shell script **Enigma2 alapú beltéri egységeken** automatizálja a **Kodi telepítését**, valamint a **magyar Kodi repository-k és források (sources.xml)** beállítását.

A cél egy **gyors, biztonságos és egységes Kodi környezet** létrehozása friss Enigma2 telepítés után.

---

## ✨ Funkciók

- ✅ Ellenőrzi, hogy a **Kodi elérhető-e** az adott image csomagtárolójában  
- ✅ Automatikusan **telepíti a Kodi-t**
- ✅ Ellenőrzi a meglévő **Kodi userdata mappát**
- ✅ Letölti és beállítja a **sources.xml** fájlt
- ✅ Letölti a **magyar Kodi repository ZIP-eket**
- ✅ Elhelyezi őket az `/etc/enigma2` könyvtárban
- ✅ Hiba esetén **leáll**, nem fut végig feleslegesen
- ✅ A végén **újraindítja az Enigma2 felületet**

---

## 📦 Telepített Kodi repository-k

A script jelenleg az alábbi magyar repository-kat tölti le:

- `repository.movieshark-2.7.2.zip`
- `repository.streamshark-1.0.1.zip`

📂 Elérési út:
/etc/enigma2/



A ZIP-ek a Kodi-ban **„Install from ZIP file”** menüpontból telepíthetők.

---

## 📁 Kodi userdata mappa kezelése

A script **nem hoz létre userdata mappát**, csak ellenőrzi a meglévőt.

Elsődlegesen használt útvonal:
/media/hdd/.kodi/userdata



Másodlagos útvonal:
/home/root/.kodi/userdata



⚠️ Ha egyik sem létezik:
> Indítsd el egyszer a Kodi-t, majd futtasd újra a scriptet.

Ez biztosítja, hogy a Kodi már inicializálva legyen.

---

## ▶️ Telepítés (Telnet / SSH)

A script **közvetlenül futtatható**, letöltés nélkül:

```sh
wget -q "--no-check-certificate" \
http://gosathu.nhely.hu/Enigma2_KODI_install_movieshark_repo_Hungary.sh \
-O - | /bin/sh
📌 Másolható, egy soros verzió:

```sh
wget -q "--no-check-certificate" http://gosathu.nhely.hu/Enigma2_KODI_install_movieshark_repo_Hungary.sh -O - | /bin/sh
🌐 Használt források
🔗 Kodi repository tárhely


http://kodirepo.nhely.hu/
🔗 sources.xml


http://gosathu.nhely.hu/sources.xml
🛠 Követelmények
Enigma2 alapú image

Internetkapcsolat

Működő opkg

Az image tartalmazza az alábbi csomagot:


enigma2-plugin-extensions-kodi
ℹ️ Fontos megjegyzések
A script ékezetmentes kimenetet használ, telneten minden boxon jól olvasható

BusyBox sh kompatibilis

Biztonságos: hiba esetén azonnal kilép

A futás végén újraindítja az Enigma2 felületet

👤 Szerző
Gabywap
📦 Verzió: 2.2
📅 Dátum: 2026.01.05

☕ Zárás
A script szabadon használható, bővíthető.
A kodirepo tárhely később további Kodi repository-kkal is bővíthető.

Jó használatot! 🎥📺


