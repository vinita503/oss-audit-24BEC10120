#!/bin/bash
# Script 1: System Identity Report
# Displays detailed system and kernel information for Linux Kernel Audit

# Colors for better output
GREEN='\033[0;32m'
BLUE='\033[0;34m'
YELLOW='\033[1;33m'
RED='\033[0;31m'
NC='\033[0m' # No Color

clear

echo -e "${BLUE}============================================================${NC}"
echo -e "${GREEN}         LINUX KERNEL SYSTEM IDENTITY REPORT                ${NC}"
echo -e "${BLUE}============================================================${NC}"
echo ""

# Kernel Information
echo -e "${YELLOW}--- KERNEL INFORMATION ---${NC}"
echo -e "Kernel Version      : ${GREEN}$(uname -r)${NC}"
echo -e "Kernel Name         : $(uname -s)"
echo -e "Machine Architecture: $(uname -m)"
echo -e "Operating System    : $(uname -o)"
echo ""

# Distribution Information
echo -e "${YELLOW}--- DISTRIBUTION INFORMATION ---${NC}"
if [ -f /etc/os-release ]; then
    echo -e "Distribution        : ${GREEN}$(grep PRETTY_NAME /etc/os-release | cut -d '"' -f2)${NC}"
fi
echo -e "Hostname            : $(hostname)"
echo -e "Current User        : $(whoami)"
echo -e "Home Directory      : $HOME"
echo ""

# System Status
echo -e "${YELLOW}--- SYSTEM STATUS ---${NC}"
echo -e "System Uptime       : $(uptime -p | sed 's/up //')"
echo -e "System Load         : $(uptime | awk -F'load average:' '{print $2}')"
echo -e "Current Date/Time   : $(date '+%Y-%m-%d %H:%M:%S')"
echo ""

# Memory Information
echo -e "${YELLOW}--- MEMORY INFORMATION ---${NC}"
echo -e "Total Memory        : $(free -h | grep Mem | awk '{print $2}')"
echo -e "Available Memory    : $(free -h | grep Mem | awk '{print $7}')"
echo ""

# Kernel Build Information
echo -e "${YELLOW}--- KERNEL BUILD INFO ---${NC}"
echo -e "Build Date          : $(cat /proc/version | awk '{print $5, $6, $7, $8}')"
echo -e "GCC Version         : $(cat /proc/version | grep -o 'gcc version [0-9.]*' 2>/dev/null || echo 'Not available')"
echo ""

# License Information
echo -e "${YELLOW}--- OPEN SOURCE LICENSE ---${NC}"
echo -e "${GREEN}The Linux Kernel is licensed under GNU General Public License v2 (GPLv2)${NC}"
echo ""
echo "The Four Freedoms:"
echo "  1. Freedom to run the program for any purpose"
echo "  2. Freedom to study and modify the source code"
echo "  3. Freedom to redistribute copies"
echo "  4. Freedom to distribute modified versions"
echo ""

echo -e "${BLUE}============================================================${NC}"
