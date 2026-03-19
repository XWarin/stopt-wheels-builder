#!/usr/bin/env bash
set -e

# Répertoire où scikit-build-core installe les .dylib
TARGET_DIR="$1"

echo "Fixing macOS dylibs in: $TARGET_DIR"

cd "$TARGET_DIR"

# 1. Corriger l'install_name de chaque dylib
for f in *.dylib ; do
    echo "Fixing install_name for: $f"
    install_name_tool -id "@loader_path/$f" "$f"
done

# 2. Ajouter @loader_path aux RPATH
for f in *.dylib ; do
    echo "Adding rpath @loader_path/. to $f"
    install_name_tool -add_rpath "@loader_path/." "$f" || true
done

# 3. Corriger toutes les dépendances qui pointent vers Homebrew
for f in *.dylib ; do
    echo "Fixing Homebrew paths in: $f"
    otool -L "$f" | awk '{print $1}' | grep "/opt/homebrew" | while read dep; do
        base=$(basename "$dep")
        echo " - Rewriting $dep → @rpath/$base"
        install_name_tool -change "$dep" "@rpath/$base" "$f"
    done
done

echo "All dylibs patched successfully"
