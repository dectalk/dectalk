
#include	<stdlib.h>
#include	<string.h>
//#include	"cPlatTypes.h"
#ifndef _WIN32_WCE
#	include	<time.h>
#endif
#include	"csn.h"

#define FNX_STRLEN strlen
#define FNX_STRUPR strupr
#define FNX_TIMESTRUCT int 
#define FNX_TIME time

char *strupr(char *in)
{
	int i;
	while (in[i])
	{
		if (islower(in[i]))
		{
			toupper(in[i]);
		}
		i++;
	}
	return(in);
}


int			addAndAdjust ( int o, int n );
int 		charToOffset ( char c );
char		decodeChar ( char c, int o );
char		encodeChar ( char c, int o );
char		*incrementSerializer ( char *s, int si );
char		offsetToChar ( int o );
int			subAndAdjust ( int o, int n );
int			validateFields ( SNFieldsPtr fields, int type );

SNFields	IFields;

int			TTSNBits = 100;
int			TTSBits[100];

int			ASRNBits = 100;
int			ASRBits[100];

int			FuncNBits = 100;
int			FuncBits[100];



int	addAndAdjust ( int o, int n )
{
	return ( ( o + n ) % 36 );
}

int charToOffset ( char c )
{
	if ( c == 'O' )
		return ( 0 );
	else if ( c == '@' )
		c = 'A';
	else if ( c == '*' )
		c = 'E';
	else if ( c == '$' )
		c = 'I';
	else if ( c == '%' )
		c = 'O';
	else if ( c == '&' )
		c = 'U';
	if ( c > '9' )
	{
		return ( c - 'A' + 10 );
	}
	return ( c - '0' );
}

char	decodeChar ( char c, int o )
{
	return ( offsetToChar ( subAndAdjust ( charToOffset ( c ), o ) ) );
}

char	encodeChar ( char c, int o )
{
	return ( offsetToChar ( addAndAdjust ( charToOffset ( c ), o ) ) );
}

char	*incrementSerializer ( char *s, int si )
{
	int		i, n = (int)FNX_STRLEN ( s ), t = 0;
	for ( i = 0; i < n; i++ )
	{
		t = ( t * 36 ) + charToOffset ( s[i] );
	}
	t += si;
	for ( i = n - 1; n > 0; n-- )
	{
		s[i] = offsetToChar ( t % 36 );
		t /= 36;
	}
	return ( s );
}

char	offsetToChar ( int o )
{
	char	c;
	if ( o > 9 )
		c = ( (char)( o - 10 + 'A' ) );
	else
		c = ( (char)( o + '0' ) );
	if ( c == 'A' )
		c = '@';
	else if ( c == 'E' )
		c = '*';
	else if ( c == 'I' )
		c = '$';
	else if ( c == 'O' )
		c = '%';
	else if ( c == 'U' )
		c = '&';
	return ( c );
}

int	subAndAdjust ( int o, int n )
{
	o -= n;
	while ( o < 0 ) o += 36;
	return ( o );
}


