@echo off
:: Check if style.css exists in the current directory
if not exist style.css (
    echo style.css not found in the current directory.
    exit /b
)

:: Initialize temporary file for processing
del temp_classes.txt 2>nul
del allmystyles.txt 2>nul

:: Read the style.css file line by line and parse class names
for /f "delims=" %%A in (style.css) do (
    echo %%A | findstr /r /c:"\.[a-zA-Z0-9_-]" >> temp_classes.txt
)

:: Process the extracted lines to isolate class names
for /f "tokens=1 delims={}" %%B in (temp_classes.txt) do (
    echo %%B | findstr /o "." | findstr /v "hover:" | findstr "." >> allmystyles.txt
)

:: Cleanup temporary files
del temp_classes.txt

:: Notify user of completion
echo CSS class names have been saved to allmystyles.txt.
