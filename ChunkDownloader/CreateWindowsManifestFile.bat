@echo off
set OutPutDirectoryName="0.30.0"
set ManifestFileName="BuildManifestAndroid.txt"
set PlatformName=Android
set PakFileExtension=.pak
set /a VersionNumber = 0

IF EXIST ..\%OutPutDirectoryName%\ (
echo The folder %OutPutDirectoryName% is present.
) ELSE (
echo Creating folder %OutPutDirectoryName%
md ..\%OutPutDirectoryName%
)

@echo off
  break>"..\%OutPutDirectoryName%\%ManifestFileName%"
setlocal enableextensions enabledelayedexpansion
for %%T in (..\%OutPutDirectoryName%\*) do (
    IF !PakFileExtension! == %%~xT  (
        (
            set /a VersionNumber += 1
            set _test=%%~nT
            set _result=!_test:~3,8!
            REM PakFileName.pak PakFileSize ver00N  PakChunkId PlatformName\PakFileName.pak
            @echo %%~nxT    %%~zT   ver00!VersionNumber!    !_result!    !PlatformName!\%%~nxT 
        ) >> ..\%OutPutDirectoryName%\%ManifestFileName%
    )
)
endlocal
pause