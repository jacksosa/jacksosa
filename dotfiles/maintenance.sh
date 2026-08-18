#!/bin/bash
# ~/Scripts/maintenance.sh — weekly/monthly admin tasks
# Replaces the background services that were disabled (auto-update,
# thumbnail/disk housekeeping). Run manually:
#   ~/Scripts/maintenance.sh
#
# Safe and idempotent — everything here regenerates or is re-fetched as needed.

set -uo pipefail

echo "== System maintenance — $(date '+%Y-%m-%d %H:%M') =="
echo

echo "[1/6] Updating package lists + upgrading packages..."
sudo apt update
sudo apt upgrade -y

echo
echo "[2/6] Removing unused packages, old kernels, and cached .debs..."
sudo apt autoremove --purge -y
sudo apt autoclean

echo
echo "[3/6] Clearing thumbnail cache..."
rm -rf ~/.cache/thumbnails/* 2>/dev/null || true
echo "    done"

echo
echo "[4/6] Vacuuming systemd journal (keep last 14 days)..."
sudo journalctl --vacuum-time=14d 2>/dev/null || true

echo
echo "[5/6] Trimming SSDs (fstrim)..."
sudo fstrim -av 2>/dev/null || echo "    fstrim not supported on this device"

echo
echo "[6/6] Summary..."
echo "--- disk ---"; df -h / | tail -1
echo "--- memory ---"; free -h | head -2

echo
echo "== Maintenance complete =="
