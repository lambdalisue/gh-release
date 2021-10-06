#!/bin/bash
#
# Usage (Public):
#
#   download.sh {user}/{repo} {pattern} [{tag}]
#
# Usage (Private):
#
#   PA_TOKEN=... download.sh {user}/{repo} {pattern} [{tag}]
#
# Example:
#   download.sh itchyny/gojq gojq_.*_darwin_amd64\.zip
#
CURL=${CURL:-curl}
JQ=${JQ:-jq}

repo=$1
pattern=$2
tag=${3:-latest}

# Construct parse expression
if [[ "$tag" = "latest" ]]; then
  parser=".[0].assets | map(select(.name|test(\"$pattern\";\"i\")))[0].id"
else
  parser=". | map(select(.tag_name == \"$tag\"))[0].assets | map(select(.name|test(\"$pattern\";\"i\")))[0].id"
fi

# Get releases
releases=$(${CURL} -sL https://${PA_TOKEN}@api.github.com/repos/${repo}/releases)

# Get asset_id
asset_id=$(echo $releases | ${JQ} "$parser")
if [[ "$assert_id" = "null" ]]; then
  echo "ERROR: '$tag' is not found" >&2
  exit 1
fi

# Download asset
${CURL} -sLJO \
  -H 'Accept: application/octet-stream' \
  https://${PA_TOKEN}@api.github.com/repos/${repo}/releases/assets/${asset_id}
