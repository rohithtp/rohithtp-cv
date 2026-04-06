#!/bin/bash
# Setup virtual environment and install dependencies

# Create virtual environment
python3 -m venv venv

# Activate virtual environment
source venv/bin/activate

# Upgrade pip
pip install --upgrade pip

# Install requirements
pip install -r requirements.txt

echo "Virtual environment setup complete. Run 'source venv/bin/activate' to activate it, then use aider."