/*
 ***********************************************************************
 *
 *                           Coryright (c)
 *    © Digital Equipment Corporation 1995, 1996. All rights reserved.
 *
 *    Restricted Rights: Use, duplication, or disclosure by the U.S.
 *    Government is subject to restrictions as set forth in subparagraph
 *    (c) (1) (ii) of DFARS 252.227-7013, or in FAR 52.227-19, or in FAR
 *    52.227-14 Alt. III, as applicable.
 *
 *    This software is proprietary to and embodies the confidential
 *    technology of Digital Equipment Corporation and other parties.
 *    Possession, use, or copying of this software and media is authorized
 *    only pursuant to a valid written license from Digital or an
 *    authorized sublicensor.
 *
 ***********************************************************************
 *    File Name:    cmf_main.c
 *    Author:
 *    Creation Date:
 *
 *    Functionality:
 *  cnf_main.c this is a runtime dos version of the bios that will find
 *  and configure modules on a pc-xt or an at where the config table
 *  has been trashed for some reason .... this routine can also be used
 *  at installation time to print out the unused bases, vectors, and
 *  bios addresses for the current system, and to recommend switch settings
 *  for the module.
 *
 *   -S     ... Select language for messages
 ***********************************************************************
 *    Revision History:
 *
 * 16feb96  ...cjl  add Selected language option for messages.
 * 06aug97	DR	Added some code for a UK message language.  Assume
 *			that theoretically the message language code be different.
 *	25jun98	mfg Added Latin American Message language support
 */

#include    "tsr.h"
#include "cnfp.h"

/* #define DEBUG */

/*
 * The dtpc bpb table has 4 consecutive unsigned char elements based at the
 * address pointed to by the INT 65h pointer, each element looks like:
 *
 *   7   6     5 4   2 1  0
 *     +----+-------+-----+----+
 *     |Ins | Tests | IRQ |I/O |
 *     +----+-------+-----+----+
 *
 * Some macros to extract fields from a table entry and various pointers
 * to 
 */

#define DTPC_CONFIG_OFF     (0)
#define DTPC_CONFIG_SEG     (0x4f)

#define     INST_FIELD(x)               (((x) & 0x80) >> 7)
#define     TESTS_FIELD(x)          (((x) & 0x60) >> 5)
#define     IRQ_FIELD(x)                (((x) & 0x1c) >> 2)
#define     IO_FIELD(x)                 ((x) & 0x03)

/*
 * Some macros to *insert* fields into an unsigned char
 */

#define DO_INST_SET(old,val)            (((old) & 0x7f) | ((val) << 7))
#define DO_TESTS_SET(old,val)       (((old) & 0x9f) | ((val) << 5))
#define DO_IRQ_SET(old,val)             (((old) & 0xe3) | ((val) << 2))
#define DO_IO_SET(old,val)          (((old) & 0xfc) | (val))

/*
 *  valid bases, irqs, vectors, and bios addresses are listed below ...
 */

unsigned int bases[] = { 0x240, 0x250, 0x340, 0x350 };
unsigned int dbases[] = { 240,250,340,350 };/*eab to make conversion easy */
unsigned int vectors[] = { 0x00,0x00,0x00,0x0b,0x0c,0x0d,0x0e,0x0f};
unsigned int bios_addr[] = { 0xc000, 0xc800, 0xd000, 0xd800 };

/*
 *  free arrays are used to mark which bases, irq's and bios addresses
 *  look free ...
 */

volatile unsigned int free_bios[4];
volatile unsigned int free_base[4];
volatile unsigned int free_irq[8];

/*
 *
found arrays are used to search for existing DECtalk modules and
 *  configure them in.
 */

volatile unsigned int found_base[4];
volatile unsigned int found_irq[4];
volatile int    module_ints;
volatile int    irq;

#define NO_MODULE       (0)
#define IN_SELF_TEST    (1)
#define IN_INIT         (2)
#define FOUND_IRQ       (3)

/*
 *  various static configuration data is made global so everyone can
 *  access it ...
 */

