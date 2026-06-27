# Template Add-on

This is a starter template for building custom Home Assistant add-ons.

## Features
- Multi-architecture Docker support (`amd64`, `aarch64`, `armhf`, etc.)
- Configuration parsing via `/data/options.json`
- Ingress support enabled by default (for Web UI integration into Home Assistant sidebar)

## How to use this template
1. Duplicate this folder and rename it to your service name (e.g., `paperless-ngx`).
2. Update `config.yaml` with your service's details, ports, and configuration schema.
3. Modify `Dockerfile` to pull your service's binaries, source code, or Docker image.
4. Update `run.sh` to start your application with the user's options.
