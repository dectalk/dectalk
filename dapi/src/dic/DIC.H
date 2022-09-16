/*
 ***********************************************************************
 *
 *                           Copyright ©
 *    Copyright © 2000 Force Computers, Inc., a Solectron company. All rights reserved. 
 *    © Digital Equipment Corporation 1995. All rights reserved.
 *    Restricted Rights: Use, duplication, or disclosure by the U.S.
 *    Government is subject to restrictions as set forth in subparagraph
 *    (c) (1) (ii) of DFARS 252.227-7013, or in FAR 52.227-19, or in FAR
 *    52.227-14 Alt. III, as applicable.
 *
 *    This software is proprietary to and embodies the confidential
 *    technology of Force Computers Incorporated and other parties.
 *    Possession, use, or copying of this software and media is authorized
 *    only pursuant to a valid written license from Force or an
 *    authorized sublicensor.
 *
 ***********************************************************************
 *    File Name:	dic.h
 *    Author:
 *    Creation Date:
 *
 *    Functionality:
 *
 ***********************************************************************
 *    Revision History:
 * [0]      -     	PRG		Created
 * 001	20-Nov-89 	kdk		Added new form class "character" with features
 *							"alpha" (letters of the alphabet) and "iso"
 *							(iso-latin character set).
 * 002  08-July-98 	GL   	For BATS#706, include fc_def.tab to catch the shared FC definition
 * 003 	10/16/00	CAB		Changed copyright info
 */

typedef struct				/* item descriptor */
   {
   unsigned short buffer_length;	/* length of return buffer */
   unsigned short item_code;		/* code of item being requested */
   unsigned long *buffer;		/* return buffer */
   unsigned long *transfer_size;	/* size of return */
   } ITEM_DSC;

/*
   The following lookup table is useful for doing fast conversion of a
   table into a bitmask.
*/
  
  
unsigned long BIT[32] = 
   {
   0x00000001, 0x00000002, 0x00000004, 0x00000008,
   0x00000010, 0x00000020, 0x00000040, 0x00000080,
   0x00000100, 0x00000200, 0x00000400, 0x00000800,
   0x00001000, 0x00002000, 0x00004000, 0x00008000,
   0x00010000, 0x00020000, 0x00040000, 0x00080000,
   0x00100000, 0x00200000, 0x00400000, 0x00800000,
   0x01000000, 0x02000000, 0x04000000, 0x08000000,
   0x10000000, 0x20000000, 0x40000000, 0x80000000
   };

/*
   The following structure represents a database object file header.
*/

typedef struct
   {
   unsigned long no_of_entries;		/* number of entries in dictionary */
   unsigned long creation;				/* time of database object creation */
   unsigned long modified;				/* time object was last modified */
   unsigned char dummy[500];			/* dummy field */
   } DIC_OBJ_HEADER;

/*
   The following structure represents the internal format of a dictionary
   entry.  NOTE:  this structure is used by tools and utilities which deal
   directly with dictionaries and is not intended for an internal
   representation of a tagged word in DECtalk. 

   Field explanations:

   spelling - this field is used to define the orthographic spelling of
	the entry.  It is always required, and sometimes must be interpretted
	as one of two types of suffixes:  either a derivational suffix, which
	is denoted by a '-' as the first character, or a form class marker,
	which is denoted by a '+' as the first character.

   pronunciation - this field is used to define the phonetic spelling of
	the entry.  It is required except in the case that the entry is
	for a form class marker.

   form_class - this field is a longword bitmask which defines the form
	class (or possible form classes) of the entry.  Bit 29 is reserved
	for distinguishing suffix types, that is, whether it is a derivational
	suffix or a form class marker. Bit 30 is reserved for the definition 
	of contractions.  If bit 30 is set, then the entry has an unambiguous 
	form class which is represents a contraction of form classes.
	Bit 31 is reserved to distinguish homographs.

   semantic_class - this field is an array of quadword bitmasks which 
	define the relevant semantic features.

   frequency - this field defines the frequency of the entry out of 1 million.

   comment - this field is used by the user to make random comments pertinent
	to the entry.  It is common to use this field to define modification
	date and/or reason for modification of the entry.
*/

#define S_LEN			40
#define P_LEN			40
#define C_LEN			80

typedef struct dic
   {
   struct dic *flink;						/* forward link */
   char spelling[S_LEN];					/* orthographical spelling of word */
   char pronunciation[P_LEN];				/* phonetic spelling of word */
   unsigned long form_class;				/* form class of word */
   unsigned long semantic_class[31];	/* semantics of word */
   unsigned long frequency;				/* frequency of word */
   char comment[C_LEN];						/* comment */
   } DIC;

/*
   The following structure is a subset of the dictionary entry, used by
   certain parsing and display routines.
*/

typedef struct
   {
   unsigned long form_class;		/* form class of word */
   unsigned long semantic_class[31];	/* semantic features of word */
   } GRAMMAR;

