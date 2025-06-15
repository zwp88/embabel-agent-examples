@echo off
setlocal

set AGENT_APPLICATION=..\..\examples-java
set SPRING_PROFILES_ACTIVE=shell,severance

call ..\support\agent.bat

endlocal