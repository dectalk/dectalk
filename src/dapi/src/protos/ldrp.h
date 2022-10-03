extern	int main(int argc,char **argv );
extern	int load_scan(int argc,char **argv );
extern	int load_exe(struct _iobuf *fexe,unsigned long load_addr,char *read_buff,struct dos_reloc *fixups);

extern	int load_dic(struct _iobuf *fdic,char *read_buff,char *name,int kind,int lang);
extern	int set_dic(long addr,long ents,int kind,int lang);

extern	int load_mem(long addr,char __far *buff,int size);
extern	int start_exe(unsigned int cs,unsigned int ip);
extern	unsigned long get_mem(unsigned int size);
extern	unsigned int get_mod_id(void);
extern	unsigned int get_ss(void);
extern	void kernel_load(struct _iobuf *fexe,char *read_buff,struct dos_reloc *fixups);
extern	unsigned int get_status(void);
extern	void put_command(unsigned int cmd);
extern	int wait_bit(int secs,unsigned int bit);
extern	int wait_pattern(int secs,unsigned int pattern);
extern	void __far __interrupt ldr_timer(union INT_REGS int_frame);
extern	int error_load(char *s);
extern	int wait_init(int retry,int reset);
extern	int wait_ticks(int tocks);
extern	void parse_switch(int argc,char **argv );
extern	int usage(void);
extern	int tsr_error(char *str);
