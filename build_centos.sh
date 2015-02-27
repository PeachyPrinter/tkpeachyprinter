cd src
python setup.py bdist_rpm
if [ $? != 0 ]; then
    echo "Packaging Failed Aborting"
    exit 55
fi
cd ..
mv src/dist/*.rpm .