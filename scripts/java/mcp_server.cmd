@echo off
setlocal

set AGENT_APPLICATION=..\..\examples-java
set SPRING_PROFILES_ACTIVE=web,severance

call ..\support\agent.bat

endlocal