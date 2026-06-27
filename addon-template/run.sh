#!/usr/bin/with-contenv bashio
# The line above uses bashio (Home Assistant's helper shell library) if available.
# Otherwise, standard bash can be used: #!/usr/bin/env bash

set -e

echo "Starting MnApps Custom Add-on..."

# Reading user configuration options using jq (or bashio if available)
CONFIG_PATH="/data/options.json"

if [ -f "$CONFIG_PATH" ]; then
    LOG_LEVEL=$(jq --raw-output '.log_level // "info"' "$CONFIG_PATH")
    echo "Log level is set to: $LOG_LEVEL"
else
    echo "No configuration file found at $CONFIG_PATH. Using defaults."
fi

# ==========================================
# INSERT MAIN SERVICE LAUNCH COMMANDS HERE
# e.g.,exec my-service-binary --port 8080
# ==========================================

# For testing purposes, we keep the container alive
echo "Add-on initialized. Ready."
while true; do sleep 1000; done
