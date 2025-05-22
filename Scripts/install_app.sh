#!/bin/bash

# Go to app directory
cd ..
cd /home/ubuntu/app || exit

# Update package list and install Python + venv + pip if not installed
sudo apt-get update
sudo apt-get install -y python3 python3-venv python3-pip

# Remove existing venv if any, then create a new one
rm -rf venv
python3 -m venv venv

# Activate virtual environment and install dependencies
source venv/bin/activate
pip install -r requirements.txt

# Run Flask app in background with nohup, redirect output to app.log
nohup python3 app.py > app.log 2>&1 &

echo "Flask app started successfully"