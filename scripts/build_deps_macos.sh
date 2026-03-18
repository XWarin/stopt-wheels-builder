#!/bin/bash
set -ex

echo "=== brew update ==="
brew update

echo "=== Install Eigen ==="
brew install eigen

echo "=== Install Boost (compiled) ==="
brew install boost
