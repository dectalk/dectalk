[Setup]
AppName=DECtalk 5.0 SAPI5
AppVerName=DECtalk 5.0 SAPI5
DefaultDirName={pf}\DECtalk 5.0 SAPI5
OutputBaseFilename=DECtalk 5.0 SAPI5
Compression=lzma
SolidCompression=yes

[Components]
Name: "us"; Description: "US English"; Types: "full"
Name: "uk"; Description: "UK English"; Types: "full"
Name: "sp"; Description: "Castilian Spanish"; Types: "full"
Name: "la"; Description: "Latin American Spanish"; Types: "full"
Name: "gr"; Description: "German"; Types: "full"
Name: "fr"; Description: "French"; Types: "full"

[Files]
Source: "dapi\build\dtalkdic\us\dtalk_us.dic"; DestDir: "{app}\us"; Components: us
Source: "sapi5\build\us\release\sapi5.dll"; DestDir: "{app}\us"; Components: us; Flags: regserver 
Source: "dapi\build\dtalkdic\uk\dtalk_uk.dic"; DestDir: "{app}\uk"; Components: uk
Source: "sapi5\build\uk\release\sapi5.dll"; DestDir: "{app}\uk"; Components: uk; Flags: regserver 
Source: "dapi\build\dtalkdic\sp\dtalk_sp.dic"; DestDir: "{app}\sp"; Components: sp
Source: "sapi5\build\sp\release\sapi5.dll"; DestDir: "{app}\sp"; Components: sp; Flags: regserver 
Source: "dapi\build\dtalkdic\la\dtalk_la.dic"; DestDir: "{app}\la"; Components: la
Source: "sapi5\build\la\release\sapi5.dll"; DestDir: "{app}\la"; Components: la; Flags: regserver 
Source: "dapi\build\dtalkdic\gr\dtalk_gr.dic"; DestDir: "{app}\gr"; Components: gr
Source: "sapi5\build\gr\release\sapi5.dll"; DestDir: "{app}\gr"; Components: gr; Flags: regserver 
Source: "dapi\build\dtalkdic\fr\dtalk_fr.dic"; DestDir: "{app}\fr"; Components: fr
Source: "sapi5\build\fr\release\sapi5.dll"; DestDir: "{app}\fr"; Components: fr; Flags: regserver 

