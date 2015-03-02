SET will_fail=0
SET fail_reasons=""

ECHO "----Checking for already running Virtual Environment----"
IF NOT "%VIRTUAL_ENV%" == "" (
    ECHO "Deactivitate the existing virtual enviroment before running this script."
    ECHO "This can be done with the \"deactivate\" command."
    EXIT /B 53 
)

ECHO "----Checking for Pip----"
where pip
IF NOT "%ERRORLEVEL%" == "0" (
    ECHO "FAILURE: PIP is not available, you should install it."
    SET will_fail=11
    SET fail_reasons="%fail_reasons%\nFAILURE: Pip failed installing"
    EXIT /B %will_fail%
)

ECHO "----Checking for virtualenv----"
where virtualenv
IF NOT "%ERRORLEVEL%" == "0" (
    ECHO "FAILURE: virtualenv not available, you should install it."
    SET will_fail=12
    SET fail_reasons="%fail_reasons%\nFAILURE: virtualenv not available, you should install it."
    EXIT /B %will_fail%
)

ECHO "----Checking for and create a virtual environment----"
create_venv="TRUE"
IF EXISTS venv (
    :question
    SET /P anwser "Do you wish remove and re-install this environment? (y/n)"
    IF /i {%anwser%}=={y} (GOTO :yes) 
    IF /i {%anwser%}=={n} (GOTO :no) 
    GOTO :question 

    :yes 
    create_venv="TRUE"
    GOTO :endquesiton
    
    :no 
    create_venv="FALSE"
    GOTO :endquesiton

    :endquesiton
)

IF %create_venv% == "TRUE" (
    virtualenv venv
    IF NOT "%ERRORLEVEL%" == "0" (
        ECHO "FAILURE: Virutal environment creation failed"
        SET will_fail=59
        SET fail_reasons="%fail_reasons%\nFAILURE: Virutal environment creation failed"
        EXIT /B %will_fail%
)

source venv/bin/activate
IF "%VIRTUAL_ENV%" == ""(
ECHO "FAILURE: Virutal environment activation failed"
        SET will_fail=666
        SET fail_reasons="%fail_reasons%\nFAILURE: Virutal environment activation failed"
        EXIT /B %will_fail%


ECHO "----Setting up virtual environment----"

ECHO "--------Setting up numpy----"
python -c"import numpy"
IF NOT "%ERRORLEVEL%" == "0" (
    ECHO "Numpy not available adding"
    pip install -U --force numpy
    IF NOT "%ERRORLEVEL%" == "0" (
        ECHO "FAILURE: Numpy failed installing"
        SET will_fail=1
        fail_reasons="%fail_reasons%\nFAILURE: Numpy failed installing"
    )
)

ECHO "--------Setting up cx_Freeze----"
python -c"import cx_Freeze"
IF NOT "%ERRORLEVEL%" == "0" (
    ECHO "cx-freeze Required installing"
    pip install -U cx_Freeze
    IF NOT "%ERRORLEVEL%" == "0" (
        ECHO "FAILURE: cx-freeze failed installing, You can manually install it from: https://pypi.python.org/pypi?:action=display&name=cx_Freeze&version=4.3.4 "
        SET will_fail=2
        SET fail_reasons="%fail_reasons%\nFAILURE: cx-freeze failed installing, You can manually install it from: https://pypi.python.org/pypi?:action=display&name=cx_Freeze&version=4.3.4"
    )
)

ECHO "--------Setting up pyaudio----"
python -c"import pyaudio"
IF NOT "%ERRORLEVEL%" == "0" (
    ECHO "PyAudio Required, you can manually install it from: http://people.csail.mit.edu/hubert/pyaudio/#downloads"
    SET will_fail=4
    SET fail_reasons="%fail_reasons%\nFAILURE :PyAudio Required, you can manually install it from: http://people.csail.mit.edu/hubert/pyaudio/#downloads"
    )
)

IF [ %will_fail% != 0 ]; then
    ECHO "Enviroment SETup failed"
    ECHO -e %fail_reasons%
    exit %will_fail%
)

ECHO ""
ECHO "-----------------------------------"
ECHO "Enviroment SETup complete and seemingly successful."
ECHO "You can start the enviroment with the command\"source venv/bin/activate\""
