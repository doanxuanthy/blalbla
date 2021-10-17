@echo off
set message = Hello Build
IF %2 == 1 GOTO test_build

echo %message%
GOTO END

:test_build
del /Q /F /S "%1\projects\renesas\rx65n-cloud-kit-uart-sx-ulpgn\e2studio\aws_tests\HardwareDebug\*.*"

"C:\Renesas\e_studio-2021-07\eclipse\eclipsec.exe" -nosplash -debug -consolelog -application org.eclipse.cdt.managedbuilder.core.headlessbuild -data %1\temp -import "%1\projects\renesas\rx65n-cloud-kit-uart-sx-ulpgn\e2studio\aws_tests" -build all -vm "C:\Renesas\e_studio-2021-07\eclipse\plugins\com.renesas.runtime.jdk.hotspot.win32.x86_64_11.0.8.202009102051\jdk-11.0.8+10\bin\server\jvm.dll"

copy /y "%1\demos\include\aws_clientcredential_keys.h" "%1\tests\include\aws_clientcredential_keys.h"

ECHO Result Code: %ErrorLevel%

ECHO This is test build!

GOTO END

:END
