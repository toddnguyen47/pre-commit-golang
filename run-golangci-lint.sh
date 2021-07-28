#!/usr/bin/env sh
set -e -o pipefail

for vararg in "$@"; do
  _package_name="$(echo ${vararg} | xargs -n1 dirname)"
  exec golangci-lint run "${_package_name}"
done