// ret:	error code
//		0 = no error
//		-184 = invalid functionality enabler checksum
//		-185 = invalid asr language enabler checksum
//		-186 = invalid tts language enabler checksum
//		-187 = invalid serializer incrementer
//		-188 = invalid creation date
//		-189 = invalid masterID
//		-190 = invalid flags
//		-191 = invalid channels
//		-192 = invalid expiration
//		-193 = invalid key code
//		-194 = invalid serializer
//		-195 = invalid release code
//		-196 = invalid minor version
//		-197 = invalid major version
//		-198 = invalid product name
//		-199 = invalid product family
//		-200 = invalid field structure pointer
int	validateFields ( SNFieldsPtr fields, int type )
{
	if ( fields == NULL ) return ( INVALID_FIELD );
	if ( ( fields->prodFamily < 'A' ) || ( fields->prodFamily > 'Z' ) ) return ( INVALID_FIELD + 1 );
	if ( ( fields->prodName < 'A' ) || ( fields->prodName > 'Z' ) ) return ( INVALID_FIELD + 2 );
	if ( ( fields->verMajor < 0 ) || ( fields->verMajor > 35 ) ) return ( INVALID_FIELD + 3 );
	if ( ( fields->verMinor < 0 ) || ( fields->verMinor > 35 ) ) return ( INVALID_FIELD + 4 );
	if ( ( fields->relCode < 0 ) || ( fields->relCode > 9 ) ) return ( INVALID_FIELD + 5 );
	if ( ( fields->serializer < 0 ) || ( fields->serializer > 2147483647 ) ) return ( INVALID_FIELD + 6 );
	if ( ( fields->keyCode < 0 ) || ( fields->keyCode > 99 ) ) return ( INVALID_FIELD + 7 );
	if ( ( fields->expiration < 0 ) || ( fields->expiration > 35 ) ) return ( INVALID_FIELD + 8 );
	if ( type == 0 )
	{
		if ( ( fields->channels < 0 ) || ( fields->channels > 1295 ) ) return ( INVALID_FIELD + 9 );
	}
	if ( ( fields->flags < 0 ) || ( fields->flags > 31 ) ) return ( INVALID_FIELD + 10 );

	if ( type > 0 )
	{
		if ( ( fields->channels < 0 ) || ( fields->channels > 60466175 ) ) return ( INVALID_FIELD + 9 );
		if ( ( fields->creationDate < 0001 ) || ( fields->creationDate > 9912 ) ) return ( INVALID_FIELD + 12 );
		if ( ( fields->masterID < 0 ) || ( fields->masterID > 46655 ) ) return ( INVALID_FIELD + 11 );
		if ( ( fields->serializerInc < 0 ) || ( fields->serializerInc > 35 ) ) return ( INVALID_FIELD + 13 );
		if ( ( fields->ttsEnblFactor < 0 ) || ( fields->ttsEnblFactor > 31 ) ) return ( INVALID_FIELD + 14 );
		if ( ( fields->asrEnblFactor < 0 ) || ( fields->asrEnblFactor > 31 ) ) return ( INVALID_FIELD + 15 );
		if ( ( fields->fncEnblFactor < 0 ) || ( fields->fncEnblFactor > 31 ) ) return ( INVALID_FIELD + 16 );
	}

	return ( 0 );
}



#define	BASE_ENABLEKEY_LENGTH		(10)	// number of encode key characters
#define	BASE_SERIALNUMBER_LENGTH	(36)	// number of serial number characters not counting hyphens and decoys
#define	MIN_SERIALNUMBER_LENGTH		(24)	// minimum length of serial number including hyphens and decoys
#define	SERIALNUMBER_LENGTH_1		(24)	// standard serial number length
#define	SERIALNUMBER_LENGTH_2		(37)	// extended master/client serial number length
#define	SERIALNUMBER_LENGTH_3		(41)	// ext m/c serial number with enable code factors

#pragma message ( "Building snDecode" )

int	 snEnablerDecode ( char *enableKey, int *bitArray, int *nBits, int factor, int snChecksum )
{
	char	t[BASE_ENABLEKEY_LENGTH];
	int		cs, tcs, tn, csMod;
	int		i, j, n, nChars, mask;
	if ( ( enableKey == NULL ) || ( bitArray == NULL ) || ( nBits == NULL ) || ( ( factor & 0x01 ) == 0 ) )
	{
		return ( INVALID_ENABLEKEY );
	}
	if ( *nBits <= 0  )
	{
		return ( INVALID_FIELD );
	}
	
	FNX_STRUPR( enableKey ); // Convert the key to uppercase

	factor |= 0x01;
	csMod = factor * snChecksum;
	tcs = ( charToOffset ( enableKey[1] ) ^ factor ) * 10;
	tcs += charToOffset (  enableKey[0] ) ^ factor;
	nChars = strlen ( enableKey );
	cs = enableKey[2];
	cs += enableKey[3];
	tn = ( charToOffset ( enableKey[3] ) ^ factor ) * 36;
	tn += charToOffset ( enableKey[2] ) ^ factor;
	for ( i = 4, j = 0; i < nChars; i++ )
	{
		t[j] = charToOffset ( enableKey[i] ) ^ factor;
		cs += (int)( t[j++] * 3.14F );
	}
	cs += csMod;
	cs = 100 - ( cs % 100 );
	if ( cs == 100 ) cs = 0;
	cs |= 1;
	if ( tcs != cs )
	{
		return ( INVALID_ENABLEKEY );
	}
	n = 0;
	mask = 0x10;
	if ( tn < *nBits )
	{
		*nBits = tn;
	}
	for ( i = 0, j = 0; i < *nBits; i++ )
	{
		bitArray[i] = t[j] & mask ? 1 : 0;
		mask >>= 1;
		n++;
		if ( n > 4 )
		{
			j++;
			n = 0;
			mask = 0x10;
		}
	}
	return ( 0 );
}

