#!/bin/bash

# Ensure script fails on any error
set -e

# Get package name from spec file or git as fallback
SPEC_FILE=$(ls *.spec)
if [ -z "$SPEC_FILE" ]; then
    echo "No .spec file found in repository"
    exit 1
fi

# Try to get package name from spec file first (for pipeline)
# First check if there's a %define name statement
PACKAGE_NAME=$(grep "^%define name" $SPEC_FILE | awk '{print $3}')
# If not found, try the Name: field
if [ -z "$PACKAGE_NAME" ]; then
    PACKAGE_NAME=$(grep "^Name:" $SPEC_FILE | awk '{print $2}' | sed 's/%{name}/gis_mk/')
fi

# If package name is empty, try git (for local builds)
if [ -z "$PACKAGE_NAME" ]; then
    PACKAGE_NAME=$(basename -s .git $(git config --get remote.origin.url))
    if [ -z "$PACKAGE_NAME" ]; then
        echo "Could not determine package name from spec file or git"
        exit 1
    fi
fi

echo "Building package: $PACKAGE_NAME"

# Pull the container
echo "Pulling Rocky 8 packages container..."
docker pull registry.gitlab.com/nsf-noirlab/gemini/rtsw/gemini-rtsw-repo/rocky8-packages:latest

# Run the build in container
echo "Running build in container..."
docker run --rm -v $(pwd):/work -w /work \
    registry.gitlab.com/nsf-noirlab/gemini/rtsw/gemini-rtsw-repo/rocky8-packages:latest \
    /bin/bash -l -c '
        # Find the spec file
        SPEC_FILE=$(ls *.spec)
        if [ -z "$SPEC_FILE" ]; then
            echo "No .spec file found in repository"
            exit 1
        fi

        # Extract version from spec file
        PACKAGE_VERSION=$(grep "^Version:" $SPEC_FILE | awk "{print \$2}")

        # Create source directory and tarball with correct structure
        mkdir -p /root/rpmbuild/SOURCES &&
        dir_name="'$PACKAGE_NAME'-${PACKAGE_VERSION}" &&
        tar --transform "s,^,${dir_name}/," -czf /root/rpmbuild/SOURCES/${dir_name}.tar.gz . &&
        make &&
        rpmbuild -ba $SPEC_FILE &&
        # Copy RPMs to mounted volume
        mkdir -p /work/rpms &&
        cp /root/rpmbuild/RPMS/x86_64/*.rpm /work/rpms/
    '

echo "RPM build complete! RPMs can be found in the rpms/ directory:"
ls -l rpms/ 