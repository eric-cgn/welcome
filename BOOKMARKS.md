# Default bookmarks proposed for Mill 2.1

Proposed by the Welcome to the Internet guide (this repo). Every address answered on 2026-11-15
from the lab Mac (curl with Mill's user agent, `Mozilla/1.22 (compatible; Mill/2.1; Macintosh; 68K)`,
for the Web; curl for Gopher and FTP; nc for dict, finger, and time). The non-Web addresses use the
forms in Mill's `plugins/internet/Read Me`. Titles are suggestions, in the guide's voice.

| Bookmark | Address | Protocol | Why |
|---|---|---|---|
| Welcome to the Internet | `http://welcome.1in1e6.com/` | HTTP | The guide: what the Internet is, protocol by protocol, written for Mill users. First in the list. |
| FrogFind | `http://frogfind.com/` | HTTP | A search engine that also rewrites the pages it finds so a smaller computer can read them. Refuses requests without a browser user agent; Mill's default works. |
| The First Web Site | `http://info.cern.ch/` | HTTP | CERN's restored first Web site; very light. |
| textfiles.com | `http://www.textfiles.com/` | HTTP | A large library of plain text files, ideal for Mill. |
| 68k.news | `http://68k.news/` | HTTP | Current headlines written for old browsers. Front page is about 97 KB, heavy on a Plus. |
| Gopher at quux.org | `gopher://gopher.quux.org/` | Gopher | A Gopher server with a period-looking first screen. |
| Floodgap Gopher | `gopher://gopher.floodgap.com/` | Gopher | The best-known Gopher server; home of Veronica-2, the Gopher search engine (`gopher://gopher.floodgap.com/7/v2/vs`). |
| Info-Mac Archive | `ftp://ftp.jussieu.fr/pub/mac/info-mac/` | FTP | An Info-Mac mirror (the name Info-Mac's own `help/mirror-list.txt` gives); Macintosh software, mostly `.hqx`. |
| Dictionary | `dict://dict.org/d:internet` | DICT | Looks up "internet" at dict.org; shows the address form for any word. |
| Weather by Finger | `finger://graph.no/oslo` | Finger | A text weather chart (graph.no is Norwegian; Oslo avoids giving the company a home town). Any town name works in place of `oslo`. |
| Correct Time | `time://time.nist.gov/` | Time | NIST's time server; Mill's page offers "Set this Mac's clock". |

Possible addition: `plugin://internet-services/about` (a form for finger, whois, dict, and time,
filled in from Settings), if Mill allows bookmarks to `plugin:` addresses.
