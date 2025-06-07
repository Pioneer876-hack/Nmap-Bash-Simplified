#!/bin/bash

# Done by Orient Manning (CyberDeadpool)
# Future updates !!!!!

# Debugging mode (optional)
# set -x

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

		echo -e "\n2. Nmap Scanning (TCP), OS, and Script Checking Vulnerable" 

		echo -e "\n3. Nmap Input File IP List, Script Check (Vulnerable), Treat All Hosts As Online, and Ping Scan"

		echo -e "\n4. Nmap Traceroute, TCP Scan, Service Version, Port Numbers, OS Detection, Firewall Evasion With Fragments, and Ignore TCP Reset"

		echo -e "\n5. Skip host discovery, ICMP Echo, TCP Scan, number of port(s)" 

		echo -e "\n6. Firewall Evasion"

		echo -e "\n"

		read -p "Your choice (E.g., 1 or 2): " choice
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

# Output information function
output_info(){
	echo -e "\nOutput Choices:"
	echo -e "\n1. -oN (Normal Output)"
	echo -e "\n2. -oX (XML Output)"
	echo -e "\n3. -oG (Grepable Output)"
	echo -e "\n4. -oS ((ScRipT KIdd|3 oUTpuT) Output)"
	echo -e "\n5. -oJ (Json Output)"
	echo -e "\n6. -oA (All Output Formats)"
}
output_info

output(){
	read -p "Enter Output Choice: " output_choice

	case $output_choice in 
	1) 
		chosen_output="-oN nmap_scan.nmap"
	;;

	2)
		chosen_output="-oX nmap_scan.xml"
	;;

	3)
		chosen_output="-oG nmap_scan.gnmap"
	;;

	4)
		chosen_output="-oS nmap_scan"
	;;
	
	5)
		chosen_output="-oJ nmap_scan.json"
	;;

	6)
		chosen_output="-oA nmap_scan"
	;;

	esac

	echo "$chosen_output"
}

funny_ending(){
	# Complete scan 
	echo -e "\nThis scan is running faster than your Wi-Fi! 🤣 Too many results? Welcome to my world!"
}

# Check port format
port_validation(){
	if ! [[ "$port_number" =~ ^[0-9,-]+$ ]]; then
    echo "Invalid port format"
    	return
	fi
}

# Privilege check function
sudo_adder(){
	if [ "$EUID" -ne 0 ]; then
	echo "Please run this script as root (e.g., with sudo)"
	exit 1
fi 
}

# Ctrl+C key function
ctrl_c(){
	trap 'echo -e "\n🚫 scan interrupted. Exiting..."; exit' SIGINT
}
sleep 2.0

# Logging function
log(){
	if [ "$choice" -eq 2 ]; then
		echo "$(date): Performed scan on $ip_address with port(s) $port_number" >> nmap_log.txt
	elif [ "$choice" -eq 3 ]; then
		echo "$(date): Performed scan on $ip_address with port(s) $port_number" >> nmap_log.txt
	elif [ "$choice" -eq 4 ]; then
		echo "$(date): Performed scan on $ip_address with port(s) $port_number" >> nmap_log.txt
	elif [ "$choice" -eq 5 ]; then
		echo "$(date): Performed scan on $ip_address with port(s) $port_number" >> nmap_log.txt
	elif [ "$choice" -eq 6 ]; then
		echo "$(date): Performed scan on $ip_address with port(s) $port_number" >> nmap_log.txt
	else
		echo "$(date): Performed scan on $ip_address" >> nmap_log.txt
	fi
}

