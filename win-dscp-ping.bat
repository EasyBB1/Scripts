REM Windows script to test DSCP markings
@ECHO OFF
REM Enter your SIP server address below
SET SERVER="google.com.au"
SETLOCAL EnableDelayedExpansion
ECHO. > dscp.txt
FOR /L %%A IN (0, 1, 63) DO (
SET /A tos = %%A * 4
ECHO DSCP %%A ToS !tos! >> dscp.txt
PING -n 1 -v !tos! %SERVER% | FIND "TTL="
IF ERRORLEVEL 1 ( ECHO Failed  >> dscp.txt ) ELSE ( ECHO Passed  >> dscp.txt )
ECHO. >> dscp.txt)
