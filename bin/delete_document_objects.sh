#!/bin/sh
# The goal of the script is to remove the "Document Objects" entities in Kong Enterprise that cannot be removed by decK due to the following issue: https://github.com/Kong/deck/issues/208

http GET http://localhost:8001/document_objects Kong-Admin-Token:KongRul3z! | jq -c '.data[].id' | while read id; do
    echo "Deleting the document_object with the ID: ${id}"
    http --ignore-stdin DELETE http://localhost:8001/document_objects/$id Kong-Admin-Token:KongRul3z! 
done


echo "Number of Document Objects: "
http http://localhost:8001/document_objects | jq -r .data | jq length