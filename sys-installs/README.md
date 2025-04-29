# AWS CLI Installer Script

This script installs the AWS Command Line Interface (CLI) version 2 on an Ubuntu-based Linux system using the apt package manager.

## What it does:
- Checks if the script is being run as root or with sudo.
- Ensures `apt` is available.
- Informs the user about what will be installed and requests confirmation.
- Checks for existing commands named `aws` to avoid overwriting other binaries.
- Installs required dependencies (`curl`, `unzip`) silently.
- Downloads and installs the official AWS CLI v2.
- Cleans up temporary files.
- Confirms installation with the user.

## Usage
From the terminal:
`sudo ./install-awscli.sh`
or
`sudo bash install-awscli.sh`

## Requirements:
- Ubuntu or another apt-based system.
- Internet Connection

## Markdown Links Syntax:
Proper syntax for links in markdown are created by placing the link text in brackets (Ex. [Markdown Guide]) and then following it with the URL surround by parentheses (Ex. (https://www.markdownguide.org/basic-syntax/)

## Script Overview:
Here’s a summary of the key features implemented in the install-awscli.sh script:

  - Root/Sudo Check: Verifies if the user is root or running with sudo.
  - Package Manager Check: Ensures apt is available before proceeding.
  - User Confirmation: Asks the user before starting the installation.
  - Conflict Detection: Checks if the aws binary already exists.
  - Dependency Installation: Automatically installs curl and unzip.
  - Silent Download and Install: Downloads AWS CLI v2 and installs it quietly.
  - Cleanup: Removes temporary files created during installation.
  - Post-Installation Notice: Informs the user how to verify the install.

## Future Improvements:
- Add verification steps (e.g., checking aws --version after install automatically).
- Add uninstall capability.

### Disclaimer:
As stated in the accompanying task requirements, a link to the markdown syntax for links was provided but broken. So I went out and found some information on the proper markdown syntax for links on my own.

## Citations:
*The script was created with the help of ChatGPT*
- The prompt provided was: "Can you help me create a bash script that will install AWS CLI and checks for dependencies and conflicts for Ubuntu."

- [Official AWS CLI Installation Guide](https://docs.aws.amazon.com/cli/latest/userguide/install-cliv2-linux.html) – Covers how to install the AWS CLI v2 on Linux.
- [Markdown Guide](https://www.markdownguide.org/basic-syntax/) – Basic syntax reference for writing markdown documents.