unsigned int            dt_base;        /* base address for current module */
unsigned int            dt_status;
signed int io_addr = -1;
unsigned  int total_modules = 0;

void (__interrupt __far *old_int1c)();      /* timer thread */
volatile unsigned int ticks;
int temp = 0;
int flag = 0;

unsigned int message_language = US_MESSAGE_LANGUAGE;/* selected language for messages*/

main(int argc,char *argv[])
{
    int i;
    int valid;

    if(argc > 3)
      {
        usage();
      exit(1);
      }

    for(i=0;i<4;i++)
        {
        found_base[i] = NO_MODULE;
        found_irq[i] = 0;
        }

    if(argc == 1)
        {
        if(show_dtpcs(true))
            exit(0); 

#ifdef DEBUG
    printf("DEBUG- When using the -b option, should not get here!\n");
    printf("DEBUG- Should have exited.\n");
#endif

        old_int1c = _dos_getvect((unsigned)0x1c);
        _dos_setvect(0x1c, config_timer);
        find_bases();
        set_config();
        _dos_setvect(0x1c, old_int1c);
      if (temp)        /* if no modules are found */
         exit(1);
      if (flag == 0)
         usage();
        exit(0);
        }

   for (i = 1; i < argc; i++)
        {
    if ((argv[i][0] == '-') || (argv[i][0] == '/'))
            {
            switch(toupper(argv[i][1]))
            {
                case    'C' :
                    show_dtpcs(false);
                    exit(0);

            case    'M' :
                    usage();
                    exit(0);


                case    'I' :
                    old_int1c = _dos_getvect(0x1c);
                    _dos_setvect(0x1c, config_timer);
                    printf("Attempting to initialize and install DECtalk PC modules.");
                    printf("\nThe system may hang during this test if the modules are");
                    printf("\n  improperly installed.  Wait at least 1 minute and remove");
                    printf("\n  the DECtalk PC module if this happens.\n");
                    find_bases();
                    set_config();
                    _dos_setvect(0x1c, old_int1c);
                    exit(0);

                case    'R' :
                    find_free();
                    show_free();
                    recommed_switches();
                    exit(0);
                
                case    'B' :
                    /*install a module at a specified address */
                    /* In explicit address mode no parameters are passed in
                        the parameter area of memory. This solves a problem
                        when come other software is writing into that area.
                        As a consequence DT_conf soley verifies that the address
                        is legit. DT_CONF as a whole is now a noop, it supports -b
                        to avoid confusion trying to tel people how to do an explicit load.*/

                    valid = 0;
                    i+= 1;
                    io_addr = atoi(&argv[i][0]);
                    for (i=0;i<4;i++)
                        {
                        if (io_addr == (signed int)dbases[i])
                            {
                            io_addr = i;
                            valid=1;
                            break;
                            }
                        }
                    if(!valid)
                        {
                        printf("\nIllegal I/O base address of %d requested, exiting.\n",io_addr);
                        exit(1);
                        }
                    if(show_dtpcs(true))
                        exit(0);
                    old_int1c = _dos_getvect((unsigned)0x1c);
                    _dos_setvect(0x1c, config_timer);
                    set_config();
                    _dos_setvect(0x1c, old_int1c);
                    exit(0);
    
            case    'S' :       /* Select a Message Language */
                    if((argv[i+1][0] != '-') && (argv[i+1][0] != '/') && (i+1 != argc))
                        {
                        i+= 1;
                        if((toupper(argv[i][0]) == 'U') &&
                            (toupper(argv[i][1]) == 'S')) {
                            message_language = US_MESSAGE_LANGUAGE;
                            }
                        else if((toupper(argv[i][0]) == 'S') &&
                            (toupper(argv[i][1]) == 'P')) {
                            message_language = SP_MESSAGE_LANGUAGE;
                            }
                        else if((toupper(argv[i][0]) == 'L') &&
                            (toupper(argv[i][1]) == 'A')) {
                            message_language = LA_MESSAGE_LANGUAGE;
                            }
                        else if((toupper(argv[i][0]) == 'G') &&
                            (toupper(argv[i][1]) == 'R')) {
                            message_language = GR_MESSAGE_LANGUAGE;
                            }
                        else if((toupper(argv[i][0]) == 'F') &&
                            (toupper(argv[i][1]) == 'R')) {
                            message_language = FR_MESSAGE_LANGUAGE;
                            }
                        else if((toupper(argv[i][0]) == 'U') &&
                            (toupper(argv[i][1]) == 'K')) {
                            message_language = UK_MESSAGE_LANGUAGE;
                            }
                        else
                            {
                            printf("\nCNF-E-Bad set message language value; %c%c specified.\n",
                                                    toupper(argv[i][0]), toupper(argv[i][1]));
                            usage();
                            }
                        }
                    break;

             default:
                    usage();
               exit(1);
                }
            }
        }
        return (0);
}

