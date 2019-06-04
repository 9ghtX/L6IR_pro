::если надо, поправить путь к хексу, порт, скорость, адрес в следующих 4 строках

@echo off
set FILE=hex\L6IR.hex
set COM_PORT=COM5
set BAUD=115200
set ADDRESS=17

:: ниже ничего менять не надо!!!
@echo on
cd %~dp0
rfu_app\rfu.exe -v
rfu_app\rfu.exe --address %ADDRESS% --file %FILE% --port %COM_PORT% --baud %BAUD%
pause