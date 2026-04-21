#!/bin/bash
# Script to run aider with the project configuration

# Check if OPENROUTER_API_KEY is set
if [ -z "$OPENROUTER_API_KEY" ]; then
    echo "❌ Error: OPENROUTER_API_KEY environment variable is not set"
    echo ""
    echo "Please set your OpenRouter API key before running aider:"
    echo "  export OPENROUTER_API_KEY='your-api-key-here'"
    echo ""
    echo "Then run this script again:"
    echo "  ./run_aider.sh"
    exit 1
fi

# Activate virtual environment if it exists
if [ -d "venv" ]; then
    source venv/bin/activate
fi

echo "✅ Using OpenRouter API key for aider configuration"
aider --config .aider.conf.yml