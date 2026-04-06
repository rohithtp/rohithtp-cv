#!/bin/bash
# Script to run aider with the project configuration

# Activate virtual environment if it exists
if [ -d "venv" ]; then
    source venv/bin/activate
fi

aider --config .aider.conf.yml