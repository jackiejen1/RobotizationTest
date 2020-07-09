@echo off

set DIR=%~dp0

set BIN=%DIR%\..\..\client\runtime\win32\SS2Game.exe
if not exist %BIN% echo "PLEASE BUILD COCOS2DX_ROOT\tools\simulator\frameworks\runtime-src\proj.win32/simulator.sln FIRST"

set ARG=-workdir %DIR% -write-debug-log debug.log

start %BIN% %ARG%

echo ""
echo "------------------------------------------------------"
