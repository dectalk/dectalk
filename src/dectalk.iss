[Setup]
AppName=DECtalk 4.99
AppVerName=DECtalk 4.99
DefaultDirName={pf}\DECtalk 4.99
DefaultGroupName=DECtalk 4.99
AllowNoIcons=yes
UserInfoPage=yes
LicenseFile=kitting\license.txt
OutputBaseFilename=DECtalk 4.99
Compression=lzma
SolidCompression=yes

[Components]
Name: "us"; Description: "US English"; Types: "full"
Name: "uk"; Description: "UK English"; Types: "full"
Name: "sp"; Description: "Castilian Spanish"; Types: "full"
Name: "la"; Description: "Latin American Spanish"; Types: "full"
Name: "gr"; Description: "German"; Types: "full"
Name: "fr"; Description: "French"; Types: "full"
Name: "help"; Description: "Help"; Types: "full"
Name: "samples"; Description: "Sample Applications"; Types: "full"

[Files]
Source: "kitting\appendix2.txt"; DestDir: "{app}"
Source: "kitting\appendix3.txt"; DestDir: "{app}"
Source: "kitting\appendix4.txt"; DestDir: "{app}"
Source: "kitting\license.txt"; DestDir: "{app}"
Source: "kitting\readme.txt"; DestDir: "{app}"; Flags: isreadme
Source: "kitting\word.txt"; DestDir: "{app}"; Components: samples
Source: "dapi\build\dectalk\us\release\dectalk.dll"; DestDir: "{app}\us"; Components: us
Source: "dapi\build\dectalk\us\release\dectalk.dll"; DestDir: "{sys}"; DestName: "dtalk_us.dll"; Components: us
Source: "dapi\build\dtalkdic\us\dtalk_us.dic"; DestDir: "{app}\us"; Components: us
Source: "sapi\build\dtlkttse\us\release\dtlkttse.dll"; DestDir: "{app}\us"; Components: us
Source: "dapi\build\dectalk\uk\release\dectalk.dll"; DestDir: "{app}\uk"; Components: uk
Source: "dapi\build\dectalk\uk\release\dectalk.dll"; DestDir: "{sys}"; DestName: "dtalk_uk.dll"; Components: uk
Source: "dapi\build\dtalkdic\uk\dtalk_uk.dic"; DestDir: "{app}\uk"; Components: uk
Source: "sapi\build\dtlkttse\uk\release\dtlkttse.dll"; DestDir: "{app}\uk"; Components: uk
Source: "dapi\build\dectalk\sp\release\dectalk.dll"; DestDir: "{app}\sp"; Components: sp
Source: "dapi\build\dectalk\sp\release\dectalk.dll"; DestDir: "{sys}"; DestName: "dtalk_sp.dll"; Components: sp
Source: "dapi\build\dtalkdic\sp\dtalk_sp.dic"; DestDir: "{app}\sp"; Components: sp
Source: "sapi\build\dtlkttse\sp\release\dtlkttse.dll"; DestDir: "{app}\sp"; Components: sp
Source: "dapi\build\dectalk\la\release\dectalk.dll"; DestDir: "{app}\la"; Components: la
Source: "dapi\build\dectalk\la\release\dectalk.dll"; DestDir: "{sys}"; DestName: "dtalk_la.dll"; Components: la
Source: "dapi\build\dtalkdic\la\dtalk_la.dic"; DestDir: "{app}\la"; Components: la
Source: "sapi\build\dtlkttse\la\release\dtlkttse.dll"; DestDir: "{app}\la"; Components: la
Source: "dapi\build\dectalk\gr\release\dectalk.dll"; DestDir: "{app}\gr"; Components: gr
Source: "dapi\build\dectalk\gr\release\dectalk.dll"; DestDir: "{sys}"; DestName: "dtalk_gr.dll"; Components: gr
Source: "dapi\build\dtalkdic\gr\dtalk_gr.dic"; DestDir: "{app}\gr"; Components: gr
Source: "sapi\build\dtlkttse\gr\release\dtlkttse.dll"; DestDir: "{app}\gr"; Components: gr
Source: "dapi\build\dectalk\fr\release\dectalk.dll"; DestDir: "{app}\fr"; Components: fr
Source: "dapi\build\dectalk\fr\release\dectalk.dll"; DestDir: "{sys}"; DestName: "dtalk_fr.dll"; Components: fr
Source: "dapi\build\dtalkdic\fr\dtalk_fr.dic"; DestDir: "{app}\fr"; Components: fr
Source: "dtalkml\build\release\dectalk.dll"; DestDir: "{sys}"
Source: "help\dectalk.cnt"; DestDir: "{app}"; Components: help
Source: "help\dectalk.hlp"; DestDir: "{app}"; Components: help
Source: "help\dectalk.cnt"; DestDir: "{win}\help"; Components: help
Source: "help\dectalk.hlp"; DestDir: "{win}\help"; Components: help
Source: "samples\dtmemory\build\us\release\dtmemory.exe"; DestDir: "{app}"; Components: samples
Source: "samples\dtsample\build\ml\release\dtsample.exe"; DestDir: "{app}"; Components: samples
Source: "samples\say\build\us\release\say.exe"; DestDir: "{app}"; Components: samples
Source: "samples\speak\build\us\release\speak.exe"; DestDir: "{app}"; Components: samples
Source: "samples\ttssrv\build\us\release\ttssrv.exe"; DestDir: "{app}"; Components: samples
Source: "samples\ttstest\build\us\release\ttstest.exe"; DestDir: "{app}"; Components: samples
Source: "samples\vercheck\build\release\vercheck.exe"; DestDir: "{app}"; Components: samples
Source: "samples\windic\build\ml\release\windic.exe"; DestDir: "{app}"; Components: samples
Source: "sampleML\envpatch\build\release\envpatch.exe"; DestDir: "{app}"; Components: samples
Source: "sampleML\MLDemo\build\release\MLDemo.exe"; DestDir: "{app}"; Components: samples

