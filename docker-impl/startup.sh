#!/bin/sh

set -e  # Exit if any command fails

echo "Starting Ollama service..."
docker-compose up -d ollama

# Wait for Ollama to be healthy
echo "Waiting for Ollama to be healthy..."
while [ "$(docker inspect --format='{{.State.Health.Status}}' ollama)" != "healthy" ]; do
    sleep 5
    echo "Still waiting..."
done

echo "Ollama is healthy! Pulling the DeepSeek model..."
docker exec ollama ollama pull deepseek-r1:1.5b

echo "DeepSeek model downloaded. Starting Open WebUI..."
docker-compose up -d open-webui

echo "All services are running!"
