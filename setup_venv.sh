#!/bin/bash
# Setup virtual environment and install dependencies

# Create virtual environment
uv venv venv

# Activate virtual environment
source venv/bin/activate

# Install the project (and its dependencies, e.g. aider-chat) from pyproject.toml
uv pip install -e .

echo "Virtual environment setup complete. Run 'source venv/bin/activate' to activate it, then use aider."