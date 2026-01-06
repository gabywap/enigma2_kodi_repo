# 🎬 Enigma2 – Automatic Kodi Installer & Hungarian REPO Setup Script

This shell script automates **Kodi installation** on **Enigma2-based set-top boxes**, and sets up **Hungarian Kodi repositories** and sources (`sources.xml`).

It allows you to quickly have a **ready-to-use Kodi environment** after a fresh Enigma2 installation.

---

## ✨ Features

- ✅ Checks if **Kodi is available** in the image's package repository  
- ✅ Automatically **installs Kodi**
- ✅ Checks for the existing **Kodi userdata folder**
- ✅ Downloads and sets up **`sources.xml`**
- ✅ Downloads Hungarian Kodi repository ZIP files
- ✅ Places them in `/etc/enigma2`
- ✅ Stops on errors, avoiding unnecessary execution
- ✅ **Restarts the Enigma2 interface** after completion

---

## 📦 Installed Kodi Repositories

Currently, the script downloads these Hungarian repositories:

- `repository.movieshark-2.7.2.zip`
- `repository.streamshark-1.0.1.zip`

📂 Storage location:
/etc/enigma2/


In Kodi, the ZIPs can be installed via **"Install from ZIP file"**.

---

## 📁 Kodi userdata folder

The script **does not create the userdata folder**, it only checks for the existing one.

Primary path:
/media/hdd/.kodi/userdata



Secondary path:
/home/root/.kodi/userdata



⚠️ If neither exists:
> Run Kodi once, then rerun this script.

This ensures Kodi is initialized before repository setup.

---

## ▶️ Installation (Telnet / SSH)

Run the script directly without downloading it first:

```sh
wget -q "--no-check-certificate" \
http://gosathu.nhely.hu/Enigma2_KODI_install_movieshark_repo_Hungary.sh \
-O - | /bin/sh
📌 One-line copyable version:

sh
Kód másolása
wget -q "--no-check-certificate" http://gosathu.nhely.hu/Enigma2_KODI_install_movieshark_repo_Hungary.sh -O - | /bin/sh
🌐 Sources
🔗 Kodi repository hub

arduino
Kód másolása
http://kodirepo.nhely.hu/
🔗 sources.xml

arduino
Kód másolása
http://gosathu.nhely.hu/sources.xml
🛠 Requirements
Enigma2-based image

Internet connection

Working opkg

Image containing:

Kód másolása
enigma2-plugin-extensions-kodi
ℹ️ Important Notes
Script uses ASCII-only output for proper display over telnet

Fully compatible with BusyBox sh

Safe: exits immediately on errors

Restarts the Enigma2 interface when finished

👤 Author
Gabywap
📦 Version: 2.2
📅 Date: 2026.01.05

☕ Closing Notes
The script is free to use and extend.
Additional Kodi repositories can be added later to the kodirepo hub.

Enjoy your Kodi setup! 🎥📺