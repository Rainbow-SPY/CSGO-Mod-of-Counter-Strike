:: Counter-Strike-1.6-vSteam build 12835476
@echo off
@set _#APPDATA#=%LOCALAPPDATA%\Rainbow-SPY\cstrike\bin
if exist "%_#APPDATA#%\load.ini" (
		goto loadRunningCstrikeandEND
		) else (
		echo.
		)
:CheckProcess
tasklist /nh|find /i "hl.exe"
if errorlevel 1 (set _Ecode_Task_HL=False) else (set _Ecode_Task_HL=True & cls & goto CrashHLTask)
tasklist /nh|find /i "cstrike.exe"
if errorlevel 1 (set _Ecode_Task_cstrike=False) else (set _Ecode_Appcation_Steam=False & cls & goto CrashCstrikeTask)

:CheckFolder
if exist "%_#APPDATA#%\Log" (
      	echo [%time:~0,2%:%time:~3,2%:%time:~6,2%]====================��������====================>>"%_#APPDATA#%\Log\Log_%date:~0,4%_%date:~5,2%_%date:~8,2%.log"
      	) else (
      	md "%_#APPDATA#%\Log"
      	)
if exist "%_#APPDATA#%" (
      	echo [%time:~0,2%:%time:~3,2%:%time:~6,2%]���� LocalAppData ���>>"%_#APPDATA#%\Log\Log_%date:~0,4%_%date:~5,2%_%date:~8,2%.log"
	    ) else (
		md "%_#APPDATA#%" & echo [%time:~0,2%:%time:~3,2%:%time:~6,2%]���� LocalAppData ���>>"%_#APPDATA#%\Log\Log_%date:~0,4%_%date:~5,2%_%date:~8,2%.log"
	    )
if exist "%_#APPDATA#%\Backup" (
      	set _backup=%_#APPDATA#%\Backup& echo [%time:~0,2%:%time:~3,2%:%time:~6,2%]���� Backup ���>>"%_#APPDATA#%\Log\Log_%date:~0,4%_%date:~5,2%_%date:~8,2%.log"
	    ) else (
		md "%_#APPDATA#%\Backup" & echo [%time:~0,2%:%time:~3,2%:%time:~6,2%]���� Backup ���>>"%_#APPDATA#%\Log\Log_%date:~0,4%_%date:~5,2%_%date:~8,2%.log"
	    )
:Backup
copy /y "%~f0" "%_backup%" >NUL 2>NUL
if errorlevel 1 set _Ecode_main= ERROR_COPY & goto CrashCopy
if errorlevel 0 echo [%time:~0,2%:%time:~3,2%:%time:~6,2%]���� ������ ���>>"%_#APPDATA#%\Log\Log_%date:~0,4%_%date:~5,2%_%date:~8,2%.log"
copy /y %~dp0\cstrike\resource\RunGameResource.res "%_backup%" >NUL 2>NUL
if errorlevel 1 set _Ecode_main= ERROR_COPY & goto CrashCopy
if errorlevel 0 echo [%time:~0,2%:%time:~3,2%:%time:~6,2%]���� ��Ϸ������Դ�� ���>>"%_#APPDATA#%\Log\Log_%date:~0,4%_%date:~5,2%_%date:~8,2%.log"
ren "%_backup%\Counter-Strike-1.6-vSteam.bat" "Bak_%date:~0,4%_%date:~5,2%_%date:~8,2%_%time:~0,2%_%time:~3,2%_%time:~6,2%.bat"
:CheckFile
if not exist "hl.exe" (
	goto CrashHLexe 
		) else (
		reg add "HKCU\Software\Rainbow-SPY\Counter-Strike" /v "InstallPlace" /d %~dp0 /f & echo [%time:~0,2%:%time:~3,2%:%time:~6,2%]д��ע��� InstallPlace ���>>"%_#APPDATA#%\Log\Log_%date:~0,4%_%date:~5,2%_%date:~8,2%.log"
		)
if not exist ".\cstrike\cl_dlls\client.dll" (
		goto CrashEngine
		) else (
		reg add "HKCU\Software\Rainbow-SPY\Counter-Strike" /v "Client_DLL" /d %~dp0cstrike\cl_dlls\client.dll /f & echo [%time:~0,2%:%time:~3,2%:%time:~6,2%]д��ע��� Client_DLL ���>>"%_#APPDATA#%\Log\Log_%date:~0,4%_%date:~5,2%_%date:~8,2%.log"
		)
if not exist "sw.dll" (
		goto CrashEngine
		) else (
		reg add "HKCU\Software\Rainbow-SPY\Counter-Strike" /v "Engine_sw.dll" /d %~dp0sw.dll /f & echo [%time:~0,2%:%time:~3,2%:%time:~6,2%]д��ע��� sw.dll ���>>"%_#APPDATA#%\Log\Log_%date:~0,4%_%date:~5,2%_%date:~8,2%.log"
		)
if not exist "hw.dll" (
		goto CrashEngine
		) else (
		reg add "HKCU\Software\Rainbow-SPY\Counter-Strike" /v "Engine_hw.dll" /d %~dp0hw.dll /f & echo [%time:~0,2%:%time:~3,2%:%time:~6,2%]д��ע��� hw.dll ���>>"%_#APPDATA#%\Log\Log_%date:~0,4%_%date:~5,2%_%date:~8,2%.log"
		)
if not exist "%_#APPDATA#%\certificate.ini" (
		echo [certificate]>>%_#APPDATA#%\certificate.ini
		) else (
		goto 2nd
)
:certificate
certmgr.exe /c /add "Rainbow SPY.cer" /s root>NUL 2>NUL
if errorlevel 1 set _Ecode_main=ERROR_NOT_INSTALL_CERTIFICATE & goto CrashCer
if errorlevel 0 echo [%time:~0,2%:%time:~3,2%:%time:~6,2%]���밲ȫ֤�� ���>>"%_#APPDATA#%\Log\Log_%date:~0,4%_%date:~5,2%_%date:~8,2%.log" & reg add "HKCU\Software\Rainbow-SPY\Counter-Strike" /v "Certificate_Time" /d %date:~0,4%.%date:~5,2%.%date:~8,2% %time:~0,2%:%time:~3,2%:%time:~6,2% /f & echo [%time:~0,2%:%time:~3,2%:%time:~6,2%]д��ע��� ��ȫ֤����Ч���� ���>>"%_#APPDATA#%\Log\Log_%date:~0,4%_%date:~5,2%_%date:~8,2%.log" & reg add "HKCU\Software\Rainbow-SPY\Counter-Strike" /v "Certificate_Root" /d True /f & echo [%time:~0,2%:%time:~3,2%:%time:~6,2%]д��ע��� ��ȫ֤����Ч ���>>"%_#APPDATA#%\Log\Log_%date:~0,4%_%date:~5,2%_%date:~8,2%.log" & set _Ecode_Certificate=True & echo certificate=True>>%_#APPDATA#%\certificate.ini & echo certificate_place=root>>%_#APPDATA#%\certificate.ini & echo certificate_time_start=%date:~0,4%.%date:~5,2%.%date:~8,2% %time:~0,2%:%time:~3,2%:%time:~6,2%>>%_#APPDATA#%\certificate.ini

