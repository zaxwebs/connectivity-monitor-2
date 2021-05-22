@echo off
title Connectivity Monitor by Zack Webster
set Url=www.google.com
set Delay=5
set LogDir=C:\ping-logs
set Timestamp=%DATE:/=-%_%TIME::=-%
set FileName=%Timestamp: =%.log
set Connected=0
echo Connection Monitoring Program.
echo Press Ctrl+C to exit.
echo Creating log directory
md %LogDir%
echo Testing connection by pinging [96m%Url%[0m every [96m%Delay%[0m seconds.
echo Logging to [96m%LogDir%\%FileName%[0m.
echo %date%	%time%	Initiated
:Loop
PING -n %Delay% -w 1 127.0.0.1 > NUL
%SystemRoot%\system32\ping.exe -n 1 %Url% | %SystemRoot%\system32\find.exe "TTL=" > NUL
if %ERRORLEVEL% EQU 0 (
	if %Connected% EQU 0 (
		echo %date%	%time%	[92mConnected[0m
		echo %date%	%time%	Connected >> %LogDir%\%FileName%
		set Connected=1
	)
) else (
	echo %date%	%time%	[91mDisconnected[0m
	echo %date%	%time%	Disconnected >> %LogDir%\%FileName%
	set Connected=0
)
goto :Loop