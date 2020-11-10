#!/bin/sh

pushd /tmp

echo "[before deck] Number of Document Objects: "
http http://localhost:8001/document_objects | jq -r .data | jq length

echo "Running deck sync..."
deck sync

echo "[after deck] Number of Document Objects: "
http http://localhost:8001/document_objects | jq -r .data | jq length