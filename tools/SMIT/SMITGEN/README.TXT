SMITGEN is used to generate a vendor-specific initialization file, which the 
Access32 "Flexible" licensee uses to initialize the synthesizer.

SMITGEN creates a key string from the info supplied on the command line, 
along with some build info. It combines this with the file SMIT.C to 
create the SMITxx.C file which is to be sent to the licensee.

The companion project "SMITREAD" will create a console image which will 
read the initialized memory and display its (decoded) contents.

Both SMITGEN and SMITREAD use CRYPT2 and COOP to hold keys and algorithms.



 usage:
 SMITGEN -v xx -s "string" -k deckey

 where:
 xx		is the two-letter identifier of the licensee, and
		  is used to generate the filename and part of the string.
 string		is the unique text used to identify the engine
 deckey		is the key used to encrypt the string.
		  WARNING: normally, this would not be specified and the 
		  hard-coded key would be used instead.


So, for example, to generate the initialization file for "Tom Kopec", you
would use

 SMITGEN -v TK -s "Tom Kopec Access32 Software"

which would generate SMITTK.C to be sent to the Tom Kopec Company, Inc for
inclusion in their product code.

