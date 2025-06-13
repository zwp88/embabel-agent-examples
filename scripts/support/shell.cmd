@echo off
setlocal

call check_env.bat

if errorlevel 1 (
    echo Environment check failed. Exiting...
    exit /b 1
)

set SPRING_PROFILES_ACTIVE=shell,severance

cmd /c mvn -f %AGENT_APPLICATION" -Dmaven.test.skip=true spring-boot:run

endlocal