# Open edges and decisions

Everything waiting on Eric. Not served (outside `docs/`). An edge in a page is an `<!-- EDGE: -->`
comment; `grep -rn EDGE docs/` finds them, and `tools/check.sh` refuses to publish until none are
left. Settled items move to the bottom with what was decided.

## Edges in the pages

Published 2026-11-15 as written, after Eric read every page; the comments are out of the pages, and
these stay listed for the checks still owed (the 2.1 items against the built `v2.1`, edge 12's
source, edge 14 when Mill's Gopher change lands).

| # | Page | Edge |
|---|---|---|
| 1 | archives.html | The formats Mill handles. The 2.1 plan (retro repo, `docs/mill-plan.md`, 4905f9b on `globaltalk`) puts gzip, MacBinary, BinHex, zip, and tar in an Archive Formats Plug-In, with Browse. StuffIt and Compact Pro stay out. Redrafted from the plan; the "Opening a wrapped file" and "When Browse is dimmed" sections and the Try this need checking against the built `v2.1` after its wording review. Open: what saving a file from inside a MacBinary or BinHex file gives (the page says "the file inside, unwrapped"). |
| 2 | archives.html | (Merged into 1; the placeholder is gone.) Was: fill from the plan (the Cancel / Browse / Save... dialog, Save... the default; "Browse after saving"; "Support Random Access" per protocol; member addresses after `#/`), then check every label against the built `v2.1` after its wording review. |
| 3 | archives.html | Minimal Install has no Archive Formats Plug-In (archives saved as before, no window); check against the 2.1 installer, and the Plug-In's final name (the plan leaves it open). |
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
| 14 | gopher.html | "A few kinds of Gopher item lead to things Mill can't open, and Mill leaves those out of the menu." Vague; and Mill will show telnet and CSO items instead (backlog). Rewrite once Mill's behavior is settled: name the two kinds, and say what Mill does when one is clicked. |
| 15 | mac.html | The Tip on browsing archives on your own disks, and "also opens the wrapped files": from the 2.1 plan (`file:` always reads in place, no Support Random Access checkbox). Check against the built `v2.1`. |

## Decisions pending

- **Publishing:** the drafts describe Mill 2.1 (News, IMAP, LDAP, SMB, NFS, Image Formats, and
  archive browsing), so they go live with the 2.1 release, not before. Until then, nothing new is
  pushed (the repo and the site are public), or the drafts live on a branch kept local.
- **Sequencing with Mill:** 2.1's stage 7 is a wording review of every user-facing string. The guide
  quotes Mill's labels exactly, so its last pass comes after that review, checked against the built
  `v2.1` on a lab Mac.
- **Other 2.1 changes the guide may mention:** keep-alive connections and the idle-timeout setting
  (General); HTTP/1.1. Probably invisible to the reader; decide when the build is in.
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
- **Cartoons (parked):** five proposed (Names and Numbers, Archives, Finding People, Newsgroups,
  Etiquette); prompts in `art/prompts.md`. The first generations weren't consistent enough with the
  Rules of the Road cartoon, so this waits. Ideas for later: give Gemini `art/road.jpg` as the style
  and character reference with each prompt; generate all five in one session. Names and Numbers'
  cartoon extends the highway (an edge).
- **StuffIt Expander:** in 2.1 Mill browses BinHex and MacBinary itself; StuffIt (`.sit`) and Compact
  Pro (`.cpt`) still need Expander, and no Mac copy has been found to point to yet.
- **Addresses page:** Command-L (Open Location) as step 1; a Tip that Mill adds `http://` itself.
- **Default bookmarks for Mill 2.1:** eleven proposed, in `BOOKMARKS.md`; handed to the Mill session by Eric.
- **Glossary:** written last, from the terms the pages define.
- **Outside the guide:** `http://1in1e6.com/` says "classic Macs" (out of voice); Mill's https alert
  says "TLS".

## For Mill (backlog; for the Mill session)

- **Gopher: show telnet and CSO items.** Today `plugins/internet/gopher.c:76` drops Gopher types 8 and
  T (telnet, tn3270) and 2 (CSO) from menus. Eric: show them as links (`telnet://host:port/`, and
  the like) and let Mill give its ordinary error for a protocol it doesn't speak. The guide's Gopher
  page changes to match (edge 14).
- **https alert wording:** "TLS requires an HTTP proxy." uses a post-1997 term.
- **Default bookmarks for 2.1:** `BOOKMARKS.md`.

## Settled

- The guide ships with Mill 2.1, as a default bookmark; pages may describe 2.1's Plug-Ins.
- Linked sites may show their own time; our text never comments (cleared: Veronica-2's dates,
  newsgroup welcome articles' dates, 68k.news's "Headlines from the Future", the Info-Mac mirror's
  "historical collection").
- Earlier pages: all edges cleared (Mill users need only one; Rules of the Road title; better than it
  sounds; the road doesn't care what you drive, now the caption; the Happy Mac smile).