// Decode a serial number and get the encoded data
// in:	serialNumber = a pointer to a serial number string to decode
//		fields = a pointer to an SNFields structure to receive the data
// out:	fields = filled in with decoded data
// ret:	error code
//		0 = no error
//		-97 = invalid key code checksum
//		-98 = invalid serial number checksum
//		-99 = invalid serial number length (serial number is shorter than MIN_SERIALNUMBER_LENGTH characters)
//		-184 = invalid functionality enabler checksum
//		-185 = invalid asr language enabler checksum
//		-186 = invalid tts language enabler checksum
//		-187 = invalid serializer incrementer
//		-188 = invalid creation date
//		-189 = invalid masterID
//		-190 = invalid flags
//		-191 = invalid channels
//		-192 = invalid expiration
//		-193 = invalid key code
//		-194 = invalid serializer
//		-195 = invalid release code
//		-196 = invalid minor version
//		-197 = invalid major version
//		-198 = invalid product name
//		-199 = invalid product family
//		-200 = invalid field structure pointer
int	 snDecode ( char *serialNumber, void *f )
{
	int			i, n, o, cs, nt, type;
	char		t[BASE_SERIALNUMBER_LENGTH];
	SNFieldsPtr	fields = (SNFieldsPtr)f;
	
	if ( serialNumber == NULL )
	{
		return ( INVALID_SERIALNUMBER );
	}
	n = (int)FNX_STRLEN ( serialNumber );

	// check serial number length
	if ( n < MIN_SERIALNUMBER_LENGTH ) return ( INVALID_SERIALNUMBER + 1 );
	
	for ( i = 0; i < n; i++ )
	{
		serialNumber[i] = toupper ( serialNumber[i] );
	}

	// get the offset value
	o = charToOffset ( serialNumber[11] );
	
	// decode the base serial number
	t[0] = serialNumber[0];								// product family (A-Z)
	t[1] = serialNumber[1];								// product name	(A-Z)
	t[2] = serialNumber[2];								// major version (0-9,A-Z)
	t[3] = serialNumber[3];								// minor version (0-9,A-Z)
	t[4] = decodeChar ( serialNumber[5], 1 + o );		// release code (0-9)
	t[5] = decodeChar ( serialNumber[10], 5 + o );		// key code checksum (0-9)
	t[6] = decodeChar ( serialNumber[16], 10 + o );		// key code 1 [21] (0-9)
	t[7] = decodeChar ( serialNumber[20], 13 + o );		// key code 2 [21] (0-9)
	t[8] = decodeChar ( serialNumber[6], 2 + o );		// expiration code (0-9,A-Z)
	t[9] = serialNumber[11];							// serializer 1 [654321] (0-9,A-Z)
	t[10] = decodeChar ( serialNumber[21], 14 + o );	// serializer 2 [654321] (0-9,A-Z)
	t[11] = decodeChar ( serialNumber[15], 9 + o );		// serializer 3 [654321] (0-9,A-Z)
	t[12] = decodeChar ( serialNumber[7], 3 + o );		// serializer 4 [654321] (0-9,A-Z)
	t[13] = decodeChar ( serialNumber[12], 7 + o );		// serializer 5 [654321] (0-9,A-Z)
	t[14] = decodeChar ( serialNumber[17], 11 + o );	// serializer 6 [654321] (0-9,A-Z)
	t[15] = decodeChar ( serialNumber[23], 16 + o );	// channels 1 [21] (0-9,A-Z)
	t[16] = decodeChar ( serialNumber[18], 12 + o );	// channels 2 [21] (0-9,A-Z)
	t[17] = decodeChar ( serialNumber[13], 8 + o );		// flags
	t[18] = decodeChar ( serialNumber[8], 4 + o );		// serial number checksum 1 [21] (0-9)
	t[19] = decodeChar ( serialNumber[22], 15 + o );	// serial number checksum 2 [21] (0-9)
	if ( n > SERIALNUMBER_LENGTH_1 )
	{
		t[20] = decodeChar ( serialNumber[25], 17 + o );	// master ID 1 [321] (0-9,A-Z)
		t[21] = decodeChar ( serialNumber[30], 21 + o );	// master ID 2 [321] (0-9,A-Z)
		t[22] = decodeChar ( serialNumber[33], 24 + o );	// master ID 3 [321] (0-9,A-Z)
		t[23] = decodeChar ( serialNumber[26], 18 + o );	// creation date 1 [321] (0-11)
		t[24] = decodeChar ( serialNumber[31], 22 + o );	// creation date 2 [321] (0-9)
		t[25] = decodeChar ( serialNumber[35], 25 + o );	// creation date 3 [321] (0-9)
		t[26] = decodeChar ( serialNumber[27], 19 + o );	// channels 3 [543] (0-9,A-Z)
		t[27] = decodeChar ( serialNumber[32], 23 + o );	// channels 4 [543] (0-9,A-Z)
		t[28] = decodeChar ( serialNumber[36], 26 + o );	// channels 5 [543] (0-9,A-Z)
		t[29] = decodeChar ( serialNumber[28], 20 + o );	// serializer increment (0-9,A-Z)
		if ( n > SERIALNUMBER_LENGTH_2 )
		{
			t[30] = decodeChar ( serialNumber[37], 0 + o );	// tts enable factor (0-9,A-Z)
			t[31] = decodeChar ( serialNumber[40], 1 + o );	// asr enable factor (0-9,A-Z)
			t[32] = decodeChar ( serialNumber[38], 2 + o );	// fnc enable factor (0-9,A-Z)
			nt = 33;
		}
		else
		{
			nt = 30;
		}
	}
	else
	{
		nt = 20;
	}
	
	// calculate the serial number checksum
	for ( i = 0, cs = 0; i < nt; i++ )
	{
		if ( ( i < 18 ) || ( i > 19 ) )
		{
			cs += (int)( (float)charToOffset ( t[i] ) * 3.14F );
		}
	}
	cs = 100 - ( cs % 100 );
	if ( cs == 100 ) cs = 0;
	fields->checksum = cs;
	
	// get the stored serial number checksum
	i = ( charToOffset ( t[19] ) * 10 ) + charToOffset ( t[18] );
	
	// check the serial number checksum
	if ( i != cs ) return ( INVALID_SERIALNUMBER + 2 );
	
	// calculate the key code checksum
	cs = 10 - ( ( ( charToOffset ( t[7] ) * 10 ) + charToOffset ( t[6] ) ) % 10 );
	
	// get the stored key code checksum
	i = charToOffset ( t[5] );
	
	// check the key code checksum
	if ( i != cs ) return ( INVALID_SERIALNUMBER + 3 );
	
	// extract fields
	fields->prodFamily = t[0];
	fields->prodName = t[1];
	fields->verMajor = charToOffset ( t[2] );
	fields->verMinor = charToOffset ( t[3] );
	fields->relCode = charToOffset ( t[4] );
	fields->serializer = 0;
	for ( i = 14; i >= 9; i-- )
	{
		fields->serializer *= 36;
		fields->serializer += charToOffset ( t[i] );
	}
	fields->keyCode = ( charToOffset ( t[7] ) * 10 ) + charToOffset ( t[6] );
	fields->expiration = charToOffset ( t[8] );
	fields->channels = ( charToOffset ( t[16] ) * 36 ) + charToOffset ( t[15] );
	fields->flags = charToOffset ( t[17] );
	if ( n > SERIALNUMBER_LENGTH_1 )
	{
		fields->creationDate = ( ( ( charToOffset ( t[25] ) * 10 ) + charToOffset ( t[24] ) ) * 100 ) + charToOffset ( t[23] );
		fields->channels += ( ( ( ( charToOffset ( t[28] ) * 36 ) + charToOffset ( t[27] ) ) * 36 ) + charToOffset ( t[26] ) ) * 36 * 36;
		fields->masterID = ( ( ( charToOffset ( t[22] ) * 36 ) + charToOffset ( t[21] ) ) * 36 ) + charToOffset ( t[20] );
		fields->serializerInc = charToOffset ( t[29] );
		if ( n > SERIALNUMBER_LENGTH_2 )
		{
			fields->ttsEnblFactor = charToOffset ( t[30] );
			fields->asrEnblFactor = charToOffset ( t[31] );
			fields->fncEnblFactor = charToOffset ( t[32] );
			if ( ( fields->ttsEnblFactor & 0x01 ) == 0 )
			{
				fields->ttsEnblFactor = 0;
			}
			if ( ( fields->asrEnblFactor & 0x01 ) == 0 )
			{
				fields->asrEnblFactor = 0;
			}
			if ( ( fields->fncEnblFactor & 0x01 ) == 0 )
			{
				fields->fncEnblFactor = 0;
			}
		}
		else
		{
			fields->ttsEnblFactor = 0;
			fields->asrEnblFactor = 0;
			fields->fncEnblFactor = 0;
		}
		type = 1;
	}
	else
	{
		fields->creationDate = 0;
		fields->masterID = 0;
		fields->serializerInc = 0;

		fields->ttsEnblFactor = 0;
		fields->asrEnblFactor = 0;
		fields->fncEnblFactor = 0;

		type = 0;
	}
	
	return ( validateFields ( fields, type ) );
}

