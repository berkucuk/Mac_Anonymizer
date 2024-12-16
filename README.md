# Mac_Anonymizer
It ensures anonymity within the network by randomly changing the MAC addresses of the physical network cards in the Linux machine.
In order for this service to work, macchanger, net-tools and python3 virtual env packages must be installed.
In order to run the automatic installation script, you can give it permission to run with chmod +x install.sh and run it with ./install.sh.
This tool runs automatically every hour and changes the MAC addresses of the physical network cards connected to the machine with random values, allowing you to remain anonymous within the network.
