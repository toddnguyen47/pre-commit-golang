#!/usr/bin/env sh
set -e -o pipefail

_package_name="$(echo $@ | xargs -n1 dirname)"
exec golangci-lint run "${_package_name}"
