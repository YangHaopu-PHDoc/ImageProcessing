@echo off
setlocal EnableDelayedExpansion

:: Note: replace the path below with complete path to CZI datasets
SET datapath=D:\IUCPQ\SU90Quad\data\publique donnee\21324072\

:: Note: replace the path below with complete path to macro files
SET macropath=D:\IUCPQ\SU90Quad\source\ImageProcessing\CapillaryDensity\Macros\

:: Note: replace the path below with complete path to Fiji app
SET imagejPath="C:\Program Files\Fiji\fiji-windows-x64.exe"

%imagejPath% --ij2 --headless --console --run "%macropath%0.Convert_CZI_to_Tiff.ijm" "inputFolder='%datapath%'"

pause

