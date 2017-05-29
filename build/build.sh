#!/usr/bin/env bash

set -e

CURRENT_DIR=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )
ROOT_DIR=$(dirname "${CURRENT_DIR}")

git_resource_dir="${CURRENT_DIR}/.tmp-git-resource"

# Get the assets and and scripts from git-resource
git clone --depth 1 https://github.com/concourse/git-resource.git "${git_resource_dir}"
mv -f ${git_resource_dir}/assets/* "${ROOT_DIR}/assets/"
mv -f ${git_resource_dir}/scripts/* "${ROOT_DIR}/scripts/"
rm -rf "${git_resource_dir}"

# Patch in and out
pushd "${ROOT_DIR}/assets"
git apply -v "${CURRENT_DIR}/assets.patch"
popd