#ifndef	DECODE_ONLY
#	pragma message ( "Building snEncode" )

	int	 snEnablerEncode ( int *bitArray, int nBits, int factor, int snChecksum, char *enableKey )
	{
		int		i, j, n;
		int		bits, mask;
		int		cs;
		int		csMod;

		if ( ( bitArray == NULL ) || ( nBits <= 0 ) || ( nBits >= ( BASE_ENABLEKEY_LENGTH - 3 ) * 8 ) || ( enableKey == NULL ) || ( ( factor & 0x01 ) == 0 ) )
		{
			return ( INVALID_ENABLEKEY );
		}
		factor |= 0x01;
		csMod = factor * snChecksum;
		j = 4;
		n = 0;
		mask = 0x10;
		bits = 0;
		for ( i = 0; i < nBits; i++ )
		{
			if ( bitArray[i] )
			{
				bits |= mask;
			}
			mask >>= 1;
			n++;
			if ( n > 4 )
			{
				enableKey[j++] = bits;
				n = 0;
				mask = 0x10;
				bits = 0;
			}
		}
		if ( n > 0 )
		{
			enableKey[j++] = bits;
		}
		enableKey[j] = 0;
		enableKey[2] = offsetToChar ( ( nBits % 36 ) ^ factor );
		cs = enableKey[2];
		enableKey[3] = offsetToChar ( ( nBits / 36 ) ^ factor );
		cs += enableKey[3];
		for ( i = 4; i < j; i++ )
		{
			cs += (int)( (float)enableKey[i] * 3.14F );
			enableKey[i] = offsetToChar ( enableKey[i] ^ factor );
		}
		cs += csMod;
		cs = 100 - ( cs % 100 );
		if ( cs == 100 ) cs = 0;
		cs |= 1;
		enableKey[0] = offsetToChar ( ( cs % 10 ) ^ factor );
		enableKey[1] = offsetToChar ( ( cs / 10 ) ^ factor );
		return ( 0 );
	}

