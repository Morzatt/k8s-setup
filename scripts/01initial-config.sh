#!/bin/bash 
#
# Initial automated download of packages and configuration of the admin user

# Update, Upgrade and install sudo
apt update
apt upgrade
apt-get install sudo

# Add the administrative account to the group sudo
/sbin/adduser administrative

# Check that ufw is installed

# Download ufw and configure it
apt install ufw
ufw disable
ufw reset -y
ufw default deny incoming
ufw default allow outgoing
# SSH port
ufw allow ssh
# HTTP port
ufw allow http
# HTTPS port
ufw allow https
# ALLOW IP'S OF WORKERS AND MASTERS
ufw allow from x.x.x.x
systemctl start ufw
ufw enable

# Install curl
apt install curl
