#!/bin/bash

# Done by Orient Manning (CyberDeadpool)
# Beta script build for future updates !!!!!

# Greet the user
echo "Nmap script for automation"
sleep 1.0

# Display the choices
echo "Here are the choices:" 
echo "1. Basic Nmap scan"

echo "2. Nmap Scanning TCP, All Ports, OS, and Script Checking Vulnerable" 

echo "3. Nmap Input File IP List, Script Check (Vulnerable), Treat All Hosts 
As Online, All Ports Scan, and Ping Scan"

echo "4. Nmap Traceroute, TCP Scan, Service Version, Port Numbers, OS 
Detection, Firewall Evasion With Fragments, and Ignore TCP Reset"

echo "5. Skip host discovery, ICMP Echo, TCP Scan, Stylesheet, number of port(s)" 

echo "6. Firewall Evasion"
read -p "Your choice (E.g., 1 or 2): " choice

# Use case statements to allow the choice that user chose to execute
case $choice in
   1) 
   # Basic nmap tcp scan 
   	read -p "IP Address: " ip_address
   # Empty file last results 
   	cat /dev/null > nmap_scan

   # Nmap command
   	sudo nmap -sS -sV "$ip_address" --verbose | sudo tee nmap_scan

	# Message on where to find scan results
	echo "ATTENTION!!!"
   	echo "The results for the Nmap scan can be at your current directory by the name 'nmap_scan'"
   ;;
   2) 
	# Get user input for IP address 
	read -p  "IP Address: " ip_address
	
	# Empty the contents within the file
	cat /dev/null > nmap_scan
	
	# Execute the nmap TCP command
	sudo nmap -sS "$ip_address" -p- -O --script vuln --verbose 2>/dev/null | sudo tee nmap_scan 

	# Message on where to find scan results
	echo "ATTENTION!!!"
	echo "The results for the Nmap scan can be at your current directory by the name 'nmap_scan'"
   ;;
   3) 
   	# NEEDS TO BE FIXED!!!!
	# Get path to file with ip addresses
	read -p "IP Address List Path: " path
	# Empty the contents in old results file on next scan
	cat /dev/null > nmap_scan
	# Execute the nmap command
	sudo nmap -sS -iL "$path" --script vuln -p- --verbose 2>/dev/null | sudo tee nmap_scan
   ;; 
   4)
	# Get user input for IP address
	read -p "What is the IP address you would like to scan? " ip_address
	read -p "What is the port(s) number that you want to scan? " port_number
	# read -p "What is your source IP address? " spoof_source_ip
	
	# Empty the contents of results file 
	cat /dev/null > nmap_scan
	
	# Execute the nmap command
	sudo nmap -sS  "$ip_address" --traceroute -sV -p"$port_number" -sC -O --verbose 2>/dev/null | sudo tee nmap_scan

	# Message on where to find scan results
	echo "ATTENTION!!!"
	echo "The results for the Nmap scan can be at your current directory by the name 'nmap_scan'"
   ;;
   5)
   # Prompt for IP address and port number(s)
	read -p "Enter IP address: " ip_address
	read -p "Enter port number(s): " port

	# Command
	sudo nmap -Pn --stylesheet -sS -PE -p"$port" "$ip_address" 2>/dev/null | sudo tee nmap_scan

	# Exit/Error Code
	echo "Status Code: $?"

	# Message on where to find scan results
	echo "ATTENTION!!!"
	echo "The results for the Nmap scan can be at your current directory by the name 'nmap_scan'"
   ;;
   6)
   # Prompts
	read -p "Enter IP address: " ip_address
	read -p "Enter port number(s) to scan: " port
	read -p "Enter scan timer: " scan_time
	read -p "Enter source port number: " source_port
	read -p "Enter data length: " data_length
	read -p "Enter decoy number (e.g. 1-5 or higher): " decoy

	# Empty the contents of results file 
	cat /dev/null > nmap_scan

   # Command 
	sudo nmap -sA -sU --stats-every 3 -Pn -sV -n --source-port "$source_port" -T"$scan_time" -D RND:"$decoy" --packet-trace --data-length "$data_length" "$ip_address" 2>/dev/null | sudo tee nmap_scan

	# Message on where to find scan results
	echo "ATTENTION!!!"
	echo "The results for the Nmap scan can be at your current directory by the name 'nmap_scan'"
esac

