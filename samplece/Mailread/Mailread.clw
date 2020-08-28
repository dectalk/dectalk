; CLW file contains information for the MFC ClassWizard

[General Info]
Version=1
LastClass=CMailreadDlg
LastTemplate=CDialog
NewFileInclude1=#include "stdafx.h"
NewFileInclude2=#include "Mailread.h"

ClassCount=2
Class1=CMailreadApp
Class2=CMailreadDlg

ResourceCount=2
Resource1=IDR_MAINFRAME
Resource2=IDD_MAILREAD_DIALOG

[CLS:CMailreadApp]
Type=0
HeaderFile=Mailread.h
ImplementationFile=Mailread.cpp
Filter=N

[CLS:CMailreadDlg]
Type=0
HeaderFile=MailreadDlg.h
ImplementationFile=MailreadDlg.cpp
Filter=D
LastObject=IDC_MAIL_NUMBER
BaseClass=CDialog
VirtualFilter=dWC


[DLG:IDD_MAILREAD_DIALOG]
Type=1
Class=CMailreadDlg
ControlCount=6
Control1=IDC_PLAY_UNREAD,button,1342243584
Control2=IDC_PLAY_MAIL,button,1342242816
Control3=IDC_REPEAT_MAIL,button,1342242816
Control4=IDC_MAIL_NUMBER,edit,1350631552
Control5=IDC_ASYNC,button,1342197545
Control6=IDC_POP3,button,1342181161

