DECtalk v4.61 README file for Linux

For infromation about installing DECtalk, refer to INSTALL

For general information about DECtalk refer to the documentation
in html format in doc/DECtalk/html
in pdf format in doc/DECtalk/pdf
in ps format in doc/DECtalk/ps

Information about DECtalk specific to Linux.

The user that runs a DECtalk application must have write permission
to /dev/dsp. 

DECtalk is a product licensed by number of concurrent uses.  So,
It creates a file /var/tmp/DECtalk.pids where the current license 
information is stored while DECtalk is running.  If a DECtalk application 
crashes, the file /var/tmp/DECtalk.pids may have to be removed manually,
and only shold be removed if no other DECtalk applications are running.
DECtalk tries to free licenses that are used by programs that are
no longer running.

To run the graphical sample programs, you have to have glib 1.2.0.0.7 or later
and gtk 1.2.0.5.2 or later.  Both of these pacakges are available from
http://www.gtk.org/

One of the sample programs in the kit is "say"  Rsynth comes with a 
program called "say" and this install may clobber the say from rsynth,
or the say from rsynth will be the one called when the program say is
executed.


