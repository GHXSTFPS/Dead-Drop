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

<h1 align="center">🧨 Dead Drop</h1>

<p align="center">
  <b>Red Team Backdoor Toolkit</b><br>
  <i>Lightweight. Portable. Stealthy.</i>
</p>

<p align="center">
  <img src="https://img.shields.io/badge/status-active-red?style=for-the-badge" />
  <img src="https://img.shields.io/badge/platform-windows-black?style=for-the-badge" />
  <img src="https://img.shields.io/badge/built_with-powershell-white?style=for-the-badge&logo=powershell" />
</p>

---

## ⚙️ Features

- ✔️ Installs **OpenSSH Client and Server** (if missing)
- ✔️ Enables and configures `ssh-agent` and `sshd` on boot
- ✔️ Creates a **hidden admin user**: `Shadow`
- ✔️ Adds **firewall exception** for port **22**
- ✔️ Requires **no internet** after first execution
- ✔️ Fully **self-contained PowerShell script**

---

## 🚨 Intended Use

> **Dead Drop is intended for ethical, educational, and controlled environments only.**  
> Use it **with explicit permission**, and **in accordance with all local laws and policies**.

---

## 🧰 Requirements

- 🖥️ Windows 10/11 with Administrator access  
- 💬 PowerShell 5.1+ or CMD  
- 💾 Removable USB or drive with the script stored

---

## 📦 Usage

<details>
<summary><b>Click to expand detailed usage instructions</b></summary><br>

1. Copy `dead_drop.ps1` to a removable USB drive  
2. Plug it into the target machine  
3. Right-click and run the script as Administrator  
4. The script will automatically:
   - Install & start OpenSSH services
   - Create hidden admin user: `Shadow`
   - Add port 22 to Windows Firewall
   - Confirm success at each step  

</details>

---

## 🔐 Example Hidden Account

| Username | Password     | Group             |
|----------|--------------|-------------------|
| Shadow   | Shadow123!   | Administrators *(Hidden)* |

---

## 🧪 Demo / Screenshot

> Coming soon...

---

## 🖤 Author & Project Info

**Author:** GHXSTFPS  
**Project:** Dead Drop  
**GitHub:** [github.com/GHXSTFPS/dead-drop](https://github.com/GHXSTFPS/dead-drop)

---

## ⚖️ Legal Disclaimer

> This project is for **educational purposes only**.  
> The author assumes **no responsibility for misuse** or unauthorized use.  
> Use responsibly and within legal boundaries.

---
