@echo off
set message =  Hello Flash
del "D:\AWS\XX\output\flash.log"
IF %2 == test GOTO test_flash
GOTO END
:test_flash
ECHO This is test flash!
"C:\Program Files (x86)\Renesas Electronics\Programming Tools\Renesas Flash Programmer V3.08\RFPV3.exe" /silent "%1\vendors\renesas\boards\rx65n-cloud-kit-uart-sx-ulpgn\aws_tests\flash_project\erase_from_bank1\erase.rpj" /log "D:\AWS\XX\output\flash.log"
"C:\Program Files (x86)\Renesas Electronics\Programming Tools\Renesas Flash Programmer V3.08\RFPV3.exe" /silent "%1\vendors\renesas\boards\rx65n-cloud-kit-uart-sx-ulpgn\aws_tests\flash_project\flash_project.rpj" /file "%1\projects\renesas\rx65n-cloud-kit-uart-sx-ulpgn\e2studio\aws_tests\HardwareDebug\aws_tests.mot" /log "D:\AWS\XX\output\flash.log"
ECHO Flashing done!
ECHO Result Code: %ErrorLevel%
GOTO END

:END
