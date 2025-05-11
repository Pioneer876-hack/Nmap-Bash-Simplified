```markdown
# Nmap Automation Script

## Author
**Orient Manning (CyberDeadpool)**  
_Future updates!_

## Description
This script automates various **Nmap scanning techniques**, providing users with multiple scanning options for **network reconnaissance** and **security assessments**.

## Features
- Basic Nmap scan
- TCP, All Ports, OS Detection, and Vulnerability Scanning
- Input File IP List Scanning with Full Port Scan & Ping Scan
- Traceroute, Service Detection, Firewall Evasion
- Skip Host Discovery with ICMP Echo & TCP Scan
- Advanced Firewall Evasion Techniques

## Requirements
- **Nmap** installed on your system
- **Bash** shell environment
- **Root privileges** for certain scans

## How to Use
1. Clone the repository:
   ```bash
   https://github.com/Pioneer876-hack/Nmap-Bash-Simplified.git
   cd RepoName
   ```

2. Make the script executable:
   ```bash
   chmod +x nmap_auto.sh
   ```

3. Run the script:
   ```bash
   ./nmap_auto.sh
   ```

4. Select your scanning option (e.g., enter `1` for a Basic Nmap scan).

## Scan Options & Instructions
When the script runs, it presents **six choices** for scanning:

1️⃣ **Basic Nmap Scan**  
   - Enter the **IP address** to scan.
   - Results will be saved in `nmap_scan` in the current directory.

2️⃣ **Advanced TCP Scan with Vulnerability Checks**  
   - Enter the **target IP address**.
   - Performs **full port scan**, OS detection, and vulnerability checks.

3️⃣ **Input File Scanning**  
   - Enter the **path to a file containing IP addresses**.
   - Treats **all hosts** as online and performs **ping & vulnerability scans**.

4️⃣ **Traceroute & Firewall Evasion**  
   - Enter the **IP address** and **port numbers**.
   - Performs **traceroute**, **service version detection**, **OS identification**, and **firewall evasion**.

5️⃣ **Skip Host Discovery & ICMP Echo**  
   - Enter the **target IP address** and **ports**.
   - Uses **stylesheet** for output formatting.

6️⃣ **Advanced Firewall Evasion**  
   - Enter the **target IP address**, ports, timer, source port, data length, and decoy numbers.
   - Uses **fragmentation**, **decoys**, and **packet trace**.

## Output
All scan results are saved in `nmap_scan` within the **current directory**.

## Disclaimer
This script is intended for **educational and ethical security purposes only**. Unauthorized scanning of networks **without explicit permission** may violate laws or policies.

## License
This project is licensed under **MIT License**. See the [LICENSE](LICENSE) file for details.

# Demo Video
/home/orient/Documents/Github Projects/Screencast From 2025-05-11 17-54-24.mp4
```


