@echo off
if "%1" == "-devinstall" (
    copy  %desktop%\cooked.bat %windir%\System32
    goto end
)
cls
set desktop=%userprofile%\Desktop
set cookedlocal=%windir%\System32\cooked.bat
if not exist %cookedlocal% goto :install
goto process

:install
if not exist %desktop%\cooked.bat echo BOTE NO DESKTOP & pause & exit
title - Cooked Installator -
mode 75, 30
move  %desktop%\cooked.bat %windir%\System32 >nul

if exist %cookedlocal% (
    powershell -Command "Write-Host 'Instalado com Sucesso!' -ForegroundColor Green"
    pause >nul
    exit
) else (
    powershell -Command "Write-Host 'UHMMMM Algum Erro Aconteceu' -ForegroundColor Red"
    pause >nul
    exit
)

:uninstall
del %cookedlocal% /Q
rd %cookedlocal%
rd %cookedlocal%
goto end



:process
if "%1" == "-uninstall" goto uninstall
if "%1" == "/uninstall" goto uninstall
title HACKING & color 0a & mode 75, 30
md C:\cookedfiles
cd C:\cookedfiles
set cf=C:\cookedfiles
echo Hello %username%-hacker
timeout /t 3 /nobreak > nul
call :batfiles
cls
echo.
powershell -Command "Write-Host 'Hacking the Central Point' -ForegroundColor Red"
echo %random%.%random% 100110101010 ...%random%%random% = 1010101010 8
powershell -Command "Write-Host 'Injecting the SQL' -ForegroundColor Magenta"
powershell -Command "Write-Host 'Getting the Database' -ForegroundColor Red"
timeout /t 2 /nobreak > nul
echo.
powershell -Command "Write-Host '#39248 %random% 032940329 ------ [´[ JK]] SYS' -ForegroundColor Blue"
systeminfo
echo.
echo.
timeout /t 2 /nobreak > nul
echo %random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random% = %random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%
echo %random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random% = %random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%
echo %random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random% = %random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%
echo %random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random% = %random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%
echo %random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random% = %random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%
echo %random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random% = %random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%
echo %random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random% = %random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%
echo %random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random% = %random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%
echo %random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random% = %random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%
echo %random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random% = %random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%
echo %random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random% = %random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%
echo %random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random% = %random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%
echo %random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random% = %random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%
echo %random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random% = %random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%
echo %random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random% = %random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%
echo %random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random% = %random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%
echo %random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random% = %random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%
echo %random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random% = %random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%
echo %random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random% = %random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%
echo %random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random% = %random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%
timeout /t 3 /nobreak > nul
powershell -Command "Write-Host 'Datahash Code = 29ud239082390 902380324 . 3204239' -ForegroundColor Blue"
powershell -Command "Write-Host '-------- Getting Info --------' -ForegroundColor DarkMagenta"
powershell -Command "Write-Host '/NASA ___MAIN___ SXS' -ForegroundColor Red"
powershell -Command "Write-Host 'Converting the Password...' -ForegroundColor DarkBlue"
powershell -Command "Write-Host 'Using Bruteforce, Wordlist' -ForegroundColor Red"
powershell -Command "Write-Host '*¨(&()*)(&(*(&&*(& ))))' -ForegroundColor Magenta"
timeout /t 2 /nobreak > nul
echo.
powershell -Command "Write-Host 'Injeting DLL into IP' -ForegroundColor DarkBlue"
powershell -Command "Write-Host 'Logging (37293821)' -ForegroundColor DarkRed"
powershell -Command "Write-Host 'Hashing Network (WIFI___301___)& PROCESS)' -ForegroundColor White"
echo.
echo.
echo.
timeout /t 3 /nobreak > nul
echo %random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random% = %random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%
echo %random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random% = %random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%
echo %random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random% = %random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%
echo %random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random% = %random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%
echo %random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random% = %random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%
echo %random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random% = %random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%
echo %random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random% = %random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%
echo %random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random% = %random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%
echo %random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random% = %random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%
echo %random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random% = %random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%
echo %random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random% = %random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%
timeout /t 3 /nobreak > nul
echo.
echo.
powershell -Command "Write-Host 'Hacked LOL!' -ForegroundColor Red"
cd..
del C:\cookedfiles /Q
rd C:\cookedfiles
rd C:\cookedfiles
taskkill /im cmd.exe
goto end

:batfiles
echo @echo off > matrix.bat
echo cls >> matrix.bat
echo color 0a >> matrix.bat
echo title %random% >> matrix.bat
echo mode 75, 30 >> matrix.bat
echo :nah >> matrix.bat
echo echo %random%%random%%random%%random%%random%%random%%random%%random%%random%%random% >> matrix.bat
echo goto nah >> matrix.bat
start matrix.bat
start matrix.bat
start matrix.bat

echo @echo off > colors.bat
echo cls >> colors.bat
echo color 0a >> colors.bat
echo title INJETOR >> colors.bat
echo mode 75, 30 >> colors.bat
echo :nah >> colors.bat
echo powershell -Command "Write-Host 'INJECTING - 0' -ForegroundColor Red" >> colors.bat
echo powershell -Command "Write-Host 'INJECTING - 1' -ForegroundColor DarkGreen" >> colors.bat
echo goto nah >> colors.bat
start colors.bat

:end