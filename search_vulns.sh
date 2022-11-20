#!/bin/bash
# Automation script for gathering information and find vulns on servers

# Ask Ip adress for the nmap et searchsploit scans
echo "Input target IP for Nmap & Searchsploit Scans"
read IP

# Do a nmap -sc -sV -v on the target and save result to msfscan.xml

sudo nmap -sC -sV --script nmap-vulners/ -v -A $IP -oX .scan/msfscan.xml -o .scan/msfscan.txt

# Make a searchsploit scan on target

searchsploit --nmap .scan/msfscan.xml -opv --colour | tee .scan/searchsploit.txt