usage()
{
    printf("Valid switches (one per use).\n");
    printf("  -C  ... show initialized DECtalk modules.\n");
    printf("  -I  ... find and initialize modules.\n");
    printf("  -B nnn  find and initialize module at I/O base address nnn.\n");
    printf("  -R  ... recommend switch settings.\n");
    printf("  -M  ... show the valid switches.\n");
    printf("  -S aa  ... Selects language for messages; US default.\n");
    printf("               where aa is:\n");
    printf("                  US: American English.\n");
    printf("                  SP: Spanish.\n");
    printf("                  GR: German.\n");
    printf("                  FR: French.\n");
    printf("                  UK: British English. \n");
    exit(1);
}
/******************************************************************
 *                      show installed routines
 ******************************************************************/
                                                                
int show_dtpcs(int quiet)
/*int quiet;*/
{

    unsigned char _far *bpb;
    int i;

    FP_SEG(bpb) = DTPC_CONFIG_SEG;
    FP_OFF(bpb) = DTPC_CONFIG_OFF;

    if (io_addr != -1)   /*eab add in hard address call off */
        {
        printf("\nInitialization of a module at I/O base address %d requested.",dbases[io_addr]);
        return(1); /*eab*/
        }

#ifdef DEBUG
    printf("DEBUG- When using the -b option, should not get here!\n");
    printf("DEBUG- io_addr is: %d.\n",io_addr);
#endif

    total_modules = 0;
    for(i=0;i<4;i++)
        /*
         * In the code below, if a specific base address is
         * provided only check the single address specified.
         * If you check all 4 possible valid addresses you
         * might corrupt the SCSI2 mail box of a CDROM device.
         * 17-JAN-1995 cjl.
         */
        if (INST_FIELD(*(bpb+i)))
            {
            if(quiet == false)
                {
                if(total_modules == 0)
                 /* printf("DECtalk PC initialized modules are ");*/
                printf("Module %d at I/O base address %03X.\n",total_modules,bases[IO_FIELD(*(bpb+i))]);
                }
            total_modules += 1;
            }
    if(quiet == false)
        {
        if(total_modules == 0)
            printf("No initialized modules found.");
        else if(total_modules == 1)
            printf("Total of 1 module found.");
        else printf("Total of %d modules found.");
        }
    return(total_modules);
}

/******************************************************************
 *                      configuration routines
 ******************************************************************/

/*
 *  find_free() looks for unused irq, base, and bios addresses ...
 */

