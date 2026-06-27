#!/usr/bin/env bash
set -e

echo "Starting CloakBrowser CDP Server Add-on..."

# Parse options from /data/options.json
CONFIG_PATH="/data/options.json"
if [ -f "$CONFIG_PATH" ]; then
    # Check if fetch_widevine is set to true
    if grep -q '"fetch_widevine": true' "$CONFIG_PATH"; then
        echo "Enabling Widevine CDM fetch..."
        export CLOAKBROWSER_FETCH_WIDEVINE=1
    else
        export CLOAKBROWSER_FETCH_WIDEVINE=0
    fi
fi

# Exec original entrypoint with 'cloakserve' argument if it exists,
# otherwise execute 'cloakbrowser cloakserve' directly.
if [ -f "/entrypoint.sh" ]; then
    echo "Delegating to original entrypoint..."
    exec /entrypoint.sh cloakserve
else
    echo "Running cloakbrowser directly..."
    exec cloakbrowser cloakserve
fi
