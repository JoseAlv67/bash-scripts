#!/bin/bash

# Print's a pipe for each time the elapsed ping lasts more than 100 milliseconds.
# Variables:
#   -  `e`: Elapsed. Ping elapsed time im milliseconds.
#   -  `l`: Lines. Variable that collects all the pipes ('|') considering the time consumed.
#   -  `ws`: Wite Spaces. String of spaces after the print to aloign the text.
#   -  `wc`: Wite Count. Count of spaces to add after the print to aloign the text.
#   -  `t`: Time. Time un milliseconds to measure to add a pipe to draw the graph.
#   -  `c`: Count. Count of pipes to create the graph
pg() {
  ping google.com |\
  awk -v e=0 -v l="" -v ws="" -v wc=8 -v t=100 -v c=0 \
     '{ \
        printIfError(); \
        e = substr($7, 6); \
        e = substr(e, 0, (index(e, ".") + 1)); \
        if (e > t) { c = c + (e / t); } \
        l = fore(c, "|"); \
        wc = wc - length(e); \
        ws = fore(wc, " "); \
        printGraph(ws""e" - "l, length(l)); \
        l=""; c=0; ws=""; wc=8; \
      } \
      func printGraph(text, lLength) { if (lLength > 0) { if (lLength < 6) green(text); else if (lLength < 11) yellow(text); else red(text); } } \
      func fore(count, char) { txt = ""; for (q = 0; q < count; q++) { txt = char""txt; } return txt; } \
      func printIfError() { if ($2" "$3 != "bytes from" && $1" "$2 != "PING google.com") { printError($2 == "timeout" ? "TIMEOUT" : $0) } } \
      func printError(errMsg) { red("\\/\\/\\/\\ -- "errMsg" -- /\\/\\/\\/"); } \
      func red(x) { print("\033[31m" x "\033[0m"); } \
      func green(x) { print("\033[32m" x "\033[0m"); } \
      func yellow(x) { print("\033[33m" x "\033[0m"); } \
      '
}

# ln2: Add an UTC date in ISO format: `2022-08-10T13:57:16Z 64 bytes from 142.250.184.46: icmp_seq=0 ttl=114 time=35.255 ms`
# ln3: Parse from `2022-08-10T13:58:20Z time=39.434` to `58:20 39.434`
# ln4 Variables declarations:
#   - `at`: Actual Time. The period of time that I'm sumarizing.
#   - `ca`: Count Actual. Count of the times of the actual period of time.
#   - `st`: Sumarized Time. The sumarized time of that period.
#   - `l`: Lines. Variable that collects all the pipes ('|') considering the time consumed.
#   - `ws`: Wite Spaces. String of spaces after the print to aloign the text.
#   - `wc`: Wite Count. Count of spaces to add after the print to aloign the text.
#   - `t`: Time. Time un milliseconds to measure to add a pipe to draw the graph.
#   - `c`: Count. Count of pipes to create the graph
pg10() {
  ping google.com | \
  while read p; do echo $(date -u +%FT%TZ) $p; done | \
  awk -v at="" -v ca=0 -v st=0 -v l="" -v ws="" -v wc=7 -v t=100 -v c=0 \
     '{ \
        printIfError(); \
        time = substr(substr($1, 15), 0, 4)"0"; \
        elapsed = substr($8, 6); \
        if (at != time) { \
           prnt(); \
           at = time; \
         } else { \
           ca = ca + 1; \
           st = st + elapsed; \
         } \
      } \
      func fore(count, char) { txt=""; for (q = 0; q < count; q++) { txt = char""txt; } return txt; } \
      func prnt() { \
        if (ca > 0) { \
          prom = (st / ca); \
          prom = substr(prom, 0, (index(prom, ".") + 1)); \
          if (prom > t) { c = c + (prom / t); } \
          l = fore(c, "|"); \
          wc = wc - length(prom); \
          ws = fore(wc, " "); \
          printGraph(at""ws"~"prom" - "l, length(l)); \
          l=""; c=0; ca=0; st=0; ws=""; wc=7; \
        } \
      } \
      func printGraph(text, lLength) { if (lLength > 0) { if (lLength < 6) green(text); else if (lLength < 11) yellow(text); else red(text); } } \
      func printIfError() { if ($3" "$4 != "bytes from" && $2" "$3 != "PING google.com") { printError(substr(substr($1, 15), 0, 5), $3 == "timeout" ? "TIMEOUT" : $0) } } \
      func printError(time, errMsg) { red(time" \\/\\/\\/\\ -- "errMsg" -- /\\/\\/\\/"); } \
      func red(x) { print("\033[31m" x "\033[0m"); } \
      func green(x) { print("\033[32m" x "\033[0m"); } \
      func yellow(x) { print("\033[33m" x "\033[0m"); } \
    '
}

# Print's a pipe for each time the elapsed ping lasts more than 100 milliseconds, but only if the taked time is more than 100 ms
# Variables:
#   -  `e`: Elapsed. Ping elapsed time im milliseconds.
#   -  `l`: Lines. Variable that collects all the pipes ('|') considering the time consumed.
#   -  `t`: Time. Time un milliseconds to measure to add a pipe to draw the graph.
#   -  `c`: Count. Count of pipes to create the graph
pgc() {
  ping google.com |\
  while read p; do echo $(date +%FT%TZ) $p; done | \
  awk -v e=0 -v l="" -v t=100 -v c=0 \
     '{ \
        time = substr(substr($1, 12), 0, 8); \
        printIfError(time); \
        e = substr($8, 6); \
        e = substr(e, 0, (index(e, ".") + 1)); \
        if (e > t) { c = c + (e / t); } \
        l = fore(c, "|"); \
        lLength = length(l)
        if (lLength > 1) printGraph(time" - "l, lLength); \
        l=""; c=0; \
      } \
      func printGraph(text, lLength) { if (lLength > 0) { if (lLength < 6) green(text); else if (lLength < 11) yellow(text); else red(text); } } \
      func fore(count, char) { txt = ""; for (q = 0; q < count; q++) { txt = char""txt; } return txt; } \
      func printIfError(time) { if ($3" "$4 != "bytes from" && $2" "$3 != "PING google.com") { printError(time, $3 == "timeout" ? "TIMEOUT" : $0) } } \
      func printError(time, errMsg) { red(time" \\/\\/\\/\\ -- "errMsg" -- /\\/\\/\\/"); } \
      func red(x) { print("\033[31m" x "\033[0m"); } \
      func green(x) { print("\033[32m" x "\033[0m"); } \
      func yellow(x) { print("\033[33m" x "\033[0m"); } \
      '
}
