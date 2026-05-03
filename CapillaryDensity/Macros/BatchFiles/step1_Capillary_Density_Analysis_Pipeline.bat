@echo off
setlocal EnableDelayedExpansion

:: Note: replace the path below with complete path to CZI datasets
SET datapath=D:\IUCPQ\SU90Quad\data\publique donnee\21324072\

:: Note: replace the path below with complete path to macro files
SET macropath=D:\IUCPQ\SU90Quad\source\ImageProcessing\CapillaryDensity\Macros\

:: Note: replace the path below with complete path to Fiji app
SET imagejPath="C:\Program Files\Fiji\fiji-windows-x64.exe"

:: Note: replace the path below with complete path to Ilastik app
SET ilastikpath=C:\Program Files\ilastik-1.4.2rc1-gpu\ilastik.exe



%imagejPath% --ij2 --console --run "%macropath%1.Tiff_to_Mask.ijm" "inputFolder='%datapath%'"
%imagejPath% --ij2 --console --run "%macropath%2.Masked_Laminin.ijm" "inputFolder='%datapath%'"

set filelist=
FOR /F "delims=" %%G in ('dir /b "%datapath%*_Lamin_Masked.tif"') do set filelist=!filelist! "%datapath%%%G"
"%ilastikpath%" --headless --project="%macropath%3.Pixelclass_Laminin_Masked.ilp" %filelist%

%imagejPath% --ij2 --console --run "%macropath%4.Segment_Laminin.ijm" "inputFolder='%datapath%'"
%imagejPath% --ij2 --console --run "%macropath%5.Export_Area.ijm" "inputFolder='%datapath%'"
%imagejPath% --ij2 --console --run "%macropath%6.Export_Quant_CD31_CD105.ijm" "inputFolder='%datapath%'"

pause
