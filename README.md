# 🚀 Docker Desktop Setup on Linux (Ubuntu)

This guide helps you install and login to Docker Desktop on Linux (Ubuntu-based distros), especially when you face the issue:
> **"You must initialize pass before logging in to Docker Desktop"**

---

## 🧰 Prerequisites

- Ubuntu 20.04 / 22.04 / any Debian-based distro
- `sudo` access
- Internet connection

---

## 📦 Step 1: Install Docker Desktop (from `.deb` package)

Download the latest `.deb` from:  
👉 [https://docs.docker.com/desktop/install/linux/](https://docs.docker.com/desktop/install/linux/)

Then run:

cd ~/Downloads
sudo apt install ./docker-desktop-<version>-<arch>.deb


#  Launch Docker Desktop
docker-desktop
If GUI doesn't open, try:
pkill -f docker-desktop
docker-desktop

# Fix "You must initialize pass before logging in"
Docker Desktop uses pass (Linux Password Store) + gpg for login credentials.
To fix this error, follow the steps below.

Install pass and gpg
sudo apt update
sudo apt install pass gnupg

# Generate a GPG Key
gpg --full-generate-key
Select key type: 1 (RSA and RSA)

Key size: 4096

Expiry: Press Enter (no expiry)

Fill in name/email (fake is okay)

Set a passphrase : "any password"

Find Your GPG Key ID
Output sample:
like this 
pub   rsa4096 2025-04-23 [SC]
      ABCD1234EF56789012345678ABCDEFGH12345678
choose this one : ABCD1234EF56789012345678ABCDEFGH12345678

# Initialize pass with GPG key
pass init ABCD1234EF56789012345678ABCDEFGH12345678

# Go to docker dekstop ui and click login this is automatically logged in

# Run Docker with this command for makeing image: 
docker compose up --build
# stop docker through command docker daemon
sudo systemctl stop docker
Stop Docker Desktop (GUI app)
Kill the process:
pkill -f docker-desktop
Clear Docker Desktop cache (if needed)
rm -rf ~/.docker/desktop

if start again
sudo systemctl start docker


# Tag your image and push to Docker Hub for the purpose of getting another one:
Run this command with Dockerfile working directory:
1. build image: 
docker build -t myproject_web .
2. Tag Image for Docker Hub:
   docker tag myproject_web yourdockerhubusername/myproject:latest
   docker tag myproject_web dockerhubankit/myproject:latest
3. Login to Docker Hub
   docker login
4. Push the Image to Docker Hub
   docker push yourdockerhubusername/myproject:latest
   docker push dockerhubankit/myproject:latest

# Docker logout
docker logout
# Check Login Status
cat ~/.docker/config.json