[Registry]
Root: HKLM; Subkey: "SOFTWARE\DECtalk Software\DECtalk\sapi5\US"; ValueName: "MainDict"; ValueType: String; ValueData: "{app}\us\dtalk_us.dic"; Flags: uninsdeletevalue uninsdeletekeyifempty; Components: us
Root: HKLM; Subkey: "SOFTWARE\Microsoft\Speech\Voices\Tokens\USBetty"; ValueType: String; ValueData: "US Betty"; Flags: uninsdeletevalue uninsdeletekeyifempty; Components: us
Root: HKLM; Subkey: "SOFTWARE\Microsoft\Speech\Voices\Tokens\USBetty"; ValueName: "409"; ValueType: String; ValueData: "US Betty"; Flags: uninsdeletevalue uninsdeletekeyifempty; Components: us
Root: HKLM; Subkey: "SOFTWARE\Microsoft\Speech\Voices\Tokens\USBetty"; ValueName: "CLSID"; ValueType: String; ValueData: "{{99EE9580-A4A6-11d1-BEB2-0060083E8376}"; Flags: uninsdeletevalue uninsdeletekeyifempty; Components: us
Root: HKLM; Subkey: "SOFTWARE\Microsoft\Speech\Voices\Tokens\USBetty"; ValueName: "Speaker"; ValueType: String; ValueData: "1"; Flags: uninsdeletevalue uninsdeletekeyifempty; Components: us
Root: HKLM; Subkey: "SOFTWARE\Microsoft\Speech\Voices\Tokens\USBetty\Attributes"; ValueName: "Gender"; ValueType: String; ValueData: "Female"; Flags: uninsdeletevalue uninsdeletekeyifempty; Components: us
Root: HKLM; Subkey: "SOFTWARE\Microsoft\Speech\Voices\Tokens\USBetty\Attributes"; ValueName: "Language"; ValueType: String; ValueData: "409"; Flags: uninsdeletevalue uninsdeletekeyifempty; Components: us
Root: HKLM; Subkey: "SOFTWARE\Microsoft\Speech\Voices\Tokens\USBetty\Attributes"; ValueName: "Age"; ValueType: String; ValueData: "Adult"; Flags: uninsdeletevalue uninsdeletekeyifempty; Components: us
Root: HKLM; Subkey: "SOFTWARE\Microsoft\Speech\Voices\Tokens\USBetty\Attributes"; ValueName: "Vendor"; ValueType: String; ValueData: "DECtalk"; Flags: uninsdeletevalue uninsdeletekeyifempty; Components: us
Root: HKLM; Subkey: "SOFTWARE\Microsoft\Speech\Voices\Tokens\USBetty\Attributes"; ValueName: "Name"; ValueType: String; ValueData: "Betty"; Flags: uninsdeletevalue uninsdeletekeyifempty; Components: us
Root: HKLM; Subkey: "SOFTWARE\Microsoft\Speech\Voices\Tokens\USDennis"; ValueType: String; ValueData: "US Dennis"; Flags: uninsdeletevalue uninsdeletekeyifempty; Components: us
Root: HKLM; Subkey: "SOFTWARE\Microsoft\Speech\Voices\Tokens\USDennis"; ValueName: "409"; ValueType: String; ValueData: "US Dennis"; Flags: uninsdeletevalue uninsdeletekeyifempty; Components: us
Root: HKLM; Subkey: "SOFTWARE\Microsoft\Speech\Voices\Tokens\USDennis"; ValueName: "CLSID"; ValueType: String; ValueData: "{{99EE9580-A4A6-11d1-BEB2-0060083E8376}"; Flags: uninsdeletevalue uninsdeletekeyifempty; Components: us
Root: HKLM; Subkey: "SOFTWARE\Microsoft\Speech\Voices\Tokens\USDennis"; ValueName: "Speaker"; ValueType: String; ValueData: "4"; Flags: uninsdeletevalue uninsdeletekeyifempty; Components: us
Root: HKLM; Subkey: "SOFTWARE\Microsoft\Speech\Voices\Tokens\USDennis\Attributes"; ValueName: "Gender"; ValueType: String; ValueData: "Male"; Flags: uninsdeletevalue uninsdeletekeyifempty; Components: us
Root: HKLM; Subkey: "SOFTWARE\Microsoft\Speech\Voices\Tokens\USDennis\Attributes"; ValueName: "Language"; ValueType: String; ValueData: "409"; Flags: uninsdeletevalue uninsdeletekeyifempty; Components: us
Root: HKLM; Subkey: "SOFTWARE\Microsoft\Speech\Voices\Tokens\USDennis\Attributes"; ValueName: "Age"; ValueType: String; ValueData: "Adult"; Flags: uninsdeletevalue uninsdeletekeyifempty; Components: us
Root: HKLM; Subkey: "SOFTWARE\Microsoft\Speech\Voices\Tokens\USDennis\Attributes"; ValueName: "Vendor"; ValueType: String; ValueData: "DECtalk"; Flags: uninsdeletevalue uninsdeletekeyifempty; Components: us
Root: HKLM; Subkey: "SOFTWARE\Microsoft\Speech\Voices\Tokens\USDennis\Attributes"; ValueName: "Name"; ValueType: String; ValueData: "Dennis"; Flags: uninsdeletevalue uninsdeletekeyifempty; Components: us
Root: HKLM; Subkey: "SOFTWARE\Microsoft\Speech\Voices\Tokens\USFrank"; ValueType: String; ValueData: "US Frank"; Flags: uninsdeletevalue uninsdeletekeyifempty; Components: us
Root: HKLM; Subkey: "SOFTWARE\Microsoft\Speech\Voices\Tokens\USFrank"; ValueName: "409"; ValueType: String; ValueData: "US Frank"; Flags: uninsdeletevalue uninsdeletekeyifempty; Components: us
Root: HKLM; Subkey: "SOFTWARE\Microsoft\Speech\Voices\Tokens\USFrank"; ValueName: "CLSID"; ValueType: String; ValueData: "{{99EE9580-A4A6-11d1-BEB2-0060083E8376}"; Flags: uninsdeletevalue uninsdeletekeyifempty; Components: us
Root: HKLM; Subkey: "SOFTWARE\Microsoft\Speech\Voices\Tokens\USFrank"; ValueName: "Speaker"; ValueType: String; ValueData: "3"; Flags: uninsdeletevalue uninsdeletekeyifempty; Components: us
Root: HKLM; Subkey: "SOFTWARE\Microsoft\Speech\Voices\Tokens\USFrank\Attributes"; ValueName: "Gender"; ValueType: String; ValueData: "Male"; Flags: uninsdeletevalue uninsdeletekeyifempty; Components: us
Root: HKLM; Subkey: "SOFTWARE\Microsoft\Speech\Voices\Tokens\USFrank\Attributes"; ValueName: "Language"; ValueType: String; ValueData: "409"; Flags: uninsdeletevalue uninsdeletekeyifempty; Components: us
Root: HKLM; Subkey: "SOFTWARE\Microsoft\Speech\Voices\Tokens\USFrank\Attributes"; ValueName: "Age"; ValueType: String; ValueData: "Senior; Adult"; Flags: uninsdeletevalue uninsdeletekeyifempty; Components: us
Root: HKLM; Subkey: "SOFTWARE\Microsoft\Speech\Voices\Tokens\USFrank\Attributes"; ValueName: "Vendor"; ValueType: String; ValueData: "DECtalk"; Flags: uninsdeletevalue uninsdeletekeyifempty; Components: us
Root: HKLM; Subkey: "SOFTWARE\Microsoft\Speech\Voices\Tokens\USFrank\Attributes"; ValueName: "Name"; ValueType: String; ValueData: "Frank"; Flags: uninsdeletevalue uninsdeletekeyifempty; Components: us
Root: HKLM; Subkey: "SOFTWARE\Microsoft\Speech\Voices\Tokens\USHarry"; ValueType: String; ValueData: "US Harry"; Flags: uninsdeletevalue uninsdeletekeyifempty; Components: us
Root: HKLM; Subkey: "SOFTWARE\Microsoft\Speech\Voices\Tokens\USHarry"; ValueName: "409"; ValueType: String; ValueData: "US Harry"; Flags: uninsdeletevalue uninsdeletekeyifempty; Components: us
Root: HKLM; Subkey: "SOFTWARE\Microsoft\Speech\Voices\Tokens\USHarry"; ValueName: "CLSID"; ValueType: String; ValueData: "{{99EE9580-A4A6-11d1-BEB2-0060083E8376}"; Flags: uninsdeletevalue uninsdeletekeyifempty; Components: us
Root: HKLM; Subkey: "SOFTWARE\Microsoft\Speech\Voices\Tokens\USHarry"; ValueName: "Speaker"; ValueType: String; ValueData: "2"; Flags: uninsdeletevalue uninsdeletekeyifempty; Components: us
Root: HKLM; Subkey: "SOFTWARE\Microsoft\Speech\Voices\Tokens\USHarry\Attributes"; ValueName: "Gender"; ValueType: String; ValueData: "Male"; Flags: uninsdeletevalue uninsdeletekeyifempty; Components: us
Root: HKLM; Subkey: "SOFTWARE\Microsoft\Speech\Voices\Tokens\USHarry\Attributes"; ValueName: "Language"; ValueType: String; ValueData: "409"; Flags: uninsdeletevalue uninsdeletekeyifempty; Components: us
Root: HKLM; Subkey: "SOFTWARE\Microsoft\Speech\Voices\Tokens\USHarry\Attributes"; ValueName: "Age"; ValueType: String; ValueData: "Adult"; Flags: uninsdeletevalue uninsdeletekeyifempty; Components: us
Root: HKLM; Subkey: "SOFTWARE\Microsoft\Speech\Voices\Tokens\USHarry\Attributes"; ValueName: "Vendor"; ValueType: String; ValueData: "DECtalk"; Flags: uninsdeletevalue uninsdeletekeyifempty; Components: us
Root: HKLM; Subkey: "SOFTWARE\Microsoft\Speech\Voices\Tokens\USHarry\Attributes"; ValueName: "Name"; ValueType: String; ValueData: "Harry"; Flags: uninsdeletevalue uninsdeletekeyifempty; Components: us
Root: HKLM; Subkey: "SOFTWARE\Microsoft\Speech\Voices\Tokens\USKit"; ValueType: String; ValueData: "US Kit"; Flags: uninsdeletevalue uninsdeletekeyifempty; Components: us
Root: HKLM; Subkey: "SOFTWARE\Microsoft\Speech\Voices\Tokens\USKit"; ValueName: "409"; ValueType: String; ValueData: "US Kit"; Flags: uninsdeletevalue uninsdeletekeyifempty; Components: us
Root: HKLM; Subkey: "SOFTWARE\Microsoft\Speech\Voices\Tokens\USKit"; ValueName: "CLSID"; ValueType: String; ValueData: "{{99EE9580-A4A6-11d1-BEB2-0060083E8376}"; Flags: uninsdeletevalue uninsdeletekeyifempty; Components: us
Root: HKLM; Subkey: "SOFTWARE\Microsoft\Speech\Voices\Tokens\USKit"; ValueName: "Speaker"; ValueType: String; ValueData: "5"; Flags: uninsdeletevalue uninsdeletekeyifempty; Components: us
Root: HKLM; Subkey: "SOFTWARE\Microsoft\Speech\Voices\Tokens\USKit\Attributes"; ValueName: "Gender"; ValueType: String; ValueData: "Male"; Flags: uninsdeletevalue uninsdeletekeyifempty; Components: us
Root: HKLM; Subkey: "SOFTWARE\Microsoft\Speech\Voices\Tokens\USKit\Attributes"; ValueName: "Language"; ValueType: String; ValueData: "409"; Flags: uninsdeletevalue uninsdeletekeyifempty; Components: us
Root: HKLM; Subkey: "SOFTWARE\Microsoft\Speech\Voices\Tokens\USKit\Attributes"; ValueName: "Age"; ValueType: String; ValueData: "Child"; Flags: uninsdeletevalue uninsdeletekeyifempty; Components: us
Root: HKLM; Subkey: "SOFTWARE\Microsoft\Speech\Voices\Tokens\USKit\Attributes"; ValueName: "Vendor"; ValueType: String; ValueData: "DECtalk"; Flags: uninsdeletevalue uninsdeletekeyifempty; Components: us
Root: HKLM; Subkey: "SOFTWARE\Microsoft\Speech\Voices\Tokens\USKit\Attributes"; ValueName: "Name"; ValueType: String; ValueData: "Kit"; Flags: uninsdeletevalue uninsdeletekeyifempty; Components: us
Root: HKLM; Subkey: "SOFTWARE\Microsoft\Speech\Voices\Tokens\USPaul"; ValueType: String; ValueData: "US Paul"; Flags: uninsdeletevalue uninsdeletekeyifempty; Components: us
Root: HKLM; Subkey: "SOFTWARE\Microsoft\Speech\Voices\Tokens\USPaul"; ValueName: "409"; ValueType: String; ValueData: "US Paul"; Flags: uninsdeletevalue uninsdeletekeyifempty; Components: us
Root: HKLM; Subkey: "SOFTWARE\Microsoft\Speech\Voices\Tokens\USPaul"; ValueName: "CLSID"; ValueType: String; ValueData: "{{99EE9580-A4A6-11d1-BEB2-0060083E8376}"; Flags: uninsdeletevalue uninsdeletekeyifempty; Components: us
Root: HKLM; Subkey: "SOFTWARE\Microsoft\Speech\Voices\Tokens\USPaul"; ValueName: "Speaker"; ValueType: String; ValueData: "0"; Flags: uninsdeletevalue uninsdeletekeyifempty; Components: us
Root: HKLM; Subkey: "SOFTWARE\Microsoft\Speech\Voices\Tokens\USPaul\Attributes"; ValueName: "Gender"; ValueType: String; ValueData: "Male"; Flags: uninsdeletevalue uninsdeletekeyifempty; Components: us
Root: HKLM; Subkey: "SOFTWARE\Microsoft\Speech\Voices\Tokens\USPaul\Attributes"; ValueName: "Language"; ValueType: String; ValueData: "409"; Flags: uninsdeletevalue uninsdeletekeyifempty; Components: us
Root: HKLM; Subkey: "SOFTWARE\Microsoft\Speech\Voices\Tokens\USPaul\Attributes"; ValueName: "Age"; ValueType: String; ValueData: "Adult"; Flags: uninsdeletevalue uninsdeletekeyifempty; Components: us
Root: HKLM; Subkey: "SOFTWARE\Microsoft\Speech\Voices\Tokens\USPaul\Attributes"; ValueName: "Vendor"; ValueType: String; ValueData: "DECtalk"; Flags: uninsdeletevalue uninsdeletekeyifempty; Components: us
Root: HKLM; Subkey: "SOFTWARE\Microsoft\Speech\Voices\Tokens\USPaul\Attributes"; ValueName: "Name"; ValueType: String; ValueData: "Paul"; Flags: uninsdeletevalue uninsdeletekeyifempty; Components: us
Root: HKLM; Subkey: "SOFTWARE\Microsoft\Speech\Voices\Tokens\USPaul\Attributes"; ValueName: "VendorPreferred"; ValueType: String; Flags: uninsdeletevalue uninsdeletekeyifempty; Components: us
Root: HKLM; Subkey: "SOFTWARE\Microsoft\Speech\Voices\Tokens\USRita"; ValueType: String; ValueData: "US Rita"; Flags: uninsdeletevalue uninsdeletekeyifempty; Components: us
Root: HKLM; Subkey: "SOFTWARE\Microsoft\Speech\Voices\Tokens\USRita"; ValueName: "409"; ValueType: String; ValueData: "US Rita"; Flags: uninsdeletevalue uninsdeletekeyifempty; Components: us
Root: HKLM; Subkey: "SOFTWARE\Microsoft\Speech\Voices\Tokens\USRita"; ValueName: "CLSID"; ValueType: String; ValueData: "{{99EE9580-A4A6-11d1-BEB2-0060083E8376}"; Flags: uninsdeletevalue uninsdeletekeyifempty; Components: us
Root: HKLM; Subkey: "SOFTWARE\Microsoft\Speech\Voices\Tokens\USRita"; ValueName: "Speaker"; ValueType: String; ValueData: "7"; Flags: uninsdeletevalue uninsdeletekeyifempty; Components: us
Root: HKLM; Subkey: "SOFTWARE\Microsoft\Speech\Voices\Tokens\USRita\Attributes"; ValueName: "Gender"; ValueType: String; ValueData: "Female"; Flags: uninsdeletevalue uninsdeletekeyifempty; Components: us
Root: HKLM; Subkey: "SOFTWARE\Microsoft\Speech\Voices\Tokens\USRita\Attributes"; ValueName: "Language"; ValueType: String; ValueData: "409"; Flags: uninsdeletevalue uninsdeletekeyifempty; Components: us
Root: HKLM; Subkey: "SOFTWARE\Microsoft\Speech\Voices\Tokens\USRita\Attributes"; ValueName: "Age"; ValueType: String; ValueData: "Adult"; Flags: uninsdeletevalue uninsdeletekeyifempty; Components: us
Root: HKLM; Subkey: "SOFTWARE\Microsoft\Speech\Voices\Tokens\USRita\Attributes"; ValueName: "Vendor"; ValueType: String; ValueData: "DECtalk"; Flags: uninsdeletevalue uninsdeletekeyifempty; Components: us
Root: HKLM; Subkey: "SOFTWARE\Microsoft\Speech\Voices\Tokens\USRita\Attributes"; ValueName: "Name"; ValueType: String; ValueData: "Rita"; Flags: uninsdeletevalue uninsdeletekeyifempty; Components: us
Root: HKLM; Subkey: "SOFTWARE\Microsoft\Speech\Voices\Tokens\USUrsula"; ValueType: String; ValueData: "US Ursula"; Flags: uninsdeletevalue uninsdeletekeyifempty; Components: us
Root: HKLM; Subkey: "SOFTWARE\Microsoft\Speech\Voices\Tokens\USUrsula"; ValueName: "409"; ValueType: String; ValueData: "US Ursula"; Flags: uninsdeletevalue uninsdeletekeyifempty; Components: us
Root: HKLM; Subkey: "SOFTWARE\Microsoft\Speech\Voices\Tokens\USUrsula"; ValueName: "CLSID"; ValueType: String; ValueData: "{{99EE9580-A4A6-11d1-BEB2-0060083E8376}"; Flags: uninsdeletevalue uninsdeletekeyifempty; Components: us
Root: HKLM; Subkey: "SOFTWARE\Microsoft\Speech\Voices\Tokens\USUrsula"; ValueName: "Speaker"; ValueType: String; ValueData: "6"; Flags: uninsdeletevalue uninsdeletekeyifempty; Components: us
Root: HKLM; Subkey: "SOFTWARE\Microsoft\Speech\Voices\Tokens\USUrsula\Attributes"; ValueName: "Gender"; ValueType: String; ValueData: "Female"; Flags: uninsdeletevalue uninsdeletekeyifempty; Components: us
Root: HKLM; Subkey: "SOFTWARE\Microsoft\Speech\Voices\Tokens\USUrsula\Attributes"; ValueName: "Language"; ValueType: String; ValueData: "409"; Flags: uninsdeletevalue uninsdeletekeyifempty; Components: us
Root: HKLM; Subkey: "SOFTWARE\Microsoft\Speech\Voices\Tokens\USUrsula\Attributes"; ValueName: "Age"; ValueType: String; ValueData: "Senior; Adult"; Flags: uninsdeletevalue uninsdeletekeyifempty; Components: us
Root: HKLM; Subkey: "SOFTWARE\Microsoft\Speech\Voices\Tokens\USUrsula\Attributes"; ValueName: "Vendor"; ValueType: String; ValueData: "DECtalk"; Flags: uninsdeletevalue uninsdeletekeyifempty; Components: us
Root: HKLM; Subkey: "SOFTWARE\Microsoft\Speech\Voices\Tokens\USUrsula\Attributes"; ValueName: "Name"; ValueType: String; ValueData: "Ursula"; Flags: uninsdeletevalue uninsdeletekeyifempty; Components: us
Root: HKLM; Subkey: "SOFTWARE\Microsoft\Speech\Voices\Tokens\USWendy"; ValueType: String; ValueData: "US Wendy"; Flags: uninsdeletevalue uninsdeletekeyifempty; Components: us
Root: HKLM; Subkey: "SOFTWARE\Microsoft\Speech\Voices\Tokens\USWendy"; ValueName: "409"; ValueType: String; ValueData: "US Wendy"; Flags: uninsdeletevalue uninsdeletekeyifempty; Components: us
Root: HKLM; Subkey: "SOFTWARE\Microsoft\Speech\Voices\Tokens\USWendy"; ValueName: "CLSID"; ValueType: String; ValueData: "{{99EE9580-A4A6-11d1-BEB2-0060083E8376}"; Flags: uninsdeletevalue uninsdeletekeyifempty; Components: us
Root: HKLM; Subkey: "SOFTWARE\Microsoft\Speech\Voices\Tokens\USWendy"; ValueName: "Speaker"; ValueType: String; ValueData: "8"; Flags: uninsdeletevalue uninsdeletekeyifempty; Components: us
Root: HKLM; Subkey: "SOFTWARE\Microsoft\Speech\Voices\Tokens\USWendy\Attributes"; ValueName: "Gender"; ValueType: String; ValueData: "Female"; Flags: uninsdeletevalue uninsdeletekeyifempty; Components: us
Root: HKLM; Subkey: "SOFTWARE\Microsoft\Speech\Voices\Tokens\USWendy\Attributes"; ValueName: "Language"; ValueType: String; ValueData: "409"; Flags: uninsdeletevalue uninsdeletekeyifempty; Components: us
Root: HKLM; Subkey: "SOFTWARE\Microsoft\Speech\Voices\Tokens\USWendy\Attributes"; ValueName: "Age"; ValueType: String; ValueData: "Adult"; Flags: uninsdeletevalue uninsdeletekeyifempty; Components: us
Root: HKLM; Subkey: "SOFTWARE\Microsoft\Speech\Voices\Tokens\USWendy\Attributes"; ValueName: "Vendor"; ValueType: String; ValueData: "DECtalk"; Flags: uninsdeletevalue uninsdeletekeyifempty; Components: us
Root: HKLM; Subkey: "SOFTWARE\Microsoft\Speech\Voices\Tokens\USWendy\Attributes"; ValueName: "Name"; ValueType: String; ValueData: "Wendy"; Flags: uninsdeletevalue uninsdeletekeyifempty; Components: us
Root: HKLM; Subkey: "SOFTWARE\DECtalk Software\DECtalk\sapi5\UK"; ValueName: "MainDict"; ValueType: String; ValueData: "{app}\uk\dtalk_uk.dic"; Flags: uninsdeletevalue uninsdeletekeyifempty; Components: uk
Root: HKLM; Subkey: "SOFTWARE\Microsoft\Speech\Voices\Tokens\UKBetty"; ValueType: String; ValueData: "UK Betty"; Flags: uninsdeletevalue uninsdeletekeyifempty; Components: uk
Root: HKLM; Subkey: "SOFTWARE\Microsoft\Speech\Voices\Tokens\UKBetty"; ValueName: "409"; ValueType: String; ValueData: "UK Betty"; Flags: uninsdeletevalue uninsdeletekeyifempty; Components: uk
Root: HKLM; Subkey: "SOFTWARE\Microsoft\Speech\Voices\Tokens\UKBetty"; ValueName: "CLSID"; ValueType: String; ValueData: "{{99EE9588-A4A6-11d1-BEB2-0060083E8376}"; Flags: uninsdeletevalue uninsdeletekeyifempty; Components: uk
Root: HKLM; Subkey: "SOFTWARE\Microsoft\Speech\Voices\Tokens\UKBetty"; ValueName: "Speaker"; ValueType: String; ValueData: "1"; Flags: uninsdeletevalue uninsdeletekeyifempty; Components: uk
Root: HKLM; Subkey: "SOFTWARE\Microsoft\Speech\Voices\Tokens\UKBetty\Attributes"; ValueName: "Gender"; ValueType: String; ValueData: "Female"; Flags: uninsdeletevalue uninsdeletekeyifempty; Components: uk
Root: HKLM; Subkey: "SOFTWARE\Microsoft\Speech\Voices\Tokens\UKBetty\Attributes"; ValueName: "Language"; ValueType: String; ValueData: "409"; Flags: uninsdeletevalue uninsdeletekeyifempty; Components: uk
Root: HKLM; Subkey: "SOFTWARE\Microsoft\Speech\Voices\Tokens\UKBetty\Attributes"; ValueName: "Age"; ValueType: String; ValueData: "Adult"; Flags: uninsdeletevalue uninsdeletekeyifempty; Components: uk
Root: HKLM; Subkey: "SOFTWARE\Microsoft\Speech\Voices\Tokens\UKBetty\Attributes"; ValueName: "Vendor"; ValueType: String; ValueData: "DECtalk"; Flags: uninsdeletevalue uninsdeletekeyifempty; Components: uk
Root: HKLM; Subkey: "SOFTWARE\Microsoft\Speech\Voices\Tokens\UKBetty\Attributes"; ValueName: "Name"; ValueType: String; ValueData: "Betty"; Flags: uninsdeletevalue uninsdeletekeyifempty; Components: uk
Root: HKLM; Subkey: "SOFTWARE\Microsoft\Speech\Voices\Tokens\UKDennis"; ValueType: String; ValueData: "UK Dennis"; Flags: uninsdeletevalue uninsdeletekeyifempty; Components: uk
Root: HKLM; Subkey: "SOFTWARE\Microsoft\Speech\Voices\Tokens\UKDennis"; ValueName: "409"; ValueType: String; ValueData: "UK Dennis"; Flags: uninsdeletevalue uninsdeletekeyifempty; Components: uk
Root: HKLM; Subkey: "SOFTWARE\Microsoft\Speech\Voices\Tokens\UKDennis"; ValueName: "CLSID"; ValueType: String; ValueData: "{{99EE9588-A4A6-11d1-BEB2-0060083E8376}"; Flags: uninsdeletevalue uninsdeletekeyifempty; Components: uk
Root: HKLM; Subkey: "SOFTWARE\Microsoft\Speech\Voices\Tokens\UKDennis"; ValueName: "Speaker"; ValueType: String; ValueData: "4"; Flags: uninsdeletevalue uninsdeletekeyifempty; Components: uk
Root: HKLM; Subkey: "SOFTWARE\Microsoft\Speech\Voices\Tokens\UKDennis\Attributes"; ValueName: "Gender"; ValueType: String; ValueData: "Male"; Flags: uninsdeletevalue uninsdeletekeyifempty; Components: uk
Root: HKLM; Subkey: "SOFTWARE\Microsoft\Speech\Voices\Tokens\UKDennis\Attributes"; ValueName: "Language"; ValueType: String; ValueData: "409"; Flags: uninsdeletevalue uninsdeletekeyifempty; Components: uk
Root: HKLM; Subkey: "SOFTWARE\Microsoft\Speech\Voices\Tokens\UKDennis\Attributes"; ValueName: "Age"; ValueType: String; ValueData: "Adult"; Flags: uninsdeletevalue uninsdeletekeyifempty; Components: uk
Root: HKLM; Subkey: "SOFTWARE\Microsoft\Speech\Voices\Tokens\UKDennis\Attributes"; ValueName: "Vendor"; ValueType: String; ValueData: "DECtalk"; Flags: uninsdeletevalue uninsdeletekeyifempty; Components: uk
Root: HKLM; Subkey: "SOFTWARE\Microsoft\Speech\Voices\Tokens\UKDennis\Attributes"; ValueName: "Name"; ValueType: String; ValueData: "Dennis"; Flags: uninsdeletevalue uninsdeletekeyifempty; Components: uk
Root: HKLM; Subkey: "SOFTWARE\Microsoft\Speech\Voices\Tokens\UKFrank"; ValueType: String; ValueData: "UK Frank"; Flags: uninsdeletevalue uninsdeletekeyifempty; Components: uk
Root: HKLM; Subkey: "SOFTWARE\Microsoft\Speech\Voices\Tokens\UKFrank"; ValueName: "409"; ValueType: String; ValueData: "UK Frank"; Flags: uninsdeletevalue uninsdeletekeyifempty; Components: uk
Root: HKLM; Subkey: "SOFTWARE\Microsoft\Speech\Voices\Tokens\UKFrank"; ValueName: "CLSID"; ValueType: String; ValueData: "{{99EE9588-A4A6-11d1-BEB2-0060083E8376}"; Flags: uninsdeletevalue uninsdeletekeyifempty; Components: uk
Root: HKLM; Subkey: "SOFTWARE\Microsoft\Speech\Voices\Tokens\UKFrank"; ValueName: "Speaker"; ValueType: String; ValueData: "3"; Flags: uninsdeletevalue uninsdeletekeyifempty; Components: uk
Root: HKLM; Subkey: "SOFTWARE\Microsoft\Speech\Voices\Tokens\UKFrank\Attributes"; ValueName: "Gender"; ValueType: String; ValueData: "Male"; Flags: uninsdeletevalue uninsdeletekeyifempty; Components: uk
Root: HKLM; Subkey: "SOFTWARE\Microsoft\Speech\Voices\Tokens\UKFrank\Attributes"; ValueName: "Language"; ValueType: String; ValueData: "409"; Flags: uninsdeletevalue uninsdeletekeyifempty; Components: uk
Root: HKLM; Subkey: "SOFTWARE\Microsoft\Speech\Voices\Tokens\UKFrank\Attributes"; ValueName: "Age"; ValueType: String; ValueData: "Senior; Adult"; Flags: uninsdeletevalue uninsdeletekeyifempty; Components: uk
Root: HKLM; Subkey: "SOFTWARE\Microsoft\Speech\Voices\Tokens\UKFrank\Attributes"; ValueName: "Vendor"; ValueType: String; ValueData: "DECtalk"; Flags: uninsdeletevalue uninsdeletekeyifempty; Components: uk
Root: HKLM; Subkey: "SOFTWARE\Microsoft\Speech\Voices\Tokens\UKFrank\Attributes"; ValueName: "Name"; ValueType: String; ValueData: "Frank"; Flags: uninsdeletevalue uninsdeletekeyifempty; Components: uk
Root: HKLM; Subkey: "SOFTWARE\Microsoft\Speech\Voices\Tokens\UKHarry"; ValueType: String; ValueData: "UK Harry"; Flags: uninsdeletevalue uninsdeletekeyifempty; Components: uk
Root: HKLM; Subkey: "SOFTWARE\Microsoft\Speech\Voices\Tokens\UKHarry"; ValueName: "409"; ValueType: String; ValueData: "UK Harry"; Flags: uninsdeletevalue uninsdeletekeyifempty; Components: uk
Root: HKLM; Subkey: "SOFTWARE\Microsoft\Speech\Voices\Tokens\UKHarry"; ValueName: "CLSID"; ValueType: String; ValueData: "{{99EE9588-A4A6-11d1-BEB2-0060083E8376}"; Flags: uninsdeletevalue uninsdeletekeyifempty; Components: uk
Root: HKLM; Subkey: "SOFTWARE\Microsoft\Speech\Voices\Tokens\UKHarry"; ValueName: "Speaker"; ValueType: String; ValueData: "2"; Flags: uninsdeletevalue uninsdeletekeyifempty; Components: uk
Root: HKLM; Subkey: "SOFTWARE\Microsoft\Speech\Voices\Tokens\UKHarry\Attributes"; ValueName: "Gender"; ValueType: String; ValueData: "Male"; Flags: uninsdeletevalue uninsdeletekeyifempty; Components: uk
Root: HKLM; Subkey: "SOFTWARE\Microsoft\Speech\Voices\Tokens\UKHarry\Attributes"; ValueName: "Language"; ValueType: String; ValueData: "409"; Flags: uninsdeletevalue uninsdeletekeyifempty; Components: uk
Root: HKLM; Subkey: "SOFTWARE\Microsoft\Speech\Voices\Tokens\UKHarry\Attributes"; ValueName: "Age"; ValueType: String; ValueData: "Adult"; Flags: uninsdeletevalue uninsdeletekeyifempty; Components: uk
Root: HKLM; Subkey: "SOFTWARE\Microsoft\Speech\Voices\Tokens\UKHarry\Attributes"; ValueName: "Vendor"; ValueType: String; ValueData: "DECtalk"; Flags: uninsdeletevalue uninsdeletekeyifempty; Components: uk
Root: HKLM; Subkey: "SOFTWARE\Microsoft\Speech\Voices\Tokens\UKHarry\Attributes"; ValueName: "Name"; ValueType: String; ValueData: "Harry"; Flags: uninsdeletevalue uninsdeletekeyifempty; Components: uk
Root: HKLM; Subkey: "SOFTWARE\Microsoft\Speech\Voices\Tokens\UKKit"; ValueType: String; ValueData: "UK Kit"; Flags: uninsdeletevalue uninsdeletekeyifempty; Components: uk
Root: HKLM; Subkey: "SOFTWARE\Microsoft\Speech\Voices\Tokens\UKKit"; ValueName: "409"; ValueType: String; ValueData: "UK Kit"; Flags: uninsdeletevalue uninsdeletekeyifempty; Components: uk
Root: HKLM; Subkey: "SOFTWARE\Microsoft\Speech\Voices\Tokens\UKKit"; ValueName: "CLSID"; ValueType: String; ValueData: "{{99EE9588-A4A6-11d1-BEB2-0060083E8376}"; Flags: uninsdeletevalue uninsdeletekeyifempty; Components: uk
Root: HKLM; Subkey: "SOFTWARE\Microsoft\Speech\Voices\Tokens\UKKit"; ValueName: "Speaker"; ValueType: String; ValueData: "5"; Flags: uninsdeletevalue uninsdeletekeyifempty; Components: uk
Root: HKLM; Subkey: "SOFTWARE\Microsoft\Speech\Voices\Tokens\UKKit\Attributes"; ValueName: "Gender"; ValueType: String; ValueData: "Male"; Flags: uninsdeletevalue uninsdeletekeyifempty; Components: uk
Root: HKLM; Subkey: "SOFTWARE\Microsoft\Speech\Voices\Tokens\UKKit\Attributes"; ValueName: "Language"; ValueType: String; ValueData: "409"; Flags: uninsdeletevalue uninsdeletekeyifempty; Components: uk
Root: HKLM; Subkey: "SOFTWARE\Microsoft\Speech\Voices\Tokens\UKKit\Attributes"; ValueName: "Age"; ValueType: String; ValueData: "Child"; Flags: uninsdeletevalue uninsdeletekeyifempty; Components: uk
Root: HKLM; Subkey: "SOFTWARE\Microsoft\Speech\Voices\Tokens\UKKit\Attributes"; ValueName: "Vendor"; ValueType: String; ValueData: "DECtalk"; Flags: uninsdeletevalue uninsdeletekeyifempty; Components: uk
Root: HKLM; Subkey: "SOFTWARE\Microsoft\Speech\Voices\Tokens\UKKit\Attributes"; ValueName: "Name"; ValueType: String; ValueData: "Kit"; Flags: uninsdeletevalue uninsdeletekeyifempty; Components: uk
Root: HKLM; Subkey: "SOFTWARE\Microsoft\Speech\Voices\Tokens\UKPaul"; ValueType: String; ValueData: "UK Paul"; Flags: uninsdeletevalue uninsdeletekeyifempty; Components: uk
Root: HKLM; Subkey: "SOFTWARE\Microsoft\Speech\Voices\Tokens\UKPaul"; ValueName: "409"; ValueType: String; ValueData: "UK Paul"; Flags: uninsdeletevalue uninsdeletekeyifempty; Components: uk
Root: HKLM; Subkey: "SOFTWARE\Microsoft\Speech\Voices\Tokens\UKPaul"; ValueName: "CLSID"; ValueType: String; ValueData: "{{99EE9588-A4A6-11d1-BEB2-0060083E8376}"; Flags: uninsdeletevalue uninsdeletekeyifempty; Components: uk
Root: HKLM; Subkey: "SOFTWARE\Microsoft\Speech\Voices\Tokens\UKPaul"; ValueName: "Speaker"; ValueType: String; ValueData: "0"; Flags: uninsdeletevalue uninsdeletekeyifempty; Components: uk
Root: HKLM; Subkey: "SOFTWARE\Microsoft\Speech\Voices\Tokens\UKPaul\Attributes"; ValueName: "Gender"; ValueType: String; ValueData: "Male"; Flags: uninsdeletevalue uninsdeletekeyifempty; Components: uk
Root: HKLM; Subkey: "SOFTWARE\Microsoft\Speech\Voices\Tokens\UKPaul\Attributes"; ValueName: "Language"; ValueType: String; ValueData: "409"; Flags: uninsdeletevalue uninsdeletekeyifempty; Components: uk
Root: HKLM; Subkey: "SOFTWARE\Microsoft\Speech\Voices\Tokens\UKPaul\Attributes"; ValueName: "Age"; ValueType: String; ValueData: "Adult"; Flags: uninsdeletevalue uninsdeletekeyifempty; Components: uk
Root: HKLM; Subkey: "SOFTWARE\Microsoft\Speech\Voices\Tokens\UKPaul\Attributes"; ValueName: "Vendor"; ValueType: String; ValueData: "DECtalk"; Flags: uninsdeletevalue uninsdeletekeyifempty; Components: uk
Root: HKLM; Subkey: "SOFTWARE\Microsoft\Speech\Voices\Tokens\UKPaul\Attributes"; ValueName: "Name"; ValueType: String; ValueData: "Paul"; Flags: uninsdeletevalue uninsdeletekeyifempty; Components: uk
Root: HKLM; Subkey: "SOFTWARE\Microsoft\Speech\Voices\Tokens\UKPaul\Attributes"; ValueName: "VendorPreferred"; ValueType: String; Flags: uninsdeletevalue uninsdeletekeyifempty; Components: uk
Root: HKLM; Subkey: "SOFTWARE\Microsoft\Speech\Voices\Tokens\UKRita"; ValueType: String; ValueData: "UK Rita"; Flags: uninsdeletevalue uninsdeletekeyifempty; Components: uk
Root: HKLM; Subkey: "SOFTWARE\Microsoft\Speech\Voices\Tokens\UKRita"; ValueName: "409"; ValueType: String; ValueData: "UK Rita"; Flags: uninsdeletevalue uninsdeletekeyifempty; Components: uk
Root: HKLM; Subkey: "SOFTWARE\Microsoft\Speech\Voices\Tokens\UKRita"; ValueName: "CLSID"; ValueType: String; ValueData: "{{99EE9588-A4A6-11d1-BEB2-0060083E8376}"; Flags: uninsdeletevalue uninsdeletekeyifempty; Components: uk
Root: HKLM; Subkey: "SOFTWARE\Microsoft\Speech\Voices\Tokens\UKRita"; ValueName: "Speaker"; ValueType: String; ValueData: "7"; Flags: uninsdeletevalue uninsdeletekeyifempty; Components: uk
Root: HKLM; Subkey: "SOFTWARE\Microsoft\Speech\Voices\Tokens\UKRita\Attributes"; ValueName: "Gender"; ValueType: String; ValueData: "Female"; Flags: uninsdeletevalue uninsdeletekeyifempty; Components: uk
Root: HKLM; Subkey: "SOFTWARE\Microsoft\Speech\Voices\Tokens\UKRita\Attributes"; ValueName: "Language"; ValueType: String; ValueData: "409"; Flags: uninsdeletevalue uninsdeletekeyifempty; Components: uk
Root: HKLM; Subkey: "SOFTWARE\Microsoft\Speech\Voices\Tokens\UKRita\Attributes"; ValueName: "Age"; ValueType: String; ValueData: "Adult"; Flags: uninsdeletevalue uninsdeletekeyifempty; Components: uk
Root: HKLM; Subkey: "SOFTWARE\Microsoft\Speech\Voices\Tokens\UKRita\Attributes"; ValueName: "Vendor"; ValueType: String; ValueData: "DECtalk"; Flags: uninsdeletevalue uninsdeletekeyifempty; Components: uk
Root: HKLM; Subkey: "SOFTWARE\Microsoft\Speech\Voices\Tokens\UKRita\Attributes"; ValueName: "Name"; ValueType: String; ValueData: "Rita"; Flags: uninsdeletevalue uninsdeletekeyifempty; Components: uk
Root: HKLM; Subkey: "SOFTWARE\Microsoft\Speech\Voices\Tokens\UKUrsula"; ValueType: String; ValueData: "UK Ursula"; Flags: uninsdeletevalue uninsdeletekeyifempty; Components: uk
Root: HKLM; Subkey: "SOFTWARE\Microsoft\Speech\Voices\Tokens\UKUrsula"; ValueName: "409"; ValueType: String; ValueData: "UK Ursula"; Flags: uninsdeletevalue uninsdeletekeyifempty; Components: uk
Root: HKLM; Subkey: "SOFTWARE\Microsoft\Speech\Voices\Tokens\UKUrsula"; ValueName: "CLSID"; ValueType: String; ValueData: "{{99EE9588-A4A6-11d1-BEB2-0060083E8376}"; Flags: uninsdeletevalue uninsdeletekeyifempty; Components: uk
Root: HKLM; Subkey: "SOFTWARE\Microsoft\Speech\Voices\Tokens\UKUrsula"; ValueName: "Speaker"; ValueType: String; ValueData: "6"; Flags: uninsdeletevalue uninsdeletekeyifempty; Components: uk
Root: HKLM; Subkey: "SOFTWARE\Microsoft\Speech\Voices\Tokens\UKUrsula\Attributes"; ValueName: "Gender"; ValueType: String; ValueData: "Female"; Flags: uninsdeletevalue uninsdeletekeyifempty; Components: uk
Root: HKLM; Subkey: "SOFTWARE\Microsoft\Speech\Voices\Tokens\UKUrsula\Attributes"; ValueName: "Language"; ValueType: String; ValueData: "409"; Flags: uninsdeletevalue uninsdeletekeyifempty; Components: uk
Root: HKLM; Subkey: "SOFTWARE\Microsoft\Speech\Voices\Tokens\UKUrsula\Attributes"; ValueName: "Age"; ValueType: String; ValueData: "Senior; Adult"; Flags: uninsdeletevalue uninsdeletekeyifempty; Components: uk
Root: HKLM; Subkey: "SOFTWARE\Microsoft\Speech\Voices\Tokens\UKUrsula\Attributes"; ValueName: "Vendor"; ValueType: String; ValueData: "DECtalk"; Flags: uninsdeletevalue uninsdeletekeyifempty; Components: uk
Root: HKLM; Subkey: "SOFTWARE\Microsoft\Speech\Voices\Tokens\UKUrsula\Attributes"; ValueName: "Name"; ValueType: String; ValueData: "Ursula"; Flags: uninsdeletevalue uninsdeletekeyifempty; Components: uk
Root: HKLM; Subkey: "SOFTWARE\Microsoft\Speech\Voices\Tokens\UKWendy"; ValueType: String; ValueData: "UK Wendy"; Flags: uninsdeletevalue uninsdeletekeyifempty; Components: uk
Root: HKLM; Subkey: "SOFTWARE\Microsoft\Speech\Voices\Tokens\UKWendy"; ValueName: "409"; ValueType: String; ValueData: "UK Wendy"; Flags: uninsdeletevalue uninsdeletekeyifempty; Components: uk
Root: HKLM; Subkey: "SOFTWARE\Microsoft\Speech\Voices\Tokens\UKWendy"; ValueName: "CLSID"; ValueType: String; ValueData: "{{99EE9588-A4A6-11d1-BEB2-0060083E8376}"; Flags: uninsdeletevalue uninsdeletekeyifempty; Components: uk
Root: HKLM; Subkey: "SOFTWARE\Microsoft\Speech\Voices\Tokens\UKWendy"; ValueName: "Speaker"; ValueType: String; ValueData: "8"; Flags: uninsdeletevalue uninsdeletekeyifempty; Components: uk
Root: HKLM; Subkey: "SOFTWARE\Microsoft\Speech\Voices\Tokens\UKWendy\Attributes"; ValueName: "Gender"; ValueType: String; ValueData: "Female"; Flags: uninsdeletevalue uninsdeletekeyifempty; Components: uk
Root: HKLM; Subkey: "SOFTWARE\Microsoft\Speech\Voices\Tokens\UKWendy\Attributes"; ValueName: "Language"; ValueType: String; ValueData: "409"; Flags: uninsdeletevalue uninsdeletekeyifempty; Components: uk
Root: HKLM; Subkey: "SOFTWARE\Microsoft\Speech\Voices\Tokens\UKWendy\Attributes"; ValueName: "Age"; ValueType: String; ValueData: "Adult"; Flags: uninsdeletevalue uninsdeletekeyifempty; Components: uk
Root: HKLM; Subkey: "SOFTWARE\Microsoft\Speech\Voices\Tokens\UKWendy\Attributes"; ValueName: "Vendor"; ValueType: String; ValueData: "DECtalk"; Flags: uninsdeletevalue uninsdeletekeyifempty; Components: uk
Root: HKLM; Subkey: "SOFTWARE\Microsoft\Speech\Voices\Tokens\UKWendy\Attributes"; ValueName: "Name"; ValueType: String; ValueData: "Wendy"; Flags: uninsdeletevalue uninsdeletekeyifempty; Components: uk
Root: HKLM; Subkey: "SOFTWARE\DECtalk Software\DECtalk\sapi5\SP"; ValueName: "MainDict"; ValueType: String; ValueData: "{app}\sp\dtalk_sp.dic"; Flags: uninsdeletevalue uninsdeletekeyifempty; Components: sp
Root: HKLM; Subkey: "SOFTWARE\Microsoft\Speech\Voices\Tokens\SPBetty"; ValueType: String; ValueData: "SP Betty"; Flags: uninsdeletevalue uninsdeletekeyifempty; Components: sp
Root: HKLM; Subkey: "SOFTWARE\Microsoft\Speech\Voices\Tokens\SPBetty"; ValueName: "409"; ValueType: String; ValueData: "SP Betty"; Flags: uninsdeletevalue uninsdeletekeyifempty; Components: sp
Root: HKLM; Subkey: "SOFTWARE\Microsoft\Speech\Voices\Tokens\SPBetty"; ValueName: "CLSID"; ValueType: String; ValueData: "{{99EE9582-A4A6-11d1-BEB2-0060083E8376}"; Flags: uninsdeletevalue uninsdeletekeyifempty; Components: sp
Root: HKLM; Subkey: "SOFTWARE\Microsoft\Speech\Voices\Tokens\SPBetty"; ValueName: "Speaker"; ValueType: String; ValueData: "1"; Flags: uninsdeletevalue uninsdeletekeyifempty; Components: sp
Root: HKLM; Subkey: "SOFTWARE\Microsoft\Speech\Voices\Tokens\SPBetty\Attributes"; ValueName: "Gender"; ValueType: String; ValueData: "Female"; Flags: uninsdeletevalue uninsdeletekeyifempty; Components: sp
Root: HKLM; Subkey: "SOFTWARE\Microsoft\Speech\Voices\Tokens\SPBetty\Attributes"; ValueName: "Language"; ValueType: String; ValueData: "409"; Flags: uninsdeletevalue uninsdeletekeyifempty; Components: sp
Root: HKLM; Subkey: "SOFTWARE\Microsoft\Speech\Voices\Tokens\SPBetty\Attributes"; ValueName: "Age"; ValueType: String; ValueData: "Adult"; Flags: uninsdeletevalue uninsdeletekeyifempty; Components: sp
Root: HKLM; Subkey: "SOFTWARE\Microsoft\Speech\Voices\Tokens\SPBetty\Attributes"; ValueName: "Vendor"; ValueType: String; ValueData: "DECtalk"; Flags: uninsdeletevalue uninsdeletekeyifempty; Components: sp
Root: HKLM; Subkey: "SOFTWARE\Microsoft\Speech\Voices\Tokens\SPBetty\Attributes"; ValueName: "Name"; ValueType: String; ValueData: "Betty"; Flags: uninsdeletevalue uninsdeletekeyifempty; Components: sp
Root: HKLM; Subkey: "SOFTWARE\Microsoft\Speech\Voices\Tokens\SPDennis"; ValueType: String; ValueData: "SP Dennis"; Flags: uninsdeletevalue uninsdeletekeyifempty; Components: sp
Root: HKLM; Subkey: "SOFTWARE\Microsoft\Speech\Voices\Tokens\SPDennis"; ValueName: "409"; ValueType: String; ValueData: "SP Dennis"; Flags: uninsdeletevalue uninsdeletekeyifempty; Components: sp
Root: HKLM; Subkey: "SOFTWARE\Microsoft\Speech\Voices\Tokens\SPDennis"; ValueName: "CLSID"; ValueType: String; ValueData: "{{99EE9582-A4A6-11d1-BEB2-0060083E8376}"; Flags: uninsdeletevalue uninsdeletekeyifempty; Components: sp
Root: HKLM; Subkey: "SOFTWARE\Microsoft\Speech\Voices\Tokens\SPDennis"; ValueName: "Speaker"; ValueType: String; ValueData: "4"; Flags: uninsdeletevalue uninsdeletekeyifempty; Components: sp
Root: HKLM; Subkey: "SOFTWARE\Microsoft\Speech\Voices\Tokens\SPDennis\Attributes"; ValueName: "Gender"; ValueType: String; ValueData: "Male"; Flags: uninsdeletevalue uninsdeletekeyifempty; Components: sp
Root: HKLM; Subkey: "SOFTWARE\Microsoft\Speech\Voices\Tokens\SPDennis\Attributes"; ValueName: "Language"; ValueType: String; ValueData: "409"; Flags: uninsdeletevalue uninsdeletekeyifempty; Components: sp
Root: HKLM; Subkey: "SOFTWARE\Microsoft\Speech\Voices\Tokens\SPDennis\Attributes"; ValueName: "Age"; ValueType: String; ValueData: "Adult"; Flags: uninsdeletevalue uninsdeletekeyifempty; Components: sp
Root: HKLM; Subkey: "SOFTWARE\Microsoft\Speech\Voices\Tokens\SPDennis\Attributes"; ValueName: "Vendor"; ValueType: String; ValueData: "DECtalk"; Flags: uninsdeletevalue uninsdeletekeyifempty; Components: sp
Root: HKLM; Subkey: "SOFTWARE\Microsoft\Speech\Voices\Tokens\SPDennis\Attributes"; ValueName: "Name"; ValueType: String; ValueData: "Dennis"; Flags: uninsdeletevalue uninsdeletekeyifempty; Components: sp
Root: HKLM; Subkey: "SOFTWARE\Microsoft\Speech\Voices\Tokens\SPFrank"; ValueType: String; ValueData: "SP Frank"; Flags: uninsdeletevalue uninsdeletekeyifempty; Components: sp
Root: HKLM; Subkey: "SOFTWARE\Microsoft\Speech\Voices\Tokens\SPFrank"; ValueName: "409"; ValueType: String; ValueData: "SP Frank"; Flags: uninsdeletevalue uninsdeletekeyifempty; Components: sp
Root: HKLM; Subkey: "SOFTWARE\Microsoft\Speech\Voices\Tokens\SPFrank"; ValueName: "CLSID"; ValueType: String; ValueData: "{{99EE9582-A4A6-11d1-BEB2-0060083E8376}"; Flags: uninsdeletevalue uninsdeletekeyifempty; Components: sp
Root: HKLM; Subkey: "SOFTWARE\Microsoft\Speech\Voices\Tokens\SPFrank"; ValueName: "Speaker"; ValueType: String; ValueData: "3"; Flags: uninsdeletevalue uninsdeletekeyifempty; Components: sp
Root: HKLM; Subkey: "SOFTWARE\Microsoft\Speech\Voices\Tokens\SPFrank\Attributes"; ValueName: "Gender"; ValueType: String; ValueData: "Male"; Flags: uninsdeletevalue uninsdeletekeyifempty; Components: sp
Root: HKLM; Subkey: "SOFTWARE\Microsoft\Speech\Voices\Tokens\SPFrank\Attributes"; ValueName: "Language"; ValueType: String; ValueData: "409"; Flags: uninsdeletevalue uninsdeletekeyifempty; Components: sp
Root: HKLM; Subkey: "SOFTWARE\Microsoft\Speech\Voices\Tokens\SPFrank\Attributes"; ValueName: "Age"; ValueType: String; ValueData: "Senior; Adult"; Flags: uninsdeletevalue uninsdeletekeyifempty; Components: sp
Root: HKLM; Subkey: "SOFTWARE\Microsoft\Speech\Voices\Tokens\SPFrank\Attributes"; ValueName: "Vendor"; ValueType: String; ValueData: "DECtalk"; Flags: uninsdeletevalue uninsdeletekeyifempty; Components: sp
Root: HKLM; Subkey: "SOFTWARE\Microsoft\Speech\Voices\Tokens\SPFrank\Attributes"; ValueName: "Name"; ValueType: String; ValueData: "Frank"; Flags: uninsdeletevalue uninsdeletekeyifempty; Components: sp
Root: HKLM; Subkey: "SOFTWARE\Microsoft\Speech\Voices\Tokens\SPHarry"; ValueType: String; ValueData: "SP Harry"; Flags: uninsdeletevalue uninsdeletekeyifempty; Components: sp
Root: HKLM; Subkey: "SOFTWARE\Microsoft\Speech\Voices\Tokens\SPHarry"; ValueName: "409"; ValueType: String; ValueData: "SP Harry"; Flags: uninsdeletevalue uninsdeletekeyifempty; Components: sp
Root: HKLM; Subkey: "SOFTWARE\Microsoft\Speech\Voices\Tokens\SPHarry"; ValueName: "CLSID"; ValueType: String; ValueData: "{{99EE9582-A4A6-11d1-BEB2-0060083E8376}"; Flags: uninsdeletevalue uninsdeletekeyifempty; Components: sp
Root: HKLM; Subkey: "SOFTWARE\Microsoft\Speech\Voices\Tokens\SPHarry"; ValueName: "Speaker"; ValueType: String; ValueData: "2"; Flags: uninsdeletevalue uninsdeletekeyifempty; Components: sp
Root: HKLM; Subkey: "SOFTWARE\Microsoft\Speech\Voices\Tokens\SPHarry\Attributes"; ValueName: "Gender"; ValueType: String; ValueData: "Male"; Flags: uninsdeletevalue uninsdeletekeyifempty; Components: sp
Root: HKLM; Subkey: "SOFTWARE\Microsoft\Speech\Voices\Tokens\SPHarry\Attributes"; ValueName: "Language"; ValueType: String; ValueData: "409"; Flags: uninsdeletevalue uninsdeletekeyifempty; Components: sp
Root: HKLM; Subkey: "SOFTWARE\Microsoft\Speech\Voices\Tokens\SPHarry\Attributes"; ValueName: "Age"; ValueType: String; ValueData: "Adult"; Flags: uninsdeletevalue uninsdeletekeyifempty; Components: sp
Root: HKLM; Subkey: "SOFTWARE\Microsoft\Speech\Voices\Tokens\SPHarry\Attributes"; ValueName: "Vendor"; ValueType: String; ValueData: "DECtalk"; Flags: uninsdeletevalue uninsdeletekeyifempty; Components: sp
Root: HKLM; Subkey: "SOFTWARE\Microsoft\Speech\Voices\Tokens\SPHarry\Attributes"; ValueName: "Name"; ValueType: String; ValueData: "Harry"; Flags: uninsdeletevalue uninsdeletekeyifempty; Components: sp
Root: HKLM; Subkey: "SOFTWARE\Microsoft\Speech\Voices\Tokens\SPKit"; ValueType: String; ValueData: "SP Kit"; Flags: uninsdeletevalue uninsdeletekeyifempty; Components: sp
Root: HKLM; Subkey: "SOFTWARE\Microsoft\Speech\Voices\Tokens\SPKit"; ValueName: "409"; ValueType: String; ValueData: "SP Kit"; Flags: uninsdeletevalue uninsdeletekeyifempty; Components: sp
Root: HKLM; Subkey: "SOFTWARE\Microsoft\Speech\Voices\Tokens\SPKit"; ValueName: "CLSID"; ValueType: String; ValueData: "{{99EE9582-A4A6-11d1-BEB2-0060083E8376}"; Flags: uninsdeletevalue uninsdeletekeyifempty; Components: sp
Root: HKLM; Subkey: "SOFTWARE\Microsoft\Speech\Voices\Tokens\SPKit"; ValueName: "Speaker"; ValueType: String; ValueData: "5"; Flags: uninsdeletevalue uninsdeletekeyifempty; Components: sp
Root: HKLM; Subkey: "SOFTWARE\Microsoft\Speech\Voices\Tokens\SPKit\Attributes"; ValueName: "Gender"; ValueType: String; ValueData: "Male"; Flags: uninsdeletevalue uninsdeletekeyifempty; Components: sp
Root: HKLM; Subkey: "SOFTWARE\Microsoft\Speech\Voices\Tokens\SPKit\Attributes"; ValueName: "Language"; ValueType: String; ValueData: "409"; Flags: uninsdeletevalue uninsdeletekeyifempty; Components: sp
Root: HKLM; Subkey: "SOFTWARE\Microsoft\Speech\Voices\Tokens\SPKit\Attributes"; ValueName: "Age"; ValueType: String; ValueData: "Child"; Flags: uninsdeletevalue uninsdeletekeyifempty; Components: sp
Root: HKLM; Subkey: "SOFTWARE\Microsoft\Speech\Voices\Tokens\SPKit\Attributes"; ValueName: "Vendor"; ValueType: String; ValueData: "DECtalk"; Flags: uninsdeletevalue uninsdeletekeyifempty; Components: sp
Root: HKLM; Subkey: "SOFTWARE\Microsoft\Speech\Voices\Tokens\SPKit\Attributes"; ValueName: "Name"; ValueType: String; ValueData: "Kit"; Flags: uninsdeletevalue uninsdeletekeyifempty; Components: sp
Root: HKLM; Subkey: "SOFTWARE\Microsoft\Speech\Voices\Tokens\SPPaul"; ValueType: String; ValueData: "SP Paul"; Flags: uninsdeletevalue uninsdeletekeyifempty; Components: sp
Root: HKLM; Subkey: "SOFTWARE\Microsoft\Speech\Voices\Tokens\SPPaul"; ValueName: "409"; ValueType: String; ValueData: "SP Paul"; Flags: uninsdeletevalue uninsdeletekeyifempty; Components: sp
Root: HKLM; Subkey: "SOFTWARE\Microsoft\Speech\Voices\Tokens\SPPaul"; ValueName: "CLSID"; ValueType: String; ValueData: "{{99EE9582-A4A6-11d1-BEB2-0060083E8376}"; Flags: uninsdeletevalue uninsdeletekeyifempty; Components: sp
Root: HKLM; Subkey: "SOFTWARE\Microsoft\Speech\Voices\Tokens\SPPaul"; ValueName: "Speaker"; ValueType: String; ValueData: "0"; Flags: uninsdeletevalue uninsdeletekeyifempty; Components: sp
Root: HKLM; Subkey: "SOFTWARE\Microsoft\Speech\Voices\Tokens\SPPaul\Attributes"; ValueName: "Gender"; ValueType: String; ValueData: "Male"; Flags: uninsdeletevalue uninsdeletekeyifempty; Components: sp
Root: HKLM; Subkey: "SOFTWARE\Microsoft\Speech\Voices\Tokens\SPPaul\Attributes"; ValueName: "Language"; ValueType: String; ValueData: "409"; Flags: uninsdeletevalue uninsdeletekeyifempty; Components: sp
Root: HKLM; Subkey: "SOFTWARE\Microsoft\Speech\Voices\Tokens\SPPaul\Attributes"; ValueName: "Age"; ValueType: String; ValueData: "Adult"; Flags: uninsdeletevalue uninsdeletekeyifempty; Components: sp
Root: HKLM; Subkey: "SOFTWARE\Microsoft\Speech\Voices\Tokens\SPPaul\Attributes"; ValueName: "Vendor"; ValueType: String; ValueData: "DECtalk"; Flags: uninsdeletevalue uninsdeletekeyifempty; Components: sp
Root: HKLM; Subkey: "SOFTWARE\Microsoft\Speech\Voices\Tokens\SPPaul\Attributes"; ValueName: "Name"; ValueType: String; ValueData: "Paul"; Flags: uninsdeletevalue uninsdeletekeyifempty; Components: sp
Root: HKLM; Subkey: "SOFTWARE\Microsoft\Speech\Voices\Tokens\SPPaul\Attributes"; ValueName: "VendorPreferred"; ValueType: String; Flags: uninsdeletevalue uninsdeletekeyifempty; Components: sp
Root: HKLM; Subkey: "SOFTWARE\Microsoft\Speech\Voices\Tokens\SPRita"; ValueType: String; ValueData: "SP Rita"; Flags: uninsdeletevalue uninsdeletekeyifempty; Components: sp
Root: HKLM; Subkey: "SOFTWARE\Microsoft\Speech\Voices\Tokens\SPRita"; ValueName: "409"; ValueType: String; ValueData: "SP Rita"; Flags: uninsdeletevalue uninsdeletekeyifempty; Components: sp
Root: HKLM; Subkey: "SOFTWARE\Microsoft\Speech\Voices\Tokens\SPRita"; ValueName: "CLSID"; ValueType: String; ValueData: "{{99EE9582-A4A6-11d1-BEB2-0060083E8376}"; Flags: uninsdeletevalue uninsdeletekeyifempty; Components: sp
Root: HKLM; Subkey: "SOFTWARE\Microsoft\Speech\Voices\Tokens\SPRita"; ValueName: "Speaker"; ValueType: String; ValueData: "7"; Flags: uninsdeletevalue uninsdeletekeyifempty; Components: sp
Root: HKLM; Subkey: "SOFTWARE\Microsoft\Speech\Voices\Tokens\SPRita\Attributes"; ValueName: "Gender"; ValueType: String; ValueData: "Female"; Flags: uninsdeletevalue uninsdeletekeyifempty; Components: sp
Root: HKLM; Subkey: "SOFTWARE\Microsoft\Speech\Voices\Tokens\SPRita\Attributes"; ValueName: "Language"; ValueType: String; ValueData: "409"; Flags: uninsdeletevalue uninsdeletekeyifempty; Components: sp
Root: HKLM; Subkey: "SOFTWARE\Microsoft\Speech\Voices\Tokens\SPRita\Attributes"; ValueName: "Age"; ValueType: String; ValueData: "Adult"; Flags: uninsdeletevalue uninsdeletekeyifempty; Components: sp
Root: HKLM; Subkey: "SOFTWARE\Microsoft\Speech\Voices\Tokens\SPRita\Attributes"; ValueName: "Vendor"; ValueType: String; ValueData: "DECtalk"; Flags: uninsdeletevalue uninsdeletekeyifempty; Components: sp
Root: HKLM; Subkey: "SOFTWARE\Microsoft\Speech\Voices\Tokens\SPRita\Attributes"; ValueName: "Name"; ValueType: String; ValueData: "Rita"; Flags: uninsdeletevalue uninsdeletekeyifempty; Components: sp
Root: HKLM; Subkey: "SOFTWARE\Microsoft\Speech\Voices\Tokens\SPUrsula"; ValueType: String; ValueData: "SP Ursula"; Flags: uninsdeletevalue uninsdeletekeyifempty; Components: sp
Root: HKLM; Subkey: "SOFTWARE\Microsoft\Speech\Voices\Tokens\SPUrsula"; ValueName: "409"; ValueType: String; ValueData: "SP Ursula"; Flags: uninsdeletevalue uninsdeletekeyifempty; Components: sp
Root: HKLM; Subkey: "SOFTWARE\Microsoft\Speech\Voices\Tokens\SPUrsula"; ValueName: "CLSID"; ValueType: String; ValueData: "{{99EE9582-A4A6-11d1-BEB2-0060083E8376}"; Flags: uninsdeletevalue uninsdeletekeyifempty; Components: sp
Root: HKLM; Subkey: "SOFTWARE\Microsoft\Speech\Voices\Tokens\SPUrsula"; ValueName: "Speaker"; ValueType: String; ValueData: "6"; Flags: uninsdeletevalue uninsdeletekeyifempty; Components: sp
Root: HKLM; Subkey: "SOFTWARE\Microsoft\Speech\Voices\Tokens\SPUrsula\Attributes"; ValueName: "Gender"; ValueType: String; ValueData: "Female"; Flags: uninsdeletevalue uninsdeletekeyifempty; Components: sp
Root: HKLM; Subkey: "SOFTWARE\Microsoft\Speech\Voices\Tokens\SPUrsula\Attributes"; ValueName: "Language"; ValueType: String; ValueData: "409"; Flags: uninsdeletevalue uninsdeletekeyifempty; Components: sp
Root: HKLM; Subkey: "SOFTWARE\Microsoft\Speech\Voices\Tokens\SPUrsula\Attributes"; ValueName: "Age"; ValueType: String; ValueData: "Senior; Adult"; Flags: uninsdeletevalue uninsdeletekeyifempty; Components: sp
Root: HKLM; Subkey: "SOFTWARE\Microsoft\Speech\Voices\Tokens\SPUrsula\Attributes"; ValueName: "Vendor"; ValueType: String; ValueData: "DECtalk"; Flags: uninsdeletevalue uninsdeletekeyifempty; Components: sp
Root: HKLM; Subkey: "SOFTWARE\Microsoft\Speech\Voices\Tokens\SPUrsula\Attributes"; ValueName: "Name"; ValueType: String; ValueData: "Ursula"; Flags: uninsdeletevalue uninsdeletekeyifempty; Components: sp
Root: HKLM; Subkey: "SOFTWARE\Microsoft\Speech\Voices\Tokens\SPWendy"; ValueType: String; ValueData: "SP Wendy"; Flags: uninsdeletevalue uninsdeletekeyifempty; Components: sp
Root: HKLM; Subkey: "SOFTWARE\Microsoft\Speech\Voices\Tokens\SPWendy"; ValueName: "409"; ValueType: String; ValueData: "SP Wendy"; Flags: uninsdeletevalue uninsdeletekeyifempty; Components: sp
Root: HKLM; Subkey: "SOFTWARE\Microsoft\Speech\Voices\Tokens\SPWendy"; ValueName: "CLSID"; ValueType: String; ValueData: "{{99EE9582-A4A6-11d1-BEB2-0060083E8376}"; Flags: uninsdeletevalue uninsdeletekeyifempty; Components: sp
Root: HKLM; Subkey: "SOFTWARE\Microsoft\Speech\Voices\Tokens\SPWendy"; ValueName: "Speaker"; ValueType: String; ValueData: "8"; Flags: uninsdeletevalue uninsdeletekeyifempty; Components: sp
Root: HKLM; Subkey: "SOFTWARE\Microsoft\Speech\Voices\Tokens\SPWendy\Attributes"; ValueName: "Gender"; ValueType: String; ValueData: "Female"; Flags: uninsdeletevalue uninsdeletekeyifempty; Components: sp
Root: HKLM; Subkey: "SOFTWARE\Microsoft\Speech\Voices\Tokens\SPWendy\Attributes"; ValueName: "Language"; ValueType: String; ValueData: "409"; Flags: uninsdeletevalue uninsdeletekeyifempty; Components: sp
Root: HKLM; Subkey: "SOFTWARE\Microsoft\Speech\Voices\Tokens\SPWendy\Attributes"; ValueName: "Age"; ValueType: String; ValueData: "Adult"; Flags: uninsdeletevalue uninsdeletekeyifempty; Components: sp
Root: HKLM; Subkey: "SOFTWARE\Microsoft\Speech\Voices\Tokens\SPWendy\Attributes"; ValueName: "Vendor"; ValueType: String; ValueData: "DECtalk"; Flags: uninsdeletevalue uninsdeletekeyifempty; Components: sp
Root: HKLM; Subkey: "SOFTWARE\Microsoft\Speech\Voices\Tokens\SPWendy\Attributes"; ValueName: "Name"; ValueType: String; ValueData: "Wendy"; Flags: uninsdeletevalue uninsdeletekeyifempty; Components: sp
Root: HKLM; Subkey: "SOFTWARE\DECtalk Software\DECtalk\sapi5\LA"; ValueName: "MainDict"; ValueType: String; ValueData: "{app}\la\dtalk_la.dic"; Flags: uninsdeletevalue uninsdeletekeyifempty; Components: la
Root: HKLM; Subkey: "SOFTWARE\Microsoft\Speech\Voices\Tokens\LABetty"; ValueType: String; ValueData: "LA Betty"; Flags: uninsdeletevalue uninsdeletekeyifempty; Components: la
Root: HKLM; Subkey: "SOFTWARE\Microsoft\Speech\Voices\Tokens\LABetty"; ValueName: "409"; ValueType: String; ValueData: "LA Betty"; Flags: uninsdeletevalue uninsdeletekeyifempty; Components: la
Root: HKLM; Subkey: "SOFTWARE\Microsoft\Speech\Voices\Tokens\LABetty"; ValueName: "CLSID"; ValueType: String; ValueData: "{{99EE9584-A4A6-11d1-BEB2-0060083E8376}"; Flags: uninsdeletevalue uninsdeletekeyifempty; Components: la
Root: HKLM; Subkey: "SOFTWARE\Microsoft\Speech\Voices\Tokens\LABetty"; ValueName: "Speaker"; ValueType: String; ValueData: "1"; Flags: uninsdeletevalue uninsdeletekeyifempty; Components: la
Root: HKLM; Subkey: "SOFTWARE\Microsoft\Speech\Voices\Tokens\LABetty\Attributes"; ValueName: "Gender"; ValueType: String; ValueData: "Female"; Flags: uninsdeletevalue uninsdeletekeyifempty; Components: la
Root: HKLM; Subkey: "SOFTWARE\Microsoft\Speech\Voices\Tokens\LABetty\Attributes"; ValueName: "Language"; ValueType: String; ValueData: "409"; Flags: uninsdeletevalue uninsdeletekeyifempty; Components: la
Root: HKLM; Subkey: "SOFTWARE\Microsoft\Speech\Voices\Tokens\LABetty\Attributes"; ValueName: "Age"; ValueType: String; ValueData: "Adult"; Flags: uninsdeletevalue uninsdeletekeyifempty; Components: la
Root: HKLM; Subkey: "SOFTWARE\Microsoft\Speech\Voices\Tokens\LABetty\Attributes"; ValueName: "Vendor"; ValueType: String; ValueData: "DECtalk"; Flags: uninsdeletevalue uninsdeletekeyifempty; Components: la
Root: HKLM; Subkey: "SOFTWARE\Microsoft\Speech\Voices\Tokens\LABetty\Attributes"; ValueName: "Name"; ValueType: String; ValueData: "Betty"; Flags: uninsdeletevalue uninsdeletekeyifempty; Components: la
Root: HKLM; Subkey: "SOFTWARE\Microsoft\Speech\Voices\Tokens\LADennis"; ValueType: String; ValueData: "LA Dennis"; Flags: uninsdeletevalue uninsdeletekeyifempty; Components: la
Root: HKLM; Subkey: "SOFTWARE\Microsoft\Speech\Voices\Tokens\LADennis"; ValueName: "409"; ValueType: String; ValueData: "LA Dennis"; Flags: uninsdeletevalue uninsdeletekeyifempty; Components: la
Root: HKLM; Subkey: "SOFTWARE\Microsoft\Speech\Voices\Tokens\LADennis"; ValueName: "CLSID"; ValueType: String; ValueData: "{{99EE9584-A4A6-11d1-BEB2-0060083E8376}"; Flags: uninsdeletevalue uninsdeletekeyifempty; Components: la
Root: HKLM; Subkey: "SOFTWARE\Microsoft\Speech\Voices\Tokens\LADennis"; ValueName: "Speaker"; ValueType: String; ValueData: "4"; Flags: uninsdeletevalue uninsdeletekeyifempty; Components: la
Root: HKLM; Subkey: "SOFTWARE\Microsoft\Speech\Voices\Tokens\LADennis\Attributes"; ValueName: "Gender"; ValueType: String; ValueData: "Male"; Flags: uninsdeletevalue uninsdeletekeyifempty; Components: la
Root: HKLM; Subkey: "SOFTWARE\Microsoft\Speech\Voices\Tokens\LADennis\Attributes"; ValueName: "Language"; ValueType: String; ValueData: "409"; Flags: uninsdeletevalue uninsdeletekeyifempty; Components: la
Root: HKLM; Subkey: "SOFTWARE\Microsoft\Speech\Voices\Tokens\LADennis\Attributes"; ValueName: "Age"; ValueType: String; ValueData: "Adult"; Flags: uninsdeletevalue uninsdeletekeyifempty; Components: la
Root: HKLM; Subkey: "SOFTWARE\Microsoft\Speech\Voices\Tokens\LADennis\Attributes"; ValueName: "Vendor"; ValueType: String; ValueData: "DECtalk"; Flags: uninsdeletevalue uninsdeletekeyifempty; Components: la
Root: HKLM; Subkey: "SOFTWARE\Microsoft\Speech\Voices\Tokens\LADennis\Attributes"; ValueName: "Name"; ValueType: String; ValueData: "Dennis"; Flags: uninsdeletevalue uninsdeletekeyifempty; Components: la
Root: HKLM; Subkey: "SOFTWARE\Microsoft\Speech\Voices\Tokens\LAFrank"; ValueType: String; ValueData: "LA Frank"; Flags: uninsdeletevalue uninsdeletekeyifempty; Components: la
Root: HKLM; Subkey: "SOFTWARE\Microsoft\Speech\Voices\Tokens\LAFrank"; ValueName: "409"; ValueType: String; ValueData: "LA Frank"; Flags: uninsdeletevalue uninsdeletekeyifempty; Components: la
Root: HKLM; Subkey: "SOFTWARE\Microsoft\Speech\Voices\Tokens\LAFrank"; ValueName: "CLSID"; ValueType: String; ValueData: "{{99EE9584-A4A6-11d1-BEB2-0060083E8376}"; Flags: uninsdeletevalue uninsdeletekeyifempty; Components: la
Root: HKLM; Subkey: "SOFTWARE\Microsoft\Speech\Voices\Tokens\LAFrank"; ValueName: "Speaker"; ValueType: String; ValueData: "3"; Flags: uninsdeletevalue uninsdeletekeyifempty; Components: la
Root: HKLM; Subkey: "SOFTWARE\Microsoft\Speech\Voices\Tokens\LAFrank\Attributes"; ValueName: "Gender"; ValueType: String; ValueData: "Male"; Flags: uninsdeletevalue uninsdeletekeyifempty; Components: la
Root: HKLM; Subkey: "SOFTWARE\Microsoft\Speech\Voices\Tokens\LAFrank\Attributes"; ValueName: "Language"; ValueType: String; ValueData: "409"; Flags: uninsdeletevalue uninsdeletekeyifempty; Components: la
Root: HKLM; Subkey: "SOFTWARE\Microsoft\Speech\Voices\Tokens\LAFrank\Attributes"; ValueName: "Age"; ValueType: String; ValueData: "Senior; Adult"; Flags: uninsdeletevalue uninsdeletekeyifempty; Components: la
Root: HKLM; Subkey: "SOFTWARE\Microsoft\Speech\Voices\Tokens\LAFrank\Attributes"; ValueName: "Vendor"; ValueType: String; ValueData: "DECtalk"; Flags: uninsdeletevalue uninsdeletekeyifempty; Components: la
Root: HKLM; Subkey: "SOFTWARE\Microsoft\Speech\Voices\Tokens\LAFrank\Attributes"; ValueName: "Name"; ValueType: String; ValueData: "Frank"; Flags: uninsdeletevalue uninsdeletekeyifempty; Components: la
Root: HKLM; Subkey: "SOFTWARE\Microsoft\Speech\Voices\Tokens\LAHarry"; ValueType: String; ValueData: "LA Harry"; Flags: uninsdeletevalue uninsdeletekeyifempty; Components: la
Root: HKLM; Subkey: "SOFTWARE\Microsoft\Speech\Voices\Tokens\LAHarry"; ValueName: "409"; ValueType: String; ValueData: "LA Harry"; Flags: uninsdeletevalue uninsdeletekeyifempty; Components: la
Root: HKLM; Subkey: "SOFTWARE\Microsoft\Speech\Voices\Tokens\LAHarry"; ValueName: "CLSID"; ValueType: String; ValueData: "{{99EE9584-A4A6-11d1-BEB2-0060083E8376}"; Flags: uninsdeletevalue uninsdeletekeyifempty; Components: la
Root: HKLM; Subkey: "SOFTWARE\Microsoft\Speech\Voices\Tokens\LAHarry"; ValueName: "Speaker"; ValueType: String; ValueData: "2"; Flags: uninsdeletevalue uninsdeletekeyifempty; Components: la
Root: HKLM; Subkey: "SOFTWARE\Microsoft\Speech\Voices\Tokens\LAHarry\Attributes"; ValueName: "Gender"; ValueType: String; ValueData: "Male"; Flags: uninsdeletevalue uninsdeletekeyifempty; Components: la
Root: HKLM; Subkey: "SOFTWARE\Microsoft\Speech\Voices\Tokens\LAHarry\Attributes"; ValueName: "Language"; ValueType: String; ValueData: "409"; Flags: uninsdeletevalue uninsdeletekeyifempty; Components: la
Root: HKLM; Subkey: "SOFTWARE\Microsoft\Speech\Voices\Tokens\LAHarry\Attributes"; ValueName: "Age"; ValueType: String; ValueData: "Adult"; Flags: uninsdeletevalue uninsdeletekeyifempty; Components: la
Root: HKLM; Subkey: "SOFTWARE\Microsoft\Speech\Voices\Tokens\LAHarry\Attributes"; ValueName: "Vendor"; ValueType: String; ValueData: "DECtalk"; Flags: uninsdeletevalue uninsdeletekeyifempty; Components: la
Root: HKLM; Subkey: "SOFTWARE\Microsoft\Speech\Voices\Tokens\LAHarry\Attributes"; ValueName: "Name"; ValueType: String; ValueData: "Harry"; Flags: uninsdeletevalue uninsdeletekeyifempty; Components: la
Root: HKLM; Subkey: "SOFTWARE\Microsoft\Speech\Voices\Tokens\LAKit"; ValueType: String; ValueData: "LA Kit"; Flags: uninsdeletevalue uninsdeletekeyifempty; Components: la
Root: HKLM; Subkey: "SOFTWARE\Microsoft\Speech\Voices\Tokens\LAKit"; ValueName: "409"; ValueType: String; ValueData: "LA Kit"; Flags: uninsdeletevalue uninsdeletekeyifempty; Components: la
Root: HKLM; Subkey: "SOFTWARE\Microsoft\Speech\Voices\Tokens\LAKit"; ValueName: "CLSID"; ValueType: String; ValueData: "{{99EE9584-A4A6-11d1-BEB2-0060083E8376}"; Flags: uninsdeletevalue uninsdeletekeyifempty; Components: la
Root: HKLM; Subkey: "SOFTWARE\Microsoft\Speech\Voices\Tokens\LAKit"; ValueName: "Speaker"; ValueType: String; ValueData: "5"; Flags: uninsdeletevalue uninsdeletekeyifempty; Components: la
Root: HKLM; Subkey: "SOFTWARE\Microsoft\Speech\Voices\Tokens\LAKit\Attributes"; ValueName: "Gender"; ValueType: String; ValueData: "Male"; Flags: uninsdeletevalue uninsdeletekeyifempty; Components: la
Root: HKLM; Subkey: "SOFTWARE\Microsoft\Speech\Voices\Tokens\LAKit\Attributes"; ValueName: "Language"; ValueType: String; ValueData: "409"; Flags: uninsdeletevalue uninsdeletekeyifempty; Components: la
Root: HKLM; Subkey: "SOFTWARE\Microsoft\Speech\Voices\Tokens\LAKit\Attributes"; ValueName: "Age"; ValueType: String; ValueData: "Child"; Flags: uninsdeletevalue uninsdeletekeyifempty; Components: la
Root: HKLM; Subkey: "SOFTWARE\Microsoft\Speech\Voices\Tokens\LAKit\Attributes"; ValueName: "Vendor"; ValueType: String; ValueData: "DECtalk"; Flags: uninsdeletevalue uninsdeletekeyifempty; Components: la
Root: HKLM; Subkey: "SOFTWARE\Microsoft\Speech\Voices\Tokens\LAKit\Attributes"; ValueName: "Name"; ValueType: String; ValueData: "Kit"; Flags: uninsdeletevalue uninsdeletekeyifempty; Components: la
Root: HKLM; Subkey: "SOFTWARE\Microsoft\Speech\Voices\Tokens\LAPaul"; ValueType: String; ValueData: "LA Paul"; Flags: uninsdeletevalue uninsdeletekeyifempty; Components: la
Root: HKLM; Subkey: "SOFTWARE\Microsoft\Speech\Voices\Tokens\LAPaul"; ValueName: "409"; ValueType: String; ValueData: "LA Paul"; Flags: uninsdeletevalue uninsdeletekeyifempty; Components: la
Root: HKLM; Subkey: "SOFTWARE\Microsoft\Speech\Voices\Tokens\LAPaul"; ValueName: "CLSID"; ValueType: String; ValueData: "{{99EE9584-A4A6-11d1-BEB2-0060083E8376}"; Flags: uninsdeletevalue uninsdeletekeyifempty; Components: la
Root: HKLM; Subkey: "SOFTWARE\Microsoft\Speech\Voices\Tokens\LAPaul"; ValueName: "Speaker"; ValueType: String; ValueData: "0"; Flags: uninsdeletevalue uninsdeletekeyifempty; Components: la
Root: HKLM; Subkey: "SOFTWARE\Microsoft\Speech\Voices\Tokens\LAPaul\Attributes"; ValueName: "Gender"; ValueType: String; ValueData: "Male"; Flags: uninsdeletevalue uninsdeletekeyifempty; Components: la
Root: HKLM; Subkey: "SOFTWARE\Microsoft\Speech\Voices\Tokens\LAPaul\Attributes"; ValueName: "Language"; ValueType: String; ValueData: "409"; Flags: uninsdeletevalue uninsdeletekeyifempty; Components: la
Root: HKLM; Subkey: "SOFTWARE\Microsoft\Speech\Voices\Tokens\LAPaul\Attributes"; ValueName: "Age"; ValueType: String; ValueData: "Adult"; Flags: uninsdeletevalue uninsdeletekeyifempty; Components: la
Root: HKLM; Subkey: "SOFTWARE\Microsoft\Speech\Voices\Tokens\LAPaul\Attributes"; ValueName: "Vendor"; ValueType: String; ValueData: "DECtalk"; Flags: uninsdeletevalue uninsdeletekeyifempty; Components: la
Root: HKLM; Subkey: "SOFTWARE\Microsoft\Speech\Voices\Tokens\LAPaul\Attributes"; ValueName: "Name"; ValueType: String; ValueData: "Paul"; Flags: uninsdeletevalue uninsdeletekeyifempty; Components: la
Root: HKLM; Subkey: "SOFTWARE\Microsoft\Speech\Voices\Tokens\LAPaul\Attributes"; ValueName: "VendorPreferred"; ValueType: String; Flags: uninsdeletevalue uninsdeletekeyifempty; Components: la
Root: HKLM; Subkey: "SOFTWARE\Microsoft\Speech\Voices\Tokens\LARita"; ValueType: String; ValueData: "LA Rita"; Flags: uninsdeletevalue uninsdeletekeyifempty; Components: la
Root: HKLM; Subkey: "SOFTWARE\Microsoft\Speech\Voices\Tokens\LARita"; ValueName: "409"; ValueType: String; ValueData: "LA Rita"; Flags: uninsdeletevalue uninsdeletekeyifempty; Components: la
Root: HKLM; Subkey: "SOFTWARE\Microsoft\Speech\Voices\Tokens\LARita"; ValueName: "CLSID"; ValueType: String; ValueData: "{{99EE9584-A4A6-11d1-BEB2-0060083E8376}"; Flags: uninsdeletevalue uninsdeletekeyifempty; Components: la
Root: HKLM; Subkey: "SOFTWARE\Microsoft\Speech\Voices\Tokens\LARita"; ValueName: "Speaker"; ValueType: String; ValueData: "7"; Flags: uninsdeletevalue uninsdeletekeyifempty; Components: la
Root: HKLM; Subkey: "SOFTWARE\Microsoft\Speech\Voices\Tokens\LARita\Attributes"; ValueName: "Gender"; ValueType: String; ValueData: "Female"; Flags: uninsdeletevalue uninsdeletekeyifempty; Components: la
Root: HKLM; Subkey: "SOFTWARE\Microsoft\Speech\Voices\Tokens\LARita\Attributes"; ValueName: "Language"; ValueType: String; ValueData: "409"; Flags: uninsdeletevalue uninsdeletekeyifempty; Components: la
Root: HKLM; Subkey: "SOFTWARE\Microsoft\Speech\Voices\Tokens\LARita\Attributes"; ValueName: "Age"; ValueType: String; ValueData: "Adult"; Flags: uninsdeletevalue uninsdeletekeyifempty; Components: la
Root: HKLM; Subkey: "SOFTWARE\Microsoft\Speech\Voices\Tokens\LARita\Attributes"; ValueName: "Vendor"; ValueType: String; ValueData: "DECtalk"; Flags: uninsdeletevalue uninsdeletekeyifempty; Components: la
Root: HKLM; Subkey: "SOFTWARE\Microsoft\Speech\Voices\Tokens\LARita\Attributes"; ValueName: "Name"; ValueType: String; ValueData: "Rita"; Flags: uninsdeletevalue uninsdeletekeyifempty; Components: la
Root: HKLM; Subkey: "SOFTWARE\Microsoft\Speech\Voices\Tokens\LAUrsula"; ValueType: String; ValueData: "LA Ursula"; Flags: uninsdeletevalue uninsdeletekeyifempty; Components: la
Root: HKLM; Subkey: "SOFTWARE\Microsoft\Speech\Voices\Tokens\LAUrsula"; ValueName: "409"; ValueType: String; ValueData: "LA Ursula"; Flags: uninsdeletevalue uninsdeletekeyifempty; Components: la
Root: HKLM; Subkey: "SOFTWARE\Microsoft\Speech\Voices\Tokens\LAUrsula"; ValueName: "CLSID"; ValueType: String; ValueData: "{{99EE9584-A4A6-11d1-BEB2-0060083E8376}"; Flags: uninsdeletevalue uninsdeletekeyifempty; Components: la
Root: HKLM; Subkey: "SOFTWARE\Microsoft\Speech\Voices\Tokens\LAUrsula"; ValueName: "Speaker"; ValueType: String; ValueData: "6"; Flags: uninsdeletevalue uninsdeletekeyifempty; Components: la
Root: HKLM; Subkey: "SOFTWARE\Microsoft\Speech\Voices\Tokens\LAUrsula\Attributes"; ValueName: "Gender"; ValueType: String; ValueData: "Female"; Flags: uninsdeletevalue uninsdeletekeyifempty; Components: la
Root: HKLM; Subkey: "SOFTWARE\Microsoft\Speech\Voices\Tokens\LAUrsula\Attributes"; ValueName: "Language"; ValueType: String; ValueData: "409"; Flags: uninsdeletevalue uninsdeletekeyifempty; Components: la
Root: HKLM; Subkey: "SOFTWARE\Microsoft\Speech\Voices\Tokens\LAUrsula\Attributes"; ValueName: "Age"; ValueType: String; ValueData: "Senior; Adult"; Flags: uninsdeletevalue uninsdeletekeyifempty; Components: la
Root: HKLM; Subkey: "SOFTWARE\Microsoft\Speech\Voices\Tokens\LAUrsula\Attributes"; ValueName: "Vendor"; ValueType: String; ValueData: "DECtalk"; Flags: uninsdeletevalue uninsdeletekeyifempty; Components: la
Root: HKLM; Subkey: "SOFTWARE\Microsoft\Speech\Voices\Tokens\LAUrsula\Attributes"; ValueName: "Name"; ValueType: String; ValueData: "Ursula"; Flags: uninsdeletevalue uninsdeletekeyifempty; Components: la
Root: HKLM; Subkey: "SOFTWARE\Microsoft\Speech\Voices\Tokens\LAWendy"; ValueType: String; ValueData: "LA Wendy"; Flags: uninsdeletevalue uninsdeletekeyifempty; Components: la
Root: HKLM; Subkey: "SOFTWARE\Microsoft\Speech\Voices\Tokens\LAWendy"; ValueName: "409"; ValueType: String; ValueData: "LA Wendy"; Flags: uninsdeletevalue uninsdeletekeyifempty; Components: la
Root: HKLM; Subkey: "SOFTWARE\Microsoft\Speech\Voices\Tokens\LAWendy"; ValueName: "CLSID"; ValueType: String; ValueData: "{{99EE9584-A4A6-11d1-BEB2-0060083E8376}"; Flags: uninsdeletevalue uninsdeletekeyifempty; Components: la
Root: HKLM; Subkey: "SOFTWARE\Microsoft\Speech\Voices\Tokens\LAWendy"; ValueName: "Speaker"; ValueType: String; ValueData: "8"; Flags: uninsdeletevalue uninsdeletekeyifempty; Components: la
Root: HKLM; Subkey: "SOFTWARE\Microsoft\Speech\Voices\Tokens\LAWendy\Attributes"; ValueName: "Gender"; ValueType: String; ValueData: "Female"; Flags: uninsdeletevalue uninsdeletekeyifempty; Components: la
Root: HKLM; Subkey: "SOFTWARE\Microsoft\Speech\Voices\Tokens\LAWendy\Attributes"; ValueName: "Language"; ValueType: String; ValueData: "409"; Flags: uninsdeletevalue uninsdeletekeyifempty; Components: la
Root: HKLM; Subkey: "SOFTWARE\Microsoft\Speech\Voices\Tokens\LAWendy\Attributes"; ValueName: "Age"; ValueType: String; ValueData: "Adult"; Flags: uninsdeletevalue uninsdeletekeyifempty; Components: la
Root: HKLM; Subkey: "SOFTWARE\Microsoft\Speech\Voices\Tokens\LAWendy\Attributes"; ValueName: "Vendor"; ValueType: String; ValueData: "DECtalk"; Flags: uninsdeletevalue uninsdeletekeyifempty; Components: la
Root: HKLM; Subkey: "SOFTWARE\Microsoft\Speech\Voices\Tokens\LAWendy\Attributes"; ValueName: "Name"; ValueType: String; ValueData: "Wendy"; Flags: uninsdeletevalue uninsdeletekeyifempty; Components: la
Root: HKLM; Subkey: "SOFTWARE\DECtalk Software\DECtalk\sapi5\GR"; ValueName: "MainDict"; ValueType: String; ValueData: "{app}\gr\dtalk_gr.dic"; Flags: uninsdeletevalue uninsdeletekeyifempty; Components: gr
Root: HKLM; Subkey: "SOFTWARE\Microsoft\Speech\Voices\Tokens\GRBetty"; ValueType: String; ValueData: "GR Betty"; Flags: uninsdeletevalue uninsdeletekeyifempty; Components: gr
Root: HKLM; Subkey: "SOFTWARE\Microsoft\Speech\Voices\Tokens\GRBetty"; ValueName: "409"; ValueType: String; ValueData: "GR Betty"; Flags: uninsdeletevalue uninsdeletekeyifempty; Components: gr
Root: HKLM; Subkey: "SOFTWARE\Microsoft\Speech\Voices\Tokens\GRBetty"; ValueName: "CLSID"; ValueType: String; ValueData: "{{99EE9586-A4A6-11d1-BEB2-0060083E8376}"; Flags: uninsdeletevalue uninsdeletekeyifempty; Components: gr
Root: HKLM; Subkey: "SOFTWARE\Microsoft\Speech\Voices\Tokens\GRBetty"; ValueName: "Speaker"; ValueType: String; ValueData: "1"; Flags: uninsdeletevalue uninsdeletekeyifempty; Components: gr
Root: HKLM; Subkey: "SOFTWARE\Microsoft\Speech\Voices\Tokens\GRBetty\Attributes"; ValueName: "Gender"; ValueType: String; ValueData: "Female"; Flags: uninsdeletevalue uninsdeletekeyifempty; Components: gr
Root: HKLM; Subkey: "SOFTWARE\Microsoft\Speech\Voices\Tokens\GRBetty\Attributes"; ValueName: "Language"; ValueType: String; ValueData: "409"; Flags: uninsdeletevalue uninsdeletekeyifempty; Components: gr
Root: HKLM; Subkey: "SOFTWARE\Microsoft\Speech\Voices\Tokens\GRBetty\Attributes"; ValueName: "Age"; ValueType: String; ValueData: "Adult"; Flags: uninsdeletevalue uninsdeletekeyifempty; Components: gr
Root: HKLM; Subkey: "SOFTWARE\Microsoft\Speech\Voices\Tokens\GRBetty\Attributes"; ValueName: "Vendor"; ValueType: String; ValueData: "DECtalk"; Flags: uninsdeletevalue uninsdeletekeyifempty; Components: gr
Root: HKLM; Subkey: "SOFTWARE\Microsoft\Speech\Voices\Tokens\GRBetty\Attributes"; ValueName: "Name"; ValueType: String; ValueData: "Betty"; Flags: uninsdeletevalue uninsdeletekeyifempty; Components: gr
Root: HKLM; Subkey: "SOFTWARE\Microsoft\Speech\Voices\Tokens\GRDennis"; ValueType: String; ValueData: "GR Dennis"; Flags: uninsdeletevalue uninsdeletekeyifempty; Components: gr
Root: HKLM; Subkey: "SOFTWARE\Microsoft\Speech\Voices\Tokens\GRDennis"; ValueName: "409"; ValueType: String; ValueData: "GR Dennis"; Flags: uninsdeletevalue uninsdeletekeyifempty; Components: gr
Root: HKLM; Subkey: "SOFTWARE\Microsoft\Speech\Voices\Tokens\GRDennis"; ValueName: "CLSID"; ValueType: String; ValueData: "{{99EE9586-A4A6-11d1-BEB2-0060083E8376}"; Flags: uninsdeletevalue uninsdeletekeyifempty; Components: gr
Root: HKLM; Subkey: "SOFTWARE\Microsoft\Speech\Voices\Tokens\GRDennis"; ValueName: "Speaker"; ValueType: String; ValueData: "4"; Flags: uninsdeletevalue uninsdeletekeyifempty; Components: gr
Root: HKLM; Subkey: "SOFTWARE\Microsoft\Speech\Voices\Tokens\GRDennis\Attributes"; ValueName: "Gender"; ValueType: String; ValueData: "Male"; Flags: uninsdeletevalue uninsdeletekeyifempty; Components: gr
Root: HKLM; Subkey: "SOFTWARE\Microsoft\Speech\Voices\Tokens\GRDennis\Attributes"; ValueName: "Language"; ValueType: String; ValueData: "409"; Flags: uninsdeletevalue uninsdeletekeyifempty; Components: gr
Root: HKLM; Subkey: "SOFTWARE\Microsoft\Speech\Voices\Tokens\GRDennis\Attributes"; ValueName: "Age"; ValueType: String; ValueData: "Adult"; Flags: uninsdeletevalue uninsdeletekeyifempty; Components: gr
Root: HKLM; Subkey: "SOFTWARE\Microsoft\Speech\Voices\Tokens\GRDennis\Attributes"; ValueName: "Vendor"; ValueType: String; ValueData: "DECtalk"; Flags: uninsdeletevalue uninsdeletekeyifempty; Components: gr
Root: HKLM; Subkey: "SOFTWARE\Microsoft\Speech\Voices\Tokens\GRDennis\Attributes"; ValueName: "Name"; ValueType: String; ValueData: "Dennis"; Flags: uninsdeletevalue uninsdeletekeyifempty; Components: gr
Root: HKLM; Subkey: "SOFTWARE\Microsoft\Speech\Voices\Tokens\GRFrank"; ValueType: String; ValueData: "GR Frank"; Flags: uninsdeletevalue uninsdeletekeyifempty; Components: gr
Root: HKLM; Subkey: "SOFTWARE\Microsoft\Speech\Voices\Tokens\GRFrank"; ValueName: "409"; ValueType: String; ValueData: "GR Frank"; Flags: uninsdeletevalue uninsdeletekeyifempty; Components: gr
Root: HKLM; Subkey: "SOFTWARE\Microsoft\Speech\Voices\Tokens\GRFrank"; ValueName: "CLSID"; ValueType: String; ValueData: "{{99EE9586-A4A6-11d1-BEB2-0060083E8376}"; Flags: uninsdeletevalue uninsdeletekeyifempty; Components: gr
Root: HKLM; Subkey: "SOFTWARE\Microsoft\Speech\Voices\Tokens\GRFrank"; ValueName: "Speaker"; ValueType: String; ValueData: "3"; Flags: uninsdeletevalue uninsdeletekeyifempty; Components: gr
Root: HKLM; Subkey: "SOFTWARE\Microsoft\Speech\Voices\Tokens\GRFrank\Attributes"; ValueName: "Gender"; ValueType: String; ValueData: "Male"; Flags: uninsdeletevalue uninsdeletekeyifempty; Components: gr
Root: HKLM; Subkey: "SOFTWARE\Microsoft\Speech\Voices\Tokens\GRFrank\Attributes"; ValueName: "Language"; ValueType: String; ValueData: "409"; Flags: uninsdeletevalue uninsdeletekeyifempty; Components: gr
Root: HKLM; Subkey: "SOFTWARE\Microsoft\Speech\Voices\Tokens\GRFrank\Attributes"; ValueName: "Age"; ValueType: String; ValueData: "Senior; Adult"; Flags: uninsdeletevalue uninsdeletekeyifempty; Components: gr
Root: HKLM; Subkey: "SOFTWARE\Microsoft\Speech\Voices\Tokens\GRFrank\Attributes"; ValueName: "Vendor"; ValueType: String; ValueData: "DECtalk"; Flags: uninsdeletevalue uninsdeletekeyifempty; Components: gr
Root: HKLM; Subkey: "SOFTWARE\Microsoft\Speech\Voices\Tokens\GRFrank\Attributes"; ValueName: "Name"; ValueType: String; ValueData: "Frank"; Flags: uninsdeletevalue uninsdeletekeyifempty; Components: gr
Root: HKLM; Subkey: "SOFTWARE\Microsoft\Speech\Voices\Tokens\GRHarry"; ValueType: String; ValueData: "GR Harry"; Flags: uninsdeletevalue uninsdeletekeyifempty; Components: gr
Root: HKLM; Subkey: "SOFTWARE\Microsoft\Speech\Voices\Tokens\GRHarry"; ValueName: "409"; ValueType: String; ValueData: "GR Harry"; Flags: uninsdeletevalue uninsdeletekeyifempty; Components: gr
Root: HKLM; Subkey: "SOFTWARE\Microsoft\Speech\Voices\Tokens\GRHarry"; ValueName: "CLSID"; ValueType: String; ValueData: "{{99EE9586-A4A6-11d1-BEB2-0060083E8376}"; Flags: uninsdeletevalue uninsdeletekeyifempty; Components: gr
Root: HKLM; Subkey: "SOFTWARE\Microsoft\Speech\Voices\Tokens\GRHarry"; ValueName: "Speaker"; ValueType: String; ValueData: "2"; Flags: uninsdeletevalue uninsdeletekeyifempty; Components: gr
Root: HKLM; Subkey: "SOFTWARE\Microsoft\Speech\Voices\Tokens\GRHarry\Attributes"; ValueName: "Gender"; ValueType: String; ValueData: "Male"; Flags: uninsdeletevalue uninsdeletekeyifempty; Components: gr
Root: HKLM; Subkey: "SOFTWARE\Microsoft\Speech\Voices\Tokens\GRHarry\Attributes"; ValueName: "Language"; ValueType: String; ValueData: "409"; Flags: uninsdeletevalue uninsdeletekeyifempty; Components: gr
Root: HKLM; Subkey: "SOFTWARE\Microsoft\Speech\Voices\Tokens\GRHarry\Attributes"; ValueName: "Age"; ValueType: String; ValueData: "Adult"; Flags: uninsdeletevalue uninsdeletekeyifempty; Components: gr
Root: HKLM; Subkey: "SOFTWARE\Microsoft\Speech\Voices\Tokens\GRHarry\Attributes"; ValueName: "Vendor"; ValueType: String; ValueData: "DECtalk"; Flags: uninsdeletevalue uninsdeletekeyifempty; Components: gr
Root: HKLM; Subkey: "SOFTWARE\Microsoft\Speech\Voices\Tokens\GRHarry\Attributes"; ValueName: "Name"; ValueType: String; ValueData: "Harry"; Flags: uninsdeletevalue uninsdeletekeyifempty; Components: gr
Root: HKLM; Subkey: "SOFTWARE\Microsoft\Speech\Voices\Tokens\GRKit"; ValueType: String; ValueData: "GR Kit"; Flags: uninsdeletevalue uninsdeletekeyifempty; Components: gr
Root: HKLM; Subkey: "SOFTWARE\Microsoft\Speech\Voices\Tokens\GRKit"; ValueName: "409"; ValueType: String; ValueData: "GR Kit"; Flags: uninsdeletevalue uninsdeletekeyifempty; Components: gr
Root: HKLM; Subkey: "SOFTWARE\Microsoft\Speech\Voices\Tokens\GRKit"; ValueName: "CLSID"; ValueType: String; ValueData: "{{99EE9586-A4A6-11d1-BEB2-0060083E8376}"; Flags: uninsdeletevalue uninsdeletekeyifempty; Components: gr
Root: HKLM; Subkey: "SOFTWARE\Microsoft\Speech\Voices\Tokens\GRKit"; ValueName: "Speaker"; ValueType: String; ValueData: "5"; Flags: uninsdeletevalue uninsdeletekeyifempty; Components: gr
Root: HKLM; Subkey: "SOFTWARE\Microsoft\Speech\Voices\Tokens\GRKit\Attributes"; ValueName: "Gender"; ValueType: String; ValueData: "Male"; Flags: uninsdeletevalue uninsdeletekeyifempty; Components: gr
Root: HKLM; Subkey: "SOFTWARE\Microsoft\Speech\Voices\Tokens\GRKit\Attributes"; ValueName: "Language"; ValueType: String; ValueData: "409"; Flags: uninsdeletevalue uninsdeletekeyifempty; Components: gr
Root: HKLM; Subkey: "SOFTWARE\Microsoft\Speech\Voices\Tokens\GRKit\Attributes"; ValueName: "Age"; ValueType: String; ValueData: "Child"; Flags: uninsdeletevalue uninsdeletekeyifempty; Components: gr
Root: HKLM; Subkey: "SOFTWARE\Microsoft\Speech\Voices\Tokens\GRKit\Attributes"; ValueName: "Vendor"; ValueType: String; ValueData: "DECtalk"; Flags: uninsdeletevalue uninsdeletekeyifempty; Components: gr
Root: HKLM; Subkey: "SOFTWARE\Microsoft\Speech\Voices\Tokens\GRKit\Attributes"; ValueName: "Name"; ValueType: String; ValueData: "Kit"; Flags: uninsdeletevalue uninsdeletekeyifempty; Components: gr
Root: HKLM; Subkey: "SOFTWARE\Microsoft\Speech\Voices\Tokens\GRPaul"; ValueType: String; ValueData: "GR Paul"; Flags: uninsdeletevalue uninsdeletekeyifempty; Components: gr
Root: HKLM; Subkey: "SOFTWARE\Microsoft\Speech\Voices\Tokens\GRPaul"; ValueName: "409"; ValueType: String; ValueData: "GR Paul"; Flags: uninsdeletevalue uninsdeletekeyifempty; Components: gr
Root: HKLM; Subkey: "SOFTWARE\Microsoft\Speech\Voices\Tokens\GRPaul"; ValueName: "CLSID"; ValueType: String; ValueData: "{{99EE9586-A4A6-11d1-BEB2-0060083E8376}"; Flags: uninsdeletevalue uninsdeletekeyifempty; Components: gr
Root: HKLM; Subkey: "SOFTWARE\Microsoft\Speech\Voices\Tokens\GRPaul"; ValueName: "Speaker"; ValueType: String; ValueData: "0"; Flags: uninsdeletevalue uninsdeletekeyifempty; Components: gr
Root: HKLM; Subkey: "SOFTWARE\Microsoft\Speech\Voices\Tokens\GRPaul\Attributes"; ValueName: "Gender"; ValueType: String; ValueData: "Male"; Flags: uninsdeletevalue uninsdeletekeyifempty; Components: gr
Root: HKLM; Subkey: "SOFTWARE\Microsoft\Speech\Voices\Tokens\GRPaul\Attributes"; ValueName: "Language"; ValueType: String; ValueData: "409"; Flags: uninsdeletevalue uninsdeletekeyifempty; Components: gr
Root: HKLM; Subkey: "SOFTWARE\Microsoft\Speech\Voices\Tokens\GRPaul\Attributes"; ValueName: "Age"; ValueType: String; ValueData: "Adult"; Flags: uninsdeletevalue uninsdeletekeyifempty; Components: gr
Root: HKLM; Subkey: "SOFTWARE\Microsoft\Speech\Voices\Tokens\GRPaul\Attributes"; ValueName: "Vendor"; ValueType: String; ValueData: "DECtalk"; Flags: uninsdeletevalue uninsdeletekeyifempty; Components: gr
Root: HKLM; Subkey: "SOFTWARE\Microsoft\Speech\Voices\Tokens\GRPaul\Attributes"; ValueName: "Name"; ValueType: String; ValueData: "Paul"; Flags: uninsdeletevalue uninsdeletekeyifempty; Components: gr
Root: HKLM; Subkey: "SOFTWARE\Microsoft\Speech\Voices\Tokens\GRPaul\Attributes"; ValueName: "VendorPreferred"; ValueType: String; Flags: uninsdeletevalue uninsdeletekeyifempty; Components: gr
Root: HKLM; Subkey: "SOFTWARE\Microsoft\Speech\Voices\Tokens\GRRita"; ValueType: String; ValueData: "GR Rita"; Flags: uninsdeletevalue uninsdeletekeyifempty; Components: gr
Root: HKLM; Subkey: "SOFTWARE\Microsoft\Speech\Voices\Tokens\GRRita"; ValueName: "409"; ValueType: String; ValueData: "GR Rita"; Flags: uninsdeletevalue uninsdeletekeyifempty; Components: gr
Root: HKLM; Subkey: "SOFTWARE\Microsoft\Speech\Voices\Tokens\GRRita"; ValueName: "CLSID"; ValueType: String; ValueData: "{{99EE9586-A4A6-11d1-BEB2-0060083E8376}"; Flags: uninsdeletevalue uninsdeletekeyifempty; Components: gr
Root: HKLM; Subkey: "SOFTWARE\Microsoft\Speech\Voices\Tokens\GRRita"; ValueName: "Speaker"; ValueType: String; ValueData: "7"; Flags: uninsdeletevalue uninsdeletekeyifempty; Components: gr
Root: HKLM; Subkey: "SOFTWARE\Microsoft\Speech\Voices\Tokens\GRRita\Attributes"; ValueName: "Gender"; ValueType: String; ValueData: "Female"; Flags: uninsdeletevalue uninsdeletekeyifempty; Components: gr
Root: HKLM; Subkey: "SOFTWARE\Microsoft\Speech\Voices\Tokens\GRRita\Attributes"; ValueName: "Language"; ValueType: String; ValueData: "409"; Flags: uninsdeletevalue uninsdeletekeyifempty; Components: gr
Root: HKLM; Subkey: "SOFTWARE\Microsoft\Speech\Voices\Tokens\GRRita\Attributes"; ValueName: "Age"; ValueType: String; ValueData: "Adult"; Flags: uninsdeletevalue uninsdeletekeyifempty; Components: gr
Root: HKLM; Subkey: "SOFTWARE\Microsoft\Speech\Voices\Tokens\GRRita\Attributes"; ValueName: "Vendor"; ValueType: String; ValueData: "DECtalk"; Flags: uninsdeletevalue uninsdeletekeyifempty; Components: gr
Root: HKLM; Subkey: "SOFTWARE\Microsoft\Speech\Voices\Tokens\GRRita\Attributes"; ValueName: "Name"; ValueType: String; ValueData: "Rita"; Flags: uninsdeletevalue uninsdeletekeyifempty; Components: gr
Root: HKLM; Subkey: "SOFTWARE\Microsoft\Speech\Voices\Tokens\GRUrsugr"; ValueType: String; ValueData: "GR Ursugr"; Flags: uninsdeletevalue uninsdeletekeyifempty; Components: gr
Root: HKLM; Subkey: "SOFTWARE\Microsoft\Speech\Voices\Tokens\GRUrsugr"; ValueName: "409"; ValueType: String; ValueData: "GR Ursugr"; Flags: uninsdeletevalue uninsdeletekeyifempty; Components: gr
Root: HKLM; Subkey: "SOFTWARE\Microsoft\Speech\Voices\Tokens\GRUrsugr"; ValueName: "CLSID"; ValueType: String; ValueData: "{{99EE9586-A4A6-11d1-BEB2-0060083E8376}"; Flags: uninsdeletevalue uninsdeletekeyifempty; Components: gr
Root: HKLM; Subkey: "SOFTWARE\Microsoft\Speech\Voices\Tokens\GRUrsugr"; ValueName: "Speaker"; ValueType: String; ValueData: "6"; Flags: uninsdeletevalue uninsdeletekeyifempty; Components: gr
Root: HKLM; Subkey: "SOFTWARE\Microsoft\Speech\Voices\Tokens\GRUrsugr\Attributes"; ValueName: "Gender"; ValueType: String; ValueData: "Female"; Flags: uninsdeletevalue uninsdeletekeyifempty; Components: gr
Root: HKLM; Subkey: "SOFTWARE\Microsoft\Speech\Voices\Tokens\GRUrsugr\Attributes"; ValueName: "Language"; ValueType: String; ValueData: "409"; Flags: uninsdeletevalue uninsdeletekeyifempty; Components: gr
Root: HKLM; Subkey: "SOFTWARE\Microsoft\Speech\Voices\Tokens\GRUrsugr\Attributes"; ValueName: "Age"; ValueType: String; ValueData: "Senior; Adult"; Flags: uninsdeletevalue uninsdeletekeyifempty; Components: gr
Root: HKLM; Subkey: "SOFTWARE\Microsoft\Speech\Voices\Tokens\GRUrsugr\Attributes"; ValueName: "Vendor"; ValueType: String; ValueData: "DECtalk"; Flags: uninsdeletevalue uninsdeletekeyifempty; Components: gr
Root: HKLM; Subkey: "SOFTWARE\Microsoft\Speech\Voices\Tokens\GRUrsugr\Attributes"; ValueName: "Name"; ValueType: String; ValueData: "Ursugr"; Flags: uninsdeletevalue uninsdeletekeyifempty; Components: gr
Root: HKLM; Subkey: "SOFTWARE\Microsoft\Speech\Voices\Tokens\GRWendy"; ValueType: String; ValueData: "GR Wendy"; Flags: uninsdeletevalue uninsdeletekeyifempty; Components: gr
Root: HKLM; Subkey: "SOFTWARE\Microsoft\Speech\Voices\Tokens\GRWendy"; ValueName: "409"; ValueType: String; ValueData: "GR Wendy"; Flags: uninsdeletevalue uninsdeletekeyifempty; Components: gr
Root: HKLM; Subkey: "SOFTWARE\Microsoft\Speech\Voices\Tokens\GRWendy"; ValueName: "CLSID"; ValueType: String; ValueData: "{{99EE9586-A4A6-11d1-BEB2-0060083E8376}"; Flags: uninsdeletevalue uninsdeletekeyifempty; Components: gr
Root: HKLM; Subkey: "SOFTWARE\Microsoft\Speech\Voices\Tokens\GRWendy"; ValueName: "Speaker"; ValueType: String; ValueData: "8"; Flags: uninsdeletevalue uninsdeletekeyifempty; Components: gr
Root: HKLM; Subkey: "SOFTWARE\Microsoft\Speech\Voices\Tokens\GRWendy\Attributes"; ValueName: "Gender"; ValueType: String; ValueData: "Female"; Flags: uninsdeletevalue uninsdeletekeyifempty; Components: gr
Root: HKLM; Subkey: "SOFTWARE\Microsoft\Speech\Voices\Tokens\GRWendy\Attributes"; ValueName: "Language"; ValueType: String; ValueData: "409"; Flags: uninsdeletevalue uninsdeletekeyifempty; Components: gr
Root: HKLM; Subkey: "SOFTWARE\Microsoft\Speech\Voices\Tokens\GRWendy\Attributes"; ValueName: "Age"; ValueType: String; ValueData: "Adult"; Flags: uninsdeletevalue uninsdeletekeyifempty; Components: gr
Root: HKLM; Subkey: "SOFTWARE\Microsoft\Speech\Voices\Tokens\GRWendy\Attributes"; ValueName: "Vendor"; ValueType: String; ValueData: "DECtalk"; Flags: uninsdeletevalue uninsdeletekeyifempty; Components: gr
Root: HKLM; Subkey: "SOFTWARE\Microsoft\Speech\Voices\Tokens\GRWendy\Attributes"; ValueName: "Name"; ValueType: String; ValueData: "Wendy"; Flags: uninsdeletevalue uninsdeletekeyifempty; Components: gr
Root: HKLM; Subkey: "SOFTWARE\DECtalk Software\DECtalk\sapi5\FR"; ValueName: "MainDict"; ValueType: String; ValueData: "{app}\fr\dtalk_fr.dic"; Flags: uninsdeletevalue uninsdeletekeyifempty; Components: fr
Root: HKLM; Subkey: "SOFTWARE\Microsoft\Speech\Voices\Tokens\FRBetty"; ValueType: String; ValueData: "FR Betty"; Flags: uninsdeletevalue uninsdeletekeyifempty; Components: fr
Root: HKLM; Subkey: "SOFTWARE\Microsoft\Speech\Voices\Tokens\FRBetty"; ValueName: "409"; ValueType: String; ValueData: "FR Betty"; Flags: uninsdeletevalue uninsdeletekeyifempty; Components: fr
Root: HKLM; Subkey: "SOFTWARE\Microsoft\Speech\Voices\Tokens\FRBetty"; ValueName: "CLSID"; ValueType: String; ValueData: "{{99EE9590-A4A6-11d1-BEB2-0060083E8376}"; Flags: uninsdeletevalue uninsdeletekeyifempty; Components: fr
Root: HKLM; Subkey: "SOFTWARE\Microsoft\Speech\Voices\Tokens\FRBetty"; ValueName: "Speaker"; ValueType: String; ValueData: "1"; Flags: uninsdeletevalue uninsdeletekeyifempty; Components: fr
Root: HKLM; Subkey: "SOFTWARE\Microsoft\Speech\Voices\Tokens\FRBetty\Attributes"; ValueName: "Gender"; ValueType: String; ValueData: "Female"; Flags: uninsdeletevalue uninsdeletekeyifempty; Components: fr
Root: HKLM; Subkey: "SOFTWARE\Microsoft\Speech\Voices\Tokens\FRBetty\Attributes"; ValueName: "Language"; ValueType: String; ValueData: "409"; Flags: uninsdeletevalue uninsdeletekeyifempty; Components: fr
Root: HKLM; Subkey: "SOFTWARE\Microsoft\Speech\Voices\Tokens\FRBetty\Attributes"; ValueName: "Age"; ValueType: String; ValueData: "Adult"; Flags: uninsdeletevalue uninsdeletekeyifempty; Components: fr
Root: HKLM; Subkey: "SOFTWARE\Microsoft\Speech\Voices\Tokens\FRBetty\Attributes"; ValueName: "Vendor"; ValueType: String; ValueData: "DECtalk"; Flags: uninsdeletevalue uninsdeletekeyifempty; Components: fr
Root: HKLM; Subkey: "SOFTWARE\Microsoft\Speech\Voices\Tokens\FRBetty\Attributes"; ValueName: "Name"; ValueType: String; ValueData: "Betty"; Flags: uninsdeletevalue uninsdeletekeyifempty; Components: fr
Root: HKLM; Subkey: "SOFTWARE\Microsoft\Speech\Voices\Tokens\FRDennis"; ValueType: String; ValueData: "FR Dennis"; Flags: uninsdeletevalue uninsdeletekeyifempty; Components: fr
Root: HKLM; Subkey: "SOFTWARE\Microsoft\Speech\Voices\Tokens\FRDennis"; ValueName: "409"; ValueType: String; ValueData: "FR Dennis"; Flags: uninsdeletevalue uninsdeletekeyifempty; Components: fr
Root: HKLM; Subkey: "SOFTWARE\Microsoft\Speech\Voices\Tokens\FRDennis"; ValueName: "CLSID"; ValueType: String; ValueData: "{{99EE9590-A4A6-11d1-BEB2-0060083E8376}"; Flags: uninsdeletevalue uninsdeletekeyifempty; Components: fr
Root: HKLM; Subkey: "SOFTWARE\Microsoft\Speech\Voices\Tokens\FRDennis"; ValueName: "Speaker"; ValueType: String; ValueData: "4"; Flags: uninsdeletevalue uninsdeletekeyifempty; Components: fr
Root: HKLM; Subkey: "SOFTWARE\Microsoft\Speech\Voices\Tokens\FRDennis\Attributes"; ValueName: "Gender"; ValueType: String; ValueData: "Male"; Flags: uninsdeletevalue uninsdeletekeyifempty; Components: fr
Root: HKLM; Subkey: "SOFTWARE\Microsoft\Speech\Voices\Tokens\FRDennis\Attributes"; ValueName: "Language"; ValueType: String; ValueData: "409"; Flags: uninsdeletevalue uninsdeletekeyifempty; Components: fr
Root: HKLM; Subkey: "SOFTWARE\Microsoft\Speech\Voices\Tokens\FRDennis\Attributes"; ValueName: "Age"; ValueType: String; ValueData: "Adult"; Flags: uninsdeletevalue uninsdeletekeyifempty; Components: fr
Root: HKLM; Subkey: "SOFTWARE\Microsoft\Speech\Voices\Tokens\FRDennis\Attributes"; ValueName: "Vendor"; ValueType: String; ValueData: "DECtalk"; Flags: uninsdeletevalue uninsdeletekeyifempty; Components: fr
Root: HKLM; Subkey: "SOFTWARE\Microsoft\Speech\Voices\Tokens\FRDennis\Attributes"; ValueName: "Name"; ValueType: String; ValueData: "Dennis"; Flags: uninsdeletevalue uninsdeletekeyifempty; Components: fr
Root: HKLM; Subkey: "SOFTWARE\Microsoft\Speech\Voices\Tokens\FRFrank"; ValueType: String; ValueData: "FR Frank"; Flags: uninsdeletevalue uninsdeletekeyifempty; Components: fr
Root: HKLM; Subkey: "SOFTWARE\Microsoft\Speech\Voices\Tokens\FRFrank"; ValueName: "409"; ValueType: String; ValueData: "FR Frank"; Flags: uninsdeletevalue uninsdeletekeyifempty; Components: fr
Root: HKLM; Subkey: "SOFTWARE\Microsoft\Speech\Voices\Tokens\FRFrank"; ValueName: "CLSID"; ValueType: String; ValueData: "{{99EE9590-A4A6-11d1-BEB2-0060083E8376}"; Flags: uninsdeletevalue uninsdeletekeyifempty; Components: fr
Root: HKLM; Subkey: "SOFTWARE\Microsoft\Speech\Voices\Tokens\FRFrank"; ValueName: "Speaker"; ValueType: String; ValueData: "3"; Flags: uninsdeletevalue uninsdeletekeyifempty; Components: fr
Root: HKLM; Subkey: "SOFTWARE\Microsoft\Speech\Voices\Tokens\FRFrank\Attributes"; ValueName: "Gender"; ValueType: String; ValueData: "Male"; Flags: uninsdeletevalue uninsdeletekeyifempty; Components: fr
Root: HKLM; Subkey: "SOFTWARE\Microsoft\Speech\Voices\Tokens\FRFrank\Attributes"; ValueName: "Language"; ValueType: String; ValueData: "409"; Flags: uninsdeletevalue uninsdeletekeyifempty; Components: fr
Root: HKLM; Subkey: "SOFTWARE\Microsoft\Speech\Voices\Tokens\FRFrank\Attributes"; ValueName: "Age"; ValueType: String; ValueData: "Senior; Adult"; Flags: uninsdeletevalue uninsdeletekeyifempty; Components: fr
Root: HKLM; Subkey: "SOFTWARE\Microsoft\Speech\Voices\Tokens\FRFrank\Attributes"; ValueName: "Vendor"; ValueType: String; ValueData: "DECtalk"; Flags: uninsdeletevalue uninsdeletekeyifempty; Components: fr
Root: HKLM; Subkey: "SOFTWARE\Microsoft\Speech\Voices\Tokens\FRFrank\Attributes"; ValueName: "Name"; ValueType: String; ValueData: "Frank"; Flags: uninsdeletevalue uninsdeletekeyifempty; Components: fr
Root: HKLM; Subkey: "SOFTWARE\Microsoft\Speech\Voices\Tokens\FRHarry"; ValueType: String; ValueData: "FR Harry"; Flags: uninsdeletevalue uninsdeletekeyifempty; Components: fr
Root: HKLM; Subkey: "SOFTWARE\Microsoft\Speech\Voices\Tokens\FRHarry"; ValueName: "409"; ValueType: String; ValueData: "FR Harry"; Flags: uninsdeletevalue uninsdeletekeyifempty; Components: fr
Root: HKLM; Subkey: "SOFTWARE\Microsoft\Speech\Voices\Tokens\FRHarry"; ValueName: "CLSID"; ValueType: String; ValueData: "{{99EE9590-A4A6-11d1-BEB2-0060083E8376}"; Flags: uninsdeletevalue uninsdeletekeyifempty; Components: fr
Root: HKLM; Subkey: "SOFTWARE\Microsoft\Speech\Voices\Tokens\FRHarry"; ValueName: "Speaker"; ValueType: String; ValueData: "2"; Flags: uninsdeletevalue uninsdeletekeyifempty; Components: fr
Root: HKLM; Subkey: "SOFTWARE\Microsoft\Speech\Voices\Tokens\FRHarry\Attributes"; ValueName: "Gender"; ValueType: String; ValueData: "Male"; Flags: uninsdeletevalue uninsdeletekeyifempty; Components: fr
Root: HKLM; Subkey: "SOFTWARE\Microsoft\Speech\Voices\Tokens\FRHarry\Attributes"; ValueName: "Language"; ValueType: String; ValueData: "409"; Flags: uninsdeletevalue uninsdeletekeyifempty; Components: fr
Root: HKLM; Subkey: "SOFTWARE\Microsoft\Speech\Voices\Tokens\FRHarry\Attributes"; ValueName: "Age"; ValueType: String; ValueData: "Adult"; Flags: uninsdeletevalue uninsdeletekeyifempty; Components: fr
Root: HKLM; Subkey: "SOFTWARE\Microsoft\Speech\Voices\Tokens\FRHarry\Attributes"; ValueName: "Vendor"; ValueType: String; ValueData: "DECtalk"; Flags: uninsdeletevalue uninsdeletekeyifempty; Components: fr
Root: HKLM; Subkey: "SOFTWARE\Microsoft\Speech\Voices\Tokens\FRHarry\Attributes"; ValueName: "Name"; ValueType: String; ValueData: "Harry"; Flags: uninsdeletevalue uninsdeletekeyifempty; Components: fr
Root: HKLM; Subkey: "SOFTWARE\Microsoft\Speech\Voices\Tokens\FRKit"; ValueType: String; ValueData: "FR Kit"; Flags: uninsdeletevalue uninsdeletekeyifempty; Components: fr
Root: HKLM; Subkey: "SOFTWARE\Microsoft\Speech\Voices\Tokens\FRKit"; ValueName: "409"; ValueType: String; ValueData: "FR Kit"; Flags: uninsdeletevalue uninsdeletekeyifempty; Components: fr
Root: HKLM; Subkey: "SOFTWARE\Microsoft\Speech\Voices\Tokens\FRKit"; ValueName: "CLSID"; ValueType: String; ValueData: "{{99EE9590-A4A6-11d1-BEB2-0060083E8376}"; Flags: uninsdeletevalue uninsdeletekeyifempty; Components: fr
Root: HKLM; Subkey: "SOFTWARE\Microsoft\Speech\Voices\Tokens\FRKit"; ValueName: "Speaker"; ValueType: String; ValueData: "5"; Flags: uninsdeletevalue uninsdeletekeyifempty; Components: fr
Root: HKLM; Subkey: "SOFTWARE\Microsoft\Speech\Voices\Tokens\FRKit\Attributes"; ValueName: "Gender"; ValueType: String; ValueData: "Male"; Flags: uninsdeletevalue uninsdeletekeyifempty; Components: fr
Root: HKLM; Subkey: "SOFTWARE\Microsoft\Speech\Voices\Tokens\FRKit\Attributes"; ValueName: "Language"; ValueType: String; ValueData: "409"; Flags: uninsdeletevalue uninsdeletekeyifempty; Components: fr
Root: HKLM; Subkey: "SOFTWARE\Microsoft\Speech\Voices\Tokens\FRKit\Attributes"; ValueName: "Age"; ValueType: String; ValueData: "Child"; Flags: uninsdeletevalue uninsdeletekeyifempty; Components: fr
Root: HKLM; Subkey: "SOFTWARE\Microsoft\Speech\Voices\Tokens\FRKit\Attributes"; ValueName: "Vendor"; ValueType: String; ValueData: "DECtalk"; Flags: uninsdeletevalue uninsdeletekeyifempty; Components: fr
Root: HKLM; Subkey: "SOFTWARE\Microsoft\Speech\Voices\Tokens\FRKit\Attributes"; ValueName: "Name"; ValueType: String; ValueData: "Kit"; Flags: uninsdeletevalue uninsdeletekeyifempty; Components: fr
Root: HKLM; Subkey: "SOFTWARE\Microsoft\Speech\Voices\Tokens\FRPaul"; ValueType: String; ValueData: "FR Paul"; Flags: uninsdeletevalue uninsdeletekeyifempty; Components: fr
Root: HKLM; Subkey: "SOFTWARE\Microsoft\Speech\Voices\Tokens\FRPaul"; ValueName: "409"; ValueType: String; ValueData: "FR Paul"; Flags: uninsdeletevalue uninsdeletekeyifempty; Components: fr
Root: HKLM; Subkey: "SOFTWARE\Microsoft\Speech\Voices\Tokens\FRPaul"; ValueName: "CLSID"; ValueType: String; ValueData: "{{99EE9590-A4A6-11d1-BEB2-0060083E8376}"; Flags: uninsdeletevalue uninsdeletekeyifempty; Components: fr
Root: HKLM; Subkey: "SOFTWARE\Microsoft\Speech\Voices\Tokens\FRPaul"; ValueName: "Speaker"; ValueType: String; ValueData: "0"; Flags: uninsdeletevalue uninsdeletekeyifempty; Components: fr
Root: HKLM; Subkey: "SOFTWARE\Microsoft\Speech\Voices\Tokens\FRPaul\Attributes"; ValueName: "Gender"; ValueType: String; ValueData: "Male"; Flags: uninsdeletevalue uninsdeletekeyifempty; Components: fr
Root: HKLM; Subkey: "SOFTWARE\Microsoft\Speech\Voices\Tokens\FRPaul\Attributes"; ValueName: "Language"; ValueType: String; ValueData: "409"; Flags: uninsdeletevalue uninsdeletekeyifempty; Components: fr
Root: HKLM; Subkey: "SOFTWARE\Microsoft\Speech\Voices\Tokens\FRPaul\Attributes"; ValueName: "Age"; ValueType: String; ValueData: "Adult"; Flags: uninsdeletevalue uninsdeletekeyifempty; Components: fr
Root: HKLM; Subkey: "SOFTWARE\Microsoft\Speech\Voices\Tokens\FRPaul\Attributes"; ValueName: "Vendor"; ValueType: String; ValueData: "DECtalk"; Flags: uninsdeletevalue uninsdeletekeyifempty; Components: fr
Root: HKLM; Subkey: "SOFTWARE\Microsoft\Speech\Voices\Tokens\FRPaul\Attributes"; ValueName: "Name"; ValueType: String; ValueData: "Paul"; Flags: uninsdeletevalue uninsdeletekeyifempty; Components: fr
Root: HKLM; Subkey: "SOFTWARE\Microsoft\Speech\Voices\Tokens\FRPaul\Attributes"; ValueName: "VendorPreferred"; ValueType: String; Flags: uninsdeletevalue uninsdeletekeyifempty; Components: fr
Root: HKLM; Subkey: "SOFTWARE\Microsoft\Speech\Voices\Tokens\FRRita"; ValueType: String; ValueData: "FR Rita"; Flags: uninsdeletevalue uninsdeletekeyifempty; Components: fr
Root: HKLM; Subkey: "SOFTWARE\Microsoft\Speech\Voices\Tokens\FRRita"; ValueName: "409"; ValueType: String; ValueData: "FR Rita"; Flags: uninsdeletevalue uninsdeletekeyifempty; Components: fr
Root: HKLM; Subkey: "SOFTWARE\Microsoft\Speech\Voices\Tokens\FRRita"; ValueName: "CLSID"; ValueType: String; ValueData: "{{99EE9590-A4A6-11d1-BEB2-0060083E8376}"; Flags: uninsdeletevalue uninsdeletekeyifempty; Components: fr
Root: HKLM; Subkey: "SOFTWARE\Microsoft\Speech\Voices\Tokens\FRRita"; ValueName: "Speaker"; ValueType: String; ValueData: "7"; Flags: uninsdeletevalue uninsdeletekeyifempty; Components: fr
Root: HKLM; Subkey: "SOFTWARE\Microsoft\Speech\Voices\Tokens\FRRita\Attributes"; ValueName: "Gender"; ValueType: String; ValueData: "Female"; Flags: uninsdeletevalue uninsdeletekeyifempty; Components: fr
Root: HKLM; Subkey: "SOFTWARE\Microsoft\Speech\Voices\Tokens\FRRita\Attributes"; ValueName: "Language"; ValueType: String; ValueData: "409"; Flags: uninsdeletevalue uninsdeletekeyifempty; Components: fr
Root: HKLM; Subkey: "SOFTWARE\Microsoft\Speech\Voices\Tokens\FRRita\Attributes"; ValueName: "Age"; ValueType: String; ValueData: "Adult"; Flags: uninsdeletevalue uninsdeletekeyifempty; Components: fr
Root: HKLM; Subkey: "SOFTWARE\Microsoft\Speech\Voices\Tokens\FRRita\Attributes"; ValueName: "Vendor"; ValueType: String; ValueData: "DECtalk"; Flags: uninsdeletevalue uninsdeletekeyifempty; Components: fr
Root: HKLM; Subkey: "SOFTWARE\Microsoft\Speech\Voices\Tokens\FRRita\Attributes"; ValueName: "Name"; ValueType: String; ValueData: "Rita"; Flags: uninsdeletevalue uninsdeletekeyifempty; Components: fr
Root: HKLM; Subkey: "SOFTWARE\Microsoft\Speech\Voices\Tokens\FRUrsula"; ValueType: String; ValueData: "FR Ursula"; Flags: uninsdeletevalue uninsdeletekeyifempty; Components: fr
Root: HKLM; Subkey: "SOFTWARE\Microsoft\Speech\Voices\Tokens\FRUrsula"; ValueName: "409"; ValueType: String; ValueData: "FR Ursula"; Flags: uninsdeletevalue uninsdeletekeyifempty; Components: fr
Root: HKLM; Subkey: "SOFTWARE\Microsoft\Speech\Voices\Tokens\FRUrsula"; ValueName: "CLSID"; ValueType: String; ValueData: "{{99EE9590-A4A6-11d1-BEB2-0060083E8376}"; Flags: uninsdeletevalue uninsdeletekeyifempty; Components: fr
Root: HKLM; Subkey: "SOFTWARE\Microsoft\Speech\Voices\Tokens\FRUrsula"; ValueName: "Speaker"; ValueType: String; ValueData: "6"; Flags: uninsdeletevalue uninsdeletekeyifempty; Components: fr
Root: HKLM; Subkey: "SOFTWARE\Microsoft\Speech\Voices\Tokens\FRUrsula\Attributes"; ValueName: "Gender"; ValueType: String; ValueData: "Female"; Flags: uninsdeletevalue uninsdeletekeyifempty; Components: fr
Root: HKLM; Subkey: "SOFTWARE\Microsoft\Speech\Voices\Tokens\FRUrsula\Attributes"; ValueName: "Language"; ValueType: String; ValueData: "409"; Flags: uninsdeletevalue uninsdeletekeyifempty; Components: fr
Root: HKLM; Subkey: "SOFTWARE\Microsoft\Speech\Voices\Tokens\FRUrsula\Attributes"; ValueName: "Age"; ValueType: String; ValueData: "Senior; Adult"; Flags: uninsdeletevalue uninsdeletekeyifempty; Components: fr
Root: HKLM; Subkey: "SOFTWARE\Microsoft\Speech\Voices\Tokens\FRUrsula\Attributes"; ValueName: "Vendor"; ValueType: String; ValueData: "DECtalk"; Flags: uninsdeletevalue uninsdeletekeyifempty; Components: fr
Root: HKLM; Subkey: "SOFTWARE\Microsoft\Speech\Voices\Tokens\FRUrsula\Attributes"; ValueName: "Name"; ValueType: String; ValueData: "Ursula"; Flags: uninsdeletevalue uninsdeletekeyifempty; Components: fr
Root: HKLM; Subkey: "SOFTWARE\Microsoft\Speech\Voices\Tokens\FRWendy"; ValueType: String; ValueData: "FR Wendy"; Flags: uninsdeletevalue uninsdeletekeyifempty; Components: fr
Root: HKLM; Subkey: "SOFTWARE\Microsoft\Speech\Voices\Tokens\FRWendy"; ValueName: "409"; ValueType: String; ValueData: "FR Wendy"; Flags: uninsdeletevalue uninsdeletekeyifempty; Components: fr
Root: HKLM; Subkey: "SOFTWARE\Microsoft\Speech\Voices\Tokens\FRWendy"; ValueName: "CLSID"; ValueType: String; ValueData: "{{99EE9590-A4A6-11d1-BEB2-0060083E8376}"; Flags: uninsdeletevalue uninsdeletekeyifempty; Components: fr
Root: HKLM; Subkey: "SOFTWARE\Microsoft\Speech\Voices\Tokens\FRWendy"; ValueName: "Speaker"; ValueType: String; ValueData: "8"; Flags: uninsdeletevalue uninsdeletekeyifempty; Components: fr
Root: HKLM; Subkey: "SOFTWARE\Microsoft\Speech\Voices\Tokens\FRWendy\Attributes"; ValueName: "Gender"; ValueType: String; ValueData: "Female"; Flags: uninsdeletevalue uninsdeletekeyifempty; Components: fr
Root: HKLM; Subkey: "SOFTWARE\Microsoft\Speech\Voices\Tokens\FRWendy\Attributes"; ValueName: "Language"; ValueType: String; ValueData: "409"; Flags: uninsdeletevalue uninsdeletekeyifempty; Components: fr
Root: HKLM; Subkey: "SOFTWARE\Microsoft\Speech\Voices\Tokens\FRWendy\Attributes"; ValueName: "Age"; ValueType: String; ValueData: "Adult"; Flags: uninsdeletevalue uninsdeletekeyifempty; Components: fr
Root: HKLM; Subkey: "SOFTWARE\Microsoft\Speech\Voices\Tokens\FRWendy\Attributes"; ValueName: "Vendor"; ValueType: String; ValueData: "DECtalk"; Flags: uninsdeletevalue uninsdeletekeyifempty; Components: fr
Root: HKLM; Subkey: "SOFTWARE\Microsoft\Speech\Voices\Tokens\FRWendy\Attributes"; ValueName: "Name"; ValueType: String; ValueData: "Wendy"; Flags: uninsdeletevalue uninsdeletekeyifempty; Components: fr
