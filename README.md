# Dotfiles Repository Overview

## About This Collection
This repository contains a collection of configuration files, "dotfiles", and setup scripts to personalize a Linux-based environment.  
It covers tools like Vim, Bash, and AWS CLI installation.

Included are:
- Custom `.vimrc` configuration and Vundle plugin manager setup
- Bash aliases for improved terminal productivity
- AWS CLI installer script with dependency checks

Each setup is explained in more detail in task-specific README files within their respective folders.

## How to Clone and Use These Dotfiles
```
# Clone this repository into your home directory or another location
git clone https://github.com/JohnH0820/dotfiles.git ~/dotfiles

# Navigate into the repository
cd ~/dotfiles
```

Then follow the instructions for each setup:

- **Vim Configuration:**  
  Go to `vim-config/` and run the setup script to install Vundle and configure Vim.  
  - See [vim-config/README.md](https://github.com/JohnH0820/dotfiles/blob/main/vim-config/README.md) for details.

- **Bash Customization:**  
  Go to `homefiles/` and run the setup script to install bash aliases.  
  - See [homefiles/README.md](https://github.com/JohnH0820/dotfiles/blob/main/homefiles/README.md) for details.

- **AWS CLI Installation:**  
  Use the `awscli-install/` script to install AWS CLI with apt and dependency checks.  
  - See [awscli-install/README.md](https://github.com/JohnH0820/dotfiles/blob/main/vim-config/README.md) for details.

## Desired Improvements
- Automate running all setup scripts from a single `setup.sh` at the root level
- Add optional checks for WSL or macOS support
- Expand Bash aliases with more development tools (like Git, Docker)
- Add basic troubleshooting tips for Vim plugin errors
- **Recreating and uploading a proper `.bash_aliases.sh` file**

# Summary
This `dotfiles` repository offers a starting point for personalizing a linux environment with minimal setup scripts.  
Each component is modular and can be installed individually based on user needs.
