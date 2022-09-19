#!/bin/sh

set -ex

DOCKERHUB_REPO=${DOCKERHUB_REPO:-zhengliangsu}

script_path=`realpath $0`
dir_path=`dirname ${script_path}`
no_cache="--no-cache"

parent_dir_path=$(dirname ${dir_path})

repo="$DOCKERHUB_REPO/${parent_dir_path##*/}"
tag="${dir_path##*/}"

( cd ${dir_path}; docker build --platform linux/x86_64 . ${no_cache} -t "${repo}:${tag}" )
docker push "${repo}:${tag}"
echo "Done! Enjoy..."
