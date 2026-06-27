# Use Home Assistant builder base image (Supervisor will inject this argument during build)
ARG BUILD_FROM=ghcr.io/home-assistant/amd64-base:latest
FROM ${BUILD_FROM}

# Set shell
SHELL ["/bin/bash", "-o", "pipefail", "-c"]

# Install system dependencies (e.g., jq for parsing options.json)
RUN apk add --no-cache jq

# Copy root filesystem
COPY run.sh /
RUN chmod a+x /run.sh

CMD [ "/run.sh" ]
