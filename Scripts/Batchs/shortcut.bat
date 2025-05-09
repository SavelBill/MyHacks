@echo off
if "%1" == "-help" goto help
if "%1" == "/help" goto help
if "%1" == "-h" goto help
if "%1" == "/h" goto help
if "%1" == "-?" goto help
if "%1" == "/?" goto help
if "%1" == "/c" goto create_shortcut
if "%1" == "-c" goto create_shortcut
if "%1" == "/m" goto modify_shortcut
if "%1" == "-m" goto modify_shortcut
goto help

:modify_shortcut
set shortcutPath=%2
set targetPath=%3
if not exist %shortcutPath%.lnk (
    echo The Shortcut not Exist
    goto end
)
if not exist %targetPath% (
    echo The destiny not Exist
    goto end
)
powershell -NoProfile -Command "& { $WshShell = New-Object -ComObject WScript.Shell; $Shortcut = $WshShell.CreateShortcut('%shortcutPath%.lnk'); $Shortcut.TargetPath = '%targetPath%'; $Shortcut.Save(); }"
goto end

:create_shortcut
set shortname=%2
set shortdestiny=%3
set shortdir=%4
if exist %shortdir%\%shortname%.lnk (
    echo The Shortcut Already Exist
    goto end
)
if not exist %shortdir% (
    echo Error: The Dir for Shortcut as Not Found!
    goto end
)
if not exist %shortdestiny% (
    echo Error: The Destiny for Shortcut as Not Found!
    goto end
)

powershell "$s=(New-Object -COM WScript.Shell).CreateShortcut('%shortdir%\%shortname%.lnk');$s.TargetPath='%shortdestiny%';$s.Save()"
if exist %shortdir%\%shortname%.lnk echo Succefully Created
goto end

:help
@echo off
echo.
echo How to use: shortcut -c ExampleShortcut C:\example\example.exe %userprofile%\Desktop
echo [-c] / [/c] Create a Shortcut
echo.
echo ExampleShortcut = Shortcut Name
echo C:\example\example.exe = Destiny/File Local
echo %userprofile%\Desktop = Shortcut Local
echo.
echo 1 = Name, 2 = Destiny, 3 = Shortcut Local
echo.
echo --------------------------------------------
echo.
echo How to use: shortcut -m %userprofile%\Desktop\TheShortCut C:\NewShorcutDestiny
echo [-m] / [/m] Modify a Shortcut Destiny
echo.
echo %userprofile%\Desktop\TheShortCut = Shortcut Dir
echo C:\NewShorcutDestiny = New Shorcut Destiny. I needed to Write This
echo.
echo 1 = Shortcut Dir / Local, 2 = New Shortcut Destiny
goto end

:end