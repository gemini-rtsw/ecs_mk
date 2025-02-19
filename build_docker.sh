#!/bin/bash

# Ensure script fails on any error
set -e

# Default token for local builds (same as in .gitlab-ci.yml)
TOKEN="${TOKEN:-***REMOVED-GITLAB-TOKEN***}"

# Determine if we're in pipeline
IN_PIPELINE="false"
if [ -n "$CI_REGISTRY" ]; then
    IN_PIPELINE="true"
fi

# Get registry URL from git remote when building locally
if [ -z "$CI_REGISTRY_IMAGE" ]; then
    # Extract gitlab registry URL from git remote
    GITLAB_URL=$(git config --get remote.origin.url | sed 's/.*gitlab.com[:\/]\(.*\)\.git/\1/')
    if [ -n "$GITLAB_URL" ]; then
        CI_REGISTRY_IMAGE="registry.gitlab.com/${GITLAB_URL}"
    else
        CI_REGISTRY_IMAGE="local/$(basename $(pwd))"
        echo "Warning: Could not determine GitLab registry URL, using default: ${CI_REGISTRY_IMAGE}"
    fi
fi

# Get package name from git repo if not set
if [ -z "$PACKAGE_NAME" ]; then
    PACKAGE_NAME=$(basename $(git rev-parse --show-toplevel))
fi

# Debug output
echo "PACKAGE_NAME before: ${PACKAGE_NAME}"
echo "Current directory: $(pwd)"
echo "Basename: $(basename $(pwd))"

# Build the development image
docker build \
    --build-arg IN_PIPELINE="${IN_PIPELINE}" \
    --build-arg TOKEN="${TOKEN}" \
    --build-arg PACKAGE_NAME="${PACKAGE_NAME}" \
    -t "${CI_REGISTRY_IMAGE}:latest-devel" \
    -t "${CI_REGISTRY_IMAGE}:latest" .

# Show the built images
docker images | grep "${PACKAGE_NAME:-$(basename $(pwd))}"

# Push the images if in pipeline
if [ -n "$CI_REGISTRY" ]; then
    # In pipeline - use REGISTRY_TOKEN for pushing
    docker login -u oauth2 -p "${REGISTRY_TOKEN}" "${CI_REGISTRY}"
    docker push "${CI_REGISTRY_IMAGE}:latest"
    docker push "${CI_REGISTRY_IMAGE}:latest-devel"
else
    # Local push - make it optional
    echo
    echo "Images built successfully. To push them, run:"
    echo "docker push ${CI_REGISTRY_IMAGE}:latest"
    echo "docker push ${CI_REGISTRY_IMAGE}:latest-devel"
fi 