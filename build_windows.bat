cd src
python setup.py bdist_msi
IF NOT "%ERRORLEVEL%" == "0" (
    echo "FAILED PACKAGING ABORTING"
    EXIT /B 3
)
cd ..

echo ------------------------------------
echo Moving file
echo ------------------------------------

move src\dist\*.msi .