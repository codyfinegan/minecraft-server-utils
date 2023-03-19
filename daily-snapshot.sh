#!/bin/bash

PREFIX=""
FROM="$MCSU_SOURCEDIR/"
TO="$MCSU_TARGETDIR/${PREFIX}${MCSU_SOURCEDIR_BASENAME}${MCSU_VER}_$(date +%F)"
ZIP="$MCSU_TARGETDIR/${PREFIX}${MCSU_SOURCEDIR_BASENAME}${MCSU_VER}_$(date +%F).tar.gz"

mkdir -p "$TO"
rsync -xavh --delete "$FROM" "$TO"

tar -czf $ZIP -C $TO .
aws s3 sync --exclude='*' --include='*.tar.gz' ${MCSU_TARGETDIR} s3://${MCSU_S3_BUCKET}/${MCSU_SOURCEDIR_BASENAME} --delete 
