#!/usr/bin/env bash
set -e

echo "Starting Degoog Add-on..."

# Configure data persistence by linking /app/data to Home Assistant's /data volume
if [ -d "/app" ]; then
    mkdir -p /data
    if [ -d "/app/data" ] && [ ! -L "/app/data" ]; then
        echo "Linking /app/data to persistent /data storage..."
        cp -rn /app/data/* /data/ 2>/dev/null || true
        rm -rf /app/data
        ln -s /data /app/data
    fi
fi

CONFIG_PATH="/data/options.json"
if [ -f "$CONFIG_PATH" ]; then
    PASS_VAL=$(grep -o '"settings_password": "[^"]*' "$CONFIG_PATH" | sed 's/"settings_password": "//')
    if [ -n "$PASS_VAL" ]; then
        echo "Configuring settings password..."
        export DEGOOG_SETTINGS_PASSWORDS="$PASS_VAL"
    fi
fi

# Execute base container command
if [ -f "/entrypoint.sh" ]; then
    exec /entrypoint.sh "$@"
elif [ -f "/docker-entrypoint.sh" ]; then
    exec /docker-entrypoint.sh "$@"
else
    exec "$@"
fi
