extern	void set_index_allo(unsigned int nphone,unsigned int nallo);
extern	int putstring(unsigned char *str);
extern	unsigned short p_putstring(unsigned char *str);
extern	void logclaus(short *sym,short nsym,short *ud,short *uf0);
extern	void logitem(short *buf);
extern	void dologphoneme(short phone,short dur,short f0);
extern	int putseq(struct SEQ __far *sp);
extern	void putc(unsigned int c);
extern	unsigned short p_putc(unsigned int c);
extern	int putn(unsigned int n);
extern	int vol_set(int count);
extern	int vol_up(int count);
extern	void spcwrite(unsigned int __far *spc_data);
extern	void writeDMAreg(unsigned short addr,unsigned short data);
extern	unsigned short readDMAreg(unsigned short addr);
extern	void start_flush(int serial_mode);
extern	void __far send_index(int how,int value);
extern	void default_lang(unsigned int lang_code,unsigned int ready_code);
extern	void adjust_index(unsigned int which,int direction,int del);
extern	void adjust_allo(unsigned int which,int direction);
extern	void spc_clock(unsigned char state);
extern	int reset_spc(void );
extern	void dsp_sleep(void);
extern	void dsp_wakeup(void);
extern	void sysclk_on_off(unsigned short state);
extern	void set_index_phone(unsigned int nsym,unsigned int nphone);
extern	void serial_update(void);
extern	int status_abs(unsigned int bits);
extern	void save_index(unsigned int sym,unsigned int type,unsigned int value,unsigned int how);
extern	void flush_done(void);
extern	unsigned int getc(void);
extern	unsigned int push_inring(unsigned char *string);
extern	void status_set_update(unsigned int bits);
extern	void status_clear_update(unsigned int bits);
extern	void status_abs_update(unsigned int bits);
extern	void status_toggle_update(unsigned int bits);
extern	void status_toggle(unsigned int bits);
extern	void status_set(unsigned int bits);
extern	void status_clear(unsigned int bits);
extern	int vol_down(int count);
extern	short __far *spcget(unsigned int spc_type);
extern	unsigned int kernel_disable(void );
extern	void kernel_enable(unsigned int flags);
extern	void check_index(unsigned int which_phone);
extern	int __far printf(char __far *format,...);
extern	int convert_number(struct printf_context __far *ptx);
extern	int puthex(unsigned int n);
extern	int port_out_186(unsigned int port,unsigned int value);
extern	int port_in_186(unsigned int port);
extern	unsigned char set_gpio(unsigned char bits);
extern	unsigned char read_gpio(void);
extern	unsigned char clear_gpio(unsigned char bits);