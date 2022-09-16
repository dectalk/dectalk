#ifndef IDEC_H
#define IDEC_H

/*
 * IDECUnlockEng
 *
 * 26mar97 ncs
 * All of the stuff here is for willowpond's engine stuff.
 * These declarations are "secret" for willowpond.
 * Therefore this must be kept in the dark from the regular kit,
 */

#ifdef WILLOWPOND
// {644C3121-1099-11d0-B026-0020AF26D014}
#define GUID_IID_IDECUnlockEng \
{0x644C3121, 0x1099, 0x11d0, {0xB0, 0x26, 0x00, 0x20, 0xAF, 0x26, 0xD0, 0x14}}
DEFINE_GUID(IID_IDECUnlockEng, 
0x644c3121, 0x1099, 0x11d0, 0xb0, 0x26, 0x0, 0x20, 0xaf, 0x26, 0xd0, 0x14);

// CEngUnlock class - TTS engine key unlocking

class CEngUnlock : public IUnknown {

   public:

      STDMETHOD(QueryInterface) (REFIID, LPVOID FAR *);
      STDMETHOD_(ULONG,AddRef) (void);
      STDMETHOD_(ULONG,Release) (void);

      STDMETHOD(Unlock)    (char *);
      STDMETHOD(LockCheck) (void);

      CEngUnlock (LPVOID, LPUNKNOWN);
      ~CEngUnlock (void);

   private:

      ULONG          m_cRef;        // interface reference count
      LPVOID         m_pObj;        // Back pointer to the object
      LPUNKNOWN      m_punkOuter;   // Controlling unknown for delegation
   };

typedef CEngUnlock * PCEngUnlock;

#endif // Willowpond
#endif // IDEC_H
