# Open edges and decisions

Everything waiting on Eric. Not served (outside `docs/`). An edge in a page is an `<!-- EDGE: -->`
comment; `grep -rn EDGE docs/` finds them, and `tools/check.sh` refuses to publish until none are
left. Settled items move to the bottom with what was decided.

## Edges in the pages

| # | Page | Edge |
|---|---|---|
| 1 | archives.html (two places) | The formats Mill handles, per today's source. Explorable archives are designed but blocked on the seekable-stream review and not built; the page describes Mill as it is. |
| 2 | archives.html | "Looking inside an archive": an empty placeholder until archive browsing exists. Remove the section, or fill it from the shipped source. |
| 3 | archives.html | One line names UnZip, suntar, and MacGzip: several period program names together; names and formats need checking. |
| 4 | gopher.html | "named after the university's mascot" (the Golden Gopher). |
| 5 | networks.html | Four period names in two paragraphs (Windows, IBM PC, Sun, AppleShare and the Chooser). |
| 6 | mail.html | "Some mail servers already require encryption" (a trend, like the proxy sentence). |
| 7 | names.html | "Port 80 is the exit the computers in the cartoon were heading for." |
| 8 | reference.html | "modem" as the example word. |
| 9 | reference.html | The Jargon File nod. |
| 10 | people.html | Happy Net Box profiles are written by its users and can't be checked in advance. |
| 11 | people.html | The finger weather chart (graph.no). |
| 12 | people.html | "Finger was written by Les Earnest at Stanford University in 1971": from memory, needs a source. |
| 13 | places.html | textfiles.com's files came from bulletin boards "people call by modem". |

## Decisions pending

- **Style guide additions** proposed by the drafting agents (not applied): `file:`/`mill:`/`plugin:`
  addresses shown, never linked; Mill's own names exactly ("choose Preferences from the Edit menu to
  open the Settings page"); "hold down the mouse button" for the context menu; placeholders in italic
  inside `<TT>`, never made-up domains; Settings steps numbered with exact field names; terms
  ("number" for an IP address, no "domain" for Windows logins; encode/decode, compress/unpack,
  archive/open); one Try this per protocol on multi-protocol pages; test with Mill's user agent and
  never claim "tested in Mill" unless it was; no `--` inside EDGE comments; server names as the
  archive publishes them or as they were by 1997.
- **Pictures and images:** "picture" in the guide's prose, Mill's exact label ("image") when quoting
  Mill, tied together once on The World Wide Web page. Agreed in principle; not yet in STYLE.md or
  the pages.
- **Cartoons:** five more proposed (Names and Numbers, Archives, Finding People, Newsgroups,
  Etiquette), prompts given. Names and Numbers' cartoon extends the highway (an edge). Captions and
  in-picture lettering to be reviewed.
- **StuffIt Expander:** Mill doesn't decode BinHex on download, so a reader needs Expander; no Mac copy
  found to point to yet.
- **Addresses page:** Command-L (Open Location) as step 1; a Tip that Mill adds `http://` itself.
- **Default bookmarks for Mill 2.1:** eleven proposed (the guide, FrogFind, info.cern.ch,
  textfiles.com, 68k.news, Gopher at quux.org and Floodgap, the Info-Mac mirror at ftp.jussieu.fr,
  dict.org, finger weather for Oslo, time.nist.gov). Hand to the Mill session, or Eric passes it on.
- **Glossary:** written last, from the terms the pages define.
- **Outside the guide:** `http://1in1e6.com/` says "classic Macs" (out of voice); Mill's https alert
  says "TLS".

## Settled

- The guide ships with Mill 2.1, as a default bookmark; pages may describe 2.1's Plug-Ins.
- Linked sites may show their own time; our text never comments (cleared: Veronica-2's dates,
  newsgroup welcome articles' dates, 68k.news's "Headlines from the Future", the Info-Mac mirror's
  "historical collection").
- Earlier pages: all edges cleared (Mill users need only one; Rules of the Road title; better than it
  sounds; the road doesn't care what you drive, now the caption; the Happy Mac smile).
