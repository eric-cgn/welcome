#!/usr/bin/env python3
'''Letters text onto a 1-bit GIF in a BDF bitmap font, for cartoon labels.
Each label is drawn on a white box (PAD pixels around the text) so it reads over the drawing.
Usage: tools/letter.py in.gif out.gif font.bdf "x,y,TEXT[|SECOND LINE...]" ...
  x,y is the top left of the label's white box; | starts a new line, each line centered.
  A label written "x,y,~TEXT" gets no white box.'''
import subprocess, sys

PAD = 1


def font(path):
    glyphs, cur, rows, asc = {}, None, None, 0
    for line in open(path, encoding='latin-1'):
        k, _, v = line.strip().partition(' ')
        if k == 'FONT_ASCENT': asc = int(v)
        elif k == 'ENCODING': cur = {'enc': int(v.split()[0])}
        elif k == 'DWIDTH' and cur is not None: cur['dw'] = int(v.split()[0])
        elif k == 'BBX' and cur is not None: cur['bbx'] = [int(n) for n in v.split()]
        elif k == 'BITMAP': rows = []
        elif k == 'ENDCHAR':
            cur['rows'] = rows; glyphs[cur['enc']] = cur; cur = rows = None
        elif rows is not None: rows.append(int(k, 16) if k else 0)
    return glyphs, asc


def main():
    src, out, fpath = sys.argv[1:4]
    glyphs, asc = font(fpath)
    w, h = [int(n) for n in subprocess.run(['magick', 'identify', '-format', '%w %h', src],
                                           capture_output=True, text=True, check=True).stdout.split()]
    pbm = subprocess.run(['magick', src, '-background', 'white', '-flatten', '-type', 'bilevel', 'pbm:-'],
                         capture_output=True, check=True).stdout
    data = pbm[pbm.index(b'\n', pbm.index(b'\n') + 1) + 1:]   # P4\nW H\n then rows
    stride = (w + 7) // 8
    px = [[(data[y * stride + x // 8] >> (7 - x % 8)) & 1 for x in range(w)] for y in range(h)]
    lh = asc + 2
    for spec in sys.argv[4:]:
        x0, y0, text = spec.split(',', 2)
        x0, y0, box = int(x0), int(y0), not text.startswith('~')
        lines = text.lstrip('~').split('|')
        widths = [sum(glyphs[ord(c)]['dw'] for c in ln) for ln in lines]
        bw, bh = max(widths) + 2 * PAD, len(lines) * lh - 2 + 2 * PAD
        if box:
            for y in range(y0, y0 + bh):
                for x in range(x0, x0 + bw):
                    if 0 <= x < w and 0 <= y < h: px[y][x] = 0
        for i, ln in enumerate(lines):
            pen = x0 + PAD + (max(widths) - widths[i]) // 2
            base = y0 + PAD + i * lh + asc
            for c in ln:
                g = glyphs[ord(c)]
                gw, gh, gx, gy = g['bbx']
                top = base - gy - gh
                for r, bits in enumerate(g['rows']):
                    nb = ((gw + 7) // 8) * 8
                    for b in range(gw):
                        if bits >> (nb - 1 - b) & 1:
                            X, Y = pen + gx + b, top + r
                            if 0 <= X < w and 0 <= Y < h: px[Y][X] = 1
                pen += g['dw']
    rows = bytearray()
    for y in range(h):
        for x in range(0, w, 8):
            rows.append(sum(px[y][x + j] << (7 - j) for j in range(8) if x + j < w))
    subprocess.run(['magick', 'pbm:-', '-type', 'bilevel', '-colors', '2', 'GIF:' + out],
                   input=b'P4\n%d %d\n' % (w, h) + bytes(rows), check=True)


main()