// Encode a serial number with the provided data
// in:	fields = a pointer to a SNFields structure with the data to encode
//		serialNumber = a pointer to a string long enough (SERIALNUMBER_LENGTH) to receive the serial number
// out:	serialNumber = filled in with the encoded serial number (zero terminated)
// ret:	error code
//		0 = no error
//		-184 = invalid functionality enabler factor
//		-185 = invalid asr language enabler factor
//		-186 = invalid tts language enabler factor
//		-187 = invalid serializer incrementer
//		-188 = invalid creation date
//		-189 = invalid masterID
//		-190 = invalid flags
//		-191 = invalid channels
//		-192 = invalid expiration
//		-193 = invalid key code
//		-194 = invalid serializer
//		-195 = invalid release code
//		-196 = invalid minor version
//		-197 = invalid major version
//		-198 = invalid product name
//		-199 = invalid product family
//		-200 = invalid field structure pointer
	int	 snEncode ( void *f, int type, char *serialNumber )
	{
		int			i, o, cs, nt;
		char		t[BASE_SERIALNUMBER_LENGTH];
		SNFieldsPtr	fields = (SNFieldsPtr)f;
		
		if ( serialNumber == NULL )
		{
			return ( INVALID_SERIALNUMBER );
		}

		// validate the fields structure
		i = validateFields ( fields, type );
		if ( i != 0 ) return ( i );
		
		// fill in base serial number string
		t[0] = fields->prodFamily;
		t[1] = fields->prodName;
		t[2] = offsetToChar ( fields->verMajor );
		t[3] = offsetToChar ( fields->verMinor );
		t[4] = offsetToChar ( fields->relCode );
		t[5] = 0;
		t[6] = offsetToChar ( fields->keyCode % 10 );
		t[7] = offsetToChar ( fields->keyCode / 10 );
		t[8] = offsetToChar ( fields->expiration );
		for ( i = 9, o = fields->serializer; i < 15; i++ )
		{
			t[i] = offsetToChar ( o % 36 );
			o /= 36;
		}
		o = fields->channels;
		t[15] = offsetToChar ( o % 36 );
		o /= 36;
		t[16] = offsetToChar ( o % 36 );
		t[17] = offsetToChar ( fields->flags );
		t[18] = 0;
		t[19] = 0;
		nt = 20;
		if ( ( type == SERIALNUMBER_2 ) || ( type == SERIALNUMBER_3 ) )
		{
			o /= 36;
			t[26] = offsetToChar ( o % 36 );
			o /= 36;
			t[27] = offsetToChar ( o % 36 );
			o /= 36;
			t[28] = offsetToChar ( o % 36 );
			o = fields->masterID;
			t[20] = offsetToChar ( o % 36 );
			o /= 36;
			t[21] = offsetToChar ( o % 36 );
			o /= 36;
			t[22] = offsetToChar ( o % 36 );
			o = fields->creationDate;
			t[23] = offsetToChar ( o % 100 );
			o /= 100;
			t[24] = offsetToChar ( o % 10 );
			o /= 10;
			t[25] = offsetToChar ( o % 10 );
			t[29] = offsetToChar ( fields->serializerInc );
			nt = 30;
			if ( ( fields->ttsEnblFactor != 0 ) || ( fields->asrEnblFactor != 0 ) || ( fields->fncEnblFactor ) )
			{
				srand ( (unsigned)time ( NULL ) );
				if ( fields->ttsEnblFactor == 0 )
				{
					fields->ttsEnblFactor = ( rand ( ) % 36 ) & 0xFE;
				}
				else
				{
					fields->ttsEnblFactor |= 0x01;
				}
				if ( fields->asrEnblFactor == 0 )
				{
					fields->asrEnblFactor = ( rand ( ) % 36 ) & 0xFE;
				}
				else
				{
					fields->asrEnblFactor |= 0x01;
				}
				if ( fields->fncEnblFactor == 0 )
				{
					fields->fncEnblFactor = ( rand ( ) % 36 ) & 0xFE;
				}
				else
				{
					fields->fncEnblFactor |= 0x01;
				}
				t[30] = offsetToChar ( fields->ttsEnblFactor );
				t[31] = offsetToChar ( fields->asrEnblFactor );
				t[32] = offsetToChar ( fields->fncEnblFactor );
				nt = 33;
			}
		}
		
		// calculate the key code checksum
		cs = 10 - ( ( ( charToOffset ( t[7] ) * 10 ) + charToOffset ( t[6] ) ) % 10 );
		t[5] = offsetToChar ( cs );
		
		// calculte the serial number checksum
		for ( i = 0, cs = 0; i < nt; i++ )
		{
			if ( ( i < 18 ) || ( i > 19 ) )
			{
				cs += (int)( (float)charToOffset ( t[i] ) * 3.14F );
			}
		}
		cs = 100 - ( cs % 100 );
		if ( cs == 100 ) cs = 0;
		fields->checksum = cs;
		t[18] = offsetToChar ( cs % 10 );
		t[19] = offsetToChar ( cs / 10 );
		
		// encode serial number
		o = charToOffset ( t[9] );
		serialNumber[0] = t[0];
		serialNumber[1] = t[1];
		serialNumber[2] = t[2];
		serialNumber[3] = t[3];
		serialNumber[4] = '-';
		serialNumber[5] = encodeChar ( t[4], 1 + o );
		serialNumber[6] = encodeChar ( t[8], 2 + o );
		serialNumber[7] = encodeChar ( t[12], 3 + o );
		serialNumber[8] = encodeChar ( t[18], 4 + o );
		serialNumber[9] = '-';
		serialNumber[10] = encodeChar ( t[5], 5 + o );
		serialNumber[11] = t[9];
		serialNumber[12] = encodeChar ( t[13], 7 + o );
		serialNumber[13] = encodeChar ( t[17], 8 + o );
		serialNumber[14] = '-';
		serialNumber[15] = encodeChar ( t[11], 9 + o );
		serialNumber[16] = encodeChar ( t[6], 10 + o );
		serialNumber[17] = encodeChar ( t[14], 11 + o );
		serialNumber[18] = encodeChar ( t[16], 12 + o );
		serialNumber[19] = '-';
		serialNumber[20] = encodeChar ( t[7], 13 + o );
		serialNumber[21] = encodeChar ( t[10], 14 + o );
		serialNumber[22] = encodeChar ( t[19], 15 + o );
		serialNumber[23] = encodeChar ( t[15], 16 + o );
		if ( ( type == SERIALNUMBER_2 ) || ( type == SERIALNUMBER_3 ) )
		{
			serialNumber[24] = '-';
			serialNumber[25] = encodeChar ( t[20], 17 + o );
			serialNumber[26] = encodeChar ( t[23], 18 + o );
			serialNumber[27] = encodeChar ( t[26], 19 + o );
			serialNumber[28] = encodeChar ( t[29], 20 + o );
			serialNumber[29] = '-';
			serialNumber[30] = encodeChar ( t[21], 21 + o );
			serialNumber[31] = encodeChar ( t[24], 22 + o );
			serialNumber[32] = encodeChar ( t[27], 23 + o );
			serialNumber[33] = encodeChar ( t[22], 24 + o );
			serialNumber[34] = '-';
			serialNumber[35] = encodeChar ( t[25], 25 + o );
			serialNumber[36] = encodeChar ( t[28], 26 + o );
			if ( nt > 30 )
			{
				serialNumber[37] = encodeChar ( t[30], 0 + o );
				serialNumber[38] = encodeChar ( t[32], 2 + o );
				serialNumber[39] = '-';
				serialNumber[40] = encodeChar ( t[31], 1 + o );
				serialNumber[41] = 0;
			}
			else
			{
				serialNumber[37] = 0;
			}
		}
		else
		{
			serialNumber[24] = 0;
		}
		
		return ( 0 );
	}
	
