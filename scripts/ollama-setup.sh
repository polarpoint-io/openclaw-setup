#!/usr/bin/env bash
set -euo pipefail

MODEL_REF="ollama/llama3.2:3b"
OLLAMA_MODEL="llama3.2:3b"

if ! command -v curl >/dev/null 2>&1; then
  echo "curl is required. Install it first (sudo apt-get install -y curl)." >&2
  exit 1
fi

if ! command -v ollama >/dev/null 2>&1; then
  echo "Installing Ollama..."
  curl -fsSL https://ollama.com/install.sh | sh
fi

if command -v systemctl >/dev/null 2>&1; then
  sudo systemctl enable --now ollama || true
fi

echo "Pulling model: ${OLLAMA_MODEL}"
ollama pull "${OLLAMA_MODEL}"

if ! command -v openclaw >/dev/null 2>&1; then
  echo "OpenClaw CLI not found. Install OpenClaw, then run:" >&2
  echo "  openclaw models set ${MODEL_REF}" >&2
  exit 1
fi

echo "Setting OpenClaw primary model to ${MODEL_REF}"
openclaw models set "${MODEL_REF}"

echo "Done. Current model status:"
openclaw models status --plain || true
