#!/bin/bash

# Done by Orient Manning (CyberDeadpool)
# Future updates !!!!!

# Greet the user
echo "Nmap script for automation"
sleep 1.0

# Information function
information_user(){
	echo -e "\nATTENTION!!!"
	echo -e "\nType 'end' or 'quit' in place of IP address (or path for choice three) to end your current choice"
	echo -e "\nThe results for the Nmap scan can be at your current directory by the name: nmap_scan"
}
# Call function
information_user

# Nmap results clean function
results(){
	read -p "Clean old Nmap scan file (Yes or No): " clean
	if [ "$clean" == 'Yes' ]; then
		cat /dev/null > nmap_scan
	fi
}
sleep 2.0

# Main function
main(){
	# Loop
	while true; do
		# Display the choices
		echo -e "\nHere are the choices:" 
		echo -e "\n1. Basic Nmap scan"

		echo -e "\n2. Nmap Scanning TCP, All Ports, OS, and Script Checking Vulnerable" 

		echo -e "\n3. Nmap Input File IP List, Script Check (Vulnerable), Treat All Hosts As Online, All Ports Scan, and Ping Scan"

		echo -e "\n4. Nmap Traceroute, TCP Scan, Service Version, Port Numbers, OS Detection, Firewall Evasion With Fragments, and Ignore TCP Reset"

		echo -e "\n5. Skip host discovery, ICMP Echo, TCP Scan, Stylesheet, number of port(s)" 

		echo -e "\n6. Firewall Evasion"
		read -p "Your choice (E.g., 1 or 2): " choice
		
		# Quit script completely
		if [ "$choice" == 'end' ]; then
			break
		fi
			# Use case statements to allow the choice that user chose to execute
			case $choice in
			1) 	
				# Cleaning old results of scan file
				results

				# Basic nmap tcp scan 
				read -p "IP Address: " ip_address

				# Conditional Statement
				if [ "$ip_address" == "end" ]; then
					break
				fi

				# Nmap command
				sudo nmap -sS -sV "$ip_address" --verbose | sudo tee nmap_scan
			;;
			2) 
				# Cleaning old results of scan file
				results

				# Get user input for IP address 
				read -p  "IP Address: " ip_address

				# Conditional Statement
				if [ "$ip_address" == 'end' ]; then
					break
				fi
				
				# Execute the nmap TCP command
				sudo nmap -sS "$ip_address" -p- -O --script vuln --verbose 2>/dev/null | sudo tee nmap_scan 
			;;
			3) 
				# Get path to file with ip addresses
				read -p "IP Address List Path: " path

				# File path check
				if [ ! -f "$path" ]; then
					echo "File not found at $path"
					continue
				fi

				# Conditional Statement
				if [ "$path" == 'end' ]; then
					break
				fi

				# Execute the nmap command
				sudo nmap -sS -iL "$path" --script vuln -p- --verbose 2>/dev/null | sudo tee nmap_scan
			;; 
			4)
				# Cleaning old results of scan file
				results

				# Get user input for IP address
				read -p "What is the IP address you would like to scan? " ip_address
				read -p "What is the port(s) number that you want to scan? " port_number
				
				# Conditional Statement
				if [ "$ip_address" == 'end' ]; then
					break
				fi
				
				# Execute the nmap command
				sudo nmap -sS  "$ip_address" --traceroute -sV -p"$port_number" -sC -O --verbose 2>/dev/null | sudo tee nmap_scan
			;;
			5)
				# Cleaning old results of scan file
				results

				# Prompt for IP address and port number(s)
				read -p "Enter IP address: " ip_address
				read -p "Enter port number(s): " port_number

				# Conditional Statement
				if [ "$ip_address" == 'end' ]; then
					break
				fi

				# Command
				sudo nmap -Pn --stylesheet -sS -PE -p"$port" "$ip_address" 2>/dev/null | sudo tee nmap_scan
			;;
			6)
				# Cleaning old results of scan file
				results

				# Prompts
				read -p "Enter IP address: " ip_address
				read -p "Enter port number(s) to scan: " port
				read -p "Enter scan timer: " scan_time
				read -p "Enter source port number: " source_port
				read -p "Enter data length: " data_length
				read -p "Enter decoy number (e.g. 1-5 or higher): " decoy


				# Conditional Statement 
				if [ "$ip_address" == 'end' ]; then
					break
				fi

				# Command 
				sudo nmap -sA -sU --stats-every 3 -Pn -sV -n --source-port "$source_port" -T"$scan_time" -D RND:"$decoy" --packet-trace --data-length "$data_length" "$ip_address" 2>/dev/null | sudo tee nmap_scan
			esac
	done
}
# Call main function
main