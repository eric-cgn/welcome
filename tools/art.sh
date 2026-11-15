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

# Callout icons, 32x32, from the sheet art/icons.jpg: each is cropped inside its grid cell (no grid
# lines), trimmed to its ink, centered in a square with a 1-pixel margin at the final size, shrunk
# with a box filter, and thresholded at 65% (no dithering, black on white).
icon() {   # icon NAME CROP
    magick art/icons.jpg -crop "$2" +repage -colorspace Gray -level 20%,85% -fuzz 10% -trim +repage "$tmp/$1.png"
    m=$(magick identify -format '%[fx:floor(max(w,h)*32/30)]' "$tmp/$1.png")
    magick "$tmp/$1.png" -background white -gravity center -extent "${m}x${m}" -filter Box -resize 32x32 \
      -threshold 65% -type bilevel -colors 2 "GIF:docs/images/$1.gif"
}
icon try 405x473+8+8          # a finger pressing a key: Try this
icon tip 615x473+640+8        # a light bulb: Tip
icon note 300x346+8+496       # paper and pencil: Note
icon important 304x346+320+496  # a triangle with an exclamation mark: Important
icon book 304x346+638+496     # an open book: Glossary
icon where 304x346+956+496    # a signpost: Where to Go
magick identify -format '%f: %wx%h, %b\n' docs/images/try.gif docs/images/tip.gif docs/images/note.gif \
  docs/images/important.gif docs/images/book.gif docs/images/where.gif
