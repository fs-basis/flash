#!/bin/bash

CURDIR=$1
date=`date +%d.%m.%Y-%H.%M`

if [ -d $CURDIR/../../source/libstb-hal-cst-next ]; then
	HAL_REV=_HAL-rev`cd $CURDIR/../../source/libstb-hal-cst-next && git log | grep "^commit" | wc -l`-github
elif [ -d $CURDIR/../../source/libstb-hal-cst-next-max ]; then
	HAL_REV=_HAL-rev`cd $CURDIR/../../source/libstb-hal-cst-next-max && git log | grep "^commit" | wc -l`-max
elif [ -d $CURDIR/../../source/libstb-hal-cst-next-tangos ]; then
	HAL_REV=_HAL-rev`cd $CURDIR/../../source/libstb-hal-cst-next-tangos && git log | grep "^commit" | wc -l`-tangos
elif [ -d $CURDIR/../../source/libstb-hal ]; then
	HAL_REV=_HAL-rev`cd $CURDIR/../../source/libstb-hal && git log | grep "^commit" | wc -l`-fs
elif [ -d $CURDIR/../../source/libstb-hal-new ]; then
	HAL_REV=_HAL-rev`cd $CURDIR/../../source/libstb-hal-new && git log | grep "^commit" | wc -l`-fs-new
fi

if [ -d $CURDIR/../../source/neutrino-mp-cst-next ]; then
	NMP_REV=_NMP-rev`cd $CURDIR/../../source/neutrino-mp-cst-next && git log | grep "^commit" | wc -l`-github
elif [ -d $CURDIR/../../source/neutrino-mp-cst-next-ni ]; then
	NMP_REV=_NMP-rev`cd $CURDIR/../../source/neutrino-mp-cst-next-ni && git log | grep "^commit" | wc -l`-github
elif [ -d $CURDIR/../../source/neutrino-mp-cst-next-max ]; then
	NMP_REV=_NMP-rev`cd $CURDIR/../../source/neutrino-mp-cst-next-max && git log | grep "^commit" | wc -l`-max
elif [ -d $CURDIR/../../source/neutrino-mp-tangos ]; then
	NMP_REV=_NMP-rev`cd $CURDIR/../../source/neutrino-mp-tangos && git log | grep "^commit" | wc -l`-tangos
elif [ -d $CURDIR/../../source/neutrino-alpha ]; then
	NMP_REV=_NMP-rev`cd $CURDIR/../../source/neutrino-alpha && git log | grep "^commit" | wc -l`-neutrino-alpha
elif [ -d $CURDIR/../../source/neutrino-test ]; then
	NMP_REV=_NMP-rev`cd $CURDIR/../../source/neutrino-test && git log | grep "^commit" | wc -l`-neutrino-test
elif [ -d $CURDIR/../../source/neutrino-msgbox ]; then
	NMP_REV=_NMP-rev`cd $CURDIR/../../source/neutrino-msgbox && git log | grep "^commit" | wc -l`-neutrino-msgbox
elif [ -d $CURDIR/../../source/neutrino-fhd-menue ]; then
	NMP_REV=_NMP-rev`cd $CURDIR/../../source/neutrino-fhd-menue && git log | grep "^commit" | wc -l`-neutrino-fhd-menue
elif [ -d $CURDIR/../../source/neutrino-matze ]; then
	NMP_REV=_NMP-rev`cd $CURDIR/../../source/neutrino-matze && git log | grep "^commit" | wc -l`-neutrino-matze_$date
fi

gitversion="_BASE-rev`(cd $CURDIR/../../ && git log | grep "^commit" | wc -l)`$HAL_REV$NMP_REV"

echo "GITVERSION   = $gitversion"
export gitversion
