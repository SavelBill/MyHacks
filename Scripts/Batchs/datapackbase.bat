@echo off
Color 0a
Title Datapack Base Maker - NotWeird
Mode 75,30
Cls
If "%1" EQU "" (Powershell -Command "Write-Host 'Error: Please drop your Folder in %~nx0' -ForegroundColor Red" & powershell -Command "Write-Host 'Error: Jogue/Drop a sua Pasta em %~nx0' -ForegroundColor Red" & pause >nul & exit /b)
if not exist %1\ (echo Bruhhh & pause & exit)
Cd %1
Md data
if not exist %1\data (echo Bruhhh & pause & exit)
echo> pack.mcmeta
(
	echo {
	echo 	"pack": {
	echo 		"pack_format": 6,
	echo 		"description": "idk"
	echo 	}
	echo }
) > pack.mcmeta
cd data
md minecraft
cd minecraft
md tags
cd tags
md functions
cd functions
echo %~nx1\data\minecraft\tags\functions - Criado
echo.
echo> tick.json
(
	echo {
	echo 	"values": [
	echo 		"main:tick"
	echo 	]
	echo }
) > tick.json
echo> load.json
(
	echo {
	echo 	"values": [
	echo 		"main:load"
	echo 	]
	echo }
) > load.json
echo load.json e tick.json criados
echo.
cd %1\data
md main
cd main
md functions
cd functions
echo %~nx1\data\main\functions - Criado
echo.
echo> load.mcfunction nul
echo> tick.mcfunction nul
echo Funcoes: load e tick criados
echo.
Powershell -Command "Write-Host '- Arquivos Criados -' -ForegroundColor Magenta"
echo.
echo Exibindo Arvore de Pastas
echo.
Tree %1
echo.
echo Abrindo Pasta...
start %1
:pause
pause >nul
goto pause