#!/bin/bash
# Script 4: Kernel Log Analyzer
# Analyzes kernel logs

RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m'

echo -e "${BLUE}============================================================${NC}"
echo -e "${GREEN}         KERNEL LOG ANALYZER                                 ${NC}"
echo -e "${BLUE}============================================================${NC}"
echo ""

# Find log source
if [ -f "/var/log/kern.log" ] && [ -r "/var/log/kern.log" ]; then
    LOG_SOURCE="/var/log/kern.log"
    echo -e "${GREEN}Using log file: $LOG_SOURCE${NC}"
elif command -v dmesg > /dev/null; then
    LOG_SOURCE="dmesg"
    echo -e "${GREEN}Using dmesg for kernel logs${NC}"
else
    echo -e "${RED}Error: Cannot access kernel logs${NC}"
    exit 1
fi

KEYWORD=${1:-"error"}
COUNT=0

echo -e "Analyzing for keyword: ${YELLOW}$KEYWORD${NC}"
echo ""

# Extract logs
if [ "$LOG_SOURCE" = "dmesg" ]; then
    dmesg > /tmp/kernel_logs.txt
    LOG_FILE="/tmp/kernel_logs.txt"
else
    LOG_FILE="$LOG_SOURCE"
fi

# Count and collect
declare -a LAST_MATCHES

while IFS= read -r line; do
    if echo "$line" | grep -iq "$KEYWORD"; then
        COUNT=$((COUNT + 1))
        LAST_MATCHES+=("$line")
        if [ ${#LAST_MATCHES[@]} -gt 10 ]; then
            unset 'LAST_MATCHES[0]'
            LAST_MATCHES=("${LAST_MATCHES[@]}")
        fi
    fi
done < "$LOG_FILE"

echo -e "${BLUE}============================================================${NC}"
echo -e "${GREEN}SUMMARY${NC}"
echo -e "${BLUE}============================================================${NC}"
echo -e "Keyword '${YELLOW}$KEYWORD${NC}' found: ${RED}$COUNT${NC} times"
echo ""

if [ $COUNT -eq 0 ]; then
    echo -e "${GREEN}✓ No $KEYWORD entries found. Kernel appears healthy!${NC}"
elif [ $COUNT -lt 10 ]; then
    echo -e "${YELLOW}⚠ $COUNT $KEYWORD entries found. Review below.${NC}"
else
    echo -e "${RED}✗ High number of $KEYWORD entries! Investigate immediately.${NC}"
fi

echo ""
echo -e "${YELLOW}--- LAST 10 MATCHING ENTRIES ---${NC}"
for line in "${LAST_MATCHES[@]}"; do
    echo "$line" | cut -c1-200
done

echo ""
echo -e "${YELLOW}--- RECOMMENDATIONS ---${NC}"
echo "1. Check hardware: sudo dmesg | grep -i hardware"
echo "2. Check memory: free -h"
echo "3. Check disk: df -h"
echo "4. Check services: systemctl list-units --failed"

# Cleanup
[ -f "/tmp/kernel_logs.txt" ] && rm /tmp/kernel_logs.txt
echo -e "${BLUE}============================================================${NC}"