/*
   The following tables define the legal tokens which can be used
   to specify the semantic features the corresponding form class.
*/

 char *adj[32] = 	/* adjective semantic features */
   {				/* examples... */
   "possesive",			/* 0)  bottle's */
   "proper",			/* 1)  */
   "place",			/* 2)  */
   "quantitative",		/* 3)  */
   "numerical",			/* 4)  */
   "ordinal",			/* 5)  */
   "demonstrative",		/* 6)  this */
   "negative",			/* 7)  noone's */
   "comparative",		/* 8)  */
   "superlative",		/* 9)  */
   NULL,			/* 10) */
   NULL,			/* 11) */
   NULL,			/* 12) */
   NULL,			/* 13) */
   NULL,			/* 14) */
   NULL,			/* 15) */
   NULL,			/* 16) */
   NULL,			/* 17) */
   NULL,			/* 18) */
   NULL,			/* 19) */
   NULL,			/* 20) */
   NULL,			/* 21) */
   NULL,			/* 22) */
   NULL,			/* 23) */
   NULL,			/* 24) */
   NULL,			/* 25) */
   NULL,			/* 26) */
   NULL,			/* 27) */
   NULL,			/* 28) */
   NULL,			/* 29) */
   NULL,			/* 30) */
   NULL				/* 31) */
   };

 char *adv[32] =	/* adverb semantic features */
   {				/* examples... */
   "manner",			/* 0)  */
   "place",			/* 1)  */
   "degree",			/* 2)  */
   "time",			/* 3)  */
   "negative",			/* 4)  */
   "relative",			/* 5)  when, where, why, as */
   "interrogative",		/* 6)  */
   "emphatic",			/* 7)  end in the suffix "-ever" */
   "present",			/* 8)  implied -past */
   "future",			/* 9)  */
   "proximal",			/* 10) */
   "interior",			/* 11) */
   "existential", 		/* 12) */
   "orientation",		/* 13) west of */
   NULL,			/* 14) */
   NULL,			/* 15) */
   NULL,			/* 16) */
   NULL,			/* 17) */
   NULL,			/* 18) */
   NULL,			/* 19) */
   NULL,			/* 20) */
   NULL,			/* 21) */
   NULL,			/* 22) */
   NULL,			/* 23) */
   NULL,			/* 24) */
   NULL,			/* 25) */
   NULL,			/* 26) */
   NULL,			/* 27) */
   NULL,			/* 28) */
   NULL,			/* 29) */
   NULL,			/* 30) */
   NULL				/* 31) */
   };

 char *art[32] = 	/* article semantic features */
   {				/* examples... */
   "definite",			/* 0)  */
   NULL,			/* 1)  */
   NULL,			/* 2)  */
   NULL,			/* 3)  */
   NULL,			/* 4)  */
   NULL,			/* 5)  */
   NULL,			/* 6)  */
   NULL,			/* 7)  */
   NULL,			/* 8)  */
   NULL,			/* 9)  */
   NULL,			/* 10) */
   NULL,			/* 11) */
   NULL,			/* 12) */
   NULL,			/* 13) */
   NULL,			/* 14) */
   NULL,			/* 15) */
   NULL,			/* 16) */
   NULL,			/* 17) */
   NULL,			/* 18) */
   NULL,			/* 19) */
   NULL,			/* 20) */
   NULL,			/* 21) */
   NULL,			/* 22) */
   NULL,			/* 23) */
   NULL,			/* 24) */
   NULL,			/* 25) */
   NULL,			/* 26) */
   NULL,			/* 27) */
   NULL,			/* 28) */
   NULL,			/* 29) */
   NULL,			/* 30) */
   NULL				/* 31) */
   };

 char *aux[32] =	/* auxiliary verb semantic features */
   {				/* examples... */
   "potential",			/* 0)  might */
   "ability",			/* 1)  can */
   "obligation",		/* 2)  ought, must, shall */
   "present",			/* 3)  will [vs. would] */
   "predicative",		/* 4)  will */
   "emphatic",			/* 5)  did */
   NULL,			/* 6)  */
   NULL,			/* 7)  */
   NULL,			/* 8)  */
   NULL,			/* 9)  */
   NULL,			/* 10) */
   NULL,			/* 11) */
   NULL,			/* 12) */
   NULL,			/* 13) */
   NULL,			/* 14) */
   NULL,			/* 15) */
   NULL,			/* 16) */
   NULL,			/* 17) */
   NULL,			/* 18) */
   NULL,			/* 19) */
   NULL,			/* 20) */
   NULL,			/* 21) */
   NULL,			/* 22) */
   NULL,			/* 23) */
   NULL,			/* 24) */
   NULL,			/* 25) */
   NULL,			/* 26) */
   NULL,			/* 27) */
   NULL,			/* 28) */
   NULL,			/* 29) */
   NULL,			/* 30) */
   NULL				/* 31) */
   };

 char *be[32] = 	/* be-form semantic features */
   {				/* examples... */
   NULL,			/* 0)  */
   NULL,			/* 1)  */
   NULL,			/* 2)  */
   NULL,			/* 3)  */
   NULL,			/* 4)  */
   NULL,			/* 5)  */
   NULL,			/* 6)  */
   NULL,			/* 7)  */
   NULL,			/* 8)  */
   NULL,			/* 9)  */
   NULL,			/* 10) */
   NULL,			/* 11) */
   NULL,			/* 12) */
   NULL,			/* 13) */
   NULL,			/* 14) */
   NULL,			/* 15) */
   NULL,			/* 16) */
   NULL,			/* 17) */
   NULL,			/* 18) */
   NULL,			/* 19) */
   NULL,			/* 20) */
   NULL,			/* 21) */
   NULL,			/* 22) */
   NULL,			/* 23) */
   NULL,			/* 24) */
   NULL,			/* 25) */
   NULL,			/* 26) */
   NULL,			/* 27) */
   NULL,			/* 28) */
   NULL,			/* 29) */
   NULL,			/* 30) */
   NULL				/* 31) */
   };

 char *bev[32] = 	/* bev-form semantic features */
   {				/* examples... */
   NULL,			/* 0)  */
   NULL,			/* 1)  */
   NULL,			/* 2)  */
   NULL,			/* 3)  */
   NULL,			/* 4)  */
   NULL,			/* 5)  */
   NULL,			/* 6)  */
   NULL,			/* 7)  */
   NULL,			/* 8)  */
   NULL,			/* 9)  */
   NULL,			/* 10) */
   NULL,			/* 11) */
   NULL,			/* 12) */
   NULL,			/* 13) */
   NULL,			/* 14) */
   NULL,			/* 15) */
   NULL,			/* 16) */
   NULL,			/* 17) */
   NULL,			/* 18) */
   NULL,			/* 19) */
   NULL,			/* 20) */
   NULL,			/* 21) */
   NULL,			/* 22) */
   NULL,			/* 23) */
   NULL,			/* 24) */
   NULL,			/* 25) */
   NULL,			/* 26) */
   NULL,			/* 27) */
   NULL,			/* 28) */
   NULL,			/* 29) */
   NULL,			/* 30) */
   NULL				/* 31) */
   };

 char *conj[32] = 	/* conjunction semantic features */
   {				/* examples... */
   NULL,			/* 0)  */
   NULL,			/* 1)  */
   NULL,			/* 2)  */
   NULL,			/* 3)  */
   NULL,			/* 4)  */
   NULL,			/* 5)  */
   NULL,			/* 6)  */
   NULL,			/* 7)  */
   NULL,			/* 8)  */
   NULL,			/* 9)  */
   NULL,			/* 10) */
   NULL,			/* 11) */
   NULL,			/* 12) */
   NULL,			/* 13) */
   NULL,			/* 14) */
   NULL,			/* 15) */
   NULL,			/* 16) */
   NULL,			/* 17) */
   NULL,			/* 18) */
   NULL,			/* 19) */
   NULL,			/* 20) */
   NULL,			/* 21) */
   NULL,			/* 22) */
   NULL,			/* 23) */
   NULL,			/* 24) */
   NULL,			/* 25) */
   NULL,			/* 26) */
   NULL,			/* 27) */
   NULL,			/* 28) */
   NULL,			/* 29) */
   NULL,			/* 30) */
   NULL				/* 31) */
   };

 char *ed[32] =		/* -ed verb semantic features */
   {				/* examples... */
   "performative",		/* 0)  */
   "locutionary",		/* 1)  */
   "momentary",			/* 2)  */
   "iterative",			/* 3)  */
   "state-change",		/* 4)  */
   "action",			/* 5)  */
   "surface-contact",		/* 6)  */
   "motion",			/* 7)  */
   "rapid",			/* 8)  */
   "itentional",		/* 9)  */
   "achievement",		/* 10) */
   "cognitive",			/* 11) */
   "plausible",			/* 12) */
   "rapid",			/* 13) */
   "emotive",			/* 14) */
   "casual",			/* 15) */
   "actual",			/* 16) */
   "agent",			/* 17) */
   "instrumental",		/* 18) */
   "dative",			/* 19) */
   "factitive",			/* 20) */
   "locative",			/* 21) */
   "objective",			/* 22) */
   "transitive",		/* 23) */
   "increase",			/* 24) */
   "sensory",			/* 25) */
   NULL,			/* 26) */
   NULL,			/* 27) */
   NULL,			/* 28) */
   NULL,			/* 29) */
   NULL,			/* 30) */
   NULL				/* 31) */
   };

 char *have[32] = 	/* have-forms semantic features */
   {				/* examples... */
   NULL,			/* 0)  */
   NULL,			/* 1)  */
   NULL,			/* 2)  */
   NULL,			/* 3)  */
   NULL,			/* 4)  */
   NULL,			/* 5)  */
   NULL,			/* 6)  */
   NULL,			/* 7)  */
   NULL,			/* 8)  */
   NULL,			/* 9)  */
   NULL,			/* 10) */
   NULL,			/* 11) */
   NULL,			/* 12) */
   NULL,			/* 13) */
   NULL,			/* 14) */
   NULL,			/* 15) */
   NULL,			/* 16) */
   NULL,			/* 17) */
   NULL,			/* 18) */
   NULL,			/* 19) */
   NULL,			/* 20) */
   NULL,			/* 21) */
   NULL,			/* 22) */
   NULL,			/* 23) */
   NULL,			/* 24) */
   NULL,			/* 25) */
   NULL,			/* 26) */
   NULL,			/* 27) */
   NULL,			/* 28) */
   NULL,			/* 29) */
   NULL,			/* 30) */
   NULL				/* 31) */
   };

 char *ing[32] =	/* -ing verb semantic features */
   {				/* examples... */
   "performative",		/* 0)  */
   "locutionary",		/* 1)  */
   "momentary",			/* 2)  */
   "iterative",			/* 3)  */
   "state-change",		/* 4)  */
   "action",			/* 5)  */
   "surface-contact",		/* 6)  */
   "motion",			/* 7)  */
   "rapid",			/* 8)  */
   "itentional",		/* 9)  */
   "achievement",		/* 10) */
   "congnitive",		/* 11) */
   "plausible",			/* 12) */
   "rapid",			/* 13) */
   "emotive",			/* 14) */
   "casual",			/* 15) */
   "actual",			/* 16) */
   "agent",			/* 17) */
   "instrumental",		/* 18) */
   "dative",			/* 19) */
   "factitive",			/* 20) */
   "locative",			/* 21) */
   "objective",			/* 22) */
   "transitive",		/* 23) */
   "increase",			/* 24) */
   "sensory",			/* 25) */
   NULL,			/* 26) */
   NULL,			/* 27) */
   NULL,			/* 28) */
   NULL,			/* 29) */
   NULL,			/* 30) */
   NULL,			/* 31) */
   };

 char *noun[32] =	/* noun semantic features */
   {				/* examples... */
   "plural",			/* 0)  man */
   "proper",			/* 1)  boy */
   "count",			/* 2)  papers */
   "abstract",			/* 3)  love */
   "living",			/* 4)  tree */
   "animate",			/* 5)  lobster */
   "human", 			/* 6)  John */
   "male",			/* 7)  Harry */
   "soft",			/* 8)  cloth */
   "small",			/* 9)  cup */
   "agent",			/* 10) actor */
   "solid",			/* 11) bat */
   "heavy",			/* 12) car */
   "slow",			/* 13) swim */
   "relational",		/* 14) mother */
   "applicative",		/* 15) butter */
   "orientation",		/* 16) west, middle */
   "emotive",			/* 17) hatred */
   "time",			/* 18) yesterday */
   "place",			/* 19) Ticonderoga */
   "edible",			/* 20) pancakes */
   "town",			/* 21) Henrietta */
   "street",			/* 22) Main */
   "measure",			/* 23) angstrom */
   "location",			/* 24) moon */
   "substance",			/* 25) cocaine */
   "numeral",			/* 26) four */
   "name",			/* 27) Lori */
   "event",			/* 28) riot */
   "valuable",			/* 29) platinum */
   "sensory",			/* 30) hear */
   "natural"			/* 31) sunlight */
   };

 char *pos[32] = 	/* possesive semantic features */
   {				/* examples... */
   NULL,			/* 0)  */
   NULL,			/* 1)  */
   NULL,			/* 2)  */
   NULL,			/* 3)  */
   NULL,			/* 4)  */
   NULL,			/* 5)  */
   NULL,			/* 6)  */
   NULL,			/* 7)  */
   NULL,			/* 8)  */
   NULL,			/* 9)  */
   NULL,			/* 10) */
   NULL,			/* 11) */
   NULL,			/* 12) */
   NULL,			/* 13) */
   NULL,			/* 14) */
   NULL,			/* 15) */
   NULL,			/* 16) */
   NULL,			/* 17) */
   NULL,			/* 18) */
   NULL,			/* 19) */
   NULL,			/* 20) */
   NULL,			/* 21) */
   NULL,			/* 22) */
   NULL,			/* 23) */
   NULL,			/* 24) */
   NULL,			/* 25) */
   NULL,			/* 26) */
   NULL,			/* 27) */
   NULL,			/* 28) */
   NULL,			/* 29) */
   NULL,			/* 30) */
   NULL				/* 31) */
   };

 char *prep[32] =	/* preposition semantic features */
   {				/* examples... */
   "direction-inwards",		/* 0)  */
   "direction-towards",		/* 1)  */
   "direction-upwards",		/* 2)  */
   "position-inwards",		/* 3)  */
   "position-towards",		/* 4)  */
   "position-upwards",		/* 5)  */
   "agentive",			/* 6)  */
   "instrumental",		/* 7)  */
   "dative",			/* 8)  */
   "factitive",			/* 9)  */
   "locative",			/* 10) */
   "objective",			/* 11) */
   "movement",			/* 12) */
   "temporal",			/* 13) */
   "present",			/* 14) */
   "inclusive",			/* 15) */
   "proximal",			/* 16) */
   NULL,			/* 17) */
   NULL,			/* 18) */
   NULL,			/* 19) */
   NULL,			/* 20) */
   NULL,			/* 21) */
   NULL,			/* 22) */
   NULL,			/* 23) */
   NULL,			/* 24) */
   NULL,			/* 25) */
   NULL,			/* 26) */
   NULL,			/* 27) */
   NULL,			/* 28) */
   NULL,			/* 29) */
   NULL,			/* 30) */
   NULL				/* 31) */
   };

 char *pron[32] = 	/* singular pronoun semantic features */
   {				/* examples... */
   "male",			/* 0)  he, him */
   "plural",			/* 1)  she, her */
   "reflexive",			/* 2)  herself */
   "one",			/* 3)  I, we */
   "two",			/* 4)  you */
   "three",			/* 5)  he, him, she, her, they */
   "definite",			/* 6)  this */
   "positive",			/* 7)  */
   "proximal",			/* 8)  this */
   "anaphoric",			/* 9)  this */
   "cataphoric",		/* 10) */
   "demonstrative",		/* 11) this */
   "emphatic",			/* 12) */
   "possesive",			/* 13) mine */
   "personal",			/* 14) he */
   "reciprocal",		/* 15) himself */
   "relative",			/* 16) who */
   "interrogative",		/* 17) what */
   "negative",			/* 18) noone */
   NULL,			/* 19) */
   NULL,			/* 20) */
   NULL,			/* 21) */
   NULL,			/* 22) */
   NULL,			/* 23) */
   NULL,			/* 24) */
   NULL,			/* 25) */
   NULL,			/* 26) */
   NULL,			/* 27) */
   NULL,			/* 28) */
   NULL,			/* 29) */
   NULL,			/* 30) */
   NULL				/* 31) */
   };

 char *subconj[32] =	/* subordinate conj semantic features */
   {				/* examples... */
   "causal",			/* 1)  */
   "temporal",			/* 2)  */
   "consecutive",		/* 3)  */
   "prior",			/* 4)  */
   "present",			/* 5)  */
   "additional",		/* 6)  */
   "contradictory",		/* 7)  */
   NULL,			/* 8)  */
   NULL,			/* 9)  */
   NULL,			/* 10) */
   NULL,			/* 11) */
   NULL,			/* 12) */
   NULL,			/* 13) */
   NULL,			/* 14) */
   NULL,			/* 15) */
   NULL,			/* 16) */
   NULL,			/* 17) */
   NULL,			/* 18) */
   NULL,			/* 19) */
   NULL,			/* 20) */
   NULL,			/* 21) */
   NULL,			/* 22) */
   NULL,			/* 23) */
   NULL,			/* 24) */
   NULL,			/* 25) */
   NULL,			/* 26) */
   NULL,			/* 27) */
   NULL,			/* 28) */
   NULL,			/* 29) */
   NULL,			/* 30) */
   NULL				/* 31) */
   };

 char *that[32] = 	/* that-forms semantic features */
   {				/* examples... */
   NULL,			/* 0)  */
   NULL,			/* 1)  */
   NULL,			/* 2)  */
   NULL,			/* 3)  */
   NULL,			/* 4)  */
   NULL,			/* 5)  */
   NULL,			/* 6)  */
   NULL,			/* 7)  */
   NULL,			/* 8)  */
   NULL,			/* 9)  */
   NULL,			/* 10) */
   NULL,			/* 11) */
   NULL,			/* 12) */
   NULL,			/* 13) */
   NULL,			/* 14) */
   NULL,			/* 15) */
   NULL,			/* 16) */
   NULL,			/* 17) */
   NULL,			/* 18) */
   NULL,			/* 19) */
   NULL,			/* 20) */
   NULL,			/* 21) */
   NULL,			/* 22) */
   NULL,			/* 23) */
   NULL,			/* 24) */
   NULL,			/* 25) */
   NULL,			/* 26) */
   NULL,			/* 27) */
   NULL,			/* 28) */
   NULL,			/* 29) */
   NULL,			/* 30) */
   NULL				/* 31) */
   };

 char *to[32] = 	/* to-forms semantic features */
   {				/* examples... */
   NULL,			/* 0)  */
   NULL,			/* 1)  */
   NULL,			/* 2)  */
   NULL,			/* 3)  */
   NULL,			/* 4)  */
   NULL,			/* 5)  */
   NULL,			/* 6)  */
   NULL,			/* 7)  */
   NULL,			/* 8)  */
   NULL,			/* 9)  */
   NULL,			/* 10) */
   NULL,			/* 11) */
   NULL,			/* 12) */
   NULL,			/* 13) */
   NULL,			/* 14) */
   NULL,			/* 15) */
   NULL,			/* 16) */
   NULL,			/* 17) */
   NULL,			/* 18) */
   NULL,			/* 19) */
   NULL,			/* 20) */
   NULL,			/* 21) */
   NULL,			/* 22) */
   NULL,			/* 23) */
   NULL,			/* 24) */
   NULL,			/* 25) */
   NULL,			/* 26) */
   NULL,			/* 27) */
   NULL,			/* 28) */
   NULL,			/* 29) */
   NULL,			/* 30) */
   NULL				/* 31) */
   };

 char *verb[32] =	/* verb semantic features */
   {				/* examples... */
   "performative",		/* 0)  */
   "locutionary",		/* 1)  */
   "momentary",			/* 2)  */
   "iterative",			/* 3)  */
   "state-change",		/* 4)  */
   "action",			/* 5)  */
   "surface-contact",		/* 6)  */
   "motion",			/* 7)  */
   "rapid",			/* 8)  */
   "itentional",		/* 9)  */
   "achievement",		/* 10) */
   "congnitive",		/* 11) */
   "plausible",			/* 12) */
   "rapid",			/* 13) */
   "emotive",			/* 14) */
   "casual",			/* 15) */
   "actual",			/* 16) */
   "agent",			/* 17) */
   "instrumental",		/* 18) */
   "dative",			/* 19) */
   "factitive",			/* 20) */
   "locative",			/* 21) */
   "objective",			/* 22) */
   "transitive",		/* 23) */
   "increase",			/* 24) */
   "sensory",			/* 25) */
   NULL,			/* 26) */
   NULL,			/* 27) */
   NULL,			/* 28) */
   NULL,			/* 29) */
   NULL,			/* 30) */
   NULL				/* 31) */
   };

 char *who[32] = 	/* who-forms semantic features */
   {				/* examples... */
   NULL,			/* 0)  */
   NULL,			/* 1)  */
   NULL,			/* 2)  */
   NULL,			/* 3)  */
   NULL,			/* 4)  */
   NULL,			/* 5)  */
   NULL,			/* 6)  */
   NULL,			/* 7)  */
   NULL,			/* 8)  */
   NULL,			/* 9)  */
   NULL,			/* 10) */
   NULL,			/* 11) */
   NULL,			/* 12) */
   NULL,			/* 13) */
   NULL,			/* 14) */
   NULL,			/* 15) */
   NULL,			/* 16) */
   NULL,			/* 17) */
   NULL,			/* 18) */
   NULL,			/* 19) */
   NULL,			/* 20) */
   NULL,			/* 21) */
   NULL,			/* 22) */
   NULL,			/* 23) */
   NULL,			/* 24) */
   NULL,			/* 25) */
   NULL,			/* 26) */
   NULL,			/* 27) */
   NULL,			/* 28) */
   NULL,			/* 29) */
   NULL,			/* 30) */
   NULL				/* 31) */
   };

 char *neg[32] =	/* neg-forms semantic features */
   {				/* examples... */
   NULL,			/* 0)  */
   NULL,			/* 1)  */
   NULL,			/* 2)  */
   NULL,			/* 3)  */
   NULL,			/* 4)  */
   NULL,			/* 5)  */
   NULL,			/* 6)  */
   NULL,			/* 7)  */
   NULL,			/* 8)  */
   NULL,			/* 9)  */
   NULL,			/* 10) */
   NULL,			/* 11) */
   NULL,			/* 12) */
   NULL,			/* 13) */
   NULL,			/* 14) */
   NULL,			/* 15) */
   NULL,			/* 16) */
   NULL,			/* 17) */
   NULL,			/* 18) */
   NULL,			/* 19) */
   NULL,			/* 20) */
   NULL,			/* 21) */
   NULL,			/* 22) */
   NULL,			/* 23) */
   NULL,			/* 24) */
   NULL,			/* 25) */
   NULL,			/* 26) */
   NULL,			/* 27) */
   NULL,			/* 28) */
   NULL,			/* 29) */
   NULL,			/* 30) */
   NULL				/* 31) */
   };

 char *inter[32] = 	/* interjection semantic features */
   {				/* examples... */
   "obscene",			/* 0)  shit! */
   "mild",			/* 1)  darn! */
   "sacrilegious",		/* 2)  christ! */
   "surprise",			/* 3)  wow! */
   "dismay",			/* 4)  shucks! */
   "locutionary",		/* 5)  hello! good-bye! */
   "religious",			/* 6)  halleluyaa! */
   "laudatory",			/* 7)  bravo! */
   "affirmative",		/* 8)  ok! */
   "approbationary",		/* 9)  hurrah! */
   NULL,			/* 10) */
   NULL,			/* 11) */
   NULL,			/* 12) */
   NULL,			/* 13) */
   NULL,			/* 14) */
   NULL,			/* 15) */
   NULL,			/* 16) */
   NULL,			/* 17) */
   NULL,			/* 18) */
   NULL,			/* 19) */
   NULL,			/* 20) */
   NULL,			/* 21) */
   NULL,			/* 22) */
   NULL,			/* 23) */
   NULL,			/* 24) */
   NULL,			/* 25) */
   NULL,			/* 26) */
   NULL,			/* 27) */
   NULL,			/* 28) */
   NULL,			/* 29) */
   NULL,			/* 30) */
   NULL				/* 31) */
   };

 char *ref[32] = 	/* reflexive semantic features */
   {				/* examples... */
   NULL,			/* 0)  */
   NULL,			/* 1)  */
   NULL,			/* 2)  */
   NULL,			/* 3)  */
   NULL,			/* 4)  */
   NULL,			/* 5)  */
   NULL,			/* 6)  */
   NULL,			/* 7)  */
   NULL,			/* 8)  */
   NULL,			/* 9)  */
   NULL,			/* 10) */
   NULL,			/* 11) */
   NULL,			/* 12) */
   NULL,			/* 13) */
   NULL,			/* 14) */
   NULL,			/* 15) */
   NULL,			/* 16) */
   NULL,			/* 17) */
   NULL,			/* 18) */
   NULL,			/* 19) */
   NULL,			/* 20) */
   NULL,			/* 21) */
   NULL,			/* 22) */
   NULL,			/* 23) */
   NULL,			/* 24) */
   NULL,			/* 25) */
   NULL,			/* 26) */
   NULL,			/* 27) */
   NULL,			/* 28) */
   NULL,			/* 29) */
   NULL,			/* 30) */
   NULL				/* 31) */
   };

 char *part[32] = 	/* particle semantic features */
   {				/* examples... */
   NULL,			/* 0)  */
   NULL,			/* 1)  */
   NULL,			/* 2)  */
   NULL,			/* 3)  */
   NULL,			/* 4)  */
   NULL,			/* 5)  */
   NULL,			/* 6)  */
   NULL,			/* 7)  */
   NULL,			/* 8)  */
   NULL,			/* 9)  */
   NULL,			/* 10) */
   NULL,			/* 11) */
   NULL,			/* 12) */
   NULL,			/* 13) */
   NULL,			/* 14) */
   NULL,			/* 15) */
   NULL,			/* 16) */
   NULL,			/* 17) */
   NULL,			/* 18) */
   NULL,			/* 19) */
   NULL,			/* 20) */
   NULL,			/* 21) */
   NULL,			/* 22) */
   NULL,			/* 23) */
   NULL,			/* 24) */
   NULL,			/* 25) */
   NULL,			/* 26) */
   NULL,			/* 27) */
   NULL,			/* 28) */
   NULL,			/* 29) */
   NULL,			/* 30) */
   NULL				/* 31) */
   };

 char *contraction[32] =/* contraction semantic features */
   {				/* examples... */
   NULL,			/* 0)  */
   NULL,			/* 1)  */
   NULL,			/* 2)  */
   NULL,			/* 3)  */
   NULL,			/* 4)  */
   NULL,			/* 5)  */
   NULL,			/* 6)  */
   NULL,			/* 7)  */
   NULL,			/* 8)  */
   NULL,			/* 9)  */
   NULL,			/* 10) */
   NULL,			/* 11) */
   NULL,			/* 12) */
   NULL,			/* 13) */
   NULL,			/* 14) */
   NULL,			/* 15) */
   NULL,			/* 16) */
   NULL,			/* 17) */
   NULL,			/* 18) */
   NULL,			/* 19) */
   NULL,			/* 20) */
   NULL,			/* 21) */
   NULL,			/* 22) */
   NULL,			/* 23) */
   NULL,			/* 24) */
   NULL,			/* 25) */
   NULL,			/* 26) */
   NULL,			/* 27) */
   NULL,			/* 28) */
   NULL,			/* 29) */
   NULL,			/* 30) */
   NULL				/* 31) */
   };

 char *func[32] =	/* function word semantic features */
   {				/* examples... */
   NULL,			/* 0)  */
   NULL,			/* 1)  */
   NULL,			/* 2)  */
   NULL,			/* 3)  */
   NULL,			/* 4)  */
   NULL,			/* 5)  */
   NULL,			/* 6)  */
   NULL,			/* 7)  */
   NULL,			/* 8)  */
   NULL,			/* 9)  */
   NULL,			/* 10) */
   NULL,			/* 11) */
   NULL,			/* 12) */
   NULL,			/* 13) */
   NULL,			/* 14) */
   NULL,			/* 15) */
   NULL,			/* 16) */
   NULL,			/* 17) */
   NULL,			/* 18) */
   NULL,			/* 19) */
   NULL,			/* 20) */
   NULL,			/* 21) */
   NULL,			/* 22) */
   NULL,			/* 23) */
   NULL,			/* 24) */
   NULL,			/* 25) */
   NULL,			/* 26) */
   NULL,			/* 27) */
   NULL,			/* 28) */
   NULL,			/* 29) */
   NULL,			/* 30) */
   NULL				/* 31) */
   };

