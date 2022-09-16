/********************************************************************
CTools.h - header for the C tools
Copyright 1994 by Microsoft corporation.All rights reserved.
*/

#ifndef _CTOOLS_H_
#define _CTOOLS_H_

class CMem {
   private:
      PVOID    m_pMem; // memory pointer
      DWORD    m_dwAllocated;   // amount of memory allocated

   public:
      CMem (void);
      ~CMem (void);
      PVOID Pointer (void) {return m_pMem;};
      BOOL Required (DWORD dwSize);
      DWORD dwCurPosn;
      PVOID Malloc (DWORD dwSize);
   };

typedef CMem * PCMem;
                     

class CSmallMem {
   private:
      PCMem    m_pMemList; // memory for the list of pointers
      DWORD    m_dwMemAlloc;  // number of pointers in the list
      PVOID    m_pCurMem;  // current memory to take from
      DWORD    m_dwCurMemUsed;   // current memory used (in bytes);
      DWORD    m_dwCurMemSize;   // current memory size
   public:
      CSmallMem (void);
      ~CSmallMem (void);
      PVOID Malloc (DWORD dwSize);
   };
typedef CSmallMem * PCSmallMem;


typedef struct {
   PVOID       pLeft;
   PVOID       pRight;
   DWORD       dwValue;
   // Character string follows
   } ADDBTREENODE, *PADDBTREENODE;

class CAddBTree {
   private:
      PCSmallMem  m_pMem;  // memory object
      PADDBTREENODE m_pFirst;  // first node in the tree
   public:
      CAddBTree (void);
      ~CAddBTree (void);
      BOOL Add (char *pszKey, DWORD dwValue);
      DWORD Find (char *pszKey);
   };
typedef CAddBTree * PCAddBTree;


typedef struct {
   PVOID       pLeft;
   PVOID       pRight;
   DWORD       dwValue;
   DWORD       dwKey;
   } ADDBNUMTREENODE, *PADDBNUMTREENODE;

class CAddBNumTree {
   private:
      PCSmallMem  m_pMem;  // memory object
      PADDBNUMTREENODE m_pFirst;  // first node in the tree
   public:
      CAddBNumTree (void);
      ~CAddBNumTree (void);
      BOOL Add (DWORD dwKey, DWORD dwValue);
      DWORD Find (DWORD dwKey);
   };
typedef CAddBNumTree * PCAddBNumTree;


class CNumList {
   private:
      PCMem m_pMem;        // memory containing the list of #s
      DWORD m_dwNumElems;    // number of elements stored away

   public:
      CNumList (void);
      ~CNumList (void);
      DWORD GetNumElems(void);
      BOOL  AddElem (DWORD dwValue);
      BOOL  GetElem (DWORD dwElemNum, DWORD *pdwValue);
      BOOL  SetElem (DWORD dwElemNum, DWORD dwValue);
   };

typedef CNumList * PCNumList;

typedef struct {
   PVOID       pElem;      // pointer to the element
   DWORD       dwElemSize; // size of the element in bytes
   } LISTELEM, * PLISTELEM;

class CList {
   private:
      DWORD dwNumElems;    // number of elements stored away
      DWORD dwBufSize;     // allocated paElem buffer size in bytes
      LISTELEM   *paElems;   // pointer to the memory containing the
                           // pointers to the list elements
      BOOL  MakeListMemoryThisBig (DWORD dwNumElems);

   public:
      CList (void);
      ~CList (void);
      DWORD GetNumElems(void);
      BOOL  AddElem (PVOID pData, DWORD dwSize);
      BOOL  InsertElem (DWORD dwElemNum, PVOID pData, DWORD dwSize);
      BOOL  RemoveElem (DWORD dwElemNum);
      DWORD GetElemSize (DWORD dwElemNum);
      PVOID GetElem (DWORD dwElemNum);
      BOOL  SetElem (DWORD dwElemNum, PVOID pData, DWORD dwSize);
	  CList *Clone ();	// clones the current list object
   };

typedef CList * PCList;


#endif   // _CTOOLS_H_
