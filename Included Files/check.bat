@ECHO OFF
if exist "portable.txt" (
GOTO Check-P
) else (
GOTO Check-NP
)

:Check-P
if exist "Data" (
    exit
) else (
    mkdir "Data"
    exit
)

:Check-NP
if exist "%userprofile%\Documents\Cat Warfare Pre-Alpha Archive" (
    exit
) else (
    mkdir "%userprofile%\Documents\Cat Warfare Pre-Alpha Archive"
    exit
)