void find_free()
{
    unsigned char imr;
    int i;
    unsigned int offset;

    imr = inp(0x21);
    for(i=3;i<7;i++)
        {
        if(imr & (1<<i))
            free_irq[i] = true;
        else
            free_irq[i] = false;
        }

/*
 *  base addresses basically rule out things but can not be sure if
 *  there is anything there, so give it a shot ...  assign 2 for strong
 *  guess, 1 for probably not, and 0 for may be.
 */

    for(i=0;i<4;i++)
        {
/*
 *  assume that it is not there and add up probable bus float states
 */
        free_base[i] = 0;
        if(inp(bases[i]) == (signed int) bases[i])
            free_base[i] += 2;
        else if(inp(bases[i]) == 0xff)
            free_base[i] += 1;
        else if(inp(bases[i]) == 0x00)
            free_base[i] += 1;
        else if(inp(bases[i]) != inp(bases[i]))
            free_base[i] += 1;
        else if((inp(bases[i]) == inp(bases[i]+1)) &&
                    (inp(bases[i]) == inp(bases[i]+2)) &&
                      (inp(bases[i]+1) == inp(bases[i]+2)))
            free_base[i] += 1;
        }

/*
 *  bios addresses are a bit tricky ...
 */

    free_bios[0] = false;
    for(i=1;i<4;i++)
        {
        free_bios[i] = true;
        for(offset = 0x0; offset != 0x800; offset += 0x80)
            {
/*
 *  first check to see if there are any bios's in the way, if there are
 *  any (no matter what size) is the range for this module, abort.  If
 *  there is one below that will creep up to this size then abort.
 */
            if(check_bios(bios_addr[i]+offset))
                {
                free_bios[i] = false;
                break;
                }
            if(check_bios(bios_addr[i]-offset) > offset)
                {
                free_bios[i] = false;
                break;
                }
/*
 *  if there is a ram buffer in the range we want, then abort too ...
 */
            if(check_ram(bios_addr[i]+offset))
                {
                free_bios[i] == false;
                break;
                }
            }
        }
}

/*
 *  check_bios() looks for a valid signature at offset and returns the size
 *  in paragraphs of the part ...
 */

unsigned int check_bios(offset)
unsigned int offset;
{
    unsigned char _far *bios;

    FP_SEG(bios) = offset;
    FP_OFF(bios) = 0;
    if(*bios == 0x55 && *(bios+1) == 0xaa)
        return(((unsigned int)*(bios+2))*0x20);
    else
       return(0);
}
    
/*
 *  check_ram() looks for ram at the desired address ...
 */

int check_ram(offset)
unsigned int offset;
{
    unsigned char _far *bios;
    unsigned char temp,dummy;
    int ram;

    FP_SEG(bios) = offset;
    FP_OFF(bios) = 0;
    ram = false;

    _disable();
    temp = *bios;
    *bios = 0x55;
    dummy = *(bios+1);
    if(*bios == 0x55)
        {
        *bios = 0xaa;
        dummy = *(bios+2);
        if(*bios == 0xaa)
            ram = true;
        }
    *bios = temp;
    _enable();
    return(ram);
}
    
/*
 *  show_free() shows the free irq and bios addresses on the system ...
 */

show_free()
{
    int i;
    int found_free;

/*
    found_free = 0;
    for(i=0;i<4;i++)
        if(free_bios[i] == true)
            found_free += 1;
    if(found_free)
        {
        if(found_free > 1)
            printf("Free bios addresses are");
        else
            printf("Free bios address is");
        for(i=0;i<4;i++)
            if(free_bios[i] == true)
                {
                found_free -= 1;
                printf(" %04X",bios_addr[i]);
                if(found_free)
                    printf(",");
                else
                    printf(".\n");
                }
        }
    else
        printf("No bios addresses are available.\n");
*/

    found_free = 0;
    for(i=0;i<4;i++)
        if(free_base[i])
            found_free += 1;
    if(found_free)
        {
        if(found_free > 1)
            printf("Free I/O base addresses are");
        else
            printf("A Free address is");
        for(i=0;i<4;i++)
            if(free_base[i])
                {
                found_free -= 1;
                printf(" %03X",bases[i]);
                if(free_base[i] >= 2)
                    printf("[*]");
                if(found_free)
                    printf(",");
                else
                    printf(".");
                }
        }
    else
        printf("No I/O base address are sure to be free.\n");

/*    don't use irq stuff
    found_free = 0;
    for(i=3;i<7;i++)
        if(free_irq[i] == true)
            found_free += 1;
    if(found_free)
        {
        if(found_free > 1)
            printf("\n  Free irqs are");
        else
            printf("\n  Free irq is ");
        for(i=3;i<7;i++)
            if(free_irq[i] == true)
                {
                found_free -= 1;
                printf(" %d",i);
                if(found_free)
                    printf(",");
                else
                    printf(".");
                }
        }
    else
        printf("\n  No irqs are free.");
*/
return (0);
}

