#!/bin/sh

SCRIPT=$(readlink -f "$0")
BASEDIR=$(dirname "$SCRIPT")

cd $BASEDIR

BSON_PATH=$BASEDIR/bson

if [ ! -d ${BSON_PATH} ]; then
        echo "Extracting the bson."
        tar zxf bson.tar.gz
fi

export PYTHONPATH=${BSON_PATH}

python $BASEDIR/convert.py $1
mv description.bson $BASEDIR/../default-settings/
mv description.map.bson $BASEDIR/../default-settings/
mv description.categorykeysmap.bson $BASEDIR/../default-settings/

cd -

