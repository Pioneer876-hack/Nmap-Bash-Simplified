#!/bin/bash

# Done by Orient Manning (CyberDeadpool)
# Future updates !!!!!

# Greet the user
echo -e "\n🚀 Welcome, cyber explorer! Ready to map the digital galaxy? Let's get scanning! 🌍"
sleep 1.0
echo -e "\n🔎 Nmap script for automation—because why scan manually when you can be a wizard? 🧙‍♂️"
sleep 1.0
echo -e "\n💻 Let's uncover some secrets hidden in the network... but remember, use your powers responsibly! 🦸‍♂️"
sleep 1.0

# Choice function 
# Display the choices
choice (){
		echo -e "\nHere are the choices:" 
		echo -e "\n1. Basic Nmap scan"

		echo -e "\n2. Nmap Scanning TCP, OS, and Script Checking Vulnerable" 

		echo -e "\n3. Nmap Input File IP List, Script Check (Vulnerable), Treat All Hosts As Online, and Ping Scan"

		echo -e "\n4. Nmap Traceroute, TCP Scan, Service Version, Port Numbers, OS Detection, Firewall Evasion With Fragments, and Ignore TCP Reset"

		echo -e "\n5. Skip host discovery, ICMP Echo, TCP Scan, Stylesheet, number of port(s)" 

		echo -e "\n6. Firewall Evasion"

		read -p "\nYour choice (E.g., 1 or 2): " choice
}
# Information function
information_user(){
	echo -e "\n🚨 ATTENTION, CYBERNAUT! 🚨"
	echo -e "\n⚠️ Before you proceed, here’s what you need to know:"
	echo -e "\n📌 To exit your current choice, type 'end' instead of an IP address (or file path for choice three)."
	echo -e "\n📁 All scan results will be saved in your current directory as 'nmap_scan'."
	echo -e "\n🛠️ Use this power responsibly—happy scanning! 🚀"
}
# Call function
information_user

# Nmap results clean function
results(){
	read -p "🧹 Do you want to clean the old Nmap scan file? (Yes/No): " clean

	if [[ "$clean" =~ ^[Yy]es$ ]]; then
		> nmap_scan  # Standard output redirection
		echo -e "\n✅ Nmap scan file has been cleaned—fresh start!"
	else
		echo -e "\n🚫 Keeping the old scan results—history matters!"
	fi

}
sleep 2.0

# Main function
main(){
	# Loop
	while true; do
		# Call choice function
		choice
		
		# Quit script completely
		if [[ "$choice" =~ ^[Ee]nd$ ]]; then
    		echo -e "\n🚪 Exiting the script... Goodbye, cyber explorer! 🚀"
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
					return "$(choice)"
				fi

				# Funny nmap information
				echo "🚀 Starting the Nmap scan—prepare for liftoff!"
				sleep 1.0

				# Nmap command
				sudo nmap -sS -sV "$ip_address" -O --verbose | sudo tee nmap_scan

				# Complete scan 
				echo -e "\nThis scan is running faster than your Wi-Fi! 🤣 Too many results? Welcome to my world!"
			;;
			2) 
				# Cleaning old results of scan file
				results

				# Get user input for IP address 
				read -p  "IP Address: " ip_address

				# Port number entered
				read -p "Enter port number(s) to scan: " port

				# Conditional Statement
				if [ "$ip_address" == 'end' ]; then
					return "$(choice)"
				fi
				
				# Funny nmap information
				echo "🚀 Starting the Nmap scan—prepare for liftoff!"
				sleep 1.0

				# Execute the nmap TCP command
				sudo nmap -sS "$ip_address" -p"$port" -O --script vuln --verbose 2>/dev/null | sudo tee nmap_scan 

				# Complete scan 
				echo -e "\nThis scan is running faster than your Wi-Fi! 🤣 Too many results? Welcome to my world!"
			;;
			3) 
				# Cleaning old results of scan file
				results 

				# Get path to file with ip addresses
				read -p "IP Address List Path: " path


				# File path check
				if [ ! -f "$path" ]; then
					echo "File not found at $path"
					continue
				fi

				# Port number entered
				read -p "Enter port number(s) to scan: " port

				# Conditional Statement
				if [ "$path" == 'end' ]; then
					return "$(choice)"
				fi

				# Funny nmap information
				echo "🚀 Starting the Nmap scan—prepare for liftoff!"
				sleep 1.0

				# Execute the nmap command
				sudo nmap -sS -iL "$path" --script vuln -p"$port" --verbose 2>/dev/null | sudo tee nmap_scan

				# Complete scan 
				echo -e "\nThis scan is running faster than your Wi-Fi! 🤣 Too many results? Welcome to my world!"
			;; 
			4)
				# Cleaning old results of scan file
				results

				# Get user input for IP address
				read -p "What is the IP address you would like to scan 🚀? " ip_address
				read -p "What is the port(s) number that you want to scan 🔎? " port_number
				
				# Conditional Statement
				if [ "$ip_address" == 'end' ]; then
					return "$(choice)"
				elif [ "$port_number" == 'end' ]; then
					return "$(choice)"
				fi
				
				# Funny nmap information
				echo "🚀 Starting the Nmap scan—prepare for liftoff!"
				sleep 1.0

				# Execute the nmap command
				sudo nmap -sS  "$ip_address" --traceroute -sV -p"$port_number" -sC -O --verbose 2>/dev/null | sudo tee nmap_scan

				# Complete scan 
				echo -e "\nThis scan is running faster than your Wi-Fi! 🤣 Too many results? Welcome to my world!"
			;;
			5)
				# Cleaning old results of scan file
				results

				# Prompt for IP address and port number(s)
				read -p "Enter IP address: " ip_address
				read -p "Enter port number(s): " port_number

				# Conditional Statement
				if [ "$ip_address" == 'end' ]; then
					return "$(choice)"
				fi

				# Funny nmap information
				echo "🚀 Starting the Nmap scan—prepare for liftoff!"
				sleep 1.0

				# Command
				sudo nmap -Pn --stylesheet -sS -PE -p"$port_number" "$ip_address" 2>/dev/null | sudo tee nmap_scan

				# Complete scan 
				echo -e "\nThis scan is running faster than your Wi-Fi! 🤣 Too many results? Welcome to my world!"
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
					return "$(choice)"
				fi

				# Funny nmap information
				echo "🚀 Starting the Nmap scan—prepare for liftoff!"
				sleep 1.0

				# Command 
				sudo nmap -sA -sU --stats-every 3 -Pn -sV -n --source-port "$source_port" -T"$scan_time" -D RND:"$decoy" --packet-trace --data-length "$data_length" "$ip_address" 2>/dev/null | sudo tee nmap_scan
				# Complete scan 
				echo -e "\nThis scan is running faster than your Wi-Fi! 🤣 Too many results? Welcome to my world!"
			esac
	done
}
# Call main function
main