#!/usr/bin/env bash
set -e

echo "Starting CloakBrowser Manager Add-on..."

CONFIG_PATH="/data/options.json"
if [ -f "$CONFIG_PATH" ]; then
    AUTH_TOKEN_VAL=$(grep -o '"auth_token": "[^"]*' "$CONFIG_PATH" | sed 's/"auth_token": "//')
    if [ -n "$AUTH_TOKEN_VAL" ]; then
        echo "Authentication token configured."
        export AUTH_TOKEN="$AUTH_TOKEN_VAL"
    fi
fi

# Delegate to base image entrypoint or command
if [ -f "/entrypoint.sh" ]; then
    exec /entrypoint.sh "$@"
elif [ -f "/docker-entrypoint.sh" ]; then
    exec /docker-entrypoint.sh "$@"
elif [ -f "/start.sh" ]; then
    exec /start.sh "$@"
else
    exec "$@"
fi
