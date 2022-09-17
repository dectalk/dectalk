
The place to obtain and install bison is at the following starting URL:

http://gnuwin32.sourceforge.net/packages/bison.htm

Note that bison sometimes creates an additional semicolon after a function definition which 
needs to be removed.

Run 

bison -v -d bachus.y 

in a cmd window and then compile. This worked for me. don't know why MVC can't just call 
bison which is in Program Files\gnu32win. (Which may be the cause of the problem: The path 
is ignored by MVC++

Remark: Better get also Flex from there. Seems a more recent version

http://gnuwin32.sourceforge.net/packages/flex.htm

Reiner