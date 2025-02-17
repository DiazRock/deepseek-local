#!/bin/sh

set -e  # Exit if any command fails

# Define default values for model and prompt
MODEL_NAME=${1:-"deepseek-ai/DeepSeek-R1-Distill-Qwen-1.5B"}
PROMPT=${2:-"Hi! Tell me about you"}

echo "Creating virtual environment..."
python3 -m venv venv

echo "Activating virtual environment..."
. venv/bin/activate

echo "Installing dependencies..."
pip install --upgrade pip
pip install -r requirements.txt

echo "Running model with MODEL_NAME=${MODEL_NAME} and custom prompt..."
python3 inference.py "$MODEL_NAME" "$PROMPT"

echo "Execution complete!"