/*
 *  recommend_switches() is used to advise the user on how to set the
 *  module jumpers ...
 */

recommed_switches()
{
    char *switches[10];

    unsigned int chosen_irq,chosen_base,chosen_bios;
    int move_irq,move_base,move_bios;
    int i;

/*  printf("\nRecommended switch settings are ");*/

/*
 *  default all the switcheses off ...
 */

    for(i=1;i<10;i++)
        switches[i] = "off ";
/*
 *  basically try all the factory defaults first then change to the
 *  next lowest free setting.
 */

    chosen_irq = chosen_base = chosen_bios = 0;
    move_irq = move_base = move_bios = 0;

/*
 *  irq settings ...

    if(free_irq[3] == true)
        {
        switches[1] = " on ";
        chosen_irq = 3;
        }
    else
        {
        for(i=3;i<7;i++)
            {
            if(free_irq[i])
                {
                switches[i-2] = " on ";
                chosen_irq = i;
                break;
                }
            }
        }
    if(chosen_irq == 0)
        {
        move_irq = true;
        chosen_irq = 3;
        switches[1] = " on ";
        }
*/

/*
 *  base settings ...
 */

    if(free_base[0] == true)
        {
        chosen_base = bases[0];
        }
    else if(free_base[1] == true)
        {
        chosen_base = bases[1];
        switches[6] = " on ";
        }
    else if(free_base[2] == true)
        {
        switches[7] = " on ";
        chosen_base = bases[2];
        }
    else if(free_base[3] == true)
        {
        chosen_base = bases[3];
        switches[6] = " on ";
        switches[7] = " on ";
        }
    else
        {
        chosen_base = bases[0];
        move_base = true;
        }
        
/*
 *  bios settings ...

    if(free_bios[1] == true)
        {
        switches[8] = " on ";
        chosen_bios = bios_addr[1];
        }
    else if(free_bios[0] == true)
        {
        chosen_bios = bios_addr[0];
        }
    else if(free_bios[2] == true)
        {
        chosen_bios = bios_addr[1];
        switches[9] = " on ";
        }
    else if(free_bios[3] == true)
        {
        chosen_bios = bios_addr[3];
        switches[8] = " on ";
        switches[9] = " on ";
        }
    else
        {
        switches[8] = " on ";
        chosen_bios = bios_addr[1];
        move_base = true;
        }
*/

/*
 * print out the data ...
 */
    printf("\n  ++-------------------++------++-------++");
    printf("\n  ||                   || I/O  ||       ||");      
    printf("\n  ++-------------------++------++-------++");
    printf("\n  || 01  02  03  04  05  06  07  08  09 ||");      
    printf("\n  ++------------------------------------++");
    printf("\n  ||");
    for(i=1;i<10;i++)
        printf("%s",switches[i]);
    printf("||");
    printf("\n  ++------------------------------------++");
    printf("\n              I/O base address %03X.",chosen_base);
    if(move_base)
        {
        printf("\nThese settings will cause a conflict with another module in");
        printf("\n  this system.  That or some other module must be removed before");
        printf("\n  the DECtalk PC can be installed.");
        }
        return (0);
}

/******************************************************************
 *                      installation routines
 ******************************************************************/

/*
 *  find_base() searches the valid bases for a DECtalk module.  If none
 *  if a module is found, it is initialized.
 */

