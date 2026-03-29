#!/bin/bash
# Script 3: Kernel Directory Auditor
# Audits kernel-related directories

GREEN='\033[0;32m'
BLUE='\033[0;34m'
YELLOW='\033[1;33m'
RED='\033[0;31m'
NC='\033[0m'

echo -e "${BLUE}============================================================${NC}"
echo -e "${GREEN}         KERNEL DIRECTORY AUDIT REPORT                      ${NC}"
echo -e "${BLUE}============================================================${NC}"
echo ""

# Directories to audit
DIRS=(
    "/boot"
    "/proc"
    "/sys"
    "/lib/modules"
    "/usr/src"
    "/etc/modprobe.d"
    "/etc/modules-load.d"
)

echo -e "${YELLOW}--- DIRECTORY AUDIT ---${NC}"
echo ""

for DIR in "${DIRS[@]}"; do
    if [ -d "$DIR" ]; then
        PERMS=$(ls -ld "$DIR" 2>/dev/null | awk '{print $1, $3, $4}')
        
        if [ "$DIR" = "/proc" ] || [ "$DIR" = "/sys" ]; then
            SIZE="Virtual Filesystem"
        else
            SIZE=$(sudo du -sh "$DIR" 2>/dev/null | cut -f1)
            [ -z "$SIZE" ] && SIZE="N/A"
        fi
        
        printf "%-20s => %-35s => %s\n" "$DIR" "$PERMS" "$SIZE"
    else
        echo -e "${RED}⚠ $DIR does not exist${NC}"
    fi
done

echo ""
echo -e "${YELLOW}--- BOOT DIRECTORY DETAILS ---${NC}"
if [ -d "/boot" ]; then
    echo "Kernel images:"
    ls -lh /boot/vmlinuz* 2>/dev/null | awk '{printf "  %-40s %s\n", $9, $5}'
    
    echo ""
    echo "Initramfs images:"
    ls -lh /boot/initrd* 2>/dev/null | awk '{printf "  %-40s %s\n", $9, $5}'
fi

echo ""
echo -e "${YELLOW}--- MODULE STATISTICS ---${NC}"
if [ -d "/lib/modules" ]; then
    for version in $(ls /lib/modules/); do
        MODULE_COUNT=$(find /lib/modules/$version -name "*.ko" 2>/dev/null | wc -l)
        echo "  $version: $MODULE_COUNT modules"
    done
fi

echo ""
echo -e "${BLUE}============================================================${NC}"
