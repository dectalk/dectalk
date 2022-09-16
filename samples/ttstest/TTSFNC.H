/******************************************************************************\
*       ttsfnc.h
*
*       Header file for CTestNotify, CTestBufNotify 
*
*       This code and information is provided "as is" without warranty
*       of any kind, either expressed or implied, including but not
*       limited to the implied warranties of merchantability and/or
*       fitness for a particular purpose.
*
*       Copyright (C) 1995 Microsoft Corporation.  All Rights Reserved.
*
\******************************************************************************/

/************************************************************************
Notification objects */
class CTestNotify : public ITTSNotifySink {
   private:

   public:
      CTestNotify (void);
      ~CTestNotify (void);

		void NotifyOutput( const TCHAR *str );

      // IUnkown members that delegate to m_punkOuter
      // Non-delegating object IUnknown
      STDMETHODIMP         QueryInterface (REFIID, LPVOID FAR *);
      STDMETHODIMP_(ULONG) AddRef(void);
      STDMETHODIMP_(ULONG) Release(void);

      // ITTSNotifySink
		STDMETHOD (AttribChanged)  (DWORD);
		STDMETHOD (AudioStart)     (QWORD);
		STDMETHOD (AudioStop)      (QWORD);
		STDMETHOD (Visual)         (QWORD, SCHAR, SCHAR, DWORD, PTTSMOUTH);
   };
typedef CTestNotify * PCTestNotify;

class CTestBufNotify : public ITTSBufNotifySink {
   private:

   public:
      CTestBufNotify (void);
      ~CTestBufNotify (void);

		void NotifyOutput( const TCHAR *str );

      // IUnkown members that delegate to m_punkOuter
      // Non-delegating object IUnknown
      STDMETHODIMP         QueryInterface (REFIID, LPVOID FAR *);
      STDMETHODIMP_(ULONG) AddRef(void);
      STDMETHODIMP_(ULONG) Release(void);

      // ITTSNotifySink
	   STDMETHOD (BookMark)		   	(QWORD, DWORD);
	   STDMETHOD (TextDataDone)   	(QWORD, DWORD);
	   STDMETHOD (TextDataStarted)   (QWORD);
	   STDMETHOD (WordPosition)      (QWORD, DWORD);
   };
typedef CTestBufNotify * PCTestBufNotify;


// helper funtions...
void MainOutput(LPCTSTR str);

// globals
extern PCTestNotify			gpTestNotify;     // notification object
extern PCTestBufNotify		gpTestBufNotify;  // buf notification object
extern CList<DWORD, DWORD>	gdwKeyList;       // list of notification keys
