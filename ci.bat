//generate CI-script for local buildong for windows with possible errors handling
@echo off
setlocal
set BUILD_DIR=build
echo.
echo === STEP 1: Create and configure the build directory ===
if not exist %BUILD_DIR% (
    mkdir %BUILD_DIR%
    echo Catalog %BUILD_DIR% created.
) else (
    echo Catalog %BUILD_DIR% alreaedy existed.
)
cd %BUILD_DIR%
echo.
echo --- Starting CMake configuration ---
cmake ..
if errorlevel 1 (
    echo.
    echo !!! ERROR: CMake configuration failed. !!!
    exit /b 1
)
echo.
echo === STEP 2: Build the project and run tests ===
cmake --build . 
if errorlevel 1 (
    echo.
    echo !!! ERROR: Project build failed. !!!
    exit /b 1
)
echo.
echo --- Running tests ---
ctest --verbose 
if errorlevel 1 (
    echo.
    echo !!! ERROR: Tests failed. !!!
    exit /b 1
)
echo.
echo === BUILD AND TEST COMPLETED SUCCESSFULLY ===
cd ..
endlocal