char *cont[32] =	/* function word semantic features */
   {				/* examples... */
   NULL,			/* 0)  */
   NULL,			/* 1)  */
   NULL,			/* 2)  */
   NULL,			/* 3)  */
   NULL,			/* 4)  */
   NULL,			/* 5)  */
   NULL,			/* 6)  */
   NULL,			/* 7)  */
   NULL,			/* 8)  */
   NULL,			/* 9)  */
   NULL,			/* 10) */
   NULL,			/* 11) */
   NULL,			/* 12) */
   NULL,			/* 13) */
   NULL,			/* 14) */
   NULL,			/* 15) */
   NULL,			/* 16) */
   NULL,			/* 17) */
   NULL,			/* 18) */
   NULL,			/* 19) */
   NULL,			/* 20) */
   NULL,			/* 21) */
   NULL,			/* 22) */
   NULL,			/* 23) */
   NULL,			/* 24) */
   NULL,			/* 25) */
   NULL,			/* 26) */
   NULL,			/* 27) */
   NULL,			/* 28) */
   NULL,			/* 29) */
   NULL,			/* 30) */
   NULL				/* 31) */
   };


char *character[32] =	/* character semantic features */
   {				/* examples... */
   "alpha",			/* 1)  "a".."z" */
   "iso",			/* 2)  ø, ¼,... */
   NULL,			/* 3)  */
   NULL,			/* 4)  */
   NULL,			/* 5)  */
   NULL,			/* 6)  */
   NULL,			/* 7)  */
   NULL,			/* 8)  */
   NULL,			/* 9)  */
   NULL,			/* 10) */
   NULL,			/* 11) */
   NULL,			/* 12) */
   NULL,			/* 13) */
   NULL,			/* 14) */
   NULL,			/* 15) */
   NULL,			/* 16) */
   NULL,			/* 17) */
   NULL,			/* 18) */
   NULL,			/* 19) */
   NULL,			/* 20) */
   NULL,			/* 21) */
   NULL,			/* 22) */
   NULL,			/* 23) */
   NULL,			/* 24) */
   NULL,			/* 25) */
   NULL,			/* 26) */
   NULL,			/* 27) */
   NULL,			/* 28) */
   NULL,			/* 29) */
   NULL,			/* 30) */
   NULL				/* 31) */
   };


char *refr[32] =	/* character semantic features */
   {				/* examples... */
   "alpha",			/* 1)  "a".."z" */
   "iso",			/* 2)  ø, ¼,... */
   NULL,			/* 3)  */
   NULL,			/* 4)  */
   NULL,			/* 5)  */
   NULL,			/* 6)  */
   NULL,			/* 7)  */
   NULL,			/* 8)  */
   NULL,			/* 9)  */
   NULL,			/* 10) */
   NULL,			/* 11) */
   NULL,			/* 12) */
   NULL,			/* 13) */
   NULL,			/* 14) */
   NULL,			/* 15) */
   NULL,			/* 16) */
   NULL,			/* 17) */
   NULL,			/* 18) */
   NULL,			/* 19) */
   NULL,			/* 20) */
   NULL,			/* 21) */
   NULL,			/* 22) */
   NULL,			/* 23) */
   NULL,			/* 24) */
   NULL,			/* 25) */
   NULL,			/* 26) */
   NULL,			/* 27) */
   NULL,			/* 28) */
   NULL,			/* 29) */
   NULL,			/* 30) */
   NULL				/* 31) */
   };



/*
   The following table defines the legal tokens which can be used
   to specify form class.
*/
     
/* this is left in, but looks like it is unused - 8/9/95  JDB */     
char *form_class[32] =		/* form classes */
   {
   "adj",			/* 0)  adjective */
   "adv",			/* 1)  adverb */
   "art",			/* 2)  article */
   "aux",			/* 3)  auxiliary verb */
   "be",			/* 4)  be-forms */
   "bev",			/* 5)  bev-forms */
   "conj",			/* 6)  conjunctions */
   "ed",			/* 7)  past-tense verbs ending in "ed" */
   "have",			/* 8)  have-forms */
   "ing",			/* 9)  verbs ending in "ing" */
   "noun",			/* 10) noun */
   "pos",			/* 11) possesive */
   "prep",			/* 12) preposition */
   "pron",			/* 13) pronoun */
   "subconj",			/* 15) subordinate conjunction */
   "that",			/* 16) that-forms */
   "to",			/* 17) to-forms */
   "verb",			/* 18) verb */
   "who",			/* 19) who-forms */
   "neg",			/* 20) negation */
   "inter",			/* 21) interjection */
   "ref",			/* 22) reflexive */
   "part",			/* 23) particle */
   "func",			/* 24) function word */
   "cont",			/* 25) cont */
   "character",			/* 25) character */
   "refr",			/* 26) REFERENCE */
   NULL,			/* 27) UNDEFINED */
   NULL,			/* 28) UNDEFINED */
   NULL,			/* 29) UNDEFINED */
   NULL,			/* 30) reserved for contractions */
   "homograph",			/* 31) homograph (or suffix type) */
   };

