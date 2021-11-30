#!/usr/bin/env bash
set -eux -o pipefail

MANIFESTS=("./deploy/static/provider/do" "./deploy/static/provider/baremetal" "./deploy/static/provider/kind" "./deploy/static/provider/exoscale" "./deploy/static/provider/cloud" "./deploy/static/provider/scw" "./deploy/static/provider/aws" "./deploy/static/provider/aws/nlb-with-tls-termination/")

mkdir -p diffs
for dir in "${MANIFESTS[@]}"
do
  kustomize build $dir/ > diffs/$(basename $dir).yaml
done
