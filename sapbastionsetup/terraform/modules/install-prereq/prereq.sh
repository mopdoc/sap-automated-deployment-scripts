#!/bin/bash

# Updating OS
yum update -y;
# Installing basic packages
dnf install python3;
dnf install -y ansible;
