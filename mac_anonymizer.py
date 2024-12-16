import psutil
import time
import subprocess as sub
from optparse import OptionParser

parser = OptionParser()

parser.add_option(
    "-v", "--verbose", 
    action="store_true", 
    dest="verbose", 
    default=False, 
    help="Print detailed output"
)
(options, args) = parser.parse_args()

network_interfaces = psutil.net_if_addrs()

real_interfaces = []

for interface in network_interfaces:
    if not any(x in interface.lower() for x in ['lo', 'veth', 'docker', 'tun', 'br', 'ipv6leakintrf0', "vmnet"]):
        real_interfaces.append(interface)

print("Network interfaces:")

def mac_changer(interface, print_output=False):
    sub.run(["sudo","ifconfig",interface, "down"])
    result = sub.run(["sudo","macchanger","-r", interface], capture_output=True, text=True)
    sub.run(["sudo","ifconfig",interface,"up"])
    
    if print_output:
        print(result.stdout)

for interface in real_interfaces:
    print(f"{interface.capitalize()}:")
    if options.verbose:
        mac_changer(interface,True)
    else:
        mac_changer(interface,False)
    
