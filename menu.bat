@echo off
chcp 65001 > nul
color a
:menu
echo.
echo.
echo		███╗   ███╗██╗   ██╗██╗  ████████╗██╗    ████████╗ ██████╗  ██████╗ ██╗ 		        
echo		████╗ ████║██║   ██║██║  ╚══██╔══╝██║    ╚══██╔══╝██╔═══██╗██╔═══██╗██║	
echo		██╔████╔██║██║   ██║██║     ██║   ██║       ██║   ██║   ██║██║   ██║██║		         
echo		██║╚██╔╝██║██║   ██║██║     ██║   ██║       ██║   ██║   ██║██║   ██║██║ 		        
echo		██║ ╚═╝ ██║╚██████╔╝███████╗██║   ██║       ██║   ╚██████╔╝╚██████╔╝███████╗		    
echo		╚═╝     ╚═╝ ╚═════╝ ╚══════╝╚═╝   ╚═╝       ╚═╝    ╚═════╝  ╚═════╝ ╚══════╝ created by chayesh kunkalkar 
echo.
echo.  
echo.
echo =====================================================================================================================
echo 1. [+] Create File - Generate a new text file
echo 2. [+] Create Folder - Set up a new directory
echo 3. [+] Open Microsoft Edge 
echo 4. [+] Create Multiple Files - Generate text files with unique names
echo 5. [+] Open Device Manager - Access hardware management
echo 6. [+] Open Network Connections - Manage network adapters and settings
echo 7. [+] Admin Command Prompt - Run Command Prompt with administrator rights
echo 8. [+] Add Domain - Configure system domain settings
echo 9. [+] Get System Information - Retrieve hardware and OS details
echo 10.[+] Clean Temp Files - Remove temporary files and folders
echo 11.[+] Firewall Settings - Configure firewall rules and security
echo 12.[+] Scan Repair C Drive - Check and fix corrupted system files
echo 13.[+] Install Google Chrome 
echo 14.[+] Setup Printer Scanner 
echo 15.[+] Open Disk Management - Manage partitions and storage drives
echo 16.[+] Exit - Close the session safely
 
set /p choice=Enter you number:

:: option 1 create file 
if "%choice%" == "1" goto createfile 
::if for creating the folder
if "%choice%"=="2" goto createfolder
::if you enter the wrong number below if will perform the task
if "%choice%"=="3" goto microedge
if "%choice%"=="4" goto multiple_file
if "%choice%"=="5" goto device_manager 
if "%choice%"=="6" goto network_connection
if "%choice%"=="7" goto adminprompt
if "%choice%"=="8" goto domain
if "%choice%"=="9" goto syinfo
if "%choice%"=="10" goto tempcleaning
if "%choice%"=="11" goto firewall_open
if "%choice%"=="12" goto repair_files
if "%choice%"=="13" goto chrome_setup
if "%choice%"=="14" goto printer_scanner 
if "%choice%"=="15" goto disk_management 
if "%choice%"=="16" goto exit_file
if "%choice%"=="" (
	echo you enter nothing.kindly enter a proper number 
	pause
	cls
	goto menu
	
	
)
:: DEFAULT CASE FOR INVAILD INPUT 
echo ERROR: OPTION %choice% does not exist! (USE NUMBER WHICH ARE GIVEN TO PERFORM THE TASK)
pause
cls
goto menu


:createfile
cls
echo ===create file ===
echo.

set /p filepath=Enter the full path(example C:\Users\admin\Desktop\)
::if the file is empty the below if will perform the task 
if "%filepath%"=="" (

	echo Error : you must eneter a file path
	timeout /t 3
	cls
	goto menu
	cls
)

set /p filename=enter the file path (without extension)
::if the file is empty the below if will perform the task 
if "%filename%"=="" (
	echo Error: you must enter a filename(example:file name without . )
	
	pause
	cls
	goto menu
	cls
	)
echo this is your new text file > "%filepath%\%filename%.txt"
echo file created successfully at : %filepath%\%filename%.txt


:createfolder
echo -----create folder-----

set /p folderpath=Eneter the folder path
set /p foldername=Enter the folder name
mkdir "%folderpath%\%foldername%"
echo folder %foldername% created %folderpath%
echo ====successfully======
pause
cls
goto menu
cls
:microedge
echo ----browser to open anything you want -----
set /p search=Eneter you search : 
start https://www.bing.com/search?q=%search%
echo =====open successfully====
pause
cls
goto menu
cls

:domain
echo ====user add to domain ======
start sysdm.cpl
echo.
echo open successfully 
echo press enter to go back to menu 
pause
cls
goto menu 
cls
:adminprompt
echo 
powershell -command "start-process cmd -verb Runas"
pause
goto menu
cls
:syinfo
echo ====information===
echo ====pc below======
systeminfo
pause
cls
goto menu 
cls
pause
:multiple_file
echo ######CREATING MULTIPLE FILE ONLY TEXT ####

echo ######EXAMPLE FILE1 FILE2 FILE3 ############
setlocal enabledelayedexpansion

set/p path=enter the path
cd %path%

REM Define your file names here

set /p names=enter the name 

for %%n in (%names%) do (
    echo Creating %%n.txt
    type nul > %%n.txt
)
echo created successfully 
pause
cls
goto menu
:device_manager
echo open device manger 
::runing device manger adm
powershell -Command "Start-Process devmgmt.msc -Verb RunAs"

pause
cls
goto menu
:network_connection
ncpa.cpl 
pause
cls
goto menu
:tempcleaning
echo clearing temp files 
echo delete all the files and folder from temp 
%temp%
cls
goto menu


:repair_files
Start-Process cmd -ArgumentList "/c sfc /scannow" -Verb RunAs
pause
cls
goto menu
:firewall_open
firewall.cpl
cls
goto menu
:chrome_setup
::chrome setup 
cd setup 
start ChromeSetup.exe 
pause
cls
goto menu
:disk_management
diskmgmt.msc
cls
goto menu
:exit_file
exit
:printer_scanner
cd setup\scanner
start naps2-8.2.1-win-x64.exe
cls
goto menu