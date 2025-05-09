@echo off
if "%~1" NEQ "" echo :( & goto superend
set atualdir=%__cd__%
cd %appdata%\.project-frog
if "%1" == "-uninstall" goto uninstall
if "%1" == "-tester" goto tester
if "%1" == "-icons" goto icons
if "%1" == "-logout" goto logout
if "%1" == "-help" goto help

if "%1" == "/uninstall" goto uninstall
if "%1" == "/tester" goto tester
if "%1" == "/icons" goto icons
if "%1" == "/logout" goto logout
if "%1" == "/help" goto help

start %appdata%\.project-frog\frog.exe
exit

:help
echo.
echo tester - Start the Tester Software for Frog / Inicia o Software de Teste para  o Frog
echo uninstall - Desintala o Frog
echo icons - Cria uma Variavel chamada: "frogicons" que tem o Caminho para o "frog.dll" que tem Icons
echo logout - Desloga do Frog
goto end

:tester
start tester.exe
goto end

:uninstall
set /p verify="Realmente quer Desinstalar o Frog? (S/N) "
if %verify% == s goto yes
if %verify% == S goto yes
if %verify% == N goto end
if %verify% == n goto end
echo Essa opcao nao Existe!
goto end

:yes
cd %appdata%
del %appdata%\.project-frog /Q
rd %appdata%\.project-frog
del %windir%\System32\frog.bat /Q
goto end

:icons
setx frogicons %appdata%\.project-frog\icons.dll >nul
echo Succefully Created / Criado com Sucesso
echo Como a var frogicons
goto end

:logout
del %userprofile%\frog.txt /Q
if not exist %userprofile%\frog.txt echo Deslogado com Sucesso
goto end

:end
cd %atualdir%

:superend