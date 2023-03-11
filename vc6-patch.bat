@echo off

rem thanks https://raymai97.github.io/myblog/msvc-support-utf8-string-literal-since-vc6

setlocal enableDelayedExpansion

:localeName
set _path_="HKCU\Control Panel\International"
set _name_=LocaleName
if "%~1"=="patch" (
	call :localeName get _localeName_
	call :localeName set en-US
)
if "%~1"=="unpatch" (
	call :localeName set !_localeName_!
)
if "%~1"=="get" (
	for /f "tokens=3 skip=2" %%i in ('reg query !_path_! /v !_name_!') do (
		set _localeName_=%%i
	)
)
if "%~1"=="set" (
	reg add !_path_! /v !_name_! /d "%~2" /f >nul || exit/b 1
)
exit /b
