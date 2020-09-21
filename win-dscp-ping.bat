REM Windows script to test DSCP markings
@ECHO OFF
REM Enter your SIP server address below
SET SERVER=google.com.au
SET FILE=dscp.txt
SETLOCAL EnableDelayedExpansion
ECHO. > %FILE%
ECHO Results for %SERVER% >> %FILE%
FOR /L %%A IN (0, 1, 63) DO (
SET /A tos = %%A * 4
ECHO DSCP %%A ToS !tos! >> %FILE%
PING -n 1 -v !tos! %SERVER% | FIND "TTL="
IF ERRORLEVEL 1 ( ECHO Failed  >> dscp.txt ) ELSE ( ECHO Passed  >> %FILE% )
ECHO. >> %FILE%)