[Registry]
Root: HKLM; Subkey: "SOFTWARE\DECtalk Software\DECtalk\4.99"; ValueName: "Company"; ValueType: String; ValueData: "{userinfoorg}"; Flags: uninsdeletevalue uninsdeletekeyifempty
Root: HKLM; Subkey: "SOFTWARE\DECtalk Software\DECtalk\4.99"; ValueName: "Installer"; ValueType: String; ValueData: "{userinfoname}"; Flags: uninsdeletevalue uninsdeletekeyifempty
Root: HKLM; Subkey: "SOFTWARE\DECtalk Software\DECtalk\4.99\US"; ValueName: "Language"; ValueType: String; ValueData: "ENGLISH, US"; Flags: uninsdeletevalue uninsdeletekeyifempty; Components: us
Root: HKLM; Subkey: "SOFTWARE\DECtalk Software\DECtalk\4.99\US"; ValueName: "MainDict"; ValueType: String; ValueData: "{app}\us\dtalk_us.dic"; Flags: uninsdeletevalue uninsdeletekeyifempty; Components: us
Root: HKLM; Subkey: "SOFTWARE\DECtalk Software\DECtalk\4.99\US"; ValueName: "Version"; ValueType: String; ValueData: "DECtalk US version 4.99"; Flags: uninsdeletevalue uninsdeletekeyifempty; Components: us
Root: HKLM; Subkey: "SOFTWARE\DECtalk Software\DECtalk\4.99\UK"; ValueName: "Language"; ValueType: String; ValueData: "ENGLISH, UK"; Flags: uninsdeletevalue uninsdeletekeyifempty; Components: uk
Root: HKLM; Subkey: "SOFTWARE\DECtalk Software\DECtalk\4.99\UK"; ValueName: "MainDict"; ValueType: String; ValueData: "{app}\uk\dtalk_uk.dic"; Flags: uninsdeletevalue uninsdeletekeyifempty; Components: uk
Root: HKLM; Subkey: "SOFTWARE\DECtalk Software\DECtalk\4.99\UK"; ValueName: "Version"; ValueType: String; ValueData: "DECtalk UK version 4.99"; Flags: uninsdeletevalue uninsdeletekeyifempty; Components: uk
Root: HKLM; Subkey: "SOFTWARE\DECtalk Software\DECtalk\4.99\SP"; ValueName: "Language"; ValueType: String; ValueData: "SPANISH"; Flags: uninsdeletevalue uninsdeletekeyifempty; Components: sp
Root: HKLM; Subkey: "SOFTWARE\DECtalk Software\DECtalk\4.99\SP"; ValueName: "MainDict"; ValueType: String; ValueData: "{app}\sp\dtalk_sp.dic"; Flags: uninsdeletevalue uninsdeletekeyifempty; Components: sp
Root: HKLM; Subkey: "SOFTWARE\DECtalk Software\DECtalk\4.99\SP"; ValueName: "Version"; ValueType: String; ValueData: "DECtalk SP version 4.99"; Flags: uninsdeletevalue uninsdeletekeyifempty; Components: sp
Root: HKLM; Subkey: "SOFTWARE\DECtalk Software\DECtalk\4.99\LA"; ValueName: "Language"; ValueType: String; ValueData: "LATIN AMERICAN"; Flags: uninsdeletevalue uninsdeletekeyifempty; Components: la
Root: HKLM; Subkey: "SOFTWARE\DECtalk Software\DECtalk\4.99\LA"; ValueName: "MainDict"; ValueType: String; ValueData: "{app}\la\dtalk_la.dic"; Flags: uninsdeletevalue uninsdeletekeyifempty; Components: la
Root: HKLM; Subkey: "SOFTWARE\DECtalk Software\DECtalk\4.99\LA"; ValueName: "Version"; ValueType: String; ValueData: "DECtalk LA version 4.99"; Flags: uninsdeletevalue uninsdeletekeyifempty; Components: la
Root: HKLM; Subkey: "SOFTWARE\DECtalk Software\DECtalk\4.99\GR"; ValueName: "Language"; ValueType: String; ValueData: "GERMAN"; Flags: uninsdeletevalue uninsdeletekeyifempty; Components: gr
Root: HKLM; Subkey: "SOFTWARE\DECtalk Software\DECtalk\4.99\GR"; ValueName: "MainDict"; ValueType: String; ValueData: "{app}\gr\dtalk_gr.dic"; Flags: uninsdeletevalue uninsdeletekeyifempty; Components: gr
Root: HKLM; Subkey: "SOFTWARE\DECtalk Software\DECtalk\4.99\GR"; ValueName: "Version"; ValueType: String; ValueData: "DECtalk GR version 4.99"; Flags: uninsdeletevalue uninsdeletekeyifempty; Components: gr
Root: HKLM; Subkey: "SOFTWARE\DECtalk Software\DECtalk\4.99\FR"; ValueName: "Language"; ValueType: String; ValueData: "FRENCH"; Flags: uninsdeletevalue uninsdeletekeyifempty; Components: fr
Root: HKLM; Subkey: "SOFTWARE\DECtalk Software\DECtalk\4.99\FR"; ValueName: "MainDict"; ValueType: String; ValueData: "{app}\fr\dtalk_fr.dic"; Flags: uninsdeletevalue uninsdeletekeyifempty; Components: fr
Root: HKLM; Subkey: "SOFTWARE\DECtalk Software\DECtalk\4.99\FR"; ValueName: "Version"; ValueType: String; ValueData: "DECtalk FR version 4.99"; Flags: uninsdeletevalue uninsdeletekeyifempty; Components: fr
Root: HKLM; Subkey: "SOFTWARE\DECtalk Software\DECtalk\Langs"; ValueName: "DefaultLang"; Flags: uninsdeletevalue uninsdeletekeyifempty
Root: HKLM; Subkey: "SOFTWARE\DECtalk Software\DECtalk\Langs"; ValueName: "US"; ValueType: String; ValueData: "ENGLISH, US"; Flags: uninsdeletevalue uninsdeletekeyifempty; Components: us
Root: HKLM; Subkey: "SOFTWARE\DECtalk Software\DECtalk\Langs"; ValueName: "UK"; ValueType: String; ValueData: "ENGLISH, UK"; Flags: uninsdeletevalue uninsdeletekeyifempty; Components: uk
Root: HKLM; Subkey: "SOFTWARE\DECtalk Software\DECtalk\Langs"; ValueName: "SP"; ValueType: String; ValueData: "SPANISH"; Flags: uninsdeletevalue uninsdeletekeyifempty; Components: sp
Root: HKLM; Subkey: "SOFTWARE\DECtalk Software\DECtalk\Langs"; ValueName: "LA"; ValueType: String; ValueData: "LATIN AMERICAN"; Flags: uninsdeletevalue uninsdeletekeyifempty; Components: la
Root: HKLM; Subkey: "SOFTWARE\DECtalk Software\DECtalk\Langs"; ValueName: "GR"; ValueType: String; ValueData: "GERMAN"; Flags: uninsdeletevalue uninsdeletekeyifempty; Components: gr
Root: HKLM; Subkey: "SOFTWARE\DECtalk Software\DECtalk\Langs"; ValueName: "FR"; ValueType: String; ValueData: "FRENCH"; Flags: uninsdeletevalue uninsdeletekeyifempty; Components: fr
Root: HKCR; Subkey: "CLSID\{{ED737300-8FCB-11ce-AB5D-00AA00590F2B}"; ValueType: String; ValueData: "DECtalk TTS Engine US"; Flags: uninsdeletevalue uninsdeletekeyifempty; Components: us
Root: HKCR; Subkey: "CLSID\{{ED737300-8FCB-11ce-AB5D-00AA00590F2B}\InprocServer32"; ValueType: String; ValueData: "{app}\us\dtlkttse.dll"; Flags: uninsdeletevalue uninsdeletekeyifempty; Components: us
Root: HKCR; Subkey: "CLSID\{{ED737300-8FCB-11ce-AB5D-00AA00590F2B}\InprocServer32"; ValueName: "ThreadingModel"; ValueType: String; ValueData: "Apartment"; Flags: uninsdeletevalue uninsdeletekeyifempty; Components: us
Root: HKLM; Subkey: "SOFTWARE\Voice\TextToSpeech\Engine"; ValueName: "DECtalk_US"; ValueType: String; ValueData: "{{ED737300-8FCB-11ce-AB5D-00AA00590F2B}"; Flags: uninsdeletevalue uninsdeletekeyifempty; Components: us
Root: HKCR; Subkey: "CLSID\{{99EE9540-A4A6-11d1-BEB2-0060083E8376}"; ValueType: String; ValueData: "DECtalk TTS Engine UK"; Flags: uninsdeletevalue uninsdeletekeyifempty; Components: uk
Root: HKCR; Subkey: "CLSID\{{99EE9540-A4A6-11d1-BEB2-0060083E8376}\InprocServer32"; ValueType: String; ValueData: "{app}\uk\dtlkttse.dll"; Flags: uninsdeletevalue uninsdeletekeyifempty; Components: uk
Root: HKCR; Subkey: "CLSID\{{99EE9540-A4A6-11d1-BEB2-0060083E8376}\InprocServer32"; ValueName: "ThreadingModel"; ValueType: String; ValueData: "Apartment"; Flags: uninsdeletevalue uninsdeletekeyifempty; Components: uk
Root: HKLM; Subkey: "SOFTWARE\Voice\TextToSpeech\Engine"; ValueName: "DECtalk_UK"; ValueType: String; ValueData: "{{99EE9540-A4A6-11d1-BEB2-0060083E8376}"; Flags: uninsdeletevalue uninsdeletekeyifempty; Components: uk
Root: HKCR; Subkey: "CLSID\{{99EE9560-A4A6-11d1-BEB2-0060083E8376}"; ValueType: String; ValueData: "DECtalk TTS Engine SP"; Flags: uninsdeletevalue uninsdeletekeyifempty; Components: sp
Root: HKCR; Subkey: "CLSID\{{99EE9560-A4A6-11d1-BEB2-0060083E8376}\InprocServer32"; ValueType: String; ValueData: "{app}\sp\dtlkttse.dll"; Flags: uninsdeletevalue uninsdeletekeyifempty; Components: sp
Root: HKCR; Subkey: "CLSID\{{99EE9560-A4A6-11d1-BEB2-0060083E8376}\InprocServer32"; ValueName: "ThreadingModel"; ValueType: String; ValueData: "Apartment"; Flags: uninsdeletevalue uninsdeletekeyifempty; Components: sp
Root: HKLM; Subkey: "SOFTWARE\Voice\TextToSpeech\Engine"; ValueName: "DECtalk_SP"; ValueType: String; ValueData: "{{99EE9560-A4A6-11d1-BEB2-0060083E8376}"; Flags: uninsdeletevalue uninsdeletekeyifempty; Components: sp
Root: HKCR; Subkey: "CLSID\{{99EE9550-A4A6-11d1-BEB2-0060083E8376}"; ValueType: String; ValueData: "DECtalk TTS Engine LA"; Flags: uninsdeletevalue uninsdeletekeyifempty; Components: la
Root: HKCR; Subkey: "CLSID\{{99EE9550-A4A6-11d1-BEB2-0060083E8376}\InprocServer32"; ValueType: String; ValueData: "{app}\la\dtlkttse.dll"; Flags: uninsdeletevalue uninsdeletekeyifempty; Components: la
Root: HKCR; Subkey: "CLSID\{{99EE9550-A4A6-11d1-BEB2-0060083E8376}\InprocServer32"; ValueName: "ThreadingModel"; ValueType: String; ValueData: "Apartment"; Flags: uninsdeletevalue uninsdeletekeyifempty; Components: la
Root: HKLM; Subkey: "SOFTWARE\Voice\TextToSpeech\Engine"; ValueName: "DECtalk_LA"; ValueType: String; ValueData: "{{99EE9550-A4A6-11d1-BEB2-0060083E8376}"; Flags: uninsdeletevalue uninsdeletekeyifempty; Components: la
Root: HKCR; Subkey: "CLSID\{{99EE9570-A4A6-11d1-BEB2-0060083E8376}"; ValueType: String; ValueData: "DECtalk TTS Engine GR"; Flags: uninsdeletevalue uninsdeletekeyifempty; Components: gr
Root: HKCR; Subkey: "CLSID\{{99EE9570-A4A6-11d1-BEB2-0060083E8376}\InprocServer32"; ValueType: String; ValueData: "{app}\gr\dtlkttse.dll"; Flags: uninsdeletevalue uninsdeletekeyifempty; Components: gr
Root: HKCR; Subkey: "CLSID\{{99EE9570-A4A6-11d1-BEB2-0060083E8376}\InprocServer32"; ValueName: "ThreadingModel"; ValueType: String; ValueData: "Apartment"; Flags: uninsdeletevalue uninsdeletekeyifempty; Components: gr
Root: HKLM; Subkey: "SOFTWARE\Voice\TextToSpeech\Engine"; ValueName: "DECtalk_GR"; ValueType: String; ValueData: "{{99EE9570-A4A6-11d1-BEB2-0060083E8376}"; Flags: uninsdeletevalue uninsdeletekeyifempty; Components: gr

[Icons]
Name: "{group}\Change Default Language"; Filename: "{app}\envpatch.exe"; Components: samples
Name: "{group}\DECtalk In Memory"; Filename: "{app}\dtmemory.exe"; Components: samples
Name: "{group}\DECtalk Sample"; Filename: "{app}\dtsample.exe"; Components: samples
Name: "{group}\Help"; Filename: "{app}\dectalk.hlp"; Components: help
Name: "{group}\MLDemo"; Filename: "{app}\MLDemo.exe"; Components: samples
Name: "{group}\Readme"; Filename: "{app}\readme.txt"
Name: "{group}\Say"; Filename: "{app}\say.exe"; Components: samples
Name: "{group}\Speak"; Filename: "{app}\speak.exe"; Components: samples
Name: "{group}\TTSSRV"; Filename: "{app}\ttssrv.exe"; Components: samples
Name: "{group}\TTSTEST"; Filename: "{app}\ttstest.exe"; Components: samples
Name: "{group}\Version Check"; Filename: "{app}\vercheck.exe"; Components: samples
Name: "{group}\Windic"; Filename: "{app}\windic.exe"; Components: samples
Name: "{group}\{cm:UninstallProgram,DECtalk}"; Filename: "{uninstallexe}"
