#!/bin/bash

# Fetches required assets for this theme from Grunt output
# 1 argument: top level directory (containing Gruntfile.js) of Grunt installationo
# Run this script in the top level directory of the theme (same as setup.py)

# To run grunt, copy the _variables.scss to "dist/flatly" directory of bootswatch, then run
# grunt swatch:flatly
# and collect the output using the script below

SRCDIR=$1
APP="orgtheme_ceda_serv"
THEME="orgtheme"

# copy the demo index file
index=docs/flatly/index.html
dest=demo/index.html
if [ ! -e `dirname ${APP}/static/${THEME}/${dest}` ]; then
	echo making `dirname ${APP}/static/${THEME}/${dest}`
	mkdir -vp `dirname ${APP}/static/${THEME}/${dest}`
else
	echo `dirname $index`
fi
cp ${SRCDIR}/${index} $APP/static/${THEME}/${dest}

# copy the other assets
for i in \
_assets/css/custom.min.css \
_assets/js/custom.js \
_vendor/popper.js/dist/umd/popper.min.js \
_vendor/popper.js/dist/umd/popper.min.js.map \
_vendor/jquery/dist/jquery.min.js \
_vendor/jquery/dist/jquery.min.map \
_vendor/bootstrap/dist/js/bootstrap.min.js \
_vendor/bootstrap/dist/js/bootstrap.min.js.map \
4/flatly/bootstrap.css 
do
	if [ ! -e `dirname $i` ]; then
		dir=`dirname $i`
		echo making ${APP}/static/${THEME}/${dir}
		mkdir -vp ${APP}/static/${THEME}/${dir}
	else
		echo `dirname $i`
	fi
	cp -v ${SRCDIR}/docs/${i} ${APP}/static/${THEME}/${i}
done
