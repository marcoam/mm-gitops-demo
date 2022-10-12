#!/bin/sh

pushd /tmp
echo "Running deck convert..."
deck convert --from kong-gateway-2.x --to kong-gateway-3.x --input-file=/tmp/kong.yaml --output-file=/tmp/kong-converted.yaml
echo "Running deck sync..."
deck sync -s /tmp/kong-converted.yaml
