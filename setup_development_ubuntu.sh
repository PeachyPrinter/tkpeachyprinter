#!/bin/bash
if [[ "$VIRTUAL_ENV" != "" ]]; then
    deactivate
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

# python -c"import cx_freeze"
# if [ $? != 0 ]; then
#     echo "cx_freeze not available adding"
#     pip install -U --force cx_freeze
#     if [ $? != 0 ]; then
#         echo "FAILURE: cx_freeze failed installing"
#         WILL_FAIL=2
#         FAIL_REASONS="$FAIL_REASONS\nFAILURE: cx_freeze failed installing"
#     fi
# fi

dpkg --get-selections | grep -v deinstall | grep python-pyaudio
if [ $? != 0 ]; then
    echo "PyAudio Required"
    sudo apt-get install python-pyaudio
    if [ $? != 0 ]; then
        WILL_FAIL=3
        FAIL_REASONS="$FAIL_REASONS\nFAILURE: pyaudio failed installing (APT)"
    fi
fi

ln -fs /usr/lib/python2.7/dist-packages/pyaudio.py venv/lib/python2.7/site-packages/pyaudio.py
ln -fs /usr/lib/python2.7/dist-packages/_portaudio.so venv/lib/python2.7/site-packages/_portaudio.so
ln -fs /usr/lib/python2.7/dist-packages/PyAudio-0.2.8.egg-info venv/lib/python2.7/site-packages/PyAudio-0.2.8.egg-info
python -c"import pyaudio"
if [ $? != 0 ]; then
        WILL_FAIL=3
        FAIL_REASONS="$FAIL_REASONS\nFAILURE: pyaudio failed installing (LINK)"
fi


if [ $WILL_FAIL != 0 ]; then
    echo "Enviroment setup failed"
    echo $FAIL_REASONS
fi
exit $WILL_FAIL

