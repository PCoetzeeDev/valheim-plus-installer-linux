#!/usr/bin/env bash

set -euo pipefail

HOME="$( cd && pwd )"
TARGET_DIR="${HOME}/.local/share/Steam/steamapps/common/Valheim/"

read -e -p "Enter path to Valheim dir: [${TARGET_DIR}]" TMP
if [ -n "$TMP" ]; then
  TARGET_DIR="$TMP"
fi

DATE=$(date +%Y-%m-%d)
BACKUP_DIR="${HOME}/valheim_backups_4u/"
BACKUP_PATH="$BACKUP_DIR"Valheim."$DATE"

echo "Creating backup at ${BACKUP_PATH}..."

mkdir -p "$BACKUP_PATH"
cp -br "$TARGET_DIR"/* "$BACKUP_DIR"/Valheim."$DATE"

echo "Installing ValheimPlus at ${TARGET_DIR}..."

wget "https://github.com/Grantapher/ValheimPlus/releases/download/0.9.9.15/UnixServer.tar.gz" -O - |
tar -xzvf - --directory="${TARGET_DIR}" &&
chmod u+x "${TARGET_DIR}/start_game_bepinex.sh"

echo "++++++++++++"
echo "All done, remember to change the command on steam. Valheim->properties->command = ./start_game_bepinex.sh %command%"
echo "++++++++++++"
