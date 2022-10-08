This is the rule compiler for rules in dapi/src/cmd/par_rule2.par.

You can build the binary in this directory with "make" and call "par_c2"
manually.

You can also just call "make compile" which will build par_c2 if needed
and then compile the rules in dapi/src/cmd/par_rule2.par.

We are missing a documentation for the rule-format, so writing new
rules is currently not really feasible.

Rules gathered while reading code and examples. Rules can be nested.

Rules:
o/.../                          Optional
r/x/y/                          Replace x with y

Matches:
D                               DIGIT_CHAR
U                               UPPER_CHAR
A                               ANY_ALPHA_CHAR
C                               ANY_CHAR_CHAR
W                               WHITE_CHAR
P                               PUNCT_CHAR
L                               LOWER_CHAR
N                               NON_ALPHA_CHAR
S                               SET_CHAR
V                               VOWEL_CHAR
O                               CONSONANT_CHAR
B                               NUMBER_CHAR
E                               CLAUSE_CHAR
H                               ALPHA_NUM
Y                               VOWEL_NON_Y
T                               SOME_PUNCT
\                               EXACT_CHAR
`                               EXACT_CASE
0                               HEXADECIMAL

Modifiers:
x                               no lookahead
~                               non-match
<n>                             match n occurences
<n-m>                           match n to m occurences
<+>                             match 1 or more occurences
D[11-31]                        match digits 11 to 31
S{'a','b'}                      Set ('a' or 'b'?)

Dictionary search delimiters:
DM                              process if dictionary miss
DH                              process if dictionary hit

Go/ret delimiters:
G                               GORET_NUMBER_DELIM
H                               GORET_HIT_DELIM
M                               GORET_MISS_DELIM
C                               COPY_HIT_DELIM

Collecting some examples here:

yahoo-rule:
0x00000001-0xFFFFFFFF:R0,o/'1'r/'-'/''//D[8-9]'00'r/'-'/','/i/D[2-9]D<2>/','/r/'-'/','/i/D<4>/''/

in text form:
R0:     US:     ALL:
{
  optional
  {
    '1'
replace '-' >> ''
  }
  D[8-9]
  '00'
  replace '-' >> ','
  insert D[2-9]D<2> >> ','
  replace '-' >> ','
  insert D<4> >> ''
}

sample-rule:
r/S{'5','6','2'}<1>/'string5'|'string6'|'string2'/

in text form:
replace{ S{'5','6','2'}<1> >>  'string5'|'string6'|'string2' }
