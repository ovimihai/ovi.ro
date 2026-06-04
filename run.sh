#!/usr/bin/env bash
#
# run.sh — start a local Jekyll dev server to preview the site.
#
# Usage:
#   ./run.sh            # serve on http://127.0.0.1:4000 with live reload
#   ./run.sh -p 4111    # serve on a different port
#
set -euo pipefail

# Always run from the directory this script lives in (the site root).
cd "$(dirname "$0")"

PORT=4000
while getopts ":p:" opt; do
  case "$opt" in
    p) PORT="$OPTARG" ;;
    *) echo "Usage: $0 [-p PORT]" >&2; exit 1 ;;
  esac
done

# Install gems on first run (or after Gemfile changes).
if ! bundle check >/dev/null 2>&1; then
  echo "Installing Ruby gems with Bundler..."
  bundle install
fi

echo "Serving site at http://127.0.0.1:${PORT}/  (Ctrl-C to stop)"

# --livereload  : refresh the browser automatically on file changes
# --host        : bind to localhost only (not exposed on the network)
exec bundle exec jekyll serve \
  --host 127.0.0.1 \
  --port "${PORT}" \
  --livereload