#endif

void*	 snNewFieldsPtr ( )
{
	return ( (void*)calloc ( sizeof(SNFields), 1 ) );
}

void	 snDeleteFieldsPtr ( void *fields )
{
	if ( fields != NULL )
	{
		free ( fields );
	}
}

// Get a checksum value for the snDecode function
// in:	nothing
// out: nothing
// ret:	checksum
unsigned long	 snGetDecodeChecksum ( )
{
	unsigned long	cs = 0;
	unsigned long	*p;
	int				i;
	
	p = (unsigned long*)snDecode;
	for ( i = 0; i < 20; i++ )
	{
		cs <<= 1;
		cs += *p++;
	}
	
	p = (unsigned long*)snGetDecodeChecksum;
	for ( i = 0; i < 10; i++ )
	{
		cs <<= 1;
		cs += *p++;
	}
	
	return ( cs );
}

char	 snGetProdFamily ( void *f )
{
	SNFieldsPtr	fields = (SNFieldsPtr)f;
	return ( fields->prodFamily );
}

char	 snGetProdName ( void *f )
{
	SNFieldsPtr	fields = (SNFieldsPtr)f;
	return ( fields->prodName );
}

int		 snGetVerMajor ( void *f )
{
	SNFieldsPtr	fields = (SNFieldsPtr)f;
	return ( fields->verMajor );
}

