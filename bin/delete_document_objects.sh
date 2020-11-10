#!/bin/sh
# The goal of the script is to remove the "Document Objects" entities in Kong Enterprise that cannot be removed by decK due to the following issue: https://github.com/Kong/deck/issues/208

echo "Checking HTTPie version: "
http --version

echo "http --verbose http://localhost:8001/document_objects Kong-Admin-Token:KongRul3z! ...."
http --verbose http://localhost:8001/document_objects Kong-Admin-Token:KongRul3z!
echo "-------"
echo "http --verbose http://localhost:8001/document_objects Kong-Admin-Token:KongRul3z! | jq -c '.data[].id' ...."
http --verbose http://localhost:8001/document_objects Kong-Admin-Token:KongRul3z! | jq -c '.data[].id'
echo "-------"
echo "-------"
echo "http http://localhost:8001/document_objects Kong-Admin-Token:KongRul3z! ...."
http http://localhost:8001/document_objects Kong-Admin-Token:KongRul3z!
echo "-------"
echo "http http://localhost:8001/document_objects Kong-Admin-Token:KongRul3z! | jq -c '.data[].id' ...."
http http://localhost:8001/document_objects Kong-Admin-Token:KongRul3z! | jq -c '.data[].id'



echo "Retrieving all of the document objects in Kong..."
http http://localhost:8001/document_objects Kong-Admin-Token:KongRul3z! | jq -c '.data[].id' | while read id; do
    echo "Deleting the document_object with the ID: ${id}"
    http --ignore-stdin DELETE http://localhost:8001/document_objects/$id Kong-Admin-Token:KongRul3z! 
done