@echo off
setlocal
echo.
if not exist "%CYGBIN%" echo ERROR Missing CYGBIN environment variable & exit 3
echo INFO Found Cygwin

if not exist "%~dpn0.sh" echo Script "%~dpn0.sh" not found & exit 2
echo INFO Transferring to sister script "%~dpn0.sh"
:: Resolve ___.sh to /cygdrive based *nix path and store in %_CYGSCRIPT%
for /f "delims=" %%A in ('%CYGBIN%\cygpath.exe "%~dpn0.sh"') do set _CYGSCRIPT=%%A
:: Throw away temporary env vars and invoke script, passing any args that were passed to us
endlocal & %CYGBIN%\bash --login "%_CYGSCRIPT%" %*