# Main function
main(){
	# Loop
	while true; do
		# Call choice function
		choice

		# Call ctrl_c function
		ctrl_c

		# Quit script completely
		if [[ "$choice" =~ ^[Ee]nd$ ]]; then
    		echo -e "\n🚪 Exiting the script... Goodbye, cyber explorer! 🚀"
    		break
		fi

		# Assigning output function to a variable
		chosen_output=$(output)

			# Use case statements to allow the choice that user chose to execute
			case $choice in
			1) 	
				# Cleaning old results of scan file
				results

				# Basic nmap tcp scan 
				read -p "IP Address: " ip_address

				# Conditional Statement
				if [ "$ip_address" == "end" ]; then
					continue
				fi

				# Funny nmap information
				echo "🚀 Starting the Nmap scan—prepare for liftoff!"
				sleep 1.0
				
				# Check privilege
				sudo_adder

				# Nmap command
				echo "$chosen_output"
				nmap -sS -sV "$ip_address" -O --verbose $chosen_output

				# Complete scan 
				funny_ending

				# Logging
				log
			;;
			2) 
				# Cleaning old results of scan file
				results

				# Get user input for IP address 
				read -p  "IP Address: " ip_address
				
				# Conditional Statement
				if [ "$ip_address" == 'end' ]; then
					continue
				fi

				# Port number entered
				read -p "Enter port number(s) to scan: " port_number
				
				# Conditional Statement
				if [ "$port_number" == 'end' ]; then
					continue
				fi
				
				# Check port
				port_validation
				 
				# Funny nmap information
				echo "🚀 Starting the Nmap scan—prepare for liftoff!"
				sleep 1.0

				# Check privilege
				sudo_adder 

				# Execute the nmap TCP command
				nmap -sS "$ip_address" -p"$port_number" -O --script vuln $chosen_output --verbose  

				# Logging
				log

				# Complete scan 
				funny_ending
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
				read -p "Enter port number(s) to scan: " port_number
				
				# Check port 
				port_validation

				# Conditional Statement
				if [ "$path" == 'end' ]; then
					continue
				fi

				# Funny nmap information
				echo "🚀 Starting the Nmap scan—prepare for liftoff!"
				sleep 1.0

				# Check privilege
				sudo_adder

				# Execute the nmap command
				nmap -sS -iL "$path" --script vuln -p"$port_number" $chosen_output --verbose 
				
				# Logging
				log

				# Complete scan function
				funny_ending
			;; 
			4)
				# Cleaning old results of scan file
				results

				# Get user input for IP address
				read -p "What is the IP address you would like to scan 🚀? " ip_address
				# Conditional Statement
				if [ "$ip_address" == 'end' ]; then
					continue
				fi

				read -p "What is the port(s) number that you want to scan 🔎? " port_number
				
				# Check port 
				port_validation

				# Conditional Statement
				if [ "$port_number" == 'end' ]; then
					continue
				fi
				
				# Funny nmap information
				echo "🚀 Starting the Nmap scan—prepare for liftoff!"
				sleep 1.0

				# Check privilege
				sudo_adder

				# Execute the nmap command
				nmap -sS  "$ip_address" --traceroute -sV -p"$port_number" -sC -O $chosen_output --verbose 
				
				# Logging
				log

				# Complete scan funny
				funny_ending
			;;
			5)
				# Cleaning old results of scan file
				results

				# Prompt for IP address and port number(s)
				read -p "Enter IP address: " ip_address
				# Conditional Statement
				if [ "$ip_address" == 'end' ]; then
					continue
				fi

				read -p "Enter port number(s): " port_number
				
				# Check port 
				port_validation

				# Conditional Statement
				if [ "$port_number" == 'end' ]; then
					continue
				fi

				# Funny nmap information
				echo "🚀 Starting the Nmap scan—prepare for liftoff!"
				sleep 1.0

				# Check privilege
				sudo_adder

				# Command
				nmap -Pn -sS -PE -p"$port_number" "$ip_address" $chosen_output


				# Logging
				log

				# Complete scan function
				funny_ending
			;;
			6)
				# Cleaning old results of scan file
				results

				# Prompts
				read -p "Enter IP address: " ip_address
				

				# Conditional Statement 
				if [ "$ip_address" == 'end' ]; then
					continue
				fi

				read -p "Enter port number(s) to scan: " port_number
				
				# Check port
				port_validation

				# Conditional Statement 
				if [ "$port_number" == 'end' ]; then
					continue
				fi

				read -p "Enter scan timer: " scan_time
				# Conditional Statement 
				if [ "$scan_time" == 'end' ]; then
					continue
				fi

				read -p "Enter source port number: " source_port
				# Conditional Statement 
				if [ "$source_port" == 'end' ]; then
					continue
				fi

				read -p "Enter data length: " data_length
				# Conditional Statement 
				if [ "$data_length" == 'end' ]; then
					continue
				fi

				read -p "Enter decoy number (e.g. 1-5 or higher): " decoy
				# Conditional Statement 
				if [ "$decoy" == 'end' ]; then
					continue
				fi


				# Funny nmap information
				echo "🚀 Starting the Nmap scan—prepare for liftoff!"
				sleep 1.0

				# Check privilege
				sudo_adder

				# Command 
				nmap -sA -sU --stats-every 3 -Pn -sV -n "$port_number" --source-port "$source_port" -T"$scan_time" -D RND:"$decoy" --packet-trace --data-length "$data_length" "$ip_address" $chosen_output
				
				# Logging
				log

				# Complete scan funny
				funny_ending
			esac
	done
}
# Call main function
main