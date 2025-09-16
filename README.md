<!-- Dead Drop ASCII Logo -->
```text
░███████                                ░██    ░███████                                  
░██   ░██                               ░██    ░██   ░██                                 
░██    ░██  ░███████   ░██████    ░████████    ░██    ░██ ░██░████  ░███████  ░████████  
░██    ░██ ░██    ░██       ░██  ░██    ░██    ░██    ░██ ░███     ░██    ░██ ░██    ░██ 
░██    ░██ ░█████████  ░███████  ░██    ░██    ░██    ░██ ░██      ░██    ░██ ░██    ░██ 
░██   ░██  ░██        ░██   ░██  ░██   ░███    ░██   ░██  ░██      ░██    ░██ ░███   ░██ 
░███████    ░███████   ░█████░██  ░█████░██    ░███████   ░██       ░███████  ░██░█████  
                                                                              ░██        
                                                                              ░██        
```

---

## 🧨 Dead Drop

**Dead Drop** is a lightweight, portable Windows-based post-exploitation tool designed for **lab environments**, **red team exercises**, and **offline ops**. 

This script allows you to plug in removable media, execute a single script, and silently prepare a backdoor channel via **OpenSSH**, complete with a hidden **administrative user**, firewall exceptions, and startup persistence

---

## ⚙️ Features

- 🛡️ Checks and installs **OpenSSH Client** and **Server** on Windows  
- 🔐 Enables & starts **ssh-agent** and **sshd** on boot  
- 👤 Creates a hidden user account `Shadow` with **admin privileges**  
- 🚪 Adds **Windows Firewall exception** for **port 22**  
- 🔧 Requires **no internet** beyond initial execution  
- 🧱 Written in **PowerShell** (fully self-contained)

---

## 🚨 Intended Use

> ⚠️ **Dead Drop is intended for ethical, educational, and controlled lab environments only.**  
> Use it in accordance with your local laws, organizational policies, and with explicit permission.

---

## 🧰 Requirements

- 💻 Windows 10/11 with Administrator access  
- 🧱 PowerShell 5.1+ or CMD environment  
- 📦 Removable USB/Drive with the script stored

---

## 📦 Usage

1. 🧲 Place the `dead_drop.ps1` script on removable media  
2. 💻 Plug into the target Windows machine  
3. 🧨 Launch the script manually with **Administrator privileges**  
4. ✅ The script will perform the following:
    - Install & start OpenSSH services
    - Create hidden admin account `Shadow`
    - Add port 22 to Windows Firewall
    - Confirm successful setup at each stage

---

## ❗ Example Hidden Account

| Username | Password    | Group       |
|----------|-------------|-------------|
| `Shadow` | `Shadow123!`| Administrators (Hidden) |

---

## 🧪 Screenshot / Demo (Optional)

*Coming Soon*

---

## 🖤 Author

👤 [GHXSTFPS](https://github.com/GHXSTFPS)  
🧠 Project: `Dead Drop`  
📍 GitHub: [github.com/GHXSTFPS/dead-drop](https://github.com/GHXSTFPS)

---

## 🔐 Legal Disclaimer

This project is intended for **educational purposes** only and should **not** be used in any unauthorized environment.  
The author assumes **no responsibility** for misuse or damage caused.

---
