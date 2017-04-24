#!/bin/sh

set -e

test -z "$srcdir" && srcdir=$(dirname "$0")
test -z "$srcdir" && srcdir=.

cwd=$(pwd)
cd "$srcdir"

autoreconf --force --install --warnings=all

if test -z "${NOCONFIGURE}"; then
    set -x
    $srcdir/configure --prefix=/usr \
                      --disable-gtk_next \
                      --disable-parallel \
                      --disable-chrome \
                      --disable-plank \
                      --disable-telegram \
                      "$@"
fi
