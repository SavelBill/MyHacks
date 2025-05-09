@echo off
color 1f & mode 75, 30 & cls & title Instalador do Frog
set dir=%__cd__%
set folder=C:\Users\%username%\AppData\Roaming
where python >nul 2>&1

if %errorlevel% equ 0 (
    goto install
) else (
    echo O Python nao esta Instalado
    echo Instale a Versao mais Recente e Volte
    pause >nul
    exit
)

:install
cls
echo --- Instalador do Frog ---
echo Precisa ser Admin para Funcionar!
echo.
set /p verify="Voce Deseja Instalar o Frog e seus Componentes? (S/N) "
if %verify% == s goto installation
if %verify% == S goto installation
if %verify% == N exit
if %verify% == n exit
echo.
echo Desculpe SEU BURRO isso nao e uma Opcao!
echo Olha oq Voce ta Escrevendo!
timeout /t 2 /nobreak > nul
goto install

:installation

title Instalando o Frog
color 0a
cls
echo Instalando...
pip install colorama
pip install python-whois
pip install requests
pip install python-dns
echo.
move %dir%\frog %folder%
ren %folder%\frog .project-frog
reg add "HKEY_CLASSES_ROOT\.bat\ShellNew" /f
reg add "HKEY_CLASSES_ROOT\.bat\ShellNew" /v NullFile /t REG_SZ /d "" /f
powershell "$s=(New-Object -COM WScript.Shell).CreateShortcut('%AppData%\Microsoft\Windows\Start Menu\Programs\Frog.lnk');$s.TargetPath='%appdata%\.project-frog\frog.exe';$s.Save()"
copy %appdata%\.project-frog\frog.bat %windir%\System32
del %appdata%\.project-frog\frog.bat /Q
exit