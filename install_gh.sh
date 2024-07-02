#!/bin/bash

# This script installs the GitHub CLI and authenticates with GitHub

# Check if the script is running as root
if [ $EUID -ne 0 ]
then
  echo "This script must be run as root"
  exit 1
fi

ls 

# Detect architecture
# If the architecture is x86_64, change it to amd64
# If the architecture is i386 or i686, change it to 386
ARCH=$(uname -m | sed 's/x86_64/amd64/;s/i[3-6]86/386/')
echo "Architecture: $ARCH"

# Install GitHub CLI

# DOwnload the latest version of the GitHub CLI
curl -s https://api.github.com/repos/cli/cli/releases/latest \
| grep "browser_download_url.*deb" \
| cut -d : -f 2,3 \
| tr -d \" \
| grep $ARCH.deb \
| curl -w "Download status: %{http_code}" -o /tmp/gh_$ARCH.deb -L $(cat) > /dev/null

if [ $? -eq 0 ]
then
  echo "Download successful"
else
  echo "Download failed"
  exit 1
fi

# Install the GitHub CLI
apt install -y /tmp/gh_$ARCH.deb

# Remove the downloaded file
rm /tmp/gh_$ARCH.deb

curl -fsSL https://cli.github.com/packages/githubcli-archive-keyring.gpg | sudo dd of=/usr/share/keyrings/githubcli-archive-keyring.gpg \
&& sudo chmod go+r /usr/share/keyrings/githubcli-archive-keyring.gpg \
&& echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/githubcli-archive-keyring.gpg] https://cli.github.com/packages stable main" | sudo tee /etc/apt/sources.list.d/github-cli.list > /dev/null \
&& sudo apt update

# Authenticate with GitHub
gh auth login
