#!/usr/bin/bash

if [[ -z "$1" ]]; then
    echo missing path to file
    exit 1
fi

# strip "attributes"
# ex. domain:example.com[:@attr]
sed -i 's|:@.*$||' "$1"

# format transformation
sed -i 's|domain:|DOMAIN-SUFFIX,|' "$1"
sed -i 's|full:|DOMAIN,|' "$1"
sed -i 's|regexp:|URL-REGEX,|' "$1"
sed -i 's|keyword:|DOMAIN-KEYWORD,|' "$1"