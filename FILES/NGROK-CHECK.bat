@echo off
del /f "C:\Users\Public\Desktop\Epic Games Launcher.lnk" > out.txt 2>&1
net config server /srvcomment:"Windows Azure VM" > out.txt 2>&1
REG ADD "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer" /V EnableAutoTray /T REG_DWORD /D 0 /F > out.txt 2>&1
curl -O https://raw.githubusercontent.com/T36k0/RDP/main/FILES/DisablePasswordComplexity.ps1?token=AJIPFUVFPML3TEJ7XRAVO7TA6KB2M > out.txt 2>&1
curl -o "C:\Users\Public\Desktop\Fast Config VPS.exe" "https://raw.githubusercontent.com/T36k0/RDP/main/FILES/FastConfigVPS_v5.1.exe?token=AJIPFUU2YN6LCYWALAG65F3A6KCA6" > out.txt 2>&1

net user tishko testaa1 /add >nul
net user rdp1 testaa1 /add >nul
net user rdp2 testaa1 /add >nul
net user rdp3 testaa1 /add >nul
net localgroup administrators tishko /add >nul
net localgroup administrators rdp1 /add >nul
net localgroup administrators rdp2 /add >nul
net localgroup administrators rdp3 /add >nul
net user tishko /active:yes >nul
net user rdp1 /active:yes >nul
net user rdp2 /active:yes >nul
net user rdp3 /active:yes >nul

echo IP:
tasklist | find /i "ngrok.exe" >Nul && curl -s localhost:4040/api/tunnels | jq -r .tunnels[0].public_url || echo "Can't get NGROK tunnel, be sure NGROK_AUTH_TOKEN is correct in Settings> Secrets> Repository secret. Maybe your previous VM still running: https://dashboard.ngrok.com/status/tunnels "
echo User: Administrator
PowerShell -NoProfile -ExecutionPolicy Bypass -Command "& './DisablePasswordComplexity.ps1'" > out.txt 2>&1
diskperf -Y >nul
sc start audiosrv >nul
sc config Audiosrv start= auto >nul
ICACLS C:\Windows\Temp /grant administrator:F >nul
ICACLS C:\Windows\installer /grant administrator:F >nul
ICACLS C:\Windows\Temp /grant Users:F >nul
ICACLS C:\Windows\installer /grant Users:F >nul
ping -n 10 127.0.0.1 >nul
