#define get_long(ptr) ((unsigned long)\
                       ((((unsigned char*)(ptr))[0] << 24) | \
                       (((unsigned char*)(ptr))[1] << 16) | \
                       (((unsigned char*)(ptr))[2] << 8)  | \
                       (((unsigned char*)(ptr))[3])))

#define get_treble(ptr) ((unsigned long)\
                        ((((unsigned char*)(ptr))[0] << 16) | \
                         (((unsigned char*)(ptr))[1] << 8)  | \
                         (((unsigned char*)(ptr))[2])))
                       
#define get_short(ptr) ((unsigned short)\
                       ((((unsigned char*)(ptr))[0] << 8)  | \
                        (((unsigned char*)(ptr))[1])))
                        
#define get_byte(ptr) (((unsigned char*)(ptr))[0])

#define get_slong(ptr) (signed long)(\
				(get_long((ptr)) > 0x7FFFFFFF) ?\
                                (((signed long)(get_long((ptr)) & 0x7FFFFFFF)) - 0x80000000):\
                                ((signed long)(get_long((ptr))))\
                                )

#define get_streble(ptr) (signed long)(\
				(get_treble((ptr)) > 0x7FFFFF) ?\
                                (((signed long)(get_treble((ptr)) & 0x7FFFFF)) - 0x800000):\
                                ((signed long)(get_treble((ptr))))\
                                )

#define get_sshort(ptr) (signed short)(\
				(get_short((ptr)) > 0x7FFF) ?\
                                (((signed short)(get_short((ptr)) & 0x7FFF)) - 0x8000):\
                                ((signed short)(get_short((ptr))))\
                                )

#define get_sbyte(ptr) (signed char)(\
				(get_byte((ptr)) > 0x7F) ?\
                                (((signed char)(get_byte((ptr)) & 0x7F)) - 0x80):\
                                ((signed char)(get_byte((ptr))))\
                                )

#define set_long(ptr,val) ((((unsigned char*)(ptr))[0] = (((unsigned long)(val)) >> 24) & 0xff), \
		          (((unsigned char*)(ptr))[1] = (((unsigned long)(val)) >> 16) & 0xff), \
		          (((unsigned char*)(ptr))[2] = (((unsigned long)(val)) >> 8) & 0xff), \
		          (((unsigned char*)(ptr))[3] = (((unsigned long)(val)) >> 0) & 0xff))

#define set_slong(ptr,val) set_long((ptr),((unsigned long)(\
                            (((signed long)(val)) < 0) ?\
                            ((unsigned long)(((signed long)(val)) + 0x80000000) | 0x80000000) :\
                            (val)\
                           )))

#define set_treble(ptr,val) ((((unsigned char*)(ptr))[0] = (((unsigned long)(val)) >> 16) & 0xff), \
		             (((unsigned char*)(ptr))[1] = (((unsigned long)(val)) >> 8) & 0xff), \
		             (((unsigned char*)(ptr))[2] = (((unsigned long)(val)) >> 0) & 0xff))

#define set_streble(ptr,val) set_treble((ptr),((unsigned long)(\
                            (((signed long)(val)) < 0) ?\
                            ((unsigned long)(((signed long)(val)) + 0x800000) | 0x800000) :\
                            (val)\
                           )))

                       
#define set_short(ptr,val) ((((unsigned char*)(ptr))[0] = (((unsigned short)(val)) >> 8) & 0xff), \
		            (((unsigned char*)(ptr))[1] = (((unsigned short)(val)) >> 0) & 0xff))

#define set_sshort(ptr,val) set_short((ptr),((unsigned short)(\
                            (((signed short)(val)) < 0) ?\
                            ((unsigned short)(((signed short)(val)) + 0x8000) | 0x8000) :\
                            (val)\
                           )))

#define set_byte(ptr,val) (((unsigned char*)(ptr))[0]=(val))

#define set_sbyte(ptr,val) set_byte((ptr),((unsigned char)(\
                            (((signed char)(val)) < 0) ?\
                            ((unsigned char)(((signed char)(val)) + 0x80) | 0x80) :\
                            (val)\
                           )))

#define char4(c1,c2,c3,c4) (((c1)<<24)|((c2)<<16)|((c3)<<8)|(c4))

