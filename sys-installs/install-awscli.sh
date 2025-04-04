#!/bin/bash

# Check if running as root
if [[ "$EUID" -ne 0 ]]; then
    echo "This script must be run as root or with sudo."
    exit 1
fi

# Check if apt package manager exists
if ! command -v apt &> /dev/null; then
    echo "This script requires apt package manager. Exiting."
    exit 1
fi

# Confirm with the user
echo "This script will install the AWS Command Line Interface (CLI) on your system."
read -p "Do you want to proceed? (y/n): " answer
if [[ "$answer" != "y" ]]; then
    echo "Installation aborted."
    exit 0
fi

# Check for existing aws command
if command -v aws &> /dev/null; then
    echo "A command named 'aws' already exists on this system. Exiting to prevent conflict."
    exit 1
fi

# Install required dependencies silently
apt update -y
apt install -y curl unzip

# Download and install AWS CLI v2
TMP_DIR=$(mktemp -d)
cd "$TMP_DIR"
curl -s "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
unzip -q awscliv2.zip
./aws/install

# Clean up
cd /
rm -rf "$TMP_DIR"

# Confirm install
echo "AWS CLI installation complete!"
echo "You can verify it by running: aws --version"

