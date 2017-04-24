#! /bin/bash
#
# This file is part of adapta-gtk-theme
#
# Copyright (C) 2016-2017 Tista <tista.gma500@gmail.com>
#
# This program is free software; you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation; either version 2 of the License, or
# (at your option) any later version.
#

INKSCAPE="`command -v inkscape`"

SRC_DIR="assets-cinnamon/light/misc"
SRC_DARK_DIR="assets-cinnamon/nokto/misc"
ASSETS_DIR="../cinnamon/assets"
ASSETS_DARK_DIR="../cinnamon-nokto/assets"
KEY_FILE="../../gtk/sass/common/_key_colors.scss"
THUMB="thumbnail"

inkver="`$INKSCAPE --version | awk '{print $2}'`"
if [ "$inkver" = 0.91 ]; then
    non_scale_dpi=90
else
    non_scale_dpi=96
fi

# Renderer
render-non-scale() {
    $INKSCAPE --export-dpi="$non_scale_dpi" \
              --export-png=$ASSETS_DIR/$THUMB.png $SRC_DIR/$THUMB.svg >/dev/null \
                                                                      2>>inkscape.log
    $INKSCAPE --export-dpi="$non_scale_dpi" \
              --export-png=$ASSETS_DARK_DIR/$THUMB.png $SRC_DARK_DIR/$THUMB.svg >/dev/null \
                                                                                2>>inkscape.log
}

# Generate PNG file
if [ -f $ASSETS_DIR/$THUMB.png ] && \
    [ $KEY_FILE -ot $ASSETS_DIR/$THUMB.png ]; then
    echo $ASSETS_DIR/$THUMB.png exists.
elif [ -f $ASSETS_DIR/$THUMB.png ] && \
    [ $KEY_FILE -nt $ASSETS_DIR/$THUMB.png ]; then
    echo Re-rendering $ASSETS_DIR/$THUMB.png
    echo Re-rendering $ASSETS_DARK_DIR/$THUMB.png
    echo $THUMB.png >>inkscape.log
    rm -f $ASSETS_DIR/$THUMB.png
    rm -f $ASSETS_DARK_DIR/$THUMB.png
    render-non-scale
else
    echo Rendering $ASSETS_DIR/$THUMB.png
    echo Rendering $ASSETS_DARK_DIR/$THUMB.png
    echo $THUMB.png >>inkscape.log
    render-non-scale
fi
