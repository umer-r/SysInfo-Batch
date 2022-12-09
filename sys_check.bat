@echo off

echo +-------------------------------------------+ 
echo ^| BATCH SYSTEM CHECK SCRIPT : @UmerMehmood_ ^| 
echo +-------------------------------------------+ 

if %os%==Windows_NT goto WINNT
goto NOCON

:WINNT

echo ^|_[!] Status
echo   ^|           
echo   ^|____[+] Collecting Data...
echo.
echo.
echo.

:: Setting variables
set system=
set manufacturer=
set model=
set idnumber=
set productID=
set cpu=
set phycore=
set totalMem=
set availableMem=
set usedMem=
set diskspacetotal=

FOR /F "tokens=2 delims='='" %%A in ('wmic OS Get csname /value') do SET system=%%A
FOR /F "tokens=2 delims='='" %%A in ('wmic ComputerSystem Get Manufacturer /value') do SET manufacturer=%%A
FOR /F "tokens=2 delims='='" %%A in ('wmic ComputerSystem Get Model /value') do SET model=%%A
FOR /F "tokens=2 delims='='" %%A in ('wmic csproduct Get IdentifyingNumber /value') do SET idnumber=%%A
FOR /F "tokens=2 delims='='" %%A in ('wmic csproduct Get UUID /value') do SET productID=%%A
FOR /F "tokens=2 delims='='" %%A in ('wmic cpu get name /value') do SET cpu=%%A
FOR /F "tokens=2 delims='='" %%A in ('wmic cpu get NumberOfCores /value') do SET phycore=%%A
FOR /F "tokens=2 delims='='" %%A in ('wmic cpu get NumberOfLogicalProcessors /value') do SET logcore=%%A
FOR /F "tokens=4" %%a in ('systeminfo ^| findstr ^Physical') do if defined totalMem (set availableMem=%%a) else (set totalMem=%%a)
set totalMem=%totalMem:,=%
set availableMem=%availableMem:,=%
set /a usedMem=totalMem-availableMem
REM FOR /F "tokens=2 delims='='" %%A in ('wmic logicaldisk get size /value') do SET diskspacetotal=%%A
REM FOR /F "tokens=*" %%g IN ('wmic /node:"%COMPUTERNAME%" LogicalDisk Where DriveType="3" Get DeviceID,FreeSpace ^| findstr /I c:') do SET hello=%%g

cls

echo Objects                Values
echo ------------------     ---------
echo [+] PC Name            %system%
echo [+] PC Make            %manufacturer%
echo [+] PC Model           %model%
echo [+] Serial Number      %idnumber%
echo [+] PC UUID            %productID%
echo [+] CPU Name           %cpu%
echo [+] Physical Cores     %phycore%
echo [+] Logical Cores      %logcore%
echo [+] RAM Memory         %totalMem%
echo [+] Disk Space         %hello%
echo.
echo.
pause