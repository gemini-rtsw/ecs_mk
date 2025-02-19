#!/bin/bash

# Ensure the script fails on any error
set -e

# Check if we're in a git repository
if ! git rev-parse --is-inside-work-tree > /dev/null 2>&1; then
    echo "Error: Not in a git repository"
    exit 1
fi

# Get the full repository path from git remote URL (excluding .git and the domain)
REPO_PATH=$(git config --get remote.origin.url | sed 's/.*gitlab.com[:\/]\(.*\)\.git/\1/')
REPO_NAME=$(basename ${REPO_PATH})

# Get the git root directory
GIT_ROOT=$(git rev-parse --show-toplevel)

# Check if docker is running
if ! docker info > /dev/null 2>&1; then
    echo "Docker is not running. Please start Docker first."
    exit 1
fi

# Get the GitLab registry URL from the environment or use a default
GITLAB_REGISTRY=${CI_REGISTRY:-"registry.gitlab.com"}
# Use the repository's own image with full path
IMAGE_NAME="${REPO_PATH}:latest-devel"
FULL_IMAGE_PATH="${GITLAB_REGISTRY}/${IMAGE_NAME}"

echo "Detected repository path: ${REPO_PATH}"
echo "Using image: ${FULL_IMAGE_PATH}"

# Check if the image exists locally and check for updates
echo "Checking for newer image version..."
docker pull ${FULL_IMAGE_PATH}

# Check if running on macOS
if [[ "$(uname)" == "Darwin" ]]; then
    # On macOS, we'll create the directory inside the container
    echo "Running on macOS - will create /gem_test inside container"
    MOUNT_GEM_TEST=""
    STARTUP_CMD="mkdir -p /gem_test && bash -l"
else
    # On Linux, try to mount external directory
    if [ ! -d "/gem_test" ]; then
        echo "Creating /gem_test directory..."
        sudo mkdir -p /gem_test
        sudo chown $(whoami):$(whoami) /gem_test
    fi
    MOUNT_GEM_TEST="-v /gem_test:/gem_test"
    STARTUP_CMD="bash -l"
fi

# Run the container with all necessary mounts and environment
docker run -it --rm \
    ${MOUNT_GEM_TEST} \
    -v ${GIT_ROOT}:/repo \
    -v ${HOME}/.gitconfig:/root/.gitconfig \
    -v ${HOME}/.git-credentials:/root/.git-credentials \
    -v ${HOME}/.ssh:/root/.ssh \
    -v ${HOME}/.docker:/root/.docker \
    -w /repo \
    ${FULL_IMAGE_PATH} \
    bash -c "${STARTUP_CMD}" 