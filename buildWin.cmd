:: FPGA Arcade Replay Build Script
:: Target: Windows
:: 
:: Author: highpuff
:: Date: 2020-01-12

@ECHO OFF

:: Change TARGET-name below

@SET TARGET=replaySetup.adf
@SET LABEL=replaySetup

:: Do NOT change anything below!

@SET BASE_PTH=%~dp0

@SET DISK_PTH=%BASE_PTH%adf\%TARGET%
@SET FILE_PTH=%BASE_PTH%base
@SET TOOL_PTH=%BASE_PTH%bin\adftools\

@SET ADF_MAKE=%TOOL_PTH%adfcreate.exe
@SET ADF_COPY=%TOOL_PTH%adfcopy.exe
@SET ADF_INST=%TOOL_PTH%adfinst.exe
@SET ADF_MDIR=%TOOL_PTH%adfmakedir.exe
@SET ADF_LIST=%TOOL_PTH%adflist.exe

:: Clean some old files

IF EXIST %DISK_PTH% ECHO DEL /F /Q %DISK_PTH%

:: Create an Amiga Disk File (.adf)

%ADF_MAKE% --label=%LABEL% %DISK_PTH% >NUL

:: Create needed folders

%ADF_MDIR% %DISK_PTH% c >NUL
%ADF_MDIR% %DISK_PTH% classes/datatypes >NUL
%ADF_MDIR% %DISK_PTH% devs/netinterfaces >NUL
%ADF_MDIR% %DISK_PTH% devs/monitors >NUL
%ADF_MDIR% %DISK_PTH% devs/netinterfaces >NUL
%ADF_MDIR% %DISK_PTH% libs/picasso96 >NUL
%ADF_MDIR% %DISK_PTH% prefs/env-archive/picasso96 >NUL
%ADF_MDIR% %DISK_PTH% s >NUL

:: Copy needed files

%ADF_COPY% %DISK_PTH% %FILE_PTH%\replaySetup / >NUL
%ADF_COPY% %DISK_PTH% %FILE_PTH%\replaySetup.info / >NUL

%ADF_COPY% %DISK_PTH% %FILE_PTH%\c\FindBoard c >NUL
%ADF_COPY% %DISK_PTH% %FILE_PTH%\c\Installer c >NUL
%ADF_COPY% %DISK_PTH% %FILE_PTH%\c\Reboot c >NUL

%ADF_COPY% %DISK_PTH% %FILE_PTH%\classes\datatypes\picture.datatype classes/datatypes >NUL

%ADF_COPY% %DISK_PTH% %FILE_PTH%\devs\Picasso96Settings devs >NUL
%ADF_COPY% %DISK_PTH% %FILE_PTH%\devs\replayeth.device devs >NUL

%ADF_COPY% %DISK_PTH% %FILE_PTH%\devs\monitors\Replay devs/monitors >NUL
%ADF_COPY% %DISK_PTH% %FILE_PTH%\devs\monitors\Replay.info devs/monitors >NUL

%ADF_COPY% %DISK_PTH% %FILE_PTH%\devs\netinterfaces\ReplayEth devs/monitors >NUL
%ADF_COPY% %DISK_PTH% %FILE_PTH%\devs\netinterfaces\ReplayEth.info devs/monitors >NUL

%ADF_COPY% %DISK_PTH% %FILE_PTH%\libs\Picasso96API.library libs >NUL
%ADF_COPY% %DISK_PTH% %FILE_PTH%\libs\picasso96\emulation.library libs/picasso96 >NUL
%ADF_COPY% %DISK_PTH% %FILE_PTH%\libs\picasso96\fastlayers.library libs/picasso96 >NUL
%ADF_COPY% %DISK_PTH% %FILE_PTH%\libs\picasso96\Replay.card libs/picasso96 >NUL
%ADF_COPY% %DISK_PTH% %FILE_PTH%\libs\picasso96\rtg.library libs/picasso96 >NUL

%ADF_COPY% %DISK_PTH% %FILE_PTH%\prefs\Picasso96Mode prefs >NUL
%ADF_COPY% %DISK_PTH% %FILE_PTH%\prefs\Picasso96Mode.info prefs >NUL

%ADF_COPY% %DISK_PTH% %FILE_PTH%\prefs\env-archive\picasso96\AmigaVideo prefs/env-archive/picasso96 >NUL
%ADF_COPY% %DISK_PTH% %FILE_PTH%\prefs\env-archive\picasso96\BlackSwitching prefs/env-archive/picasso96 >NUL
%ADF_COPY% %DISK_PTH% %FILE_PTH%\prefs\env-archive\picasso96\Debug prefs/env-archive/picasso96 >NUL
%ADF_COPY% %DISK_PTH% %FILE_PTH%\prefs\env-archive\picasso96\DirectColorMask prefs/env-archive/picasso96 >NUL
%ADF_COPY% %DISK_PTH% %FILE_PTH%\prefs\env-archive\picasso96\DisableAmigaBlitter prefs/env-archive/picasso96 >NUL
%ADF_COPY% %DISK_PTH% %FILE_PTH%\prefs\env-archive\picasso96\DoNotSetMMU prefs/env-archive/picasso96 >NUL
%ADF_COPY% %DISK_PTH% %FILE_PTH%\prefs\env-archive\picasso96\EnableBootVGA prefs/env-archive/picasso96 >NUL
%ADF_COPY% %DISK_PTH% %FILE_PTH%\prefs\env-archive\picasso96\Experimental prefs/env-archive/picasso96 >NUL
%ADF_COPY% %DISK_PTH% %FILE_PTH%\prefs\env-archive\picasso96\PlanarOnlyDIPFDBUF prefs/env-archive/picasso96 >NUL
%ADF_COPY% %DISK_PTH% %FILE_PTH%\prefs\env-archive\picasso96\PlanesToFast prefs/env-archive/picasso96 >NUL
%ADF_COPY% %DISK_PTH% %FILE_PTH%\prefs\env-archive\picasso96\ShowModes prefs/env-archive/picasso96 >NUL

:: List the new archive

%ADF_LIST% %DISK_PTH%

:: Done