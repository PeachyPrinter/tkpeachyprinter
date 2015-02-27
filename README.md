# TK Peachy Printer
TK Peachy Printer is a tkinter front end GUI for the peachy printer api. 

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
 - portaudio

### Windows
via (oh yeah there is no package manager in windows)
 - python [https://www.python.org/downloads/windows/]
 - pyaudio [http://people.csail.mit.edu/hubert/pyaudio/#downloads]

##Getting Started
###Creating a development environment
This development process assumes the use of python virtual environments we have made a couple of handy helper scripts to setup these enviroments.
 - Start by running the setup development enviroment script for your OS. This will setup a virtual enviroment and load the required dependancies into it.

###Building the software package.

###Running the software



