
exit

# Cantidad de requests agrupado por horas de distintos días:
find /aloha/logs/access_log-2018-12-2* |
  while read file; do printf "\n\n#### $file ####\n"; \
    grep -v -E '.js|.css|.gif|.jpg|.png|/alohaDisplay/resources/|/alohaDisplay/info|/aloha/recursos/|/aloha/session-expired.htm|/favicon.ico|GET null null|"GET / ' $file |
    awk '{print substr($4, 1, 3)"00"}' |
    uniq -c |
    awk -v d=1500 -v l="" -v a=0 '{ if($1 > d) {a = $1/d};
      for (c = 0; c < a; c++) { l="|"l };
      print $2 " " $1 " "l;
      l=""; a=0; }';
  done

awk -v d=1500
    -v l=""
    -v a=0
'{
  if($1 > d) {a = $1/d};
  for (c = 0; c < a; c++) { l="|"l };
  print $2 " " $1 " "l;
  l="";
  a=0;
 }'

echo algo raro a mensionar | awk '{
    printIfError(); \
  } \
  func printIfError() { if ($2" "$3 != "bytes from") { printError($2 == "timeout" ? "TIMEOUT" : $0) } } \
  func printError(errMsg) { red("\\/\\/\\/\\ -- "errMsg" -- /\\/\\/\\/"); } \
  func red(x) { print("\033[31m" x "\033[0m"); } \
'

#### Example of bad ping sequence:
Request timeout for icmp_seq 1200
#### Example of other ping error:
ping: sendto: No route to host


function black(x)           { print("\033[30m" x "\033[0m") }
function red(x)             { print("\033[31m" x "\033[0m") }
function green(x)           { print("\033[32m" x "\033[0m") }
function yellow(x)          { print("\033[33m" x "\033[0m") }
function blue(x)            { print("\033[34m" x "\033[0m") }
function magenta(x)         { print("\033[35m" x "\033[0m") }
function cyan(x)            { print("\033[36m" x "\033[0m") }
function white(x)           { print("\033[37m" x "\033[0m") }
function brightBlack(x)     { print("\033[90m" x "\033[0m") }
function brightRed(x)       { print("\033[91m" x "\033[0m") }
function brightGreen(x)     { print("\033[92m" x "\033[0m") }
function brightYellow(x)    { print("\033[93m" x "\033[0m") }
function brightBlue(x)      { print("\033[94m" x "\033[0m") }
function brightMagenta(x)   { print("\033[95m" x "\033[0m") }
function brightCyan(x)      { print("\033[96m" x "\033[0m") }
function brightWhite(x)     { print("\033[97m" x "\033[0m") }
function bgBlack(x)         { print("\033[40m" x "\033[0m") }
function bgRed(x)           { print("\033[41m" x "\033[0m") }
function bgGreen(x)         { print("\033[42m" x "\033[0m") }
function bgYellow(x)        { print("\033[43m" x "\033[0m") }
function bgBlue(x)          { print("\033[44m" x "\033[0m") }
function bgMagenta(x)       { print("\033[45m" x "\033[0m") }
function bgCyan(x)          { print("\033[46m" x "\033[0m") }
function bgWhite(x)         { print("\033[47m" x "\033[0m") }
function bgBrightBlack(x)   { print("\033[100m" x "\033[0m") }
function bgBrightRed(x)     { print("\033[101m" x "\033[0m") }
function bgBrightGreen(x)   { print("\033[102m" x "\033[0m") }
function bgBrightYellow(x)  { print("\033[103m" x "\033[0m") }
function bgBrightBlue(x)    { print("\033[104m" x "\033[0m") }
function bgBrightMagenta(x) { print("\033[105m" x "\033[0m") }
function bgBrightCyan(x)    { print("\033[106m" x "\033[0m") }
function bgBrightWhite(x)   { print("\033[107m" x "\033[0m") }
function skyblue(x)         { print("\033[38;2;40;177;249m" x "\033[0m") }


 for (c = 0; c < a; c++) { l="|"l };

ping google.com |\
while read p; do echo $(date -u +%FT%TZ) $p; done | \
awk '{ print substr(substr($1, 15), 0, 5) }'

 [185.667] - ||
 [162.020] - ||
 [714.836] - ||||||||
 [44.483] - |
 [102.595] - ||
 [83.902] - |
 [295.953] - |||
 [44.048] - |
 [80.336] - |
 [188.550] - ||
 [73.552] - |
 [263.100] - |||

        - |
   37.7 - |
  137.5 - ||
  110.6 - ||
  173.6 - ||
   51.0 - |
  134.1 - ||
  179.2 - ||
   89.9 - |
  325.9 - ||||
        -
   81.6 - |
  100.9 - ||

    38.9 - |
    37.5 - |
    80.5 - |
   135.7 - ||
   204.9 - |||
   240.2 - |||
   187.8 - ||
   165.7 - ||
   194.2 - ||
    75.3 - |
   155.9 - ||
    79.5 - |
   325.4 - ||||
   118.8 - ||
   185.8 - ||
   234.4 - |||
   272.9 - |||
    84.5 - |
   170.0 - ||
    87.5 - |
    38.7 - |
    37.1 - |

# Variables:
#   -  `e`: Elapsed. Ping elapsed time im milliseconds.
#   -  `l`: Lines. Variable that collects all the pipes ('|') considering the time consumed.
#   -  `ws`: Wite Spaces. String of spaces after the print to aloign the text.
#   -  `wc`: Wite Count. Count of spaces to add after the print to aloign the text.
#   -  `t`: Time. Time un milliseconds to measure to add a pipe to draw the graph.
#   -  `c`: Count. Count of pipes to create the graph
func pg() {
  ping google.com |\
   awk -v e=0 -v l="" -v ws="" -v wc=8 -v t=100 -v c=0 \
     '{ \
        e = substr($7, 6); \
        e = substr(e, 0, (index(e, ".") + 1)); \
        if (e > t) { c = c + (e / t); } \
        l = fore(c, "|"); \
        wc = wc - length(e); \
        ws = fore(wc, " "); \
        print ws""e" - "l; \
        l=""; c=0; ws=""; wc=8; \
      } \
      func fore(count, char) { txt=""; for (q = 0; q < count; q++) { txt = char""txt; } return txt; } \
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
function pg10() {
  ping google.com |\
  while read p; do echo $(date -u +%FT%TZ) $p; done | \
  awk -v at="" -v ca=0 -v st=0 -v l="" -v ws="" -v wc=7 -v t=100 -v c=0 \
    '{ time = substr(substr($1, 15), 0, 4)"0";
       elapsed = substr($8, 6); \
       if (at != time) { \
          prnt();
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
          print at""ws"~"prom" - "l; \
          l=""; c=0; ca=0; st=0; ws=""; wc=7; \
        } \
      } \
    '
}


ping google.com |\
awk -v e=0 -v l="" -v ws="" -v wc=8 -v t=100 -v c=1 \
  '{ \
     e = substr($7, 6); \
     e = substr(e, 0, (index(e, ".") + 1)); \
     print "-- e: "e
     if (e > t) { c = c + (e / t); } else { print "++e: "e } \
     l = fore(c, "|"); \
     wc = wc - length(e); \
     ws = fore(wc, " "); \
     print ws""e" - "l; \
     l=""; c=0; ws=""; wc=8; \
   } \
   func fore(count, char) { txt=""; for (q = 0; q < count; q++) { txt = char""txt; } return txt; } \
   '

(22,32+33,4+44,33)/3 = 33,35
