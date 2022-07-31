@ECHO OFF
if exist "launcherportable.txt" (
GOTO Check-LP
) else (

if exist "portable.txt" (
GOTO Check-P
) else (
GOTO Check-NP
)

)

:Check-LP
if exist "..\Cat Warfare Pre-Alpha Archive" (
    exit
) else (
    mkdir "..\Cat Warfare Pre-Alpha Archive"
    exit
)

:Check-P
if exist "Data" (
    exit
) else (
    mkdir "Data"
    exit
)

:Check-NP
if exist "%userprofile%\Documents\Pikakid98 Launcher\Cat Warfare Pre-Alpha Archive" (
    exit
) else (
    mkdir "%userprofile%\Documents\Pikakid98 Launcher\Cat Warfare Pre-Alpha Archive"
    exit
)