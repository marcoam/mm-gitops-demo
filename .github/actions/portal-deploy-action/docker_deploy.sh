#!/bin/sh

pushd /tmp
echo "Running deck convert..."
deck convert --from kong-gateway-2.x --to kong-gateway-3.x --input-file=/tmp/kong.yaml --output-file kong-converted.yaml
echo "Running deck sync..."
deck sync -s kong-converted.yaml
