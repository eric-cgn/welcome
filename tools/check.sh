#!/bin/sh
# Checks every page in docs/ before it is published: the HTML 3.2 DTD (OpenSP, in a container),
# plain ASCII, no comments (EDGE notes must be settled and removed, since View Source shows them),
# pages under 16 KB, and every IMG with WIDTH, HEIGHT, and ALT.
# The DTD and catalog come from The Millionth (../retro-homepage/millionth/dtd), or set DTD_DIR.
set -e
cd "$(dirname "$0")/.."
DTD_DIR=${DTD_DIR:-../retro-homepage/millionth/dtd}
bad=0
for f in docs/*.html; do
    if LC_ALL=C grep -n '[^ -~	]' "$f"; then echo "$f: non-ASCII characters"; bad=1; fi
    if grep -n '<!--' "$f"; then echo "$f: comments (settle each EDGE and remove it)"; bad=1; fi
    size=$(wc -c < "$f")
    if [ "$size" -gt 16384 ]; then echo "$f: $size bytes, over 16 KB"; bad=1; fi
    for tag in $(grep -o '<IMG[^>]*>' "$f" | tr ' ' '_'); do
        for a in WIDTH HEIGHT ALT; do
            case "$tag" in *"$a="*) ;; *) echo "$f: IMG without $a: $tag"; bad=1;; esac
        done
    done
done
docker run --rm -v "$(cd "$DTD_DIR" && pwd)":/dtd:ro -v "$PWD/docs":/docs:ro python:3.13-slim-bookworm sh -c '
  apt-get -qq update >/dev/null && apt-get -qq install -y opensp >/dev/null 2>&1
  ok=0; for f in /docs/*.html; do SGML_CATALOG_FILES=/dtd/html32.soc onsgmls -s -E 20 "$f" || ok=1; done; exit $ok' || bad=1
[ $bad = 0 ] && echo "All pages pass." || { echo "Not ready to publish."; exit 1; }
