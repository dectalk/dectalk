#ifndef PHP_H
#define PHP_H
extern	int syl_find_vowel(int *ph);
extern	int syl_find_cons(int *ph);
extern	int syl_find_affix(int *ph);
extern	void logsyllable(void);
extern	void saysyllable(void);
extern	int ph_syllab(int j);
extern	int logascky(unsigned int *s);
extern	int syl_clause_init(void);
extern	int speak_syllable(void);
extern	int phalloph(void);
extern	short remaining_stresses_til(short msym,short b_type);
extern	short promote_last_2(short msym);
extern	void make_out_phonol(void );
extern	int prphonol(void);
extern	void phclause(void);
extern	int init_clause(void);
extern	int init_phclause(void);
extern	int init_pars(void);
extern	int exit_if_done(void);
extern	void send_pars(void );
extern	void send2_pars(void);
extern	int phdraw(void);
extern	int pht0draw(void);
#ifndef MINIMAL_SYNTH
extern	int set_user_target(void);
#endif
extern	int set_tglst(void);
extern	int filter_commands(void);
#ifndef MINIMAL_SYNTH
extern	int linear_interp(void);
#endif
extern	int phinton(void);
extern	int firstfeature(short FEA1,short FEA2,short nseg);
static	int make_f0_command(short rulenumber,short tar,short delay);
extern	int main(unsigned int data_seg,unsigned int stack_start);
extern	int kltask(void);
extern	void speak_now(void);
extern	int deadstop(int value,int low,int high);
//extern	int readphone(short *buf);
extern  int readphone(short buf[],short *input_phone);
extern	int mstofr(int nms);
extern	int phsort(void);
extern	int interp_user_f0(void);
extern	void init_med_final(short msym);
extern	void get_stress_of_conson(short msym);
extern	short phcluster(short f,short s);
extern	void get_next_bound_type(short msym);
extern	void move_stdangle(short msym);
extern	int is_wboundary(short symb);
#ifndef MINIMAL_SYNTH
extern	void find_syll_to_stress(short locend);
#endif
extern	void insertphone(short loc,short fone);
extern	void raise_last_stress(short msym);
extern	void zap_weaker_bound(short msym1,short msym2);
extern	void delete_symbol(short msym);
extern	void make_phone(short phoname);
extern	void add_feature(short feaname,short location);
extern	int phtiming(void);
extern	int init_timing(void);
#ifndef OLD_GARBAGE
extern	int prdurs(int n);
extern	int prphdurs(void);
#endif
extern	void setparam(int which,int value);
extern	int usevoice(int voice);

extern	int saveval(void);

extern	int setspdef(void);
extern	int phsettar(void);
extern	short getbegtar(short nfone);
extern	short getendtar(short nfone);
extern	short gettar(short nphone_temp);
extern	void make_dip(short pdip);
extern	short special_coartic(short nfon,short diphpos);
extern	short setloc(short nfonobst,short nfonsonor,char initfinso,short nfonvowel);
extern	int vv_coartic_across_c(short remoteV,short remotetar,short currentV,short currenttar,short middleC,short dur_cons);
extern	int forw_smooth_rules(void);
extern	int back_smooth_rules(void);
extern	int special_rules(void);
//extern	int get_phone(short pointer);
//extern	int shrdur(short durin);
//extern	int debugforward(char *message,struct Parameters *nparameter);
//extern	int debugbackward(char *message,struct Parameters *nparameter);
extern	int init_variables(void);
extern	int debug1(void);
#endif
