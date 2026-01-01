
#!/bin/bash
#
# Automates building packages and pushing to the repo

set -e

ARCH="x86_64"
BUILD_DIR="nstep-build"
REPO_NAME="nstep-arch-repo"

echo "Setting up build directory and cleaning $ARCH directory"
rm -rf "$ARCH"
mkdir -p "$BUILD_DIR" "$ARCH"
ln -sf ../PKGBUILD "$BUILD_DIR/PKGBUILD"

echo "Building package"
cd "$BUILD_DIR"
makepkg -sf

echo "Copying package to repo"
cp *.pkg.tar.zst "../$ARCH/"

echo "Updating repository database"
cd "../$ARCH"

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
git add "$ARCH/"
git commit -m "Update package: $(date '+%Y-%m-%d')"
git push

echo "Package updated successfully"