void find_bases()
{
    int i,done;

/*
 *  first, look at all the bases
 */

    for(i=0;i<4;i++)
        {
        dt_base = bases[i];
    get_status();
        if( io_addr == -1 || i == io_addr)/*    force address   if explicit*/
            {
            switch(dt_status)
                {
                case MODULE_self_test:
                    found_base[i] = IN_SELF_TEST;
                    break;
                case MODULE_init:
                    found_base[i] = IN_INIT;
                    break;
                }
            }
        }

/*
 *  now, init all the non-responders ...
 */

    for(i=0;i<4;i++)
        if(found_base[i] == NO_MODULE)
            {
            dt_base = bases[i];
            if(io_addr == -1 || io_addr == i)
                {
                put_command(MODULE_reset);
                }
            }

/*
 *  now, wait one second for every one to either be in init or selftest
 */
        ticks = 1*DOS_TPS;
        while(ticks)
            {
            for(i=0;i<4;i++)
                if(found_base[i] == 0)
                    {
                    dt_base = bases[i];
                    get_status();
                    switch(dt_status) {

                        case MODULE_self_test:
                            found_base[i] = IN_SELF_TEST;
                            break;

                        case MODULE_init:
                            found_base[i] = IN_INIT;
                            break;
                        }
                    }
            }
/*
 *  now, wait up to 15 seconds for all selftests to finish
 */
        ticks = 15*DOS_TPS;
        while(ticks)
            {
            done = true;
            for(i=0;i<4;i++)
                if(found_base[i] == IN_SELF_TEST)
                    {
                    dt_base = bases[i];
                    get_status();
                    if(dt_status == MODULE_init)
                        found_base[i] = IN_INIT;
                    else
                        done = false;
                    }
            if(done)
                break;
            }
}

/*
 *  find_irqs() finds the irq vectors for the bases that are set to the
 *  self test flag state in the found_base() routine.
 */

void find_irqs()
{
    int i,j,added_one;
    unsigned char imr,irr,check_bit,entry_imr;
    void (__interrupt __far *old_int)();

    for(i=0;i<4;i++)
        found_irq[i] = 0;

    _disable();
    entry_imr = inp(0x21);
    _enable();

    do  {
        added_one = false;
        for(i=0;i<4;i++)
            {
            if(found_base[i] == IN_INIT && found_irq[i] == 0)
                {
                dt_base = bases[i];
/*
 *  force a status state ...
 */
                if(force_status() != SUCCESS)
                    {
                    continue;
                    }
/*
 *  disable all interrupts temporarily to force the module set an irr
 *  bit ...
 */
                _disable();
                outp(0x21,0x7c);
                for(j=0;j<4;j++)
                    if(found_base[j] == IN_INIT)
                        inp(bases[j]+6);
                _enable();

                for(j=0;j<3;j++)
                    {
                    put_command(CMD_reset);
                    if(wait_mode(1,MODE_status) == FAILURE)
                        {
                        break;
                        }
                    put_command(CMD_test | TEST_isa_int);
                    if(wait_mode(1,MODE_test) == FAILURE)
                        {
                        break;
                        }
                    _disable();
                    outp(0x20,0x0a);
                    irr = inp(0x20);
                    _enable();
                    if(irr & 0x7c)
                        break;
                    }
                if((irr & 0x7c) == 0)
                    {
                    continue;
                    }
    
/*
 *  now one of the irr bits should be set, scan the set ones enableing
 *  one at a time in the imr until we find the correct irq ...
 */
                for(irq = 3; irq < 8; irq++)
                    {
                    check_bit = (1 << irq);
                    if(irr & check_bit)
                        {
                        _disable();
                        module_ints = 0;
                        old_int = _dos_getvect(vectors[irq]);
                        _dos_setvect(vectors[irq], config_catch);
                        outp(0x21,((imr|0x7c)&(~check_bit)));
                        _enable();
                        for(j=1;j<=5;j++)
                            {
                            put_command(CMD_test | TEST_isa_int);
                            if(wait_mode(1,MODE_test) == FAILURE)
                                {
                                break;
                                }
                            ticks = 1*DOS_TPS;
                            while(ticks != 0 && (module_ints < j));
                            if(module_ints < j)
                                break;
                            put_command(CMD_reset);
                            if(wait_mode(1,MODE_status) == FAILURE)
                                {
                                break;
                                }
                            }
                        _disable();
                        outp(0x21,entry_imr);
                        _dos_setvect(vectors[irq], old_int);
                        inp(dt_base+6);
                        _enable();
                        if(module_ints >= 3)
                            {
                            found_irq[i] = irq;
                            added_one = true;
                            break;
                            }
                        }
                    }
                put_command(CMD_reset);
                }
            }
        } while(added_one);
    _disable();
    outp(0x21,entry_imr);
    _enable();
}