int		 snGetVerMinor ( void *f )
{
	SNFieldsPtr	fields = (SNFieldsPtr)f;
	return ( fields->verMinor );
}

int		 snGetRelCode ( void *f )
{
	SNFieldsPtr	fields = (SNFieldsPtr)f;
	return ( fields->relCode );
}

int		 snGetSerializer ( void *f )
{
	SNFieldsPtr	fields = (SNFieldsPtr)f;
	return ( fields->serializer );
}

int		 snGetKeyCode ( void *f )
{
	SNFieldsPtr	fields = (SNFieldsPtr)f;
	return ( fields->keyCode );
}

int		 snGetExpiration ( void *f )
{
	SNFieldsPtr	fields = (SNFieldsPtr)f;
	return ( fields->expiration );
}

int		 snGetChannels ( void *f )
{
	SNFieldsPtr	fields = (SNFieldsPtr)f;
	return ( fields->channels );
}

int		 snGetFlags ( void *f )
{
	SNFieldsPtr	fields = (SNFieldsPtr)f;
	return ( fields->flags );
}

int		 snGetMasterID ( void *f )
{
	SNFieldsPtr	fields = (SNFieldsPtr)f;
	return ( fields->masterID );
}

int		 snGetCreationDate ( void *f )
{
	SNFieldsPtr	fields = (SNFieldsPtr)f;
	return ( fields->creationDate );
}

