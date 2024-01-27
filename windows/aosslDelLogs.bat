cls
echo off
cls

echo [#] Deleting logs
if exist aossl.log del aossl.log 1>nul2>nul
if exist aosslRevert.log del aosslRevert.log 1>nul2>nul


echo [#] Done
timeout /t 2
exit /B 1