/* definitions for the rom loader format */

struct pd_entry {
        unsigned char filename[0x10];
        unsigned short int flags;
        unsigned long int file_start;
        unsigned long int file_size; // size in ROM
	unsigned long int load_size; // size unpacked
        unsigned short int checksum;
        unsigned short int dic_lang; // specify which language dictionary 
        };


struct pdrom_directory {
        unsigned short int num_entries;
        unsigned short int entry_size;
        struct pd_entry entry[1];
        };

// the vector and function codes for the prot-mode routines..
#define PM_VEC	0x30

#define ABORT	0x0	// roll over and die. (back to monitor?)
#define READROM	0x1
#define READROMWORD	0x2
#define GETBUFFER 0x4
// that's it for now...
