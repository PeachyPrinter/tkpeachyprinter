#!/bin/bash
if [[ "$VIRTUAL_ENV" != "" ]]; then
    echo "Deactivitate the existing virtual enviroment before running this script."
    echo "This can be done with the \"deactivate\" command."
    exit 53 
fi

if [ -d "venv" ]; then
    while true; do
    read -p "Do you wish remove and re-install this environment?" yn
    case $yn in
        [Yy]* ) rm -rf venv && virtualenv venv; break;;
        [Nn]* ) break;;
        * ) echo "Please answer yes or no.";;
    esac
    done
else
    virtualenv venv
fi

source venv/bin/activate

if [[ "$VIRTUAL_ENV" == "" ]]; then
    echo "Virutal environment setup failed"
    exit 666
fi

SETUP_TMP="setup_tmp"
WILL_FAIL=0
FAIL_REASONS=""

python -c"import numpy"
if [ $? != 0 ]; then
    echo "Numpy not available adding"
    pip install -U --force numpy
    if [ $? != 0 ]; then
        echo "FAILURE: Numpy failed installing"
        WILL_FAIL=1
        FAIL_REASONS="$FAIL_REASONS\nFAILURE: Numpy failed installing"
    fi
fi

python -c"import cx_Freeze"
if [ $? != 0 ]; then
    echo "cx_Freeze not available adding"
    pip install -U --force cx_Freeze
    if [ $? != 0 ]; then
        echo "FAILURE: cx_Freeze failed installing"
        WILL_FAIL=2
        FAIL_REASONS="$FAIL_REASONS\nFAILURE: cx_Freeze failed installing"
    fi
fi

python -c"import pyaudio"
if [ $? != 0 ]; then
    echo "pyaudio not available adding"
    pip install -U --force --allow-external pyaudio --allow-unverified pyaudio pyaudio
    if [ $? != 0 ]; then
        echo "FAILURE: pyaudio failed installing"
        WILL_FAIL=2
        FAIL_REASONS="$FAIL_REASONS\nFAILURE: cx_Freeze failed installing"
    fi
fi


if [ $WILL_FAIL != 0 ]; then
    echo "Enviroment setup failed"
    echo $FAIL_REASONS
fi
exit $WILL_FAIL

echo "Enviroment setup complete and seemingly successful."
echo "You can start the enviroment with the command\"source venv/bin/activate\""
