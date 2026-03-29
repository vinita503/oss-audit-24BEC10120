#!/bin/bash
# Script 2: Kernel Package Inspector
# Checks kernel-related packages and provides philosophical notes

GREEN='\033[0;32m'
BLUE='\033[0;34m'
YELLOW='\033[1;33m'
RED='\033[0;31m'
NC='\033[0m'

echo -e "${BLUE}============================================================${NC}"
echo -e "${GREEN}         KERNEL PACKAGE INSPECTOR                           ${NC}"
echo -e "${BLUE}============================================================${NC}"
echo ""

# Current Kernel
echo -e "${YELLOW}--- CURRENT KERNEL ---${NC}"
KERNEL_VERSION=$(uname -r)
echo -e "Running Kernel: ${GREEN}$KERNEL_VERSION${NC}"
echo ""

# Check Kernel Headers
echo -e "${YELLOW}--- KERNEL HEADERS ---${NC}"
if [ -d "/usr/src/linux-headers-$KERNEL_VERSION" ]; then
    echo -e "${GREEN}✓ Kernel headers are INSTALLED${NC}"
    echo "  Location: /usr/src/linux-headers-$KERNEL_VERSION"
else
    echo -e "${RED}✗ Kernel headers are NOT installed${NC}"
    echo "  To install: sudo apt install linux-headers-$KERNEL_VERSION"
fi
echo ""

# Check kernel image
echo -e "${YELLOW}--- KERNEL IMAGE ---${NC}"
if [ -f "/boot/vmlinuz-$KERNEL_VERSION" ]; then
    echo -e "${GREEN}✓ Kernel image found in /boot${NC}"
    ls -lh "/boot/vmlinuz-$KERNEL_VERSION" | awk '{print "  Size: " $5}'
fi
echo ""

# Loaded Modules
echo -e "${YELLOW}--- LOADED KERNEL MODULES ---${NC}"
MODULE_COUNT=$(lsmod | wc -l)
echo -e "Total modules loaded: ${GREEN}$((MODULE_COUNT - 1))${NC}"
echo ""
echo "Top 5 modules by size:"
lsmod | sort -k2 -rn | head -6 | tail -5 | awk '{printf "  %-20s %10s bytes\n", $1, $2}'
echo ""

# Philosophical Note
echo -e "${BLUE}============================================================${NC}"
echo -e "${GREEN}           PHILOSOPHICAL NOTE: THE LINUX KERNEL             ${NC}"
echo -e "${BLUE}============================================================${NC}"
echo ""
echo "The Linux Kernel - A Story of Collaborative Excellence"
echo ""
echo "Started in 1991 by Linus Torvalds, a Finnish student who"
echo "wanted a free Unix-like system. Today, it powers:"
echo ""
echo "  • 100% of the world's top 500 supercomputers"
echo "  • Over 70% of all web servers"
echo "  • 3+ billion Android devices"
echo "  • Most cloud infrastructure worldwide"
echo ""
echo "Key Philosophy: 'Release early, release often'"
echo "This approach proved that open, collaborative development"
echo "produces more reliable software than closed, proprietary models."
echo ""
echo -e "${BLUE}============================================================${NC}"
