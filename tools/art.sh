#!/bin/sh
# Rebuilds every image in docs/images from its original in art/: 1-bit conversion (tools/onebit.sh),
# then any lettering in a bitmap font (tools/letter.py). Fonts: art/fonts (Adobe's X11 bitmaps; see
# art/fonts/COPYING).
set -e
cd "$(dirname "$0")/.."
tmp=$(mktemp -d); trap 'rm -rf "$tmp"' EXIT

tools/onebit.sh art/signature.jpeg docs/images/signature.gif 192 80 transparent

# Rules of the Road: the exit sign reads PORT over 80, with an arrow drawn like a highway exit's
tools/onebit.sh art/road.jpg "$tmp/road.gif" 400 80 >/dev/null
python3 -I tools/letter.py "$tmp/road.gif" "$tmp/road-lettered.gif" art/fonts/timB14.bdf "330,28,~PORT" "331,46,~80"
magick "$tmp/road-lettered.gif" +antialias -fill black -stroke black -strokewidth 3 -draw "line 351,62 361,52" \
  -strokewidth 1 -draw "polygon 369,44 355,46 367,58" -type bilevel -colors 2 GIF:docs/images/road.gif
magick identify -format '%f: %wx%h, %b\n' docs/images/road.gif
