#!/bin/bash
# Script 5: Kernel Manifesto Generator
# Creates a personalized open-source manifesto

GREEN='\033[0;32m'
BLUE='\033[0;34m'
YELLOW='\033[1;33m'
NC='\033[0m'

clear
echo -e "${BLUE}============================================================${NC}"
echo -e "${GREEN}         KERNEL INSPIRED MANIFESTO GENERATOR                ${NC}"
echo -e "${BLUE}============================================================${NC}"
echo ""
echo "Answer these questions to generate your open-source manifesto"
echo "inspired by the Linux Kernel community."
echo ""

# Get user input
read -p "1. What does 'open source' mean to you? " MEANING
read -p "2. What open-source tool do you rely on most? " TOOL
read -p "3. What would you build and share freely? " BUILD
read -p "4. One word to describe the open-source community: " COMMUNITY

# System info
DATE=$(date "+%B %d, %Y")
USER=$(whoami)
KERNEL=$(uname -r)
HOST=$(hostname)

OUTPUT_FILE="../docs/manifesto_${USER}_$(date +%Y%m%d).txt"

clear
echo "Generating your manifesto..."
sleep 1

# Create manifesto
cat > "$OUTPUT_FILE" << EOF
============================================================
              MY OPEN SOURCE MANIFESTO
         Inspired by the Linux Kernel Community
============================================================

Date: $DATE
Author: $USER
System: $HOST
Kernel: $KERNEL

--- MY OPEN SOURCE PHILOSOPHY ---

$MEANING

--- MY DEPENDENCE ON OPEN SOURCE ---

Every day, I rely on '$TOOL' and countless other open-source
tools. These exist because developers chose to share their
work freely, building on the contributions of others.

--- MY PLEDGE TO THE COMMUNITY ---

The open-source community is '$COMMUNITY'. I've seen how
collaboration produces better software than any company
could build alone.

I commit to building and sharing '$BUILD' freely with the
world. I will contribute my code, my time, and my knowledge.

--- LESSONS FROM THE KERNEL COMMUNITY ---

From Linus Torvalds and thousands of kernel contributors:

1. "Release early, release often" - Don't wait for perfection
2. "Given enough eyeballs, all bugs are shallow" - Trust the community
3. "Talk is cheap. Show me the code" - Let your work speak
4. "Be nice, don't be a jerk" - Community matters

--- MY COMMITMENT ---

I pledge to:
• Use open-source software where possible
• Share my code and knowledge
• Help newcomers to open source
• Contribute back to projects I use

I stand on the shoulders of giants - Torvalds, Stallman, and
thousands of unnamed contributors. I offer my shoulders to
those who come after me.

============================================================
Generated on: $DATE
============================================================
EOF

echo -e "${GREEN}✓ Manifesto saved to: $OUTPUT_FILE${NC}"
echo ""
echo "--- YOUR MANIFESTO ---"
cat "$OUTPUT_FILE"
