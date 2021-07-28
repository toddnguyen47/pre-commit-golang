#!/usr/bin/env bash
set -e -o pipefail

_root_dir="$(git rev-parse --show-toplevel)"

pushd "${_root_dir}" > /dev/null

exec 5>&1
_package_name="$(echo $@ | xargs -n1 dirname)"
output="$(go vet ${_package_name}/*.go | tee /dev/fd/5)"
[[ -z "$output" ]]

popd > /dev/null
