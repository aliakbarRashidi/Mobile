; Script generated by the Inno Setup Script Wizard.
; SEE THE DOCUMENTATION FOR DETAILS ON CREATING INNO SETUP SCRIPT FILES!

#define MyAppName "EventOrganiser"
#define MyAppVersion "1.0"
#define MyAppPublisher "Easy Event Apps"
#define MyAppURL "http://www.easyeventapps.com"
#define MyAppExeName "EventOrganiser.exe"

[Setup]
; NOTE: The value of AppId uniquely identifies this application.
; Do not use the same AppId value in installers for other applications.
; (To generate a new GUID, click Tools | Generate GUID inside the IDE.)
AppId={{0762D492-B70C-4F04-8CAA-BE53D71159AF}
AppName={#MyAppName}
AppVersion={#MyAppVersion}
;AppVerName={#MyAppName} {#MyAppVersion}
AppPublisher={#MyAppPublisher}
AppPublisherURL={#MyAppURL}
AppSupportURL={#MyAppURL}
AppUpdatesURL={#MyAppURL}
DefaultDirName={pf}\{#MyAppName}
DisableProgramGroupPage=yes
; LicenseFile=E:\Mobile\Mobile\Deploy\LicenseFileWin.txt
InfoBeforeFile=E:\Mobile\Mobile\Deploy\InfoBeforeWin.txt
InfoAfterFile=E:\Mobile\Mobile\Deploy\InfoAfterWin.txt
OutputDir=C:\Deployment
OutputBaseFilename=EventOrganiserSetup
SetupIconFile=E:\Mobile\Mobile\Deploy\eeventa512_oVF_icon.ico
Compression=lzma
SolidCompression=yes

[Languages]
Name: "english"; MessagesFile: "compiler:Default.isl"

[Tasks]
Name: "desktopicon"; Description: "{cm:CreateDesktopIcon}"; GroupDescription: "{cm:AdditionalIcons}"; Flags: unchecked

[Files]
; Source: "C:\Program Files (x86)\Inno Setup 5\Examples\MyProg.exe"; DestDir: "{app}"; Flags: ignoreversion
Source: "E:\Mobile\Mobile\build-EventOrganiser-Desktop_Qt_5_8_0_MSVC2015_64bit-Release\release\*"; DestDir: "{app}"; Flags: ignoreversion recursesubdirs createallsubdirs
; NOTE: Don't use "Flags: ignoreversion" on any shared system files

[Icons]
Name: "{commonprograms}\{#MyAppName}"; Filename: "{app}\{#MyAppExeName}"
Name: "{commondesktop}\{#MyAppName}"; Filename: "{app}\{#MyAppExeName}"; Tasks: desktopicon

[Run]
Filename: "{app}\{#MyAppExeName}"; Description: "{cm:LaunchProgram,{#StringChange(MyAppName, '&', '&&')}}"; Flags: nowait postinstall skipifsilent

