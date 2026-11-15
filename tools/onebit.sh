#!/bin/sh
# Makes a 1-bit GIF for docs/images from an original in art/ (any format ImageMagick reads).
# Usage: tools/onebit.sh art/<original> docs/images/<name>.gif WIDTH [THRESHOLD] [transparent]
#   WIDTH      pixels wide (at most 460); height follows the original's shape
#   THRESHOLD  percent of white below which a pixel turns black (default 80; lower thins lines)
#   transparent  makes white transparent (the signature uses this)
# The original is cropped to its ink, shrunk with a box filter so thin lines stay joined, and
# thresholded: no dithering, so drawings stay crisp lines.
# The signature: tools/onebit.sh art/signature.jpeg docs/images/signature.gif 192 80 transparent
set -e
src=${1:?usage: tools/onebit.sh original out.gif width [threshold] [transparent]}
out=${2:?}; w=${3:?}; t=${4:-80}
[ "$w" -le 460 ] || { echo "width $w is over 460"; exit 1; }
alpha=""; [ "${5:-}" = transparent ] && alpha="-transparent white"
magick "$src" -colorspace Gray -level 20%,85% -fuzz 10% -trim +repage -bordercolor white -border 20 \
  -filter Box -resize "${w}x" -threshold "${t}%" -trim +repage -bordercolor white -border 2 \
  -type bilevel $alpha -colors 2 "GIF:$out"
magick identify -format '%f: %wx%h, %b\n' "$out"
