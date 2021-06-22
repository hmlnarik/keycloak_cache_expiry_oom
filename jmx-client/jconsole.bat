@echo off

if "x%JAVA_HOME%" == "x" (
  echo JAVA_HOME is not set. Unable to locate the jars needed to run jconsole.
  goto END
)

set "CLASSPATH=%JAVA_HOME%\lib\jconsole.jar"
set "CLASSPATH=%CLASSPATH%;%JAVA_HOME%\lib\tools.jar"

if not exist ".\jboss-cli-client.jar" (
    echo   WARNING: Jar not found: %JBOSS_HOME%\bin\client\jboss-cli-client.jar
    echo   WARNING: If this jar is missing, jconsole will fail to connect to the server.
    goto END
)
set "CLASSPATH=%CLASSPATH%;.\jboss-cli-client.jar"

"%JAVA_HOME%\bin\java.exe" --add-modules=java.se -version >nul 2>&1 && (set MODULAR_JDK=true) || (set MODULAR_JDK=false)

if "%MODULAR_JDK%" == "true" (
 if "%*" == "" (
    "%JAVA_HOME%\bin\jconsole.exe" "-J--add-modules=jdk.unsupported" "-J-Djava.class.path=%CLASSPATH%"
 ) else (
    "%JAVA_HOME%\bin\jconsole.exe" "-J--add-modules=jdk.unsupported" "-J-Djava.class.path=%CLASSPATH%" %*
 )   
) else (
 if "%*" == "" (
    "%JAVA_HOME%\bin\jconsole.exe" "-J-Djava.class.path=%CLASSPATH%"
 ) else (
    "%JAVA_HOME%\bin\jconsole.exe" "-J-Djava.class.path=%CLASSPATH%" %*
 )
)

:END