#!/bin/zsh
# Dastan — Gesture Guitar Studio launcher
# Serves the app locally (camera access requires http://localhost) and opens it
# sized to the left half of your screen.
cd "$(dirname "$0")"
PORT=8765
if ! lsof -i :$PORT >/dev/null 2>&1; then
  python3 -m http.server $PORT >/dev/null 2>&1 &
  sleep 0.6
fi
open "http://localhost:$PORT/index.html"
# Snap the freshly opened browser window to the left half of the screen.
osascript <<'EOF' 2>/dev/null
delay 1.2
tell application "Finder" to set sb to bounds of window of desktop
set sw to item 3 of sb
set sh to item 4 of sb
tell application "System Events"
  set fp to first application process whose frontmost is true
  try
    tell window 1 of fp
      set position to {0, 0}
      set size to {sw div 2, sh}
    end tell
  end try
end tell
EOF
