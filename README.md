![Enigma2](https://img.shields.io/badge/Platform-Enigma2-blue.svg)
![Kodi](https://img.shields.io/badge/Supported-Kodi-brightgreen.svg)
![Version](https://img.shields.io/badge/Version-2.2-yellow.svg)

# Enigma2 – Kodi automatikus telepítő és magyar repository beállító script

Ez a script Enigma2 alapú set-top boxokon automatikusan telepíti a Kodi médialejátszót, majd beállítja a szükséges magyar Kodi repository-kat és a `sources.xml` fájlt.

A script image-független, amennyiben az adott Enigma2 image csomagtárolójában elérhető a Kodi (csomag neve: `enigma2-plugin-extensions-kodi`).

---

## 📌 Fő funkciók

- Ellenőrzi, hogy a Kodi elérhető-e az image repository-jában  
- Automatikusan telepíti a Kodi-t (`opkg`)  
- Ellenőrzi a Kodi `userdata` mappáját (belső flash vagy HDD)  
- Letölti és beállítja a `sources.xml` fájlt a Kodi userdata könyvtárába  
- Letölti a magyar Kodi repository ZIP-eket és az `/etc/enigma2` könyvtárba helyezi őket  
- A script önmagát bemásolja az `/usr/script` könyvtárba (telepített példány)  
- A folyamat végén újraindítja az Enigma2-t

---

## 🧰 Követelmények

- Enigma2 alapú rendszer  
- Internet kapcsolat  
- `opkg` csomagkezelő  
- Az image tartalmazza a Kodi csomagot: `enigma2-plugin-extensions-kodi`

---

## 🚀 Gyors telepítés (ajánlott)

Futtasd telneten vagy SSH-n a következő parancsot:

```sh
wget -q --no-check-certificate http://gosathu.nhely.hu/Enigma2_KODI_install_movieshark_repo_Hungary.sh -O - | /bin/sh
```

---

## Mit csinál pontosan a script?

1. Feed frissítés
```sh
opkg update
```

2. Script öntelepítése  
A script letölti saját magát, majd bemásolja ide:
```
/usr/script/Enigma2_KODI_install_movieshark_repo_Hungary.sh
```
Jogosultság beállítása:
```sh
chmod 755 /usr/script/Enigma2_KODI_install_movieshark_repo_Hungary.sh
```
Ez biztosítja, hogy frissítés esetén mindig az új verzió fusson.

3. Kodi elérhetőségének ellenőrzése  
Ha a Kodi nem érhető el az adott image repository-jában, a script leáll és hibaüzenetet ad:
```
HIBA: Kodi nem érhető el ebben az image-ben!
```

4. Kodi telepítése
```sh
opkg install enigma2-plugin-extensions-kodi
```
Sikertelenség esetén a script megszakad.

5. Kodi userdata mappa ellenőrzése  
A script nem hoz létre userdata mappát, csak ellenőrzi az alábbi prioritás szerint:
- HDD: `/media/hdd/.kodi/userdata`
- Belső flash: `/home/root/.kodi/userdata`

Ha egyik sem létezik, a Kodi még nem lett elindítva. Indítsd el egyszer a Kodi-t, majd futtasd újra a scriptet.

6. `sources.xml` beállítása  
A script letölti a `sources.xml` fájlt:
- Forrás: [http://gosathu.nhely.hu/sources.xml](http://gosathu.nhely.hu/sources.xml)  
A fájlt a Kodi userdata könyvtárába másolja:  
```
.kodi/userdata/sources.xml
```
A fájl tartalmazza a magyar Kodi repo-kat és opcionálisan saját repo-tárhely beállítást.

7. Magyar Kodi repository ZIP-ek letöltése és elhelyezése  
Letöltött ZIP-ek (példák):
```
repository.movieshark-2.7.2.zip
repository.streamshark-1.0.1.zip
```
Célkönyvtár:
```
/etc/enigma2/
```
Ezeket a Kodi-ban a "Install from zip" (ZIP telepítés) módszerrel lehet felvenni.

8. Enigma2 újraindítása
A telepítési folyamat végén a rendszer újraindul:
```sh
killall enigma2
```

---

## 🌐 Használt linkek

- Script: [Enigma2_KODI_install_movieshark_repo_Hungary.sh](http://gosathu.nhely.hu/Enigma2_KODI_install_movieshark_repo_Hungary.sh)  
- Kodi repo tárhely: [http://kodirepo.nhely.hu/](http://kodirepo.nhely.hu/)  
- sources.xml: [http://gosathu.nhely.hu/sources.xml](http://gosathu.nhely.hu/sources.xml)

---

## ℹ️ Verzió információ

- Verzió: 2.2  
- Dátum: 2026-01-05  
- Készítette: Gabywap (gabywap)

---

## ⚠️ Megjegyzések és biztonság

- A script nem módosít image-specifikus beállításokat — csak:
  - Kodi telepítést  
  - Kodi userdata konfigurálást  
  - Repository előkészítést
- A script futtatása saját felelősségre történik.  
- Ellenőrizd a letöltött forrásokat és a script tartalmát, ha nem ismered vagy nem bízol a hosztban.

---

Kellemes Kodi használatot és jó szórakozást!
