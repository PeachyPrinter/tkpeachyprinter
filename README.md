# TK Peachy Printer
TK Peachy Printer is a tkinter front end GUI for the peachy printer api. 

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


### Windows
via (oh yeah there is no package manager in windows)
 - python [https://www.python.org/downloads/windows/]
 - pyaudio [http://people.csail.mit.edu/hubert/pyaudio/#downloads]


##Getting Started
###Creating a development enviroment
This development process assumes the use of python virtual environments we have made a couple of hand helper scripts to setup these enviroments.
 - Start by running the setup development enviroment script for your OS.


