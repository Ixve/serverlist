cls
echo off
setlocal enableextensions disabledelayedexpansion
del %~dp0\aossl.log
cls

echo [#] Changing working directory
cd %appdata%\OpenSpades\Resources\
echo Work directory changed to "%AppData%\OpenSpades\Resources\" >> %~dp0\aossl.log

echo [#] Setting temporary variables
set "search=cl_serverListUrl: http://services.buildandshoot.com/serverlist.json"
set "replace=cl_serverListUrl: https://serverlist.pages.dev/serverlist.json"
set "cfg=SPConfig.cfg"
set "perfCfg=Performance.cfg"
echo Set temporary variables "search", "replace", "cfg" ^& "perfCfg" >> %~dp0\aossl.log


echo [#] Backing up config file
copy %cfg% %cfg%.bkp 1>nul2>nul
echo Backed up SPConfig.cfg >> %~dp0\aossl.log


if exist %perfCfg% (
echo [#] Backing up performance config file
set perfCfgExist=1
copy %perfCfg% %perfCfg%.bkp 1>nul2>nul
echo Backed up Performance.cfg >> %~dp0\aossl.log
)


echo [#] Replacing master server list URL in config file
for /f "delims=" %%i in ('type "%cfg%" ^& break ^> "%cfg%" ') do (
    set "line=%%i"
    setlocal enabledelayedexpansion
    >>"%cfg%" echo(!line:%search%=%replace%!
    endlocal
)
echo Replaced master server list URL in SPConfig.cfg >> %~dp0\aossl.log


if %perfCfgExist%==1 (
	echo [#] Replacing master server list URL in performance config file
	for /f "delims=" %%i in ('type "%perfCfg%" ^& break ^> "%perfCfg%" ') do (
	    set "line=%%i"
	    setlocal enabledelayedexpansion
	    >>"%perfCfg%" echo(!line:%search%=%replace%!
	    endlocal
	)
echo Replaced master server list URL in Performance.cfg >> %~dp0\aossl.log
)


echo [#] Done
echo Work finished >> %~dp0\aossl.log
timeout /t 3
exit /B 1