@ECHO OFF

if exist "portable.txt" (
GOTO Check-P
) else (
GOTO Check-NP
)

:Check-P
if exist "Data\v0.0.4\CatWarfare4.exe" (
    GOTO Installed-P
) else (
    mkdir "Data\v0.0.4"
    GOTO NotInstalled
)

:Check-NP
if exist "%userprofile%\Documents\Cat Warfare Pre-Alpha Archive\v0.0.4\CatWarfare4.exe" (
    GOTO Installed
) else (
    GOTO NotInstalled
)


::----------------------------------------------------------
:Installed
;Title [Launching] Cat Warfare Pre-Alpha (v0.0.4)
START "" "%userprofile%\Documents\Cat Warfare Pre-Alpha Archive\v0.0.4\CatWarfare4.exe"
exit

:Installed-P
;Title [Launching] Cat Warfare Pre-Alpha (v0.0.4)
START "" "Data\v0.0.4\CatWarfare4.exe"
exit
::----------------------------------------------------------

::----------------------------------------------------------
:NotInstalled
;Title [Downloading] Cat Warfare Pre-Alpha (v0.0.4)
mkdir "%tmp%\CWPAL-Temp"
ECHO Set objWinHttp = CreateObject("WinHttp.WinHttpRequest.5.1") >> %tmp%\CWPAL-Temp\dl.vbs
ECHO. >> %tmp%\CWPAL-Temp\dl.vbs
ECHO URL = "https://github.com/catwarfarearchive/builds/raw/refs/heads/main/Cat-Warfare/v0.0.4.7z" >> %tmp%\CWPAL-Temp\dl.vbs
ECHO objWinHttp.open "GET", URL, False >> %tmp%\CWPAL-Temp\dl.vbs
ECHO objWinHttp.send "" >> %tmp%\CWPAL-Temp\dl.vbs
ECHO. >> %tmp%\CWPAL-Temp\dl.vbs
ECHO SaveBinaryData "%tmp%\CWPAL-Temp\v0.0.4.7z",objWinHttp.responseBody >> %tmp%\CWPAL-Temp\dl.vbs
ECHO. >> %tmp%\CWPAL-Temp\dl.vbs
ECHO Function SaveBinaryData(FileName, Data) >> %tmp%\CWPAL-Temp\dl.vbs
ECHO. >> %tmp%\CWPAL-Temp\dl.vbs
ECHO ' adTypeText for binary = 1 >> %tmp%\CWPAL-Temp\dl.vbs
ECHO Const adTypeText = 1 >> %tmp%\CWPAL-Temp\dl.vbs
ECHO Const adSaveCreateOverWrite = 2 >> %tmp%\CWPAL-Temp\dl.vbs
ECHO. >> %tmp%\CWPAL-Temp\dl.vbs
ECHO ' Create Stream object >> %tmp%\CWPAL-Temp\dl.vbs
ECHO Dim BinaryStream >> %tmp%\CWPAL-Temp\dl.vbs
ECHO Set BinaryStream = CreateObject("ADODB.Stream") >> %tmp%\CWPAL-Temp\dl.vbs
ECHO. >> %tmp%\CWPAL-Temp\dl.vbs
ECHO ' Specify stream type - we want To save Data/string data. >> %tmp%\CWPAL-Temp\dl.vbs
ECHO BinaryStream.Type = adTypeText >> %tmp%\CWPAL-Temp\dl.vbs
ECHO. >> %tmp%\CWPAL-Temp\dl.vbs
ECHO ' Open the stream And write binary data To the object >> %tmp%\CWPAL-Temp\dl.vbs
ECHO BinaryStream.Open >> %tmp%\CWPAL-Temp\dl.vbs
ECHO BinaryStream.Write Data >> %tmp%\CWPAL-Temp\dl.vbs
ECHO. >> %tmp%\CWPAL-Temp\dl.vbs
ECHO ' Save binary data To disk >> %tmp%\CWPAL-Temp\dl.vbs
ECHO BinaryStream.SaveToFile FileName, adSaveCreateOverWrite >> %tmp%\CWPAL-Temp\dl.vbs
ECHO. >> %tmp%\CWPAL-Temp\dl.vbs
ECHO End Function >> %tmp%\CWPAL-Temp\dl.vbs

START /wait "" "%tmp%\CWPAL-Temp\dl.vbs"

if exist "portable.txt" (
GOTO Portable
) else (
GOTO Not Portable
)

:Portable
if exist "Data" (
GOTO Extract-P
) else (
mkdir "Data\v0.0.4"
GOTO Extract-P
)

:Not Portable
if exist "%userprofile%\Documents\Cat Warfare Pre-Alpha Archive" (
GOTO Extract-NP
) else (
mkdir "%userprofile%\Documents\Cat Warfare Pre-Alpha Archive\v0.0.4"
GOTO Extract-NP
)

:Extract-NP
7zr.exe x "%tmp%\CWPAL-Temp\V0.0.4.7z" -o"%userprofile%\Documents\Cat Warfare Pre-Alpha Archive\v0.0.4"
GOTO End

:Extract-P
7zr.exe x "%tmp%\CWPAL-Temp\V0.0.4.7z" -o"Data\v0.0.4"
GOTO End

:End
rmdir "%tmp%\CWPAL-Temp" /S /Q
::----------------------------------------------------------