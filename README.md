@echo off
mode con cols=100 lines=30 & color fc

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
echo           *                        1：啟用 Windows10｜11 專業版:                       *
echo           *                                                                            *
echo           ==============================================================================
echo           ==============================================================================
echo           *                                                                            *
echo           *                        2：啟用 Windows10｜11 工作站專業版                  *
echo           *                                                                            *
echo           ==============================================================================
echo           ==============================================================================
echo           *                                                                            *
echo           *                        3：啟用Windows10｜11 專業教育版                     *
echo           *                                                                            *
echo           ==============================================================================
echo           ==============================================================================
echo           *                                                                            *
echo           *                        4：啟用Windows10｜11 教育版                         *
echo           *                                                                            *
echo           ==============================================================================
echo           ==============================================================================
echo           *                                                                            *
echo           *                        5：啟用Windows10｜11 企業版                         *
echo           *                                                                            *
echo           ==============================================================================
echo           ==============================================================================
echo           *                                                                            *
echo           *                        6：查看 Windows 激活  ??                            *
echo           *                                                                            *
echo           ==============================================================================
set /P var=":"
if %var%==1 goto 1
if %var%==2 goto 2
if %var%==3 goto 3
if %var%==4 goto 4
if %var%==5 goto 5
if %var%==6 goto look

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
slmgr -ipk W269N-WFGWX-YVC9B-4J6C9-T83GX
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
slmgr -ipk NRG8B-VKK3Q-CXVCJ-9G2XF-6Q84J
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
slmgr -ipk 6TP4R-GNPTD-KYYHQ-7B7DP-J447Y
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
slmgr -ipk NW6C2-QMPVW-D7KKK-3GKT6-VCFB2
echo\
echo                                         第二步 設定KMS......
echo\
slmgr -skms 192.168.1.1
echo\
echo                                         第三步 自動連網激活...
echo\
slmgr -ato
goto exit


:5
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
slmgr -ipk NPPR9-FWDCX-D2C8J-H872K-2YT43
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
