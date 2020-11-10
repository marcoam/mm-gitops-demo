#!/bin/sh
# The goal of the script is to remove the "Document Objects" entities in Kong Enterprise that cannot be removed by decK due to the following issue: https://github.com/Kong/deck/issues/208

echo "Checking HTTPie version: "
http --version

echo "#1 - http --verbose GET http://localhost:8001/document_objects Kong-Admin-Token:KongRul3z! ...."
http --verbose GET http://localhost:8001/document_objects Kong-Admin-Token:KongRul3z!
echo "-------"
echo "#2 - http --verbose GET http://localhost:8001/document_objects Kong-Admin-Token:KongRul3z! | jq -c '.data[].id' ...."
http --verbose GET http://localhost:8001/document_objects Kong-Admin-Token:KongRul3z! | jq -c '.data[].id'
echo "-------"
echo "-------"
echo "#3 - http GET http://localhost:8001/document_objects Kong-Admin-Token:KongRul3z! ...."
http GET http://localhost:8001/document_objects Kong-Admin-Token:KongRul3z!
echo "-------"
echo "#4 - http GET http://localhost:8001/document_objects Kong-Admin-Token:KongRul3z! | jq -c '.data[].id' ...."
http GET http://localhost:8001/document_objects Kong-Admin-Token:KongRul3z! | jq -c '.data[].id'



echo "Retrieving all of the document objects in Kong..."
http GET http://localhost:8001/document_objects Kong-Admin-Token:KongRul3z! | jq -c '.data[].id' | while read id; do
    echo "Deleting the document_object with the ID: ${id}"
    http --ignore-stdin DELETE http://localhost:8001/document_objects/$id Kong-Admin-Token:KongRul3z! 
done