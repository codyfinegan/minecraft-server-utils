#!/bin/bash

# keep all but the last 5 aws zips
echo "Pruning tar files"
(cd $MCSU_TARGETDIR && ls -tp | grep -v '/$' | tail -n +3 | xargs -I {} rm -- {})
echo "Syncing to s3"
aws s3 sync --exclude='*' --include='*.tar.gz' ${MCSU_TARGETDIR} s3://${MCSU_S3_BUCKET}/${MCSU_SOURCEDIR_BASENAME} --delete


echo "Processing folders"
find $MCSU_TARGETDIR -name "chromaticchaos_*-*-*" -mtime +1 -type d | xargs rm -f -r;


#REQUIRED_FREESPACE="$(du -s "$MCSU_SOURCEDIR" | cut -f1)"

#ls -1rt "$MCSU_TARGETDIR" | grep - | while read -r f; do
    # break if enough free space is available
#    if [ "$(df --output=avail "$MCSU_TARGETDIR" | tail -1)" -ge "$REQUIRED_FREESPACE" ] ; then
#	    echo "break"
 #       break
#    fi

    # if we need to make still more space, delete the oldest (lexicographically
    # first) snapshot in the target directory
    #rm -rf "$MCSU_TARGETDIR/$f"
#    echo "deleted $MCSU_TARGETDIR/$f"
#done