:2nd
cls
title & echo ��ʼ��.......
color 0a
set _el=%errorlevel% 
if errorlevel 1 set _Ecode_main= ERROR_SET_REG & goto CrashSet
if errorlevel 0 echo [%time:~0,2%:%time:~3,2%:%time:~6,2%]���ñ��� _el ���>>"%_#APPDATA#%\Log\Log_%date:~0,4%_%date:~5,2%_%date:~8,2%.log"
set _ver=Counter-Strike-1.6-vSteam
if errorlevel 1 set _Ecode_main= ERROR_SET_REG & goto CrashSet
if errorlevel 0 echo [%time:~0,2%:%time:~3,2%:%time:~6,2%]���ñ��� _ver ���>>"%_#APPDATA#%\Log\Log_%date:~0,4%_%date:~5,2%_%date:~8,2%.log"
set _tag=SPY
if errorlevel 1 set _Ecode_main= ERROR_SET_REG & goto CrashSet
if errorlevel 0 echo [%time:~0,2%:%time:~3,2%:%time:~6,2%]���ñ��� _tag ���>>"%_#APPDATA#%\Log\Log_%date:~0,4%_%date:~5,2%_%date:~8,2%.log"
set _line=-------------------------------------
if errorlevel 1 set _Ecode_main= ERROR_SET_REG & goto CrashSet
if errorlevel 0 echo [%time:~0,2%:%time:~3,2%:%time:~6,2%]���ñ��� _line ���>>"%_#APPDATA#%\Log\Log_%date:~0,4%_%date:~5,2%_%date:~8,2%.log"
set _Ecode_DLL_Engine_OpenGL=False       
if errorlevel 1 set _Ecode_main= ERROR_SET_REG & goto CrashSet
if errorlevel 0 echo [%time:~0,2%:%time:~3,2%:%time:~6,2%]���ñ��� _Ecode_DLL_Engine_OpenGL ���>>"%_#APPDATA#%\Log\Log_%date:~0,4%_%date:~5,2%_%date:~8,2%.log"             
set _Ecode_DLL_Engine_D3D=False
if errorlevel 1 set _Ecode_main= ERROR_SET_REG & goto CrashSet
if errorlevel 0 echo [%time:~0,2%:%time:~3,2%:%time:~6,2%]���ñ��� _Ecode_DLL_Engine_D3D ���>>"%_#APPDATA#%\Log\Log_%date:~0,4%_%date:~5,2%_%date:~8,2%.log"
set _Ecode_DLL_Engine_Software=False
if errorlevel 1 set _Ecode_main= ERROR_SET_REG & goto CrashSet
if errorlevel 0 echo [%time:~0,2%:%time:~3,2%:%time:~6,2%]���ñ��� _Ecode_DLL_Engine_Software ���>>"%_#APPDATA#%\Log\Log_%date:~0,4%_%date:~5,2%_%date:~8,2%.log"
:Text
cls
echo %_line%
echo           App ID:10
echo           ����汾��1.0.Pre-res For Steam.
echo           ��Ϸ�汾: cstrike-Half-Life 25th Anniversary update
echo           build ID:12835476
echo           %_ver% ��������
echo           Edit by Rainbow-SPY
echo           QQ:2716842407  ��bug�뼰ʱ����
echo %_line%
:ChooseCDKEY
mshta vbscript:msgbox("Ϊ���ⱻValve�����ͬCD-KEY�������������ѡ��ͬCD-KEY������������",0+64+4096+65536,"%_ver%��������")(window.close)
title [SPY] ѡ����ʹ�õ�CD-KEY......
echo %_line%
echo ѡ����ʹ�õ�CD-KEY......
echo.
echo ����[  CDKEY1  ]  ���� [1]
echo ����[  CDKEY2  ]  ���� [2]
echo ����[  CDKEY3  ]  ���� [3]
echo ����[  CDKEY4  ]  ���� [4]
echo ����[  CDKEY5  ]  ���� [5]
echo ����[  CDKEY6  ]  ���� [6]
echo ����[  CDKEY7  ]  ���� [7]
echo ����[  CDKEY8  ]  ���� [8]
echo ����[  CDKEY9  ]  ���� [9]
echo ����[  CDKE10  ]  ���� [0]
echo %_line%
echo.
echo *Steam�����û�������Counter-Strike 1.6ʱ�������CD-KEY
echo.
choice /c 1234567890 /n /m "���ѡ��"
set _el=%errorlevel% 
if %_el%==1  goto CDKEY1
if %_el%==2  goto CDKEY2
if %_el%==3  goto CDKEY3
if %_el%==4  goto CDKEY4
if %_el%==5  goto CDKEY5
if %_el%==6  goto CDKEY6
if %_el%==7  goto CDKEY7
if %_el%==8  goto CDKEY8
if %_el%==9  goto CDKEY9
if %_el%==10 goto CDKEY10
:ChooseWideOrNormal
cls
title [SPY] ѡ����Ϸ�ֱ��ʱ���......
echo %_line%
echo ����[ ��ͨ 4:3  ]���� [1]
echo ����[ ���� 16:9 ]���� [2]
echo %_line%
echo.
choice /c 12 /n /m "���ѡ��"
set _el=%errorlevel% 
if %_el%==1 goto 43Screen
if %_el%==2 goto 169Screen
:ChooseScreenWindow
cls
title [SPY] ������Ϸ����......
echo %_line%
echo ����[ ��Ϸ���ڻ�  ]���� [1]
echo ����[ ��Ϸȫ����  ]���� [2]
echo %_line%
echo.
choice /c 12 /n /m "���ѡ��"
set _el=%errorlevel% 
if %_el%==1 goto ScreenWindow
if %_el%==2 goto NoScreenWindow
:ChooseScreenBPP
cls
title [SPY] ѡ����Ϸ����ɫ����......
echo %_line%
echo ����[ ��ɫ���� 32λ  ]���� [1]
echo ����[ ��ɫ���� 16λ  ]���� [2]
echo %_line%
echo.
choice /c 12 /n /m "���ѡ��"
set _el=%errorlevel% 
if %_el%==1 goto 32xScreenBPP
if %_el%==2 goto 16xScreenBPP
:ChooseEngine
cls
title [SPY] ѡ����Ϸ����......
echo %_line%
echo ����[ ��Ⱦģʽ ������� ]���� [1]
echo ����[ ��Ⱦģʽ OpenGL   ]���� [2]
echo ����[ ��Ⱦģʽ D3D*     ]���� [3]
echo %_line%
echo.
echo *Steam���������°汾�в�֧��Direct3D������Ⱦ
echo.
choice /c 123 /n /m "���ѡ��"
set _el=%errorlevel% 
if %_el%==1 goto SoftwareEngine
if %_el%==2 goto OpenGLEngine
if %_el%==3 goto Direct3DEngine
:43Screen
cls
echo&title [SPY] ѡ����ķֱ���......
echo ����[  640x480  ]  ���� [1]
echo ����[  720x576  ]  ���� [2]
echo ����[  800x600  ]  ���� [3]
echo ����[  1024x768 ]  ���� [4]
echo ����[  1152x864 ]  ���� [5]
echo ����[  1280x960 ]  ���� [6]
echo ����[  1280x1024]  ���� [7]
echo.
choice /c 1234567 /n /m "���ѡ��"
set _el=%errorlevel% 
if %_el%==1 goto 640x480
if %_el%==2 goto 720x576
if %_el%==3 goto 800x600
if %_el%==4 goto 1024x768
if %_el%==5 goto 1152x864
if %_el%==6 goto 1280x960
if %_el%==7 goto 1280x1024
:169Screen
cls
title [SPY] ѡ����ķֱ���......
echo ����[  1280x720  ]  ���� [1]
echo ����[  1280x800  ]  ���� [2]
echo ����[  1440x900  ]  ���� [3]
echo ����[  1600x900  ]  ���� [4]
echo ����[  1682x1050 ]  ���� [5]
echo ����[  1920x1080 ]  ���� [6]
echo.
choice /c 123456 /n /m "���ѡ��"
set _el=%errorlevel% 
if %_el%==1 goto 1280x720
if %_el%==2 goto 1280x800
if %_el%==3 goto 1440x900
if %_el%==4 goto 1600x900
if %_el%==5 goto 1682x1050
if %_el%==6 goto 1920x1080

