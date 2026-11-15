#!/bin/sh
# Rebuilds every image in docs/images from its original in art/: 1-bit conversion (tools/onebit.sh),
# then cartoon labels in a bitmap font (tools/letter.py). Fonts: art/fonts (Adobe's X11 bitmaps; see
# art/fonts/COPYING).
set -e
cd "$(dirname "$0")/.."
tmp=$(mktemp -d); trap 'rm -rf "$tmp"' EXIT
tools/onebit.sh art/signature.jpeg docs/images/signature.gif 192 80 transparent
tools/onebit.sh art/road.jpg "$tmp/road.gif" 400 80 >/dev/null
python3 -I tools/letter.py "$tmp/road.gif" docs/images/road.gif art/fonts/timB10.bdf \
  "330,29,~RULES|OF THE|ROAD" "57,74,MACINTOSH" "184,126,IBM PC" "275,59,SUN"
magick identify -format '%f: %wx%h, %b\n' docs/images/road.gif
