#!/usr/bin/env bash
set -e

WHEEL="$1"
DEST="$2"

mkdir -p tmpdir
unzip "$WHEEL" -d tmpdir

bash build_utils/fix_stopt_macos_libs.sh tmpdir/pystopt

# copy Homebrew dependencies into the wheel (optional)
delocate-listdeps --all tmpdir | grep "/opt/homebrew" | xargs -I {} cp {} tmpdir/pystopt/ || true

# final repair
delocate-wheel -v --lib-sdir pystopt --require-archs x86_64 -w "$DEST" "$WHEEL"
