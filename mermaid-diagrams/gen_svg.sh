#!/usr/bin/env bash
set -euxo pipefail

SCRIPT_DIR="$(cd "$(dirname "$0")"; pwd)"
cd "$SCRIPT_DIR" || exit 1

docker run --rm -u "$(id -u):$(id -g)" -v "$(pwd):/data" ghcr.io/mermaid-js/mermaid-cli/mermaid-cli:10.9.1 -i diagrams.md