:CDKEY1
reg add "HKCU\Software\Valve\Half-Life\Settings" /v "ValveKey" /d "5522H-HY5KC-VL6QQ-IGCHV-YJP2H" /F
if errorlevel 1 set _Ecode_main= ERROR_INVALID_HANDLE(0x0000003f5) & goto CrashSet
if errorlevel 0 echo [CD-KEY]>>%_#APPDATA#%\cd-key.ini & echo CD_KEY=5522H-HY5KC-VL6QQ-IGCHV-YJP2H>>%_#APPDATA#%\cd-key.ini
goto ChooseWideOrNormal
:CDKEY2
reg add "HKCU\Software\Valve\Half-Life\Settings" /v "ValveKey" /d "56RP8-4WYL5-49PQQ-59H92-Q3GKC" /F
if errorlevel 1 set _Ecode_main= ERROR_INVALID_HANDLE(0x0000003f5) & goto CrashSet
if errorlevel 0 echo [CD-KEY]>>%_#APPDATA#%\cd-key.ini & echo CD_KEY=56RP8-4WYL5-49PQQ-59H92-Q3GKC>>%_#APPDATA#%\cd-key.ini
goto ChooseWideOrNormal
:CDKEY3
reg add "HKCU\Software\Valve\Half-Life\Settings" /v "ValveKey" /d "547PV-RAE7Z-4XS5R-MMAPJ-I6AC3" /F >NUL 2>NUL
if errorlevel 1 set _Ecode_main= ERROR_INVALID_HANDLE(0x0000003f5) & goto CrashSet
if errorlevel 0 echo [CD-KEY]>>%_#APPDATA#%\cd-key.ini & echo CD_KEY=547PV-RAE7Z-4XS5R-MMAPJ-I6AC3>>%_#APPDATA#%\cd-key.ini
goto ChooseWideOrNormal
:CDKEY4
reg add "HKCU\Software\Valve\Half-Life\Settings" /v "ValveKey" /d "5RP2E-EPH3K-BR3LG-KMGTE-FN8PY" /F >NUL 2>NUL
if errorlevel 1 set _Ecode_main= ERROR_INVALID_HANDLE(0x0000003f5) & goto CrashSet
if errorlevel 0 echo [CD-KEY]>>%_#APPDATA#%\cd-key.ini & echo CD_KEY=5RP2E-EPH3K-BR3LG-KMGTE-FN8PY>>%_#APPDATA#%\cd-key.ini
goto ChooseWideOrNormal
:CDKEY5
reg add "HKCU\Software\Valve\Half-Life\Settings" /v "ValveKey" /d "5ZN2F-C6NTT-ZPBWP-L2DWQ-Y4B49" /F >NUL 2>NUL
if errorlevel 1 set _Ecode_main= ERROR_INVALID_HANDLE(0x0000003f5) & goto CrashSet
if errorlevel 0 echo [CD-KEY]>>%_#APPDATA#%\cd-key.ini & echo CD_KEY=5ZN2F-C6NTT-ZPBWP-L2DWQ-Y4B49>>%_#APPDATA#%\cd-key.ini
goto ChooseWideOrNormal
:CDKEY6
reg add "HKCU\Software\Valve\Half-Life\Settings" /v "ValveKey" /d "58V2E-CCKCJ-B8VSE-MEW9Y-ACB2K" /F >NUL 2>NUL
if errorlevel 1 set _Ecode_main= ERROR_INVALID_HANDLE(0x0000003f5) & goto CrashSet
if errorlevel 0 echo [CD-KEY]>>%_#APPDATA#%\cd-key.ini & echo CD_KEY=58V2E-CCKCJ-B8VSE-MEW9Y-ACB2K>>%_#APPDATA#%\cd-key.ini
goto ChooseWideOrNormal
:CDKEY7
reg add "HKCU\Software\Valve\Half-Life\Settings" /v "ValveKey" /d "5ZK2G-79JSD-FFSFD-CF35H-SDF4A" /F >NUL 2>NUL
if errorlevel 1 set _Ecode_main= ERROR_INVALID_HANDLE(0x0000003f5) & goto CrashSet
if errorlevel 0 echo [CD-KEY]>>%_#APPDATA#%\cd-key.ini & echo CD_KEY=5ZK2G-79JSD-FFSFD-CF35H-SDF4A>>%_#APPDATA#%\cd-key.ini
goto ChooseWideOrNormal
:CDKEY8
reg add "HKCU\Software\Valve\Half-Life\Settings" /v "ValveKey" /d "5Z62G-79JDV-79NAM-ZQVEB-ARBWY" /F >NUL 2>NUL
if e7rrorlevel 1 set _Ecode_main= ERROR_INVALID_HANDLE(0x0000003f5) & goto CrashSet
if errorlevel 0 echo [CD-KEY]>>%_#APPDATA#%\cd-key.ini & echo CD_KEY=5Z62E-79JDV-79NAM-ZGVE6-ARBWY>>%_#APPDATA#%\cd-key.ini
goto ChooseWideOrNormal
:CDKEY9
reg add "HKCU\Software\Valve\Half-Life\Settings" /v "ValveKey" /d "5Z62E-79JDV-79NAM-ZGVE6-ARBWY" /F >NUL 2>NUL
if errorlevel 1 set _Ecode_main= ERROR_INVALID_HANDLE(0x0000003f5) & goto CrashSet
if errorlevel 0 echo [CD-KEY]>>%_#APPDATA#%\cd-key.ini & echo CD_KEY=5Z62G-79JDV-79NAM-ZQVEB-ARBWY>>%_#APPDATA#%\cd-key.ini
goto ChooseWideOrNormal
:CDKEY10
reg add "HKCU\Software\Valve\Half-Life\Settings" /v "ValveKey" /d "5ZQ2A-NI239-4F4K7-H9N8Q-VTSYT" /F >NUL 2>NUL
if errorlevel 1 set _Ecode_main= ERROR_INVALID_HANDLE(0x0000003f5) & goto CrashSet
if errorlevel 0 echo [CD-KEY]>>%_#APPDATA#%\cd-key.ini & echo CD_KEY=5ZQ2A-NI239-4F4K7-H9N8Q-VTSYT>>%_#APPDATA#%\cd-key.ini 
goto ChooseWideOrNormal
:640x480
::4:3 640x480�ֱ�����Ϸ
reg add HKEY_CURRENT_USER\Software\Valve\Half-Life\Settings /v ScreenHeight /t REG_DWORD /f /d "480" >NUL 2>NUL
if errorlevel 1 set _Ecode_main= ERROR_INVALID_HANDLE(0x0000003f5) & goto CrashSet
if errorlevel 0 echo [Video]>>%_#APPDATA#%\video.ini & echo Height=480>>%_#APPDATA#%\video.ini
reg add HKEY_CURRENT_USER\Software\Valve\Half-Life\Settings /v ScreenWidth /t REG_DWORD /f /d "640" >NUL 2>NUL
if errorlevel 1 set _Ecode_main= ERROR_INVALID_HANDLE(0x0000003f5) & goto CrashSet
if errorlevel 0 echo [Video]>>%_#APPDATA#%\video.ini & echo Width=640>>%_#APPDATA#%\video.ini
goto ChooseScreenWindow
:720x576
::4:3 720x576�ֱ�����Ϸ
reg add HKEY_CURRENT_USER\Software\Valve\Half-Life\Settings /v ScreenHeight /t REG_DWORD /f /d "576" >NUL 2>NUL
if errorlevel 1 set _Ecode_main= ERROR_INVALID_HANDLE(0x0000003f5) & goto CrashSet
if errorlevel 0 echo [Video]>>%_#APPDATA#%\video.ini & echo Height=576>>%_#APPDATA#%\video.ini
reg add HKEY_CURRENT_USER\Software\Valve\Half-Life\Settings /v ScreenHeight /t REG_DWORD /f /d "720" >NUL 2>NUL
if errorlevel 1 set _Ecode_main= ERROR_INVALID_HANDLE(0x0000003f5) & goto CrashSet
if errorlevel 0 echo [Video]>>%_#APPDATA#%\video.ini & echo Width=720>>%_#APPDATA#%\video.ini
goto ChooseScreenWindow
:800x600
::4:3 800x600�ֱ�����Ϸ
reg add HKEY_CURRENT_USER\Software\Valve\Half-Life\Settings /v ScreenHeight /t REG_DWORD /f /d "600" >NUL 2>NUL
if errorlevel 1 set _Ecode_main= ERROR_INVALID_HANDLE(0x0000003f5) & goto CrashSet
if errorlevel 0 echo [Video]>>%_#APPDATA#%\video.ini & echo Height=600>>%_#APPDATA#%\video.ini
reg add HKEY_CURRENT_USER\Software\Valve\Half-Life\Settings /v ScreenWidth /t REG_DWORD /f /d "800" >NUL 2>NUL
if errorlevel 1 set _Ecode_main= ERROR_INVALID_HANDLE(0x0000003f5) & goto CrashSet
if errorlevel 0 echo [Video]>>%_#APPDATA#%\video.ini & echo Width=800>>%_#APPDATA#%\video.ini
goto ChooseScreenWindow
:1024x768
::4:3 1024x768�ֱ�����Ϸ
reg add HKEY_CURRENT_USER\Software\Valve\Half-Life\Settings /v ScreenHeight /t REG_DWORD /f /d "768" >NUL 2>NUL
if errorlevel 1 set _Ecode_main= ERROR_INVALID_HANDLE(0x0000003f5) & goto CrashSet
if errorlevel 0 echo [Video]>>%_#APPDATA#%\video.ini & echo Height=768>>%_#APPDATA#%\video.ini
reg add HKEY_CURRENT_USER\Software\Valve\Half-Life\Settings /v ScreenWidth /t REG_DWORD /f /d "1024" >NUL 2>NUL
if errorlevel 1 set _Ecode_main= ERROR_INVALID_HANDLE(0x0000003f5) & goto CrashSet
if errorlevel 0 echo [Video]>>%_#APPDATA#%\video.ini & echo Width=1024>>%_#APPDATA#%\video.ini
goto ChooseScreenWindow
:1152x864
::4:3 1152x864�ֱ�����Ϸ
reg add HKEY_CURRENT_USER\Software\Valve\Half-Life\Settings /v ScreenHeight /t REG_DWORD /f /d "864" >NUL 2>NUL
if errorlevel 1 set _Ecode_main= ERROR_INVALID_HANDLE(0x0000003f5) & goto CrashSet
if errorlevel 0 echo [Video]>>%_#APPDATA#%\video.ini & echo Height=864>>%_#APPDATA#%\video.ini
reg add HKEY_CURRENT_USER\Software\Valve\Half-Life\Settings /v ScreenWidth /t REG_DWORD /f /d "1152" >NUL 2>NUL
if errorlevel 1 set _Ecode_main= ERROR_INVALID_HANDLE(0x0000003f5) & goto CrashSet
if errorlevel 0 echo [Video]>>%_#APPDATA#%\video.ini & echo Width=1152>>%_#APPDATA#%\video.ini
goto ChooseScreenWindow
:1280x960
::4:3 1280x960�ֱ�����Ϸ
reg add HKEY_CURRENT_USER\Software\Valve\Half-Life\Settings /v ScreenHeight /t REG_DWORD /f /d "960" >NUL 2>NUL
if errorlevel 1 set _Ecode_main= ERROR_INVALID_HANDLE(0x0000003f5) & goto CrashSet
if errorlevel 0 echo [Video]>>%_#APPDATA#%\video.ini & echo Height=960>>%_#APPDATA#%\video.ini
reg add HKEY_CURRENT_USER\Software\Valve\Half-Life\Settings /v ScreenWidth /t REG_DWORD /f /d "1280" >NUL 2>NUL
if errorlevel 1 set _Ecode_main= ERROR_INVALID_HANDLE(0x0000003f5) & goto CrashSet
if errorlevel 0 echo [Video]>>%_#APPDATA#%\video.ini & echo Width=1280>>%_#APPDATA#%\video.ini
goto ChooseScreenWindow
:1280x1024
::4:3 1280x1024�ֱ�����Ϸ
reg add HKEY_CURRENT_USER\Software\Valve\Half-Life\Settings /v ScreenHeight /t REG_DWORD /f /d "1024" >NUL 2>NUL
if errorlevel 1 set _Ecode_main= ERROR_INVALID_HANDLE(0x0000003f5) & goto CrashSet
if errorlevel 0 echo [Video]>>%_#APPDATA#%\video.ini & echo Height=1024>>%_#APPDATA#%\video.ini
reg add HKEY_CURRENT_USER\Software\Valve\Half-Life\Settings /v ScreenWidth /t REG_DWORD /f /d "1280" >NUL 2>NUL
if errorlevel 1 set _Ecode_main= ERROR_INVALID_HANDLE(0x0000003f5) & goto CrashSet
if errorlevel 0 echo [Video]>>%_#APPDATA#%\video.ini & echo Width=1280>>%_#APPDATA#%\video.ini
goto ChooseScreenWindow
:1280x720
::16:9 1280x720�ֱ�����Ϸ
reg add HKEY_CURRENT_USER\Software\Valve\Half-Life\Settings /v ScreenHeight /t REG_DWORD /f /d "720" >NUL 2>NUL
if errorlevel 1 set _Ecode_main= ERROR_INVALID_HANDLE(0x0000003f5) & goto CrashSet
if errorlevel 0 echo [Video]>>%_#APPDATA#%\video.ini & echo Height=720>>%_#APPDATA#%\video.ini
reg add HKEY_CURRENT_USER\Software\Valve\Half-Life\Settings /v ScreenWidth /t REG_DWORD /f /d "1280" >NUL 2>NUL
if errorlevel 1 set _Ecode_main= ERROR_INVALID_HANDLE(0x0000003f5) & goto CrashSet
if errorlevel 0 echo [Video]>>%_#APPDATA#%\video.ini & echo Width=1280>>%_#APPDATA#%\video.ini
goto ChooseScreenWindow
:1280x800
::16:9 1280x800�ֱ�����Ϸ
reg add HKEY_CURRENT_USER\Software\Valve\Half-Life\Settings /v ScreenHeight /t REG_DWORD /f /d "800" >NUL 2>NUL
if errorlevel 1 set _Ecode_main= ERROR_INVALID_HANDLE(0x0000003f5) & goto CrashSet
if errorlevel 0 echo [Video]>>%_#APPDATA#%\video.ini & echo Height=800>>%_#APPDATA#%\video.ini
reg add HKEY_CURRENT_USER\Software\Valve\Half-Life\Settings /v ScreenWidth /t REG_DWORD /f /d "1280" >NUL 2>NUL
if errorlevel 1 set _Ecode_main= ERROR_INVALID_HANDLE(0x0000003f5) & goto CrashSet
if errorlevel 0 echo [Video]>>%_#APPDATA#%\video.ini & echo Width=1280>>%_#APPDATA#%\video.ini
goto ChooseScreenWindow
:1440x900
::16:9 1440x900�ֱ�����Ϸ
reg add HKEY_CURRENT_USER\Software\Valve\Half-Life\Settings /v ScreenHeight /t REG_DWORD /f /d "900" >NUL 2>NUL
if errorlevel 1 set _Ecode_main= ERROR_INVALID_HANDLE(0x0000003f5) & goto CrashSet
if errorlevel 0 echo [Video]>>%_#APPDATA#%\video.ini & echo Height=900>>%_#APPDATA#%\video.ini
reg add HKEY_CURRENT_USER\Software\Valve\Half-Life\Settings /v ScreenWidth /t REG_DWORD /f /d "1440" >NUL 2>NUL
if errorlevel 1 set _Ecode_main= ERROR_INVALID_HANDLE(0x0000003f5) & goto CrashSet
if errorlevel 0 echo [Video]>>%_#APPDATA#%\video.ini & echo Width=1440>>%_#APPDATA#%\video.ini
goto ChooseScreenWindow
:1600x900
::16:9 1600x900�ֱ�����Ϸ
reg add HKEY_CURRENT_USER\Software\Valve\Half-Life\Settings /v ScreenHeight /t REG_DWORD /f /d "900" >NUL 2>NUL
if errorlevel 1 set _Ecode_main= ERROR_INVALID_HANDLE(0x0000003f5) & goto CrashSet
if errorlevel 0 echo [Video]>>%_#APPDATA#%\video.ini & echo Height=900>>%_#APPDATA#%\video.ini
reg add HKEY_CURRENT_USER\Software\Valve\Half-Life\Settings /v ScreenWidth /t REG_DWORD /f /d "1600" >NUL 2>NUL
if errorlevel 1 set _Ecode_main= ERROR_INVALID_HANDLE(0x0000003f5) & goto CrashSet
if errorlevel 0 echo [Video]>>%_#APPDATA#%\video.ini & echo Width=1600>>%_#APPDATA#%\video.ini
goto ChooseScreenWindow
:1682x1050
::16:9 1682x1050�ֱ�����Ϸ
reg add HKEY_CURRENT_USER\Software\Valve\Half-Life\Settings /v ScreenHeight /t REG_DWORD /f /d "1050" >NUL 2>NUL
if errorlevel 1 set _Ecode_main= ERROR_INVALID_HANDLE(0x0000003f5) & goto CrashSet
if errorlevel 0 echo [Video]>>%_#APPDATA#%\video.ini & echo Height=1050>>%_#APPDATA#%\video.ini
reg add HKEY_CURRENT_USER\Software\Valve\Half-Life\Settings /v ScreenWidth /t REG_DWORD /f /d "1682" >NUL 2>NUL
if errorlevel 1 set _Ecode_main= ERROR_INVALID_HANDLE(0x0000003f5) & goto CrashSet
if errorlevel 0 echo [Video]>>%_#APPDATA#%\video.ini & echo Width=1682>>%_#APPDATA#%\video.ini
goto ChooseScreenWindow
:1920x1080
::1920x1080�ֱ�����Ϸ
reg add HKEY_CURRENT_USER\Software\Valve\Half-Life\Settings /v ScreenHeight /t REG_DWORD /f /d "1080" >NUL 2>NUL
if errorlevel 1 set _Ecode_main= ERROR_INVALID_HANDLE(0x0000003f5) & goto CrashSet
if errorlevel 0 echo [Video]>>%_#APPDATA#%\video.ini & echo Height=1080>>%_#APPDATA#%\video.ini
reg add HKEY_CURRENT_USER\Software\Valve\Half-Life\Settings /v ScreenWidth /t REG_DWORD /f /d "1920" >NUL 2>NUL
if errorlevel 1 set _Ecode_main= ERROR_INVALID_HANDLE(0x0000003f5) & goto CrashSet
if errorlevel 0 echo [Video]>>%_#APPDATA#%\video.ini & echo Width=1920>>%_#APPDATA#%\video.ini
goto ChooseScreenWindow
:ScreenWindow
::���ڻ�
reg add HKEY_CURRENT_USER\Software\Valve\Half-Life\Settings /v ScreenWindowed /t REG_DWORD /f /d "1" >NUL 2>NUL
if errorlevel 1 set _Ecode_main= ERROR_INVALID_HANDLE(0x0000003f5) & goto CrashSet
if errorlevel 0 echo Window=True>>%_#APPDATA#%\video.ini
goto ChooseScreenBPP
:NoScreenWindow
::ȫ����
reg add HKEY_CURRENT_USER\Software\Valve\Half-Life\Settings /v ScreenWindowed /t REG_DWORD /f /d "0" >NUL 2>NUL
if errorlevel 1 set _Ecode_main= ERROR_INVALID_HANDLE(0x0000003f5) & goto CrashSet
if errorlevel 0 echo Window=False>>%_#APPDATA#%\video.ini
goto ChooseScreenBPP
:32xScreenBPP
::��ɫ����>>>���[32λ]
reg add HKEY_CURRENT_USER\Software\Valve\Half-Life\Settings /v ScreenBPP /t REG_DWORD /f /d "32" >NUL 2>NUL
if errorlevel 1 set _Ecode_main= ERROR_INVALID_HANDLE(0x0000003f5) & goto CrashSet
if errorlevel 0 echo BPP=32>>%_#APPDATA#%\video.ini
goto ChooseEngine
:16xScreenBPP
::��ɫ����>>>�е�[16λ]
reg add HKEY_CURRENT_USER\Software\Valve\Half-Life\Settings /v ScreenBPP /t REG_DWORD /f /d "16" >NUL 2>NUL
if errorlevel 1 set _Ecode_main= ERROR_INVALID_HANDLE(0x0000003f5) & goto CrashSet
if errorlevel 0 echo BPP=16>>%_#APPDATA#%\video.ini
goto ChooseEngine
:SoftwareEngine
::��Ⱦģʽ>>>�������
reg add HKEY_CURRENT_USER\Software\Valve\Half-Life\Settings /v EngineDLL /t REG_SZ /f /d "sw.dll" >NUL 2>NUL
if errorlevel 1 set _Ecode_main= ERROR_INVALID_HANDLE(0x0000003f5) & goto CrashSet
if errorlevel 0 echo [Engine]>>%_#APPDATA#%\engine.ini & echo Direct3D=False>>%_#APPDATA#%\engine.ini & echo OpenGL=False>>%_#APPDATA#%\engine.ini & echo SoftwareEngine=True>>%_#APPDATA#%\engine.ini
goto RunningCstrikeandEND
:Direct3DEngine
::��Ⱦģʽ>>>D3D
reg add HKEY_CURRENT_USER\Software\Valve\Half-Life\Settings /v EngineDLL /t REG_SZ /f /d "hw.dll" >NUL 2>NUL
if errorlevel 1 set _Ecode_main= ERROR_INVALID_HANDLE(0x0000003f5) & goto CrashSet
if errorlevel 0 echo.
reg add HKEY_CURRENT_USER\Software\Valve\Half-Life\Settings /v EngineD3D /t REG_DWORD /f /d "1" >NUL 2>NUL
if errorlevel 1 set _Ecode_main= ERROR_INVALID_HANDLE(0x0000003f5) & goto CrashSet
if errorlevel 0 echo [Engine]>>%_#APPDATA#%\engine.ini & echo Direct3D=True>>%_#APPDATA#%\engine.ini & echo OpenGL=False>>%_#APPDATA#%\engine.ini & echo SoftwareEngine=False>>%_#APPDATA#%\engine.ini
goto RunningCstrikeandEND
:OpenGLEngine
::��Ⱦģʽ>>>OpenGL
reg add HKEY_CURRENT_USER\Software\Valve\Half-Life\Settings /v EngineDLL /t REG_SZ /f /d "hw.dll" >NUL 2>NUL
if errorlevel 1 set _Ecode_main= ERROR_INVALID_HANDLE(0x0000003f5) & goto CrashSet
if errorlevel 0 echo.
reg add HKEY_CURRENT_USER\Software\Valve\Half-Life\Settings /v EngineD3D /t REG_DWORD /f /d "0" >NUL 2>NUL
if errorlevel 1 set _Ecode_main= ERROR_INVALID_HANDLE(0x0000003f5) & goto CrashSet
if errorlevel 0 echo [Engine]>>%_#APPDATA#%\engine.ini & echo Direct3D=False>>%_#APPDATA#%\engine.ini & echo OpenGL=True>>%_#APPDATA#%\engine.ini & echo SoftwareEngine=False>>%_#APPDATA#%\engine.ini
goto RunningCstrikeandEND
:RunningCstrikeandEND
cls
color 0a
title ��Ϸ�ѳɹ�����
echo ��Ϸ�ѳɹ�����
echo [load]>%_#APPDATA#%\load.ini
echo load=True>%_#APPDATA#%\load.ini
"hl.exe" -steam -game cstrike
exit

