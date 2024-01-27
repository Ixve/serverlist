cls
echo off
del %~dp0\aosslRevert.log
cls

echo [#] Changing working directory
cd %appdata%\OpenSpades\Resources\
echo Work directory changed to "%AppData%\OpenSpades\Resources\" >> %~dp0\aosslRevert.log

echo [#] Setting temporary variables
set "cfg=SPConfig.cfg"
set "perfCfg=Performance.cfg"
echo Set temporary variables "cfg" ^& "perfCfg" >> %~dp0\aosslRevert.log


echo [#] Reverting config file
replace %cfg%.bkp %cfg% 1>nul2>nul
echo Reverted %cfg% >> %~dp0\aosslRevert.log


if exist %perfCfg% (
echo [#] Reverting performance config file
replace %perfCfg%.bkp %perfCfg% 1>nul2>nul
echo Reverted %perfCfg% >> %~dp0\aosslRevert.log
)


echo [#] Done
echo Work finished >> %~dp0\aosslRevert.log
timeout /t 3
exit /B 1