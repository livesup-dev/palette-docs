#!/bin/bash
# Docker entrypoint script.

bin="/app/bin/palette_docs"

# start the elixir application
exec "$bin" "start"