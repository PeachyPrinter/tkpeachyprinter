-- DEPRICATED -- This is the old version of the peachyprinter ui and is no longer maintained and will not work with the version of the API.

USE AT YOUR OWN RISK


# TK Peachy Printer
TK Peachy Printer is a tkinter frontend for the peachy printer api. 

API [https://github.com/PeachyPrinter/peachyprintertools]
API python packages are available at [http://software.peachyprinter.com/builds/api/]

This code [https://github.com/PeachyPrinter/tkpeachyprinter]
Complete packages are available at [http://software.peachyprinter.com/]

## Development Requirements
### Ubuntu (Debian)
via apt
 - python-pip
 - python-pyaudio
 - python-virtualenv
 - cx-freeze

You can prepare your enviroment using the following command:
```sh
sudo apt-get install python-pip python-pyaudio cx-freeze python-virtualenv
```

### Centos (RedHat)
via yum
 - python-pip
 - python-pyaudio
 - python-virtualenv
 - cx-freeze

 You can prepare your enviroment using the following command:
```sh
sudo rpm -iUvh http://dl.fedoraproject.org/pub/epel/7/x86_64/e/epel-release-7-5.noarch.rpm
sudo yum -y update
sudo yum -y install python-pip
sudo yum -y install python-virtualenv
sudo yum -y install portaudio portaudio-devel
```

### Mac OSX
 - pip
 - virtualenv
 - portaudio available via homebrew see [http://brew.sh/] and [http://brewformulas.org/Portaudio]

### Windows
via (oh yeah there is no package manager in windows)
 - python [https://www.python.org/downloads/windows/]
 - pyaudio [http://people.csail.mit.edu/hubert/pyaudio/#downloads]

##Getting Started
###Creating a development environment
This development process assumes the use of python virtual environments we have made a couple of handy helper scripts to setup these enviroments.
 - Start by running the setup development enviroment script for your OS. This will setup a virtual enviroment and load the required dependancies into it.

###Building the software package

###Running the software
Once the virtual environment is started running the software an be done via the command *python src/peachyprintertools.py*
 - "-c"  - will out put the log info to the console
 - "-d"  - will add the development mode features
 - "-l LEVEL" - will select the log level valid levels: DEBUG INFO WARNING ERROR  note:DEBUG is so verbose printing will probibily get ruined by delays

###Known issues
 - The UI can fail to shutdown correctly on errors and the process may have to be killed.
 - There is no current build for debian systems so it must be run from souce.

###Scripts
 - build*  - These create an installable package
 - setup_devleopment*  - These create a python virtual environment and install required dependancies (Note some may need to be installed on the system)
 - get_latest_api  - This will update a currently active virtual envirionment with the lastest version of the api code 

