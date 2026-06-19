#!/usr/bin/env bash

for server in /run/user/$UID/nvim.*; do
    [ -S "$server" ] || continue

    nvim --server "$server" \
         --remote-send '<cmd>ThemeReload<CR>' \
         2>/dev/null
done
