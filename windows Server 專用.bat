@echo off
mode con cols=100 lines=40 & color fc

rem ����޲z���v��
:: BatchGotAdmin  
:-------------------------------------  
rem  --> Check for permissions  
>nul 2>&1 "%SYSTEMROOT%\system32\cacls.exe" "%SYSTEMROOT%\system32\config\system"
rem --> If error flag set, we do not have admin.  
if '%errorlevel%' NEQ '0' (  
    echo ����޲z���v����,�p�GUAC?��,�п�ܤ��\...
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

rem �E������
cls
:start
echo\
echo                                �п�J�Ʀr���(�ХH�޲z�̼Ҧ�����):
echo
echo           ==============================================================================
echo           *                                                                            *
echo           *                        1�G�ҥ� Windows Server 2025 Standard:               *
echo           *                                                                            *
echo           ==============================================================================
echo           ==============================================================================
echo           *                                                                            *
echo           *                        2�G�ҥ� Windows Server 2025 Datacenter              *
echo           *                                                                            *
echo           ==============================================================================
echo           ==============================================================================
echo           *                                                                            *
echo           *                        3�G�ҥ�Windows Server 2022 Standard                 *
echo           *                                                                            *
echo           ==============================================================================
echo           ==============================================================================
echo           *                                                                            *
echo           *                        4�G�ҥ�Windows Server 2022 Datacenter               *
echo           *                                                                            *
echo           ==============================================================================
echo           ==============================================================================
echo           *                                                                            *
echo           *                        5�G�d�� Windows �E��  ??                         *
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
echo           *     ���U�ӱN�۰ʱҰ�,�u���T��,���I���C�@�B�u�����T�w,�ҰʹL�{�ݭn�s��      *
echo           *                                                                            *
echo           ******************************************************************************
echo\
echo                                         �Ĥ@�B �w�˲��~���_...
echo\
slmgr -ipk TVRH6-WHNXV-R9WG3-9XRFY-MY832
echo\
echo                                         �ĤG�B �]�wKMS...
echo\
slmgr -skms 192.168.1.1
echo\
echo                                         �ĤT�B �۰ʳs���E��...
echo\
slmgr -ato
goto exit


:2
cls
echo\
echo           ******************************************************************************
echo           *                                                                            *
echo           *     ���U�ӱN�۰ʱҰ�,�u���T��,���I���C�@�B�u�����T�w,�ҰʹL�{�ݭn�s��      *
echo           *                                                                            *
echo           ******************************************************************************
echo\
echo                                         �Ĥ@�B �w�˲��~���_...
echo\
slmgr -ipk D764K-2NDRG-47T6Q-P8T8W-YP6DF
echo\
echo                                         �ĤG�B �]�wKMS......
echo\
slmgr -skms 192.168.1.1
echo\
echo                                         �ĤT�B �۰ʳs���E��...
echo\
slmgr -ato
goto exit


:3
cls
echo\
echo           ******************************************************************************
echo           *                                                                            *
echo           *     ���U�ӱN�۰ʱҰ�,�u���T��,���I���C�@�B�u�����T�w,�ҰʹL�{�ݭn�s��      *
echo           *                                                                            *
echo           ******************************************************************************
echo\
echo                                         �Ĥ@�B �w�˲��~���_...
echo\
slmgr -ipk VDYBN-27WPP-V4HQT-9VMD4-VMK7H
echo\
echo                                         �ĤG�B �]�wKMS......
echo\
slmgr -skms 192.168.1.1
echo\
echo                                         �ĤT�B �۰ʳs���E��...
echo\
slmgr -ato
goto exit

:4
cls
echo\
echo           ******************************************************************************
echo           *                                                                            *
echo           *     ���U�ӱN�۰ʱҰ�,�u���T��,���I���C�@�B�u�����T�w,�ҰʹL�{�ݭn�s��      *
echo           *                                                                            *
echo           ******************************************************************************
echo\
echo                                         �Ĥ@�B �w�˲��~���_....
echo\
slmgr -ipk WX4NM-KYWYW-QJJR4-XV3QB-6VM33
echo\
echo                                         �ĤG�B �]�wKMS......
echo\
slmgr -skms 192.168.1.1
echo\
echo                                         �ĤT�B �۰ʳs���E��...
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
echo           *******************************���O�w����*************************************
echo           *                                                                            *
echo           *                                                                            *
echo           *                            �Ы��� X �h�X                                   *
echo           *                                                                            *
echo           *                                                                            *
echo           ******************************************************************************
pause>nul 
start  exit