/*
 *  set_config() builds the configuration byte for each of the modules.
 *  based on what is set ind the found_base[] and found_irq[] arrays.
 */

set_config()
{
    unsigned char _far *bpb;
    int i,total_modules;

    printf("\nInitializing DECtalk PC modules. ");
    FP_SEG(bpb) = DTPC_CONFIG_SEG;
    FP_OFF(bpb) = DTPC_CONFIG_OFF;
/*
 *  first wipe clear the config bytes ...
 */
    
    for(i=0;i<4;i++)
        *(bpb+i) = 0;
/*
 *  now add in the found modules ...
 */

    total_modules = 0;
    for(i=0;i<4;i++)
        {
            
        if(found_base[i] == IN_INIT)
            {
            if (io_addr == -1 )
                {
                *(bpb+i) = DO_INST_SET((*(bpb+i)),1);
                *(bpb+i) = DO_IO_SET((*(bpb+i)),i);
                *(bpb+i) = DO_IRQ_SET((*(bpb+i)),found_irq[i]);
                printf("\nAdding module at I/O base address %03X.",bases[i]);
                total_modules += 1;
                }
            else
                {
                if ( found_base[io_addr] == IN_INIT)
                    {
                    printf("\nAdding module at I/O base address %03X",bases[i]);
                    total_modules += 1;
                    }

                }

            }
        }   
    if(total_modules == 0)
      {
        printf("\nCould not initialize modules.  Check your system.\n");
      temp = 1;
      }
    else if(total_modules == 1)
        printf("\nOne module initialized.");
    else  printf("\nTotal of %d modules initialized.\n",total_modules);
   flag = 1;
   return (0);
}

void __interrupt __far config_catch(int_frame)
union   INT_REGS    int_frame;
{
    int i;
    _disable();
    for(i=0;i<4;i++)
        if(found_base[i] == IN_INIT)
            inp(bases[i]+6);
    outp(0x20,0x60+irq);
    module_ints += 1;
    _enable();
}
/*
 * use timer ticks to count up clock time ...
 */

void __interrupt __far config_timer(int_frame)
union   INT_REGS    int_frame;
{

    if(ticks)
        ticks -= 1;
    _chain_intr(old_int1c);
}

/*
 *  status from the module is read this way ...
 */

void get_status()
{
    if (io_addr == -1 || io_addr == (signed int)dt_base)
        {
        dt_status = (inp(dt_base+1)<<8) + inp(dt_base+0);
        }
    else dt_status=0;

}

/*
 *  write a command word to the module ... clear the flag bits in the
 *  status word to allow them to be updated by the isr ...
 */

void put_command(cmd)
unsigned int cmd;
{
    outp((dt_base+0),cmd&0xff);
    outp((dt_base+1),((cmd&0xff00)>>8));
    
}

int wait_bit(secs,bit)
int secs;
unsigned int bit;
{
    ticks = secs*DOS_TPS;
    while(ticks)
        {
        get_status();
        if(dt_status & bit)
            return(SUCCESS);
        }
    return(FAILURE);
}

int wait_mode(secs,pattern)
int secs;
unsigned int pattern;
{
    ticks = secs*DOS_TPS;
    while(ticks)
        {
        get_status();
        if((dt_status & MODE_mask) == pattern)
            return(SUCCESS);
        }
    return(FAILURE);
}       

force_status()
{
    put_command(CMD_reset+1);
    if(wait_mode(1,MODE_status) == SUCCESS)
        return(SUCCESS);
    put_command(CMD_null+1);
    if(wait_mode(1,MODE_status) == SUCCESS)
        return(SUCCESS);
    put_command(CMD_reset+2);
    if(wait_mode(1,MODE_status) == SUCCESS)
        return(SUCCESS);
    put_command(CMD_null+2);
    if(wait_mode(1,MODE_status) == SUCCESS)
        return(SUCCESS);
    return(FAILURE);
}


