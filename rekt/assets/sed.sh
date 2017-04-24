#!/bin/sh
sed -i \
         -e 's/#FFFFFF/rgb(0%,0%,0%)/g' \
         -e 's/#171e24/rgb(100%,100%,100%)/g' \
    -e 's/#FDFDFD/rgb(50%,0%,0%)/g' \
     -e 's/#1b2c40/rgb(0%,50%,0%)/g' \
     -e 's/#FFFFFF/rgb(50%,0%,50%)/g' \
     -e 's/#000000/rgb(0%,0%,50%)/g' \
	*.svg
