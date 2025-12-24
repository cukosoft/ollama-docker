# ollama-docker

A Docker‑based deployment of **Ollama** (https://ollama.com).  
This repository builds an image that runs the Ollama inference server. Models can be pulled at runtime after the container starts.

## How to run locally
```bash
docker compose up -d
# or
docker build -t ollama-docker:latest .
docker run -p 11434:11434 ollama-docker:latest
```

## Pulling Models

After starting the container, pull models using:

```bash
docker exec -it <container-name> ollama pull llama2
# or
docker exec -it <container-name> ollama pull llama3
```

## API
Ollama's HTTP API is exposed on `http://localhost:11434`. See the official docs for usage.

## GitHub Actions
On every push to `main` a Docker image is built and pushed to GHCR (`ghcr.io/cukosoft/ollama-docker:latest`).

