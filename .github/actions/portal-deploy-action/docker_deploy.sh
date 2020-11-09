#!/bin/sh

pushd /tmp

http $ADMIN_HOST:$ADMIN_PORT/document_objects Kong-Admin-Token:KongRul3z! | jq -c '.data[].id' | while read id; do
    echo "Deleting the document_object with the ID: ${id}"
    http --ignore-stdin DELETE http://localhost:8001/document_objects/$id Kong-Admin-Token:KongRul3z! 
done

deck sync