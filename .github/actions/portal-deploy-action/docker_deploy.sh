#!/bin/sh

pushd /tmp
echo "Running deck sync..."
deck convert --from kong-gateway-2.x --to kong-gateway-3.x --verbose=2
deck sync --verbose=2
