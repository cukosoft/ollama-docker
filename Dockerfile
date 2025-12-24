# syntax=docker/dockerfile:1
FROM ubuntu:22.04 AS base

# Install dependencies
RUN apt-get update && \
    DEBIAN_FRONTEND=noninteractive apt-get install -y curl ca-certificates && \
    rm -rf /var/lib/apt/lists/*

# Install Ollama
RUN curl -fsSL https://ollama.com/install.sh | sh

# Pull the default model (optional, can be done at runtime)
ARG MODEL=llama2
RUN if [ -n "$MODEL" ]; then ollama pull $MODEL; fi

EXPOSE 11434

CMD ["ollama", "serve"]

