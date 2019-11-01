#!/bin/bash

CURDIR=$1
DATETIME=_`date +%d.%m.%Y-%H.%M`

if [ -d $CURDIR/../../build_source/libstb-hal-ddt ]; then
	HAL_REV=_HAL-rev`cd $CURDIR/../../build_source/libstb-hal-fs && git log | grep "^commit" | wc -l`-ddt
elif [ -d $CURDIR/../../build_source/libstb-hal-fs ]; then
	HAL_REV=_HAL-rev`cd $CURDIR/../../build_source/libstb-hal-fs && git log | grep "^commit" | wc -l`-fs
else
	HAL_REV=_HAL-revXXX
fi

if [ -d $CURDIR/../../build_source/neutrino-mp-ddt ]; then
	NMP_REV=_NMP-rev`cd $CURDIR/../../build_source/neutrino-mp-fs && git log | grep "^commit" | wc -l`-ddt
elif [ -d $CURDIR/../../build_source/neutrino-mp-fs ]; then
	NMP_REV=_NMP-rev`cd $CURDIR/../../build_source/neutrino-mp-fs && git log | grep "^commit" | wc -l`-fs
else
	NMP_REV=_NMP-revXXX
fi

gitversion="_BASE-rev`(cd $CURDIR/../../ && git log | grep "^commit" | wc -l)`$HAL_REV$NMP_REV$DATETIME"

echo "GITVERSION   = $gitversion"
export gitversion
