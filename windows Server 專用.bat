@echo off
mode con cols=100 lines=40 & color fc

rem 獲取管理員權限
:: BatchGotAdmin  
:-------------------------------------  
rem  --> Check for permissions  
>nul 2>&1 "%SYSTEMROOT%\system32\cacls.exe" "%SYSTEMROOT%\system32\config\system"
rem --> If error flag set, we do not have admin.  
if '%errorlevel%' NEQ '0' (  
    echo 獲取管理員權限中,如果UAC?窗,請選擇允許...
    goto UACPrompt  
) else ( goto gotAdmin )   
:UACPrompt  
    echo Set UAC = CreateObject^("Shell.Application"^) > "%temp%\getadmin.vbs"  
    echo UAC.ShellExecute "%~s0", "", "", "runas", 1 >> "%temp%\getadmin.vbs"   
    "%temp%\getadmin.vbs"
    exit /B  
:gotAdmin  
    if exist "%temp%\getadmin.vbs" ( del "%temp%\getadmin.vbs" )  
    pushd "%CD%"  
    CD /D "%~dp0"

rem 激活部分
cls
:start
echo\
echo                                請輸入數字選擇(請以管理者模式執行):
echo
echo           ==============================================================================
echo           *                                                                            *
echo           *                        1：啟用 Windows Server 2025 Standard:               *
echo           *                                                                            *
echo           ==============================================================================
echo           ==============================================================================
echo           *                                                                            *
echo           *                        2：啟用 Windows Server 2025 Datacenter              *
echo           *                                                                            *
echo           ==============================================================================
echo           ==============================================================================
echo           *                                                                            *
echo           *                        3：啟用Windows Server 2022 Standard                 *
echo           *                                                                            *
echo           ==============================================================================
echo           ==============================================================================
echo           *                                                                            *
echo           *                        4：啟用Windows Server 2022 Datacenter               *
echo           *                                                                            *
echo           ==============================================================================
echo           ==============================================================================
echo           *                                                                            *
echo           *                        5：查看 Windows 激活  ??                         *
echo           *                                                                            *
echo           ==============================================================================

set /P var=":"
if %var%==1 goto 1
if %var%==2 goto 2
if %var%==3 goto 3
if %var%==4 goto 4
if %var%==5 goto look

:1
cls
echo\
echo           ******************************************************************************
echo           *                                                                            *
echo           *     接下來將自動啟動,彈窗三次,請點擊每一步彈窗的確定,啟動過程需要連網      *
echo           *                                                                            *
echo           ******************************************************************************
echo\
echo                                         第一步 安裝產品金鑰...
echo\
slmgr -ipk TVRH6-WHNXV-R9WG3-9XRFY-MY832
echo\
echo                                         第二步 設定KMS...
echo\
slmgr -skms 192.168.1.1
echo\
echo                                         第三步 自動連網激活...
echo\
slmgr -ato
goto exit


:2
cls
echo\
echo           ******************************************************************************
echo           *                                                                            *
echo           *     接下來將自動啟動,彈窗三次,請點擊每一步彈窗的確定,啟動過程需要連網      *
echo           *                                                                            *
echo           ******************************************************************************
echo\
echo                                         第一步 安裝產品金鑰...
echo\
slmgr -ipk D764K-2NDRG-47T6Q-P8T8W-YP6DF
echo\
echo                                         第二步 設定KMS......
echo\
slmgr -skms 192.168.1.1
echo\
echo                                         第三步 自動連網激活...
echo\
slmgr -ato
goto exit


:3
cls
echo\
echo           ******************************************************************************
echo           *                                                                            *
echo           *     接下來將自動啟動,彈窗三次,請點擊每一步彈窗的確定,啟動過程需要連網      *
echo           *                                                                            *
echo           ******************************************************************************
echo\
echo                                         第一步 安裝產品金鑰...
echo\
slmgr -ipk VDYBN-27WPP-V4HQT-9VMD4-VMK7H
echo\
echo                                         第二步 設定KMS......
echo\
slmgr -skms 192.168.1.1
echo\
echo                                         第三步 自動連網激活...
echo\
slmgr -ato
goto exit

:4
cls
echo\
echo           ******************************************************************************
echo           *                                                                            *
echo           *     接下來將自動啟動,彈窗三次,請點擊每一步彈窗的確定,啟動過程需要連網      *
echo           *                                                                            *
echo           ******************************************************************************
echo\
echo                                         第一步 安裝產品金鑰....
echo\
slmgr -ipk WX4NM-KYWYW-QJJR4-XV3QB-6VM33
echo\
echo                                         第二步 設定KMS......
echo\
slmgr -skms 192.168.1.1
echo\
echo                                         第三步 自動連網激活...
echo\
slmgr -ato
goto exit

:look
cls
echo\
echo             Please pay attention to the contents of the pop-up window
slmgr.vbs -dlv
goto exit


:exit
echo\
echo\
echo\
echo\
echo\
echo\
echo           *******************************指令已完成*************************************
echo           *                                                                            *
echo           *                                                                            *
echo           *                            請按任 X 退出                                   *
echo           *                                                                            *
echo           *                                                                            *
echo           ******************************************************************************
pause>nul 
start  exit
