@echo off
setlocal

set AGENT_APPLICATION=..\..\examples-kotlin
set SPRING_PROFILES_ACTIVE=web,severance

call ..\support\agent.bat

endlocal