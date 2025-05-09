@echo off
setlocal
setlocal enabledelayedexpansion
if "%~1" EQU "" (
	echo.
	echo Criado por Richard
	echo.
	echo Uso: "calc primeiro_numero operador segundo_numero", EX: "calc 5 + 5"
	echo Operadores:
	echo    "/" = Dividir
	echo    "+" = Somar
	echo    "-" = Diminuir
	echo    "*" = Multiplicar
	exit /b 0
)
set "number1=%1"
set "operator=%2"
set "number2=%3"

set /a "answer=%number1%%operator%%number2%"

echo.
echo Criado por Richard
echo.
powershell -Command "Write-Host '%number1% %operator% %number2% = ' -NoNewLine; Write-Host '!answer!' -ForegroundColor Green"
exit /b 0