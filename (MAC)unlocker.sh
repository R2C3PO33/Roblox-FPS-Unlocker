#!/bin/bash

# Set path to Roblox ClientSettings
clientSettings="$HOME/Library/Application Support/Roblox/ClientSettings"

# Create the folder if it doesn't exist
if [ ! -d "$clientSettings" ]; then
    mkdir -p "$clientSettings"
fi

# Main watcher loop
while true; do
    if pgrep -x "RobloxPlayerBeta" > /dev/null; then
        cat > "$clientSettings/IxpSettings.json" <<EOF
{
    "DFIntTaskSchedulerTargetFps": 29383,
    "FFlagGameBasicSettingsFramerateCap5": false,
    "FFlagTaskSchedulerLimitTargetFpsTo2402": "False"
}
EOF
    fi
    sleep 1
done
