#!/bin/bash
#
# Automates building packages and pushing to the repo

set -e  # Exit on any error

BUILD_DIR="nstep-build"
REPO_NAME="nstep-arch-repo"

echo "Setting up build directory"
mkdir -p "$BUILD_DIR"
ln -sf ../PKGBUILD "$BUILD_DIR/PKGBUILD"

echo "Cleaning x86_64 directory"
rm x86_64/*

echo "Building package"
cd "$BUILD_DIR"
makepkg -sf

echo "Copying package to repo"
cp *.pkg.tar.zst ../x86_64/

echo "Updating repository database"
cd ../x86_64

repo-add "$REPO_NAME.db.tar.zst" *.pkg.tar.zst

# Remove symlinks
rm -f "$REPO_NAME.db" "$REPO_NAME.files"

# Remove the compression from the file name
mv "$REPO_NAME.db.tar.zst" "$REPO_NAME.db"
mv "$REPO_NAME.files.tar.zst" "$REPO_NAME.files"

echo "Cleaning up build directory"
cd ..
rm -rf "$BUILD_DIR"

echo "Committing and pushing to GitHub"
git add x86_64/
git commit -m "Update package: $(date '+%Y-%m-%d')"
git push

echo "Package updated successfully"
