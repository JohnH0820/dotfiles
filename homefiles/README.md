# Homefiles - Bash Customizations

This folder contains custom bash environment setup files designed to personalize and improve terminal workflow. The main component is a script that configures a `.bash_aliases` file with helpful command shortcuts.

## Disclaimer:
- Due to a SSD formating and defragmenting error, I have lost the `.bash_aliases` file required for this to work. I will recreate and post a correct `.bash_aliases` file as soon as I find the time to make it. I apologize and appreciate your patience.

## Included Files

- **.bash_aliases**  
  A file containing useful bash aliases to speed up terminal usage. You can customize it with your own commands or use common ones like:
  - `alias ll` – `ls -al`
  - `alias gs` – `git status`
  - `alias .` – `cd ..`
  - `alias update&upgrade` – `sudo apt update && sudo apt upgrade -y`
  - `alias serve` – `python -m SimpleHTTPServer`

- **setup_bash.sh**  
  A setup script that:
  - Backs up an existing `~/.bash_aliases` file if one exists
  - Symbolically links the `.bash_aliases` file from this repository into your home directory
  - Appends a line to your `~/.bashrc` to source `.bash_aliases` if it's not already present
  - Prompts you to reload your environment to apply changes

## Usage

1. Navigate to this folder:
   `cd ~/dotfiles/homefiles`
2. Run the Script: 
   `./setup_bash.sh`
3. Reload your bash environment:
   `source ~/bashrc`

## Citations

The Script was created with the help of ChatGPT using this prompt:
"Write a bash script to back up .bash_aliases, create a symlink from a dotfiles repo, and ensure it's sourced in .bashrc."
Adjustments were made as needed.

This is the source of some of the aliases used in this task:
["awesome" bash aliases](https://github.com/vikaskyadav/awesome-bash-alias)
