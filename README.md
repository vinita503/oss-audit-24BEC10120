# Open Source Audit: Linux Kernel

Student Name: Sandhya Kumari  
Roll Number:  24BCY10154  
Course: Open Source Software (Linux Administration)  
Chosen Software: Linux Kernel  


## Project Overview

### What is This Project?

This project is a comprehensive philosophical and technical audit of the **Linux Kernel**, one of the most influential open-source projects in history. The Linux Kernel is the core of the Linux operating system, powering everything from smartphones and laptops to supercomputers and cloud infrastructure.


## Technical Environment

| Component | Details |
|-----------|---------|
| **Platform** | Windows Subsystem for Linux (WSL2) |
| **Distribution** | Ubuntu 22.04 LTS |
| **Kernel Version** | 6.6.87.2-microsotf-standard-WSL2 |
| **Shell** | Bash 5.1.16 |
| **Architecture** | x86_64 |


## Shell Scripts

| Script | Description | Key Linux Concepts |
|--------|-------------|-------------------|
| `system_report.sh` | Displays kernel version, system info, uptime, memory, and GPLv2 license | Variables, command substitution, `uname`, `uptime`, `free` |
| `kernel_inspector.sh` | Checks kernel headers, loaded modules, and provides philosophical notes | `if-then-else`, `lsmod`, `grep`, exit status |
| `kernel_audit.sh` | Audits kernel directories (/boot, /proc, /sys, /lib/modules) | For loops, arrays, `ls -ld`, `du`, `awk`, `cut` |
| `kernel_log_analyzer.sh` | Analyzes kernel logs for errors/warnings, counts occurrences | While read loop, command-line arguments, counters |
| `kernel_manifesto.sh` | Interactive script that generates a personalized open-source manifesto | `read` input, string concatenation, file writing |

---

## How to Run

### Prerequisites

- Linux system (Ubuntu on WSL2 recommended)
- Bash shell
- Sudo privileges for scripts 3 and 4
- Basic understanding of Linux commands

### Installation

# Clone the repository
git clone (https://github.com/SANDHYAKUMARI1504/oss-audit-24BCY10154.git)

# Make scripts executable
chmod +x scripts/*.sh

# Running Scripts

Run these commands in WSL command prompts:
 # Script 1: System Identity Report
./scripts/system_report.sh

 # Script 2: Kernel Package Inspector
./scripts/kernel_inspector.sh

 # Script 3: Kernel Directory Auditor (requires sudo)
sudo ./scripts/kernel_audit.sh

 # Script 4: Kernel Log Analyzer (requires sudo)
sudo ./scripts/kernel_log_analyzer.sh error
sudo ./scripts/kernel_log_analyzer.sh warning

 # Script 5: Manifesto Generator (interactive)
./scripts/kernel_manifesto.sh
