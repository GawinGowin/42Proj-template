@echo off

for /f "delims=" %%i in ('powershell.exe -ExecutionPolicy RemoteSigned -Command ^
    "& {netsh interface ipv4 show ipaddresses | ForEach-Object { if ($_ -match 'Dhcp') {($_ -split ' ')[-1]}}}"') do (
    set "result=%%i"
)

set "DISPLAY=%result%:0.0"
echo DISPLAY=%DISPLAY%>.env
exit /b 0