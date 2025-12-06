#!/usr/bin/env bash
set -euo pipefail

# --- Tweakables ---
TEMP=5950
GAMMA="1.00:1.00:1.00"
# -------------------

# Logging (helps when run from a shortcut)
CACHE_DIR="${XDG_CACHE_HOME:-$HOME/.cache}"
mkdir -p "$CACHE_DIR"
LOG_FILE="$CACHE_DIR/toggle-redshift.log"

{
  echo "==== $(date) ===="
  echo "Starting toggle-redshift.sh"

  # Resolve redshift absolute path (PATH may be thin under keybinders)
  REDSHIFT_BIN="$(command -v redshift || true)"
  if [[ -z "${REDSHIFT_BIN}" ]]; then
    echo "Error: redshift not found in PATH"
    command -v notify-send >/dev/null && notify-send "RedShift mode" "Error: redshift not found"
    exit 1
  fi

  STATE_DIR="${XDG_STATE_HOME:-$HOME/.local/state}"
  STATE_FILE="$STATE_DIR/redshift-contrast.enabled"
  mkdir -p "$STATE_DIR"

  notify() { command -v notify-send >/dev/null && notify-send "RedShift mode" "$1"; }

  if [[ -f "$STATE_FILE" ]]; then
    # Deactivate
    "$REDSHIFT_BIN" -x || true
    rm -f "$STATE_FILE"
    notify "Deactivated"
    echo "Deactivated"
  else
    # Activate (one-shot)
    "$REDSHIFT_BIN" -x || true
    "$REDSHIFT_BIN" -O "$TEMP" -g "$GAMMA"
    touch "$STATE_FILE"
    notify "Activated (TEMP=$TEMP, GAMMA=$GAMMA)"
    echo "Activated (TEMP=$TEMP, GAMMA=$GAMMA)"
  fi
} >>"$LOG_FILE" 2>&1
