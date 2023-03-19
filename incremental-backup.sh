#!/bin/bash

FROM="$MCSU_SOURCEDIR/"
TO="$MCSU_TARGETDIR/${MCSU_SOURCEDIR_BASENAME}${MCSU_VER}"

mkdir -p "$TO"
rsync -xavh --delete "$FROM" "$TO"
