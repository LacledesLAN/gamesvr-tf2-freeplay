#!/bin/bash
set -euo pipefail

if (( $# != 1 )); then
    printf 'ERROR: Expected exactly one unqualified local image tag.\n' >&2
    exit 2
fi

image_tag="$1"
if [[ "$image_tag" != gamesvr-tf2-freeplay && "$image_tag" != gamesvr-tf2-freeplay:* ]]; then
    printf "ERROR: Invalid unqualified image tag for gamesvr-tf2-freeplay: '%s'.\n" "$image_tag" >&2
    exit 2
fi

docker run --rm "$image_tag" ./ll-tests/gamesvr-tf2-freeplay.sh