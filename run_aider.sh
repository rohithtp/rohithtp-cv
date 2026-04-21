#!/bin/bash
set -euo pipefail

# Config
export OLLAMA_API_BASE=${OLLAMA_API_BASE:-http://localhost:11434}
AIDER_MODEL=${AIDER_MODEL:-"ollama_chat/qwen2.5-coder:14b"}
AIDER_EDITOR_MODEL=${AIDER_EDITOR_MODEL:-"ollama_chat/qwen2.5-coder:7b"}
MAP_TOKENS=${MAP_TOKENS:-1024}

echo "🔍 Checking Ollama..."

if ! curl -s "$OLLAMA_API_BASE" > /dev/null; then
  echo "❌ Ollama is not running. Start it with: ollama serve"
  exit 1
fi

echo "📦 Ensuring models are available..."

if ! ollama list | grep -q "qwen2.5-coder:7b"; then
  ollama pull qwen2.5-coder:7b
fi

if ! ollama list | grep -q "qwen2.5-coder:14b"; then
  ollama pull qwen2.5-coder:14b
fi

echo "✅ Models ready"
echo "🚀 Starting Aider..."

aider \
  --model "$AIDER_MODEL" \
  --editor-model "$AIDER_EDITOR_MODEL" \
  --architect \
  --map-tokens "$MAP_TOKENS" \
  --cache-prompts \
  --no-stream
