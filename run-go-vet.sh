#!/usr/bin/env bash
set -e -o pipefail

_root_dir="$(git rev-parse --show-toplevel)"

pushd "${_root_dir}" > /dev/null

exec 5>&1
output="$(go vet "$@" | tee /dev/fd/5)"
[[ -z "$output" ]]

popd > /dev/null
