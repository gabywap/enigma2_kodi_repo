![Enigma2](https://img.shields.io/badge/Platform-Enigma2-blue.svg)
![Kodi](https://img.shields.io/badge/Supported-Kodi-brightgreen.svg)
![Version](https://img.shields.io/badge/Version-2.2-yellow.svg)

# Enigma2 – Automatic Kodi Installer and Hungarian Repository Setup Script

This script automatically installs the **Kodi media player** on **Enigma2-based set-top boxes** and sets up the required **Hungarian Kodi repositories** along with the `sources.xml` file.

The script is **image-independent** as long as the Kodi package is available in the Enigma2 image repository (package name: `enigma2-plugin-extensions-kodi`).

---

## 📌 Main Features

- ✔ Checks if Kodi is available in the image repository  
- ✔ Automatically installs Kodi (`opkg`)  
- ✔ Checks the Kodi `userdata` folder (internal flash or HDD)  
- ✔ Downloads and configures the `sources.xml` file  
- ✔ Downloads the Hungarian Kodi repository ZIP files  
- ✔ Places the ZIP files in the `/etc/enigma2` directory  
- ✔ Copies the script itself to `/usr/script` (installed copy)  
- ✔ Restarts Enigma2 to complete the process

---

## 🧰 Requirements

- Enigma2-based system  
- Internet connection  
- `opkg` package manager  
- An image containing the Kodi package: `enigma2-plugin-extensions-kodi`

---

## 🚀 Quick Installation (Recommended)

Run the following command via **telnet or SSH**:

```sh
wget -q --no-check-certificate http://gosathu.nhely.hu/Enigma2_KODI_install_movieshark_repo_Hungary.sh -O - | /bin/sh
```

---

## 📂 What the Script Does

1️⃣ Update feeds  
```sh
opkg update
```

2️⃣ Script self-installation  
The script downloads itself and copies to:
```
/usr/script/Enigma2_KODI_install_movieshark_repo_Hungary.sh
```
Set permissions:
```sh
chmod 755 /usr/script/Enigma2_KODI_install_movieshark_repo_Hungary.sh
```
This ensures that updates will always run the latest version.

3️⃣ Check Kodi availability  
If Kodi is not available in the image repository, the script stops and prints:
```
ERROR: Kodi is not available in this image!
```

4️⃣ Install Kodi  
```sh
opkg install enigma2-plugin-extensions-kodi
```
The script will stop if installation fails.

5️⃣ Check Kodi userdata folder  
The script does not create the userdata folder; it only checks in the following priority:
- HDD:  
```
/media/hdd/.kodi/userdata
```
- Internal flash:  
```
/home/root/.kodi/userdata
```
⚠ If neither exists, Kodi has not been launched yet. Launch Kodi once, then run the script again.

6️⃣ Configure `sources.xml`  
The script downloads the `sources.xml` file from:  
- Source: [http://gosathu.nhely.hu/sources.xml](http://gosathu.nhely.hu/sources.xml)  
It copies the file to the Kodi userdata directory:
```
.kodi/userdata/sources.xml
```
The file contains Hungarian Kodi repositories and can include a custom repository storage entry.

7️⃣ Hungarian Kodi repository ZIPs  
Downloaded ZIPs (examples):
```
repository.movieshark-2.7.2.zip
repository.streamshark-1.0.1.zip
```
Destination directory:
```
/etc/enigma2/
```
These can be installed in Kodi using the "Install from zip file" method.

8️⃣ Restart Enigma2  
The system is restarted at the end of the installation:
```sh
killall enigma2
```

---

## 🌐 Useful Links

- Script: [Enigma2_KODI_install_movieshark_repo_Hungary.sh](http://gosathu.nhely.hu/Enigma2_KODI_install_movieshark_repo_Hungary.sh)  
- Kodi repository storage: [http://kodirepo.nhely.hu/](http://kodirepo.nhely.hu/)  
- sources.xml: [http://gosathu.nhely.hu/sources.xml](http://gosathu.nhely.hu/sources.xml)

---

## ℹ️ Version Information

- Version: 2.2  
- Date: 2026-01-05  
- Author: Gabywap

---

## ⚠️ Notes and Security

- The script does not modify image-specific settings — it only handles:
  - Kodi installation  
  - Kodi userdata configuration  
  - Repository setup
- Run the script at your own risk.  
- Verify downloaded sources and review the script content if you do not trust the hosting server.

---

Enjoy Kodi and have fun!