/*
   The following table is used to map form classes to their respective
   semantic feature tables.
*/
       
/* this looks unused, but I'm leaving tables in to be safe... 8/30/95  JDB */       
char **feature_table[32] =
   {
   adj,				/* 0)  adjective */
   adv,				/* 1)  adverb */
   art,				/* 2)  article */
   aux,				/* 3)  auxiliary verb */
   be,				/* 4)  be-forms */
   bev,				/* 5)  bev-forms */ 
     conj,			/* 6)  conjunctions */
   ed,				/* 7)  past-tense verbs ending in "ed" */
   have,			/* 8)  have-forms */
   ing,				/* 9)  verbs ending in "ing" */
   noun,			/* 10) noun */
   pos,				/* 11) possesive */
   prep,			/* 12) preposition */
   pron,			/* 13) singular pronoun */
   subconj,			/* 14) subordinate conjunction */
   that,			/* 15) that-forms */
   to,				/* 16) to-forms */
   verb,			/* 17) verb */
   who,				/* 18) who-forms */
   neg,				/* 19) negation */
   inter,			/* 20) interjection */
   ref,				/* 21) reflexive */
   part,			/* 22) particle */
   func,			/* 23) function word */
   cont,			/* 24) cont  */
   character,		/* 25) character */
   refr,			/* 26) UNDEFINED */
   NULL,			/* 27) UNDEFINED */
   NULL,			/* 28) UNDEFINED */
   NULL,			/* 29  form class marker */
   contraction,		/* 30) contraction */
   NULL,			/* 31) homograph */
   };                                


/* 07/08/1998 GL for BATS#706 include fc_def.tab to catch form class definition */
#include "fc_def.tab"

