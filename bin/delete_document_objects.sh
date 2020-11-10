#!/bin/sh
# The goal of the script is to remove the "Document Objects" entities in Kong Enterprise that cannot be removed by decK due to the following issue: https://github.com/Kong/deck/issues/208

echo "Checking HTTPie version: "
http --version


http http://localhost:8001/document_objects Kong-Admin-Token:KongRul3z! | jq -c '.data[].id' | while read id; do
    echo "Deleting the document_object with the ID: ${id}"
    http --ignore-stdin DELETE $ADMIN_HOST:$ADMIN_PORT/document_objects/$id Kong-Admin-Token:KongRul3z! 
done