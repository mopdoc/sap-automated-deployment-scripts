#!/bin/bash
###########

# Updating OS
sudo dnf update -y;
# Installing basic needed packages
sudo dnf install --nogpgcheck -y https://dl.fedoraproject.org/pub/epel/epel-release-latest-8.noarch.rpm;
sudo dnf install -y python3 ansible;
