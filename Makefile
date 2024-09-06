MAKEFLAGS += --warn-undefined-variables
SHELL := /bin/bash
.SHELLFLAGS := -eu -o pipefail -c
# .DEFAULT_GOAL := build

.PHONY: prepare build serve clean help

TARGET := site/pdf/document.pdf

$(TARGET): mkdocs.yml docs/*
	@uv run mkdocs build

build: $(TARGET) ## build artifacts

PORT = 8000

serve: ## hosting preview server. ex) make serve PORT=8001
	uv run mkdocs serve -v -a localhost:${PORT}

prepare:
	uv sync

clean: ## cleanup artifacts & python virtial-env
	rm -rf .venv
	rm -rf site

help: ## Print this help
	@echo 'Usage: make [target] [OPTIONS]'
	@echo ''
	@echo 'Targets:'
	@awk 'BEGIN {FS = ":.*?## "} /^[a-zA-Z_-]+:.*?## / {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}' $(MAKEFILE_LIST)
