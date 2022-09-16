#ifdef	SIMULATOR
#define	__far
#define	_far
#define far
#endif

#include "kernel.h"

struct share_data	kernel_share_data;
extern struct share_data *kernel_share = &kernel_share_data;