int		 snGetSerializerInc ( void *f )
{
	SNFieldsPtr	fields = (SNFieldsPtr)f;
	return ( fields->serializerInc );
}

FNX_TIMESTRUCT	 snGetDate ( )
{
	return ( FNX_TIME ( NULL ) );
}

int		 snGetTTSEnableFactor ( void *f )
{
	SNFieldsPtr	fields = (SNFieldsPtr)f;
	return ( fields->ttsEnblFactor );
}

int		 snGetASREnableFactor ( void *f )
{
	SNFieldsPtr	fields = (SNFieldsPtr)f;
	return ( fields->asrEnblFactor );
}

int		 snGetFncEnableFactor ( void *f )
{
	SNFieldsPtr	fields = (SNFieldsPtr)f;
	return ( fields->fncEnblFactor );
}

int		 snGetSerialNumberChecksum ( void *f )
{
	SNFieldsPtr	fields = (SNFieldsPtr)f;
	return ( fields->checksum );
}


int		 snIDecode ( char *serialNumber )
{
	return ( snDecode ( serialNumber, &IFields ) );
}

int		 snITTSEnablerDecode ( char *enableKey, int factor, int snChecksum )
{
	int		nBits = TTSNBits;
	return ( snEnablerDecode ( enableKey, TTSBits, &nBits, factor, snChecksum ) );
}

int		 snIASREnablerDecode ( char *enableKey, int factor, int snChecksum )
{
	int		nBits = ASRNBits;
	return ( snEnablerDecode ( enableKey, ASRBits, &nBits, factor, snChecksum ) );
}

int		 snIFuncEnablerDecode ( char *enableKey, int factor, int snChecksum )
{
	int		nBits = FuncNBits;
	return ( snEnablerDecode ( enableKey, FuncBits, &nBits, factor, snChecksum ) );
}

int		 snIGetProdFamily ( )
{
	return ( IFields.prodFamily );
}

int		 snIGetProdName ( )
{
	return ( IFields.prodName );
}

int		 snIGetVerMajor ( )
{
	return ( IFields.verMajor );
}

int		 snIGetVerMinor ( )
{
	return ( IFields.verMinor );
}

int		 snIGetRelCode ( )
{
	return ( IFields.relCode );
}

int		 snIGetSerializer ( )
{
	return ( IFields.serializer );
}

int		 snIGetKeyCode ( )
{
	return ( IFields.keyCode );
}

int		 snIGetExpiration ( )
{
	return ( IFields.expiration );
}

int		 snIGetChannels ( )
{
	return ( IFields.channels );
}

int		 snIGetFlags ( )
{
	return ( IFields.flags );
}

int		 snIGetMasterID ( )
{
	return ( IFields.masterID );
}

int		 snIGetCreationDate ( )
{
	return ( IFields.creationDate );
}

int		 snIGetSerializerInc ( )
{
	return ( IFields.serializerInc );
}

FNX_TIMESTRUCT	 snIGetDate ( )
{
	return ( FNX_TIME ( NULL ) );
}

int		 snIGetTTSEnableFactor ( )
{
	return ( IFields.ttsEnblFactor );
}

int		 snIGetASREnableFactor ( )
{
	return ( IFields.asrEnblFactor );
}

int		 snIGetFncEnableFactor ( )
{
	return ( IFields.fncEnblFactor );
}

int		 snIGetSerialNumberChecksum ( )
{
	return ( IFields.checksum );
}

int		 snIGetTTSLanguageState ( int languageID )
{
	if ( languageID >= TTSNBits )
	{
		return ( 0 );
	}
	return ( TTSBits[languageID] );
}

int		 snIGetASRLanguageState ( int languageID )
{
	if ( languageID >= ASRNBits )
	{
		return ( 0 );
	}
	return ( ASRBits[languageID] );
}

int		 snIGetFuncState ( int funcID )
{
	if ( funcID >= FuncNBits )
	{
		return ( 0 );
	}
	return ( FuncBits[funcID] );
}

