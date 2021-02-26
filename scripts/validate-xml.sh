#!/bin/bash

# validate-xml.sh : Script to validate all XML files in the DWCA repository

ERRORS=false

# Search for all XML files in the specimen and taxon directory
XML_FILES=( `find {./specimen/,./taxon/} -name \*.xml` )

for file in ${XML_FILES[@]}; do
  /usr/bin/xmllint --noout $file
  if [ $? -gt 0 ]; then
      ERRORS=true;
  fi
done

if [ ERRORS ]; then
  exit 1
fi

