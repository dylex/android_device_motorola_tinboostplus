#!/bin/sh -e

while getopts 'i:' opt ; do case $opt in
	(i) image=$OPTARG ;;
	(*) exit 1 ;;
esac ; done

VENDOR=motorola
DEVICE=tinboostplus
pull () {
	if [ -n "$image" ] ; then
		ln $image/$1 $2 || cp -a $image/$1 $2
	else
		adb pull $1 $2
	fi
}

BASE=../../../vendor/$VENDOR/$DEVICE/proprietary
rm -rf $BASE/*

mkdir -p $BASE/lib
for LIB in `grep -v ^# proprietary-libs.txt`; do
    pull /system/lib/lib$LIB.so $BASE/lib/lib$LIB.so
done

for FILE in `grep -v ^# proprietary-files.txt`; do
    mkdir -p $BASE/`dirname $FILE`
    pull /system/$FILE $BASE/$FILE
done