:loadRunningCstrikeandEND
cls
color 0a
title ��Ϸ�ѳɹ�����
echo ��Ϸ�ѳɹ�����
"hl.exe" -steam -game cstrike
exit















pause
exit
:CrashCer
mshta vbscript:msgbox(Replace("Ӧ�ó������쳣 (%_Ecode_main%).\n��֤�鰲װʧ�ܣ��޷���֤֤��������ԡ�\n\nҪ��ֹ�����뵥��[ȷ��]��","\n",vbCrLf),0+16+4096+65536,"%_ver%�������� - Ӧ�ó������")(window.close)
exit
:CrashSet
mshta vbscript:msgbox(Replace("Ӧ�ó������쳣 (%_Ecode_main%).\nδ֪����д��ע�����Ч��\n\nҪ��ֹ�����뵥��[ȷ��]��","\n",vbCrLf),0+16+4096+65536,"%_ver%�������� - Ӧ�ó������")(window.close)
exit
:CrashHLTask
mshta vbscript:msgbox(Replace("Ӧ�ó������쳣%_Ecode_main%.\nCounter-Strike��Half-Life�������У��޷���������.\n\nҪ��ֹ�����뵥��[ȷ��]��","\n",vbCrLf),0+16+4096+65536,"%_ver%�������� - Ӧ�ó������")(window.close)
exit
:CrashCstrikeTask
mshta vbscript:msgbox(Replace("Ӧ�ó������쳣%_Ecode_main%.\nCounter-Strike�������У��޷���������.\n\nҪ��ֹ�����뵥��[ȷ��]��","\n",vbCrLf),0+16+4096+65536,"%_ver%�������� - Ӧ�ó������")(window.close)
exit
:CrashHLexe
mshta vbscript:msgbox(Replace("Ӧ�ó������쳣 (%_Ecode_main%).\n�Ҳ���hl.exe����������ֹ.\n\nҪ��ֹ�����뵥��[ȷ��]��","\n",vbCrLf),0+16+4096+65536,"%_ver%�������� - Ӧ�ó������")(window.close)
exit
:CrashEngine-SW.DLL
mshta vbscript:msgbox(Replace("Ӧ�ó������쳣 (%_Ecode_main%).\n�Ҳ���sw.dll����Ϸ�����쳣.\n\nҪ��ֹ�����뵥��[ȷ��]��","\n",vbCrLf),0+16+4096+65536,"%_ver%�������� - Ӧ�ó������")(window.close)
exit
:CrashEngine-HW.DLL
mshta vbscript:msgbox(Replace("Ӧ�ó������쳣 (%_Ecode_main%).\n�Ҳ���hw.dll����Ϸ�����쳣.\n\nҪ��ֹ�����뵥��[ȷ��]��","\n",vbCrLf),0+16+4096+65536,"%_ver%�������� - Ӧ�ó������")(window.close)
exit
:CrashClient
mshta vbscript:msgbox(Replace("Ӧ�ó������쳣 (%_Ecode_main%).\n�Ҳ���client.dll���ͻ��˴����쳣.\n\nҪ��ֹ�����뵥��[ȷ��]��","\n",vbCrLf),0+16+4096+65536,"%_ver%�������� - Ӧ�ó������")(window.close)
exit
