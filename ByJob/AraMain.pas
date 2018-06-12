unit AraMain;

interface

uses
  Winapi.Windows, Winapi.Messages, System.Variants, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Buttons, Vcl.Dialogs,
  Vcl.ExtDlgs, Vcl.Menus, Vcl.ActnList, Vcl.Tabs, Vcl.DockTabSet,
  System.SysUtils, Vcl.ComCtrls, Vcl.ExtCtrls, Vcl.StdCtrls, Winapi.MMSystem,
  StrUtils, DateUtils, ClipBrd, IniFiles;

type

  // Key Hook Strcture
  TKeyHookState = packed record
    VK : Cardinal;
    ScanCode: Cardinal;
    Flags: Cardinal;
    Time: Cardinal;
    dwExtraInfo: Cardinal;
  end;
  // 1. Key Action structure
  TKeyPlayStructure = record
    Action : Boolean;
    Toggle : Boolean;
    Switch : Boolean;
    Hot : TShortCut;
    Key : Word;
    Shift : TShiftState;
    Skill : string;
  end;
  // 2. Key Skip structure
  TKeySkipStructure = record
    Action : Boolean;
    Hot : TShortCut;
    Key : Word;
    Shift : TShiftState;
    Delay : Integer;
    Swing : TDateTime;
  end;
  // 3. Key Stop structure
  TKeyStopStructure = record
    Action : Boolean;
    Hot : TShortCut;
    Key : Word;
    Shift : TShiftState;
  end;
  // 4. Key Push structure
  TKeyPushStructure = record
    Kind : Char;
    Mix : Integer;
    Hot : TShortCut;
    Key : Word;
    Shift : TShiftState;
    Delay : Integer;
    Swing : TDateTime;
  end;
  // 5. Key Talk structure
  TKeyTalkStructure = record
    Hot : TShortCut;
    Key : Word;
    Shift : TShiftState;
    Text : string;
  end;
  // Main MDI Form
  TuAraMain = class(TForm)
    cBarIcon: TPanel;
    beBevel: TBevel;
    ebAlert: TBevel;
    ebClone: TBevel;
    ebSave: TBevel;
    sbStart: TSpeedButton;
    sbEnd: TSpeedButton;
    sbAlert: TSpeedButton;
    sbMute: TSpeedButton;
    sbAppend: TSpeedButton;
    sbClone: TSpeedButton;
    sbDelete: TSpeedButton;
    sbKeep: TSpeedButton;
    sbSave: TSpeedButton;
    sbErase: TSpeedButton;
    sbEdit: TSpeedButton;
    ehBound: TPanel;
    dhBound: TLabel;
    ebBound: TBevel;
    feBoundID: TComboBox;
    ChildIndex: TDockTabSet;
    ssState: TPanel;
    ss0Say: TPanel;
    ss1Play: TPanel;
    ss2L_On: TPanel;
    ss3R_on: TPanel;
    ss4Toggle: TPanel;
    ss5Stop: TPanel;
    ss6Version: TPanel;
    ss7By: TPanel;
    sbState: TSpeedButton;
    sbAbout: TSpeedButton;
    ss8Sponsor: TPanel;
    sbSponsor: TSpeedButton;
    rAuto: TTimer;
    fdOpen: TOpenPictureDialog;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    function  FormHelp(Command: Word; Data: NativeInt; var CallHelp: Boolean): Boolean;
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure ChildIndexChange(Sender: TObject; NewTab: Integer; var AllowChange: Boolean);
    procedure rAutoTimer(Sender: TObject);
    procedure sbStartClick(Sender: TObject);
    procedure sbEndClick(Sender: TObject);
    procedure sbAlertClick(Sender: TObject);
    procedure sbAppendClick(Sender: TObject);
    procedure sbCloneClick(Sender: TObject);
    procedure sbDeleteClick(Sender: TObject);
    procedure sbKeepClick(Sender: TObject);
    procedure sbSaveClick(Sender: TObject);
    procedure feBoundIDChange(Sender: TObject);
    procedure sbEditClick(Sender: TObject);
    procedure sbEraseClick(Sender: TObject);
    procedure sbSponsorClick(Sender: TObject);
    procedure sbAboutClick(Sender: TObject);
  private
    // Language
    say_Action_Append : string;
    say_Action_Import : string;
    say_Action_Clone : string;
    say_Profile_Default : string;
    say_Profile_Append : string;
    say_Profile_Import : string;
    say_Profile_Clone : string;
    say_Profile_Full : string;
    say_Profile_Delete : string;
    say_Profile_Delete_Title : string;
    say_Profile_Delete_Guide : string;
    say_Bound_Fail : string;
    say_Bound_Error : string;
    say_Bound_None : string;
    say_Bound_Delete : string;
    say_Bound_Delete_Title : string;
    say_Bound_Delete_Guide : string;
    // Delay Clear
    resetTime : TDateTime;
    // File Path
    filePath : string;
    // Data File Name
    dataFile : string;
    // Zone File Name
    zoneFile : string;
    // Active Scan
    activeScan : Integer;
    activeName : string;
    activeKeep : TDateTime;
    // Child Jemp
    child_Lock : Boolean;
    // Config
    config_DB : TIniFile;
    // Skill Mix
    mix_Skill : Integer;
    // Child Handle ID
    childClass : TStringList;
    childPoint : TStringList;
    // Language : Head & Title & Hint
    language_Code : TStringList;
    language_Head : TStringList;
    // Mouse hold zone mark
    procedure zoneMark();
    // Child Form Open
    procedure childLoad(const AClassID: string; AMultiLoad: Boolean);
    // Child Form Load
    procedure childMask(const AClassID: string);
    // Child Form Create
    procedure childCall(const APoint: Cardinal);
    // Child Close
    procedure childShut(const APoint: Cardinal);
    // Child Close
    procedure childExit(Sender: TObject; var Action: TCloseAction);
    // Action Control Call (Child)
    procedure action_ID(const AIndex: Integer; AActionName: string);
    // Get Run Hook - Start
    function  scan_Start(): Integer;
    // Get Run Hook - Stop
    function  scan_End(): Integer;
    // Bound Active On Check
    function  press_Access(): Boolean;
    // Key Switch CHoice(Index)
    procedure press_Action(const AIndex: Integer);
    // Key Toggle Choice(ON:OFF)
    procedure press_Switch(const AIndex: Integer);
    // Key Skip(Pause Only)
    procedure press_Skip(const ADelay: Integer);
    // Cursor Hold Check
    function  press_Cursor(): Boolean;
    // Press Key : Mouse
    procedure press_Play();
    // Press Stop
    function  press_Stop(const AIndex: Integer): Integer;
    // Key Talk
    function  press_Talk(): Boolean;
    // Check Run Process
    function  press_Check(): Integer;
    // Skill Mix
    procedure press_Mixer();
  public
    // Screen Shot File name
    ScreenShotFile : string;
    // File Open
    function  ID_FileOpen(): string;
    // ID to Title
    function  ID_Title(const AIndex: string): string;
    // ID to Caption
    procedure ID_Caption(AItem: TObject; const AKey: string; ATip: string = '');
    // Sound FIle Load
    procedure ID_Alert(const AAlertFolder: string);
    // Active ScreenShot & Program Name
    procedure ActiveShot();
    // Active Head
    function  ActiveHead(): string;
    // Bound Append
    procedure BoundUpdate(const AIndex: Integer; ADataCode: string);
    // Bound Export
    function  BoundExport(): string;
    // Profile Index
    function  ProfileIndex(AForm: TForm): Integer;
    // Profile Append
    procedure ProfileAppend(const AMode: Integer; AData: string);
    // Profile Export
    function  ProfileExport(): string;
    // Child Form Caption
    procedure ProfileTitle(const AForm: TForm; AName: string);
    // Store Set Value
    function  ProfileInText(const AIndex: Integer; AHead: string; AValue: string): Integer;
    function  ProfileInData(const AIndex: Integer; AHead: string; AValue: Boolean): Integer; overload;
    function  ProfileInData(const AIndex: Integer; AHead: string; AValue: Integer): Integer; overload;
    // Index Get Value
    function  ProfileToText(const AIndex: Integer; AHead: string; ADefault: string): string;
    function  ProfileToData(const AIndex: Integer; AHead: string; ADefault: Boolean): Boolean; overload;
    function  ProfileToData(const AIndex: Integer; AHead: string; ADefault: Integer): Integer; overload;
    // HotKey to Key:Shift Register(Akind, AIndex)
    procedure Hot2KeySet(const AKind, AIndex: Integer; AHotKey: TShortCut);
    // HotKey To Key:Shift
    procedure Hot2KeyShift(const AHotKey: TShortCut; var AKey: word; var AShift: TShiftState);
    // Key:Shift To HotKey
    function  KeyShift2Hot(const AKey: word; AShift: TShiftState): TShortCut;
    // Shift To Text
    function  Shift2Text(const AShift: TShiftState): string;
    // String To Row
    function  Data2Row(const AData, ADelimited: string): string;
    // Text To Row
    function  Text2Row(const AData: string): string;
  end;

const
  LLKHF_ALTDOWN = KF_ALTDOWN shr 8;
  c_SKILLS = 'LR123456789';
  c_SWITCH : array [Boolean] of String = ('0', '1');
  c_TOGGLE = '00000';
  c_RATIO_DOT = 100;
  c_LR_CLICKS : array [0..1, Boolean] of String = (('', 'L-on'),('', 'R-on'));
  c_PLAY_LIST = 5;
  c_SKIP_LIST = 3;
  c_STOP_LIST = 11;
  c_PUSH_MORE = 2;
  c_PUSH_LIST = 10;
  c_TALK_LIST = 10;
  c_DATA_HEAD = #2;
  c_DATA_PAGE = #3;
  c_DATA_MORE = #4;
  c_DATA_LFCR = #13 + #10;
  c_CONFIG_IN = 'CONFIG';
  c_PROFILEID = 'PROFILE';
  c_BOUNDARYS = 'BOUND';
  c_CHAT_ICON = 'TALK';
  c_LANGUAGES = 'language.cfg';

var
  uAraMain: TuAraMain;
  // Key Scan Shift State
  State_KeyShift : TShiftState;
  // Target Handler
  Scan_Action : HWND;
  // Play Action ID
  Play_Action : string = '';
  Play_Toggle : string = '';
  // Left Click
  LKey_Switch : Boolean;
  LKey_Toggle : Integer;
  // Right Click
  RKey_Switch : Boolean;
  RKey_Toggle : Integer;
  // Skip Action
  Skip_Action : Boolean = False;
  Skip_Change : TDateTime;
  // Stop Actiion ID
  Stop_Action : Integer = -1;
  // Talk Action ID
  Talk_Action : Boolean = False;
  Talk_Change : TDateTime;
  // Get - KeyBoard Event Hook API
//  State_RunState : HHook = 0;
  // Get - KeyBoard Event Hook API
  State_KeyBoard : HHook = 0;
  // Key Play
  Key_Play : array[1.. 5] of TKeyPlayStructure;
  // Key Skip
  Key_Skip : array[1.. 3] of TKeySkipStructure;
  // Key Stop
  Key_Stop : array[1..11] of TKeyStopStructure;
  // Key Push
  Key_Push : array[0..10] of TKeyPushStructure;
  // Key Talk
  Key_Talk : array[0..10] of TKeyTalkStructure;
  // Alert Kind
  Alert_Kind : string;
  // Alert List
  Alert_List : TStringList;
  // Talk Message(Clipboard)
  Talk_Board : TStringList;
  Talk_Paste : TClipboard;
  // Say Stream
  Say_Pause : TMemoryStream;
  Say_KeyIn : array [1..5] of TMemoryStream;
  Say_KeyOn : array [1..5] of TMemoryStream;
  Say_KeyUn : array [1..5] of TMemoryStream;
//  Say_L_Key : array [0..1] of TMemoryStream;
//  Say_R_Key : array [0..1] of TMemoryStream;
  // Swap Data Structure Change
  SwapList : TStringList;
  SwapHead : TStringList;
  SwapItem : TStringList;
  // Zone Hold DataBase
  ZoneBase : TStringList;
  // Profile DataBase
  DataBase : TStringList;
  // Get Key Hook Function
  function HookGetKey(AHookCode: Integer; AKeyCode: WPARAM; AKeyState: LPARAM): LongInt; stdcall;

implementation

uses
  Bound, ImExport, Sponsor, About;

{$R *.dfm}

// Get Key Hook Function
function HookGetKey(AHookCode: Integer; AKeyCode: WPARAM; AKeyState: LPARAM): LongInt; stdcall;
var
  i_GK5Skip : integer;
  i_GK5Stop : integer;
  i_GK5Play : integer;
  i_GK5Talk : integer;
  m_GK5Code : word;
  p_GK5Call : ^TKeyHookState absolute AKeyState;
begin
  Result := CallNextHookEx(State_KeyBoard, AHookCode, AKeyCode, AKeyState);
  if Application.Active  = False then
  begin
    if AHookCode = HC_ACTION then
    begin
      if uBound.Visible = False then
      begin
        // Key Code
        m_GK5Code := p_GK5Call^.VK;
        // Alt Key Press
        if ssAlt in State_KeyShift then
        begin
          if not(LongBool(p_GK5Call^.Flags and LLKHF_ALTDOWN)) then
          begin
            State_KeyShift := State_KeyShift - [ssAlt];
          end;
        end
        else
        begin
          if LongBool(p_GK5Call^.Flags and LLKHF_ALTDOWN) then
          begin
            State_KeyShift := State_KeyShift + [ssAlt];
          end;
        end;
        // Ctrl key, log once on keydown
        if ssCtrl in State_KeyShift then
        begin
          if not(WordBool(GetAsyncKeyState(VK_CONTROL) and $8000)) then
          begin
            State_KeyShift := State_KeyShift - [ssCtrl];
          end;
        end
        else
        begin
          if WordBool(GetAsyncKeyState(VK_CONTROL) and $8000) then
          begin
            State_KeyShift := State_KeyShift + [ssCtrl];
          end;
        end;
        // Shift key, log once on keydown
        if ssShift in State_KeyShift then
        begin
          if (AKeyCode = WM_KEYUP) and ((m_GK5Code = VK_LSHIFT) or (m_GK5Code = VK_RSHIFT)) then
          begin
            State_KeyShift := State_KeyShift - [ssShift];
          end;
        end
        else
        begin
          if (m_GK5Code = VK_LSHIFT) or (m_GK5Code = VK_RSHIFT) then
          begin
            State_KeyShift := State_KeyShift + [ssShift];
          end;
        end;
        // Key
        if (AKeyCode = WM_KEYUP) and
           (m_GK5Code <> VK_LMENU) and (m_GK5Code <> VK_RMENU) and  //not Alt
           (m_GK5Code <> VK_LSHIFT) and (m_GK5Code <> VK_RSHIFT) and // not Shift
           (m_GK5Code <> VK_LCONTROL) and (m_GK5Code <> VK_RCONTROL) then //not Ctrl
        begin
          // ON STOP
          i_GK5Stop := 1;
          if (Play_Action + Play_Toggle <> '') or (LKey_Switch = True) or (RKey_Switch = True) or ((Lkey_Toggle + Rkey_Toggle)<> 0) then
          begin
            while (i_GK5Stop > 0) and (i_GK5Stop <= c_STOP_LIST) do
            begin
              if (Key_Stop[i_GK5Stop].Action = True) and (Key_Stop[i_GK5Stop].Hot > 0) then
              begin
                if (m_GK5Code = Key_Stop[i_GK5Stop].Key) and (State_KeyShift = Key_Stop[i_GK5Stop].Shift) then
                begin
                  if not(((Talk_Action = True) or (Talk_Board.Count > 0)) and (Key_Stop[i_GK5Stop].Hot = VK_RETURN)) then
                  begin
                    // Stop
                    uAraMain.press_Stop(i_GK5Stop);
                    // Exit
                    i_GK5Stop := 0;
                  end;
                end
              end;
              if i_GK5Stop <> 0 then Inc(i_GK5Stop);
            end;
          end;
          // ON SKIP
          i_GK5Skip := 1;
          if Play_Action + Play_Toggle <> '' then
          begin
            while (i_GK5Skip > 0) and (i_GK5Skip <= c_SKIP_LIST) do
            begin
              if (Key_Skip[i_GK5Stop].Action = True) and (Key_Skip[i_GK5Stop].Hot > 0) then
              begin
                if (m_GK5Code = Key_Skip[i_GK5Stop].Key) and (State_KeyShift = Key_Skip[i_GK5Stop].Shift) then
                begin
                  uAraMain.press_Skip(Key_Skip[i_GK5Skip].Delay);
                end
              end;
              if i_GK5Skip <> 0 then Inc(i_GK5Skip);
            end;
          end;
          // ON PLAY
          i_GK5Play := 1;
          if i_GK5Stop <> 0 then
          begin
            while (i_GK5Play > 0) and (i_GK5Play <= c_PLAY_LIST) do
            begin
              if (Key_Play[i_GK5Play].Action = True) and (Key_Play[i_GK5Play].Hot > 0) and (Key_Play[i_GK5Play].Skill <> '') then
              begin
                if (m_GK5Code = Key_Play[i_GK5Play].Key) and (State_KeyShift = Key_Play[i_GK5Play].Shift) then
                begin
                  // Play ID
                  if Key_Play[i_GK5Play].Toggle = False then
                  begin
                    uAraMain.press_Action(i_GK5Play);
                  end
                  else
                  begin
                    uAraMain.press_Switch(i_GK5Play);
                  end;
                  // Exit
                  i_GK5Play := 0;
                end;
              end;
              if i_GK5Play <> 0 then Inc(i_GK5Play);
            end;
          end;
          // ON TALK
          i_GK5Talk := 0;
          while (i_GK5Talk > -1) and (i_GK5Talk <= c_TALK_LIST) do
          begin
            if (Key_Talk[i_GK5Talk].Text <> '') and (Key_Talk[i_GK5Talk].Hot > 0) then
            begin
              if (m_GK5Code = Key_Talk[i_GK5Talk].Key) and (State_KeyShift = Key_Talk[i_GK5Talk].Shift) then
              begin
                Talk_Board.Append(Key_Talk[i_GK5Talk].Text);
                i_GK5Talk := -1;
              end;
            end;
            if i_GK5Talk <> -1 then Inc(i_GK5Talk);
          end;
        end;
      end
      else
      begin
        if AKeyCode = WM_KEYUP then
        begin
          if p_GK5Call^.VK = VK_SNAPSHOT then
          begin
            uAraMain.ActiveShot();
          end;
        end;
      end;
    end;
  end;
end;

// Form Begin ------------------------------------------------------------------
procedure TuAraMain.FormCreate(Sender: TObject);
var
  i : Integer;
  m_FC5Tree : TSearchRec;
  function L_BuildVersion(): string;
  var
    VerInfoSize, VerValueSize, Dummy: DWORD;
    VerInfo: Pointer;
    VerValue: PVSFixedFileInfo;
  begin
    Result := '1.0.0.0';
    VerInfoSize := GetFileVersionInfoSize(PChar(ParamStr(0)), Dummy);
    if VerInfoSize > 0 then
    begin
      GetMem(VerInfo, VerInfoSize);
      try
        if GetFileVersionInfo(PChar(ParamStr(0)), 0, VerInfoSize, VerInfo) then
        begin
          VerQueryValue(VerInfo, '\', Pointer(VerValue), VerValueSize);
          with VerValue^ do
          begin
            Result := 'v.'
                    + IntTostr(dwFileVersionMS shr 16) + '.'
                    + IntTostr(dwFileVersionMS and $FFFF) + '.'
                    + IntTostr(dwFileVersionLS shr 16) + '.'
                    + IntTostr(dwFileVersionLS and $FFFF);
          end;
        end;
      finally
        FreeMem(VerInfo, VerInfoSize);
      end;
    end;
  end;
begin
  //  Version
  ss6Version.Caption := L_BuildVersion();
  // Delay Clear Define
  resetTime := EncodeDateTime(2000, 01, 01, 00, 00, 00, 00);
  // Path
  filePath := ExtractFilePath(Application.ExeName);
  // Profile Filename
  dataFile := filePath + 'Profile.apf';
  // Zone Hold Filename
  zoneFile := filePath + 'Bound.mhf';
  // Child Jemp
  child_Lock := False;
  // Config
  config_DB := TIniFile.Create(filePath + 'Config.ini');
  // Skill Mix
  mix_Skill := config_DB.ReadInteger('SKILL', 'MIX', 0);
  // Profile Choice
  ChildIndex.Tag := config_DB.ReadInteger(c_PROFILEID, 'INDEX', 0);
  // Screen Shot File name
  ScreenShotFile := config_DB.ReadString(c_BOUNDARYS, 'SHOT.FILE', '');
  // Debug
  sbState.Tag := config_DB.ReadInteger('DEBUG', 'VIEW', 0);
  // State
  sbState.Visible := (config_DB.ReadInteger('DEBUG', 'ACTION', 0) = 1);
  // Sponsor
  sbSponsor.Enabled := sbState.Visible;
  // Active Scan
  activeScan := 0;
  activeName := '';
  activeKeep := resetTime;
  // Child Form MDI ID(Handle)
  childClass := TStringList.Create;
  childPoint := TStringList.Create;
  // Language
  language_Code := TStringList.Create;
  language_Head := TStringList.Create;
  if FileExists(filePath + c_LANGUAGES) = True then
  begin
    childClass.LoadFromFile(filePath + c_LANGUAGES);
    for i := 0 to childClass.Count - 1 do
    begin
      childPoint.Text := StringReplace(childClass.Strings[ i], '=', c_DATA_LFCR, []) + c_DATA_LFCR + c_DATA_LFCR;
      if childPoint.Strings[ 0] <> '' then
      begin
        language_Code.Append(childPoint.Strings[ 0]);
        language_Head.Append(childPoint.Strings[ 1]);
      end;
    end;
  end;
  // Clear
  childClass.Clear;
  childPoint.Clear;
  // Action Profile
  say_Action_Append        := ID_Title('MAIN.PROFILE.APPEND');
  say_Action_Import        := ID_Title('MAIN.PROFILE.IMPORT');
  say_Action_Clone         := ID_Title('MAIN.PROFILE.CLONE');
  say_Profile_Default      := ID_Title('MAIN.SAY.PROFILE.DEFAULT');
  say_Profile_Append       := ID_Title('MAIN.SAY.PROFILE.APPEND');
  say_Profile_Import       := ID_Title('MAIN.SAY.PROFILE.IMPORT');
  say_Profile_Clone        := ID_Title('MAIN.SAY.PROFILE.CLONE');
  say_Profile_Full         := ID_Title('MAIN.SAY.PROFILE.FULL');
  say_Profile_Delete       := ID_Title('MAIN.SAY.PROFILE.DELETE');
  say_Profile_Delete_Title := ID_Title('MAIN.SAY.PROFILE.DELETE.TITLE');
  say_Profile_Delete_Guide := ID_Title('MAIN.SAY.PROFILE.DELETE.GUIDE');
  say_Bound_Fail           := ID_Title('MAIN.SAY.BOUND.FAIL');
  say_Bound_Error          := ID_Title('MAIN.SAY.BOUND.ERROR');
  say_Bound_None           := ID_Title('MAIN.SAY.BOUND.NONE');
  say_Bound_Delete         := ID_Title('MAIN.SAY.BOUND.DELETE');
  say_Bound_Delete_Title   := ID_Title('MAIN.SAY.BOUND.DELETE.TITLE');
  say_Bound_Delete_Guide   := ID_Title('MAIN.SAY.BOUND.DELETE.GUIDE');

  say_Profile_Full    := ReplaceStr(say_Profile_Full, '{MAX}', IntToStr(ChildIndex.HelpContext));

  if say_Action_Append        = '' then say_Action_Append        := 'Append Profile';
  if say_Action_Import        = '' then say_Action_Import        := 'Import Profile';
  if say_Action_Clone         = '' then say_Action_Clone         := 'Clone Profile';
  if say_Profile_Default      = '' then say_Profile_Default      := 'DEFAULT PROFILE';
  if say_Profile_Append       = '' then say_Profile_Append       := 'APPEND PROFILE';
  if say_Profile_Import       = '' then say_Profile_Import       := 'IMPORT PROFILE';
  if say_Profile_Clone        = '' then say_Profile_Clone        := 'CLONE PROFILE';
  if say_Profile_Full         = '' then say_Profile_Full         := 'PROFILE FULL(MAX : {MAX})';
  if say_Profile_Delete       = '' then say_Profile_Delete       := 'DELETE PROFILE';
  if say_Profile_Delete_Title = '' then say_Profile_Delete_Title := 'DELETE PROFILE';
  if say_Profile_Delete_Guide = '' then say_Profile_Delete_Guide := 'DELETE PROFILE';
  if say_Bound_Fail           = '' then say_Bound_Fail           := 'BOUND DESIGN FAIL';
  if say_Bound_Error          = '' then say_Bound_Error          := 'BOUND DATA ERROR';
  if say_Bound_None           = '' then say_Bound_None           := 'BOUND NOT CHOICE';
  if say_Bound_Delete         = '' then say_Bound_Delete         := 'BOUND DELETE';
  if say_Bound_Delete_Title   = '' then say_Bound_Delete_Title   := 'BOUND DELETE';
  if say_Bound_Delete_Guide   = '' then say_Bound_Delete_Guide   := 'BOUND DELETE';
  // Language Item
  ID_Caption( sbStart   , 'MAIN.START'   , 'MAIN.TIP.START'   );
  ID_Caption( sbEnd     , 'MAIN.END'     , 'MAIN.TIP.END'     );
  ID_Caption( sbAlert   , 'MAIN.ALERT'   , 'MAIN.TIP.ALERT'   );
  ID_Caption( sbMute    , 'MAIN.MUTE'    , 'MAIN.TIP.MUTE'    );
  ID_Caption( sbAppend  , 'MAIN.APPEND'  , 'MAIN.TIP.APPEND'  );
  ID_Caption( sbDelete  , 'MAIN.DELETE'  , 'MAIN.TIP.DELETE'  );
  ID_Caption( sbClone   , 'MAIN.CLONE'   , 'MAIN.TIP.CLONE'   );
  ID_Caption( sbSave    , 'MAIN.SAVE'    , 'MAIN.TIP.SAVE'    );
  ID_Caption( sbKeep    , 'MAIN.KEEP'    , 'MAIN.TIP.KEEP'    );
  ID_Caption( dhBound   , 'MAIN.BOUND'   , 'MAIN.TIP.BOUND'   );
  ID_Caption( sbEdit    , 'MAIN.EDIT'    , 'MAIN.TIP.EDIT'    );
  ID_Caption( sbErase   , 'MAIN.ERASE'   , 'MAIN.TIP.ERASE'   );
  ID_Caption( sbSponsor , 'MAIN.SPONSOR' , 'MAIN.TIP.SPONSOR' );
  // None
  ebAlert.Hint := ID_Title('PROFILE.ALERT.NONE');
  if ebAlert.Hint = '' then ebAlert.Hint := 'NONE';
  // Alert List
  Alert_List := TStringList.Create;
  Alert_List.Append(ebAlert.HelpKeyword + ebAlert.Hint);
  try
    if FindFirst(filePath + 'Effect\*.*', faDirectory, m_FC5Tree) > -1 then
    begin
      repeat
        if ((m_FC5Tree.Attr and faDirectory <> 0) and (m_FC5Tree.Name <> '.') and (m_FC5Tree.Name <> '..')) then
        begin
           Alert_List.Add(m_FC5Tree.Name) ;
         end;
      until FindNext(m_FC5Tree) <> 0;
    end;
  finally
    FindClose(m_FC5Tree) ;
  end;
  // Skill ID
  for i := 0 to High(Key_Push) do
  begin
    Key_Push[ i].Mix  := i;
    Key_Push[ i].Kind := c_SKILLS[i + 1];
  end;
  // Talk Message(Clipboard)
  Talk_Board := TStringList.Create;
  Talk_Paste := TClipboard.Create;
  // Play Sound List
  Say_Pause := TMemoryStream.Create;
  for i := 1 to 5 do
  begin
    Say_KeyIn[ i] := TMemoryStream.Create;
    Say_KeyOn[ i] := TMemoryStream.Create;
    Say_KeyUn[ i] := TMemoryStream.Create;
  end;
  // Swap Data Structure Change
  SwapList := TStringList.Create;
  SwapHead := TStringList.Create;
  SwapItem := TStringList.Create;
  // Bound DataBase
  ZoneBase := TStringList.Create;
  // Bound Load
  if FileExists(zoneFile) = True then
  begin
    ZoneBase.LoadFromFile(zoneFile);
  end;
  // Bound Hint
  feBoundID.Hint := ID_TITLE('MAIN.TIP.KIND');
  if feBoundID.Hint = '' then feBoundID.Hint := '';
    // Bourn None Title
  dhBound.Hint := ID_Title('MAIN.BOUND.NONE');
  if dhBound.Hint = '' then dhBound.Hint := 'NONE';
  // Bound List
  feBoundID.Items.Clear;
  feBoundID.Items.Append(feBoundID.HelpKeyword + dhBound.Hint);
  // Add Bound Head
  for i := 0 to ZoneBase.Count - 1 do
  begin
    SwapHead.Text := ReplaceStr(ZoneBase.Strings[ i] + StringOfChar(c_DATA_PAGE, 2), c_DATA_PAGE, c_DATA_LFCR);
    feBoundID.Items.Append(SwapHead.Strings[ 0]);
  end;
  // User Choice
  dhBound.Tag := config_DB.ReadInteger(c_BOUNDARYS, 'INDEX', 0);
  if (dhBound.Tag > 0) and (dhBound.Tag < feBoundID.Items.Count) then
  begin
    feBoundID.ItemIndex := dhBound.Tag;
  end
  else
  begin
    feBoundID.ItemIndex := 0;
  end;
  // Profile DataBase
  DataBase := TStringList.Create;
  // Profile Load
  if FileExists(dataFile) = True then
  begin
    DataBase.LoadFromFile(dataFile);
  end;
  // Profile Let
  if DataBase.Count < 1 then
  begin
    DataBase.Append('');
  end;
end;

procedure TuAraMain.FormDestroy(Sender: TObject);
begin
  // Auto Stop
  if Self.rAuto.Enabled = True then Self.rAuto.Enabled := False;
  // Profile Choice
  config_DB.WriteInteger(c_PROFILEID, 'INDEX', ChildIndex.TabIndex);
  // Bound Index
  config_DB.WriteInteger(c_BOUNDARYS, 'INDEX', feBoundID.ItemIndex);
  // Screen Shot FileName
  config_DB.WriteString(c_BOUNDARYS, 'SHOT.FILE', ScreenShotFile);
  // Config
  config_DB.Free;
  // Child Free
  childClass.Free;
  childPoint.Free;
  // Alert List
  Alert_List.Free;
  // Language
  language_Code.Free;
  language_Head.Free;
  // Talk Message(Clipboard)
  Talk_Board.Free;
  Talk_Paste.Free;
  // Play Sound List
  Say_Pause.Free;
  Say_KeyIn[ 5].Free;
  Say_KeyIn[ 4].Free;
  Say_KeyIn[ 3].Free;
  Say_KeyIn[ 2].Free;
  Say_KeyIn[ 1].Free;
  Say_KeyOn[ 5].Free;
  Say_KeyOn[ 4].Free;
  Say_KeyOn[ 3].Free;
  Say_KeyOn[ 2].Free;
  Say_KeyOn[ 1].Free;
  Say_KeyUn[ 5].Free;
  Say_KeyUn[ 4].Free;
  Say_KeyUn[ 3].Free;
  Say_KeyUn[ 2].Free;
  Say_KeyUn[ 1].Free;
  // Swap Data Structure Change
  SwapList.Free;
  SwapHead.Free;
  SwapItem.Free;
  // Bound DataBase
  ZoneBase.Free;
  // Profile DataBase
  DataBase.Free;
end;

function TuAraMain.FormHelp(Command: Word; Data: NativeInt; var CallHelp: Boolean): Boolean;
begin
  CallHelp := False;
  Result := CallHelp;
end;

procedure TuAraMain.FormShow(Sender: TObject);
var
  i : Integer;
begin
  // Child Lock
  child_Lock := True;
  // Child Load
  for i := 0 to DataBase.Count - 1 do
  begin
    // Profile Append
    childLoad('TuProfile', True);
    // Profile Read
    if DataBase.Strings[ i] <> '' then action_ID( i, 'PB_Load');
  end;
  // Profile Choice
  if (ChildIndex.Tag > -1) AND (ChildIndex.Tag < ChildIndex.Tabs.Count) then
  begin
    ChildIndex.TabIndex := ChildIndex.Tag;
  end;
  // Load Profile
  if (ChildIndex.TabIndex > -1) and (ChildIndex.TabIndex < ChildIndex.Tabs.Count) then
  begin
    action_ID(ChildIndex.TabIndex, 'PB_Keep');
  end;
  // Child Lock
  child_Lock := False;
  // Start
  if Self.Tag = 0 then
  begin
    // Kind
    Self.Tag := 1;
    // hold Zone Mark
    zoneMark();
    // Scan Start
    scan_Start();
  end;
end;

procedure TuAraMain.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  // Stop
  scan_End();
end;

procedure TuAraMain.ChildIndexChange(Sender: TObject; NewTab: Integer; var AllowChange: Boolean);
begin
  if child_Lock = False then
  begin
    // Stop
    if (Play_Action + Play_Toggle <> '') or (LKey_Switch = True) or (RKey_Switch = True) or ((Lkey_Toggle + Rkey_Toggle)<> 0) then
    begin
      press_Stop(0);
    end;
    // Child Form Action
    childCall(StrToIntDef(childPoint.Strings[NewTab], -1));
    // DataBase Read
    action_ID(NewTab, 'PB_Read');
  end;
end;

procedure TuAraMain.rAutoTimer(Sender: TObject);
begin
  if Skip_Action = False then
  begin
    rAuto.Enabled := False;
    Self.press_Play();
    rAuto.Enabled := True;
  end;
end;

procedure TuAraMain.sbStartClick(Sender: TObject);
begin
  Self.scan_Start();
end;

procedure TuAraMain.sbEndClick(Sender: TObject);
begin
  Self.scan_End();
end;

procedure TuAraMain.sbAlertClick(Sender: TObject);
begin

  ID_Alert(Alert_Kind);
end;

procedure TuAraMain.sbAppendClick(Sender: TObject);
begin
  ProfileAppend( 0, '');
end;

procedure TuAraMain.sbCloneClick(Sender: TObject);
begin
  ProfileAppend( 2, DataBase.Strings[ChildIndex.TabIndex]);
end;

procedure TuAraMain.sbDeleteClick(Sender: TObject);
var
  i_BC5Tabs : Integer;
begin
  if  Application.MessageBox('Delete Profile', 'DELETE', MB_YESNO + MB_ICONWARNING) = IDYES then
  begin
    if ChildIndex.Tabs.Count > 1 then
    begin
      // Tab Index
      i_BC5Tabs := ChildIndex.TabIndex;
      // Chile Form Delete
      childShut(StrToIntDef(childPoint.Strings[i_BC5Tabs], -1));
      // Child Form Point
      childPoint.Delete(i_BC5Tabs);
      // DataBase Profile Delete
      DataBase.Delete(i_BC5Tabs);
      // Tab Name Delete
      ChildIndex.Tabs.Delete(i_BC5Tabs);
      // DataBase Register - Open
      if (ChildIndex.TabIndex > -1) and (ChildIndex.TabIndex < ChildIndex.Tabs.Count) then
      begin
        action_ID(ChildIndex.TabIndex, 'PB_Store');
      end;
      // Message
      ss0Say.Caption := say_Profile_Delete;
    end
    else
    begin
      ss0Say.Caption := say_Profile_Default;
    end;
  end;
end;

procedure TuAraMain.sbKeepClick(Sender: TObject);
begin
  uImExport.ShowModal();
end;

procedure TuAraMain.sbSaveClick(Sender: TObject);
begin
  // Profile DataBase Save
  DataBase.SaveToFile(dataFile);
  // Bound DataBase Save
  ZoneBase.SaveToFile(zoneFile);
end;

procedure TuAraMain.feBoundIDChange(Sender: TObject);
begin
  zoneMark();
end;

procedure TuAraMain.sbEditClick(Sender: TObject);
begin
  if feBoundID.Tag = 0 then
  begin
    feBoundID.Tag := 1;
    try
      if feBoundID.ItemIndex < 1 then
      begin
        if uBound.New() = 1 then BoundUpdate( 0, uBound.Data());
      end
      else
      begin
        if uBound.Edit(ZoneBase.Strings[feBoundID.ItemIndex - 1]) = 1 then
        begin
          BoundUpdate(feBoundID.ItemIndex, uBound.Data());
        end;
      end;
    except
      ss0Say.Caption := say_Bound_Fail;
    end;
    feBoundID.Tag := 0;
  end;
end;

procedure TuAraMain.sbEraseClick(Sender: TObject);
var
  i_EC5Kind : Integer;
begin
  if feBoundID.ItemIndex > 0 then
  begin
    // Keep Index
    i_EC5Kind := feBoundID.ItemIndex;
    // Default None
    feBoundID.ItemIndex := 0;
    // Delete
    if (i_EC5Kind - 1) < ZoneBase.Count then
    begin
      // Item Delete
      feBoundID.Items.Delete(i_EC5Kind);
      // Zone Delete
      ZoneBase.Delete(i_EC5Kind - 1);
    end
    else
    begin
      ss0Say.Caption := say_Bound_Error;
    end;
  end
  else
  begin
    ss0Say.Caption := say_Bound_None;
  end;
end;

procedure TuAraMain.sbAboutClick(Sender: TObject);
begin
  uAbout.ShowModal();
end;

procedure TuAraMain.sbSponsorClick(Sender: TObject);
begin
  uSponsor.ACT(sbSponsor.Down);
end;

// Form End --------------------------------------------------------------------
// ID to Title
function TuAraMain.ID_FileOpen(): string;
var
  s_FO5Path : string;
begin
  Result := '';
  s_FO5Path := GetCurrentDir();
  try
    if fdOpen.Execute then
    begin
      if fdOpen.Files.Count > 0 then
      begin
        Result := fdOpen.Files.Strings[ 0];
      end;
    end;
  except
    ;
  end;
  SetCurrentDir(s_FO5Path);
end;

// ID to Title
function TuAraMain.ID_Title(const AIndex: string): string;
var
  i_IT5Seek : Integer;
begin
  Result := '';
  if AIndex <> '' then
  begin
    i_IT5Seek := language_Code.IndexOf(AIndex);
    if i_IT5Seek > -1 then Result := Trim(language_Head.Strings[i_IT5Seek]);
    Result := ReplaceStr(Result, '{CR}', c_DATA_LFCR);
  end;
end;

// Item Title
procedure TuAraMain.ID_Caption(AItem: TObject; const AKey: string; ATip: string = '' );
var
  s_IT5Head : string;
  s_IT5Hint : string;
begin
  s_IT5Head := ID_Title(AKey);
  s_IT5Hint := ID_Title(ATip);
  if AItem is TForm then
  begin
    with TForm(AItem) do
    begin
      if s_IT5Head <> '' then Caption := s_IT5Head;
    end;
  end
  else
  if AItem is TLabel then
  begin
    with TLabel(AItem) do
    begin
      if s_IT5Head <> '' then Caption := HelpKeyword + s_IT5Head;
    end;
  end
  else
  if AItem is TSpeedButton then
  begin
    with TSpeedButton(AItem) do
    begin
      if s_IT5Head <> '' then Caption := s_IT5Head;
      if s_IT5Hint <> '' then Hint := s_IT5Hint;
    end;
  end;
  if AItem is TTabSheet then
  begin
    with TTabSheet(AItem) do
    begin
      if s_IT5Head <> '' then Caption := s_IT5Head;
      if s_IT5Hint <> '' then Hint := s_IT5Hint;
    end;
  end;
end;

// Alert File Load
procedure TuAraMain.ID_Alert(const AAlertFolder: string);
var
  s_SL5File : string;
  procedure L_wav_Load(AInStream: TMemoryStream; AFileName: string);
  begin
    s_SL5File := '';
    if AAlertFolder <> '' then
    begin
      s_SL5File := filePath + 'Effect\' + AAlertFolder + '\' + AFileName + '.wav';
      if FileExists(s_SL5File) = False then s_SL5File := '';
    end;
    if s_SL5File <> '' then
    begin
      AInStream.LoadFromFile(s_SL5File);
    end
    else
    begin
      AInStream.Clear;
    end;
  end;
begin
  if AAlertFolder <> '' then
  begin
    // Stop
    L_wav_Load(Say_Pause, 'Stop');
    // Choice 1 ~ 5
    L_wav_Load(Say_KeyIn[ 1], 'Action-1');
    L_wav_Load(Say_KeyIn[ 2], 'Action-2');
    L_wav_Load(Say_KeyIn[ 3], 'Action-3');
    L_wav_Load(Say_KeyIn[ 4], 'Action-4');
    L_wav_Load(Say_KeyIn[ 5], 'Action-5');
    // Switch 1 ~ 5
    L_wav_Load(Say_KeyOn[ 1], 'Switch-1');
    L_wav_Load(Say_KeyOn[ 2], 'Switch-2');
    L_wav_Load(Say_KeyOn[ 3], 'Switch-3');
    L_wav_Load(Say_KeyOn[ 4], 'Switch-4');
    L_wav_Load(Say_KeyOn[ 5], 'Switch-5');
    // Pause 1 ~ 5
    L_wav_Load(Say_KeyUn[ 1], 'Pause-1');
    L_wav_Load(Say_KeyUn[ 2], 'Pause-2');
    L_wav_Load(Say_KeyUn[ 3], 'Pause-3');
    L_wav_Load(Say_KeyUn[ 4], 'Pause-4');
    L_wav_Load(Say_KeyUn[ 5], 'Pause-5');
  end
  else
  begin
    // Stop
    Say_Pause.Clear;
    // Choice 1 ~ 5
    Say_KeyIn[ 1].Clear;
    Say_KeyIn[ 2].Clear;
    Say_KeyIn[ 3].Clear;
    Say_KeyIn[ 4].Clear;
    Say_KeyIn[ 5].Clear;
    // Switch 1 ~ 5
    Say_KeyOn[ 1].Clear;
    Say_KeyOn[ 2].Clear;
    Say_KeyOn[ 3].Clear;
    Say_KeyOn[ 4].Clear;
    Say_KeyOn[ 5].Clear;
    // Pause 1 ~ 5
    Say_KeyUn[ 1].Clear;
    Say_KeyUn[ 2].Clear;
    Say_KeyUn[ 3].Clear;
    Say_KeyUn[ 4].Clear;
    Say_KeyUn[ 5].Clear;
  end
end;

// ScreenShot
procedure TuAraMain.ActiveShot();
begin
  // Program Name
  uBound.feActive.Text := ActiveHead();
  // Screen Shot
  uBound.Shot();
end;

// Active Head
function TuAraMain.ActiveHead(): string;
var
  m_AN5Scan : HWND;
  i_AN5Size : Integer;
  s_NF5Name : string;
begin
  Result := '';
  m_AN5Scan := GetForegroundWindow();
  if m_AN5Scan > 0 then
  begin
    i_AN5Size := GetWindowTextLengthA(m_AN5Scan);
    SetLength(s_NF5Name, i_AN5Size);
    GetWindowText(m_AN5Scan, PChar(s_NF5Name), i_AN5Size + 1);
    Result := string(PChar(s_NF5Name));
  end;
end;

// Bound Append
procedure TuAraMain.BoundUpdate(const AIndex: Integer; ADataCode: string);
begin
  // Active Scan
  activeScan := 0;
  activeName := '';
  // Update
  if AIndex = 0 then
  begin
    // Add
    ZoneBase.Append(ADataCode);
    // Item Name Change
    feBoundID.Items.Append(uBound.feStyle.Text);
  end
  else
  begin
    // Item Name Change
    feBoundID.Items.Strings[AIndex] := uBound.feStyle.Text;
    // Add
    ZoneBase.Strings[AIndex - 1] := uBound.Data();
  end;
  // Index : 0
  feBoundID.ItemIndex := 0;
end;

// Bound Export
function TuAraMain.BoundExport(): string;
begin
  Result := '';
  if (feBoundID.ItemIndex > 0) and
     (feBoundID.ItemIndex < feBoundID.Items.Count) and
     (feBoundID.ItemIndex - 1 < ZoneBase.Count) then
  begin
    Result := ZoneBase.Strings[feBoundID.ItemIndex - 1];
  end;
end;

// Profile Index
function  TuAraMain.ProfileIndex(AForm: TForm): Integer;
begin
  Result := childPoint.IndexOf(IntToStr(AForm.Handle));
end;

// Profile Append
procedure TuAraMain.ProfileAppend(const AMode: Integer; AData: string);
begin
  if ChildIndex.Tabs.Count < ChildIndex.HelpContext then
  begin
    // DataBase Register - Reset
    DataBase.Append(AData);
    // Copy Profile Name Change
    case AMode of
      0: ProfileInText(DataBase.Count - 1, 'PROFILE', say_Action_Append);
      1: ProfileInText(DataBase.Count - 1, 'PROFILE', say_Action_Import);
      2: ProfileInText(DataBase.Count - 1, 'PROFILE', say_Action_Clone);
    end;
    // Child Form Add
    childLoad('TuProfile', True);
    // DataBase Register - Open
    case AMode of
      0: action_ID(ChildIndex.Tabs.Count - 1, 'PB_Store');
      1: action_ID(ChildIndex.Tabs.Count - 1, 'PB_Read');
      2: action_ID(ChildIndex.Tabs.Count - 1, 'PB_Read');
    end;
    // Message
    case AMode of
      0: ss0Say.Caption := say_Profile_Append;
      1: ss0Say.Caption := say_Profile_Import;
      2: ss0Say.Caption := say_Profile_Clone;
    end;
  end
  else
  begin
    ss0Say.Caption := say_Profile_Full;
  end;
end;

// Profile Export
function  TuAraMain.ProfileExport(): string;
begin
  Result := '';
  if (ChildIndex.TabIndex > -1) and (ChildIndex.TabIndex < ChildIndex.Tabs.Count) then
  begin
    Result := DataBase.Strings[ChildIndex.TabIndex];
  end;
end;

// Profile Title
Procedure TuAraMain.ProfileTitle(const AForm: TForm; AName: string);
var
  i_PT5Seek : Integer;
begin
  // Form Title
  AForm.Caption := AName;
  // Tabs Name
  i_PT5Seek := ProfileIndex(AForm);
  if (i_PT5Seek > -1) and (i_PT5Seek < ChildIndex.Tabs.Count) then
  begin
    ChildIndex.Tabs.Strings[i_PT5Seek] := ' ' + AName + ' ';
  end;
end;

// Store Set String
function TuAraMain.ProfileInText(const AIndex: Integer; AHead: string; AValue: string): Integer;
var
  s_PT5Head : string;
  i_PT5Seek : Integer;
begin
  Result := -1;
  if (AIndex > -1) and (AIndex < DataBase.Count) then
  begin
    SwapList.Text := ReplaceStr(DataBase.Strings[AIndex] + StringOfChar(c_DATA_PAGE, 2), c_DATA_PAGE, c_DATA_LFCR);
    SwapHead.Text := ReplaceStr(SwapList.Strings[ 0], c_DATA_HEAD, c_DATA_LFCR);
    SwapItem.Text := ReplaceStr(SwapList.Strings[ 1], c_DATA_HEAD, c_DATA_LFCR);
    s_PT5Head := UpperCase(AHead);
    i_PT5Seek := SwapHead.IndexOf(s_PT5Head);
    if i_PT5Seek > -1 then
    begin
      SwapItem.Strings[i_PT5Seek] := AValue;
      Result := 0;
    end
    else
    begin
      SwapHead.Append(s_PT5Head);
      SwapItem.Append(AValue);
      Result := 1;
    end;
    DataBase.Strings[AIndex] := ReplaceStr(SwapHead.Text, c_DATA_LFCR, c_DATA_HEAD)
                              + c_DATA_PAGE
                              + ReplaceStr(SwapItem.Text, c_DATA_LFCR, c_DATA_HEAD)
                              + c_DATA_PAGE;
  end;
end;

// Store Set Boolean
function TuAraMain.ProfileInData(const AIndex: Integer; AHead: string; AValue: Boolean): Integer;
begin
  Result := ProfileInText(AIndex, AHead, c_SWITCH[AValue]);
end;

// Store Set Integer
function TuAraMain.ProfileInData(const AIndex: Integer; AHead: string; AValue: Integer): Integer;
begin
  Result := ProfileInText(AIndex, AHead, IntTostr(AValue));
end;

// Index Get String
function TuAraMain.ProfileToText(const AIndex: Integer; AHead: string; ADefault: string): string;
var
  i_PT5Poke : Integer;
begin
  Result := ADefault;
  if (AIndex > -1) and (AIndex < DataBase.Count) then
  begin
    SwapList.Text := ReplaceStr(DataBase.Strings[AIndex] + StringOfChar(c_DATA_PAGE, 2), c_DATA_PAGE, c_DATA_LFCR);
    SwapHead.Text := ReplaceStr(SwapList.Strings[ 0], c_DATA_HEAD, c_DATA_LFCR);
    SwapItem.Text := ReplaceStr(SwapList.Strings[ 1], c_DATA_HEAD, c_DATA_LFCR);
    i_PT5Poke := SwapHead.IndexOf(UpperCase(AHead));
    if i_PT5Poke > -1 then
    begin
      if i_PT5Poke < SwapItem.Count then
      begin
        Result := SwapItem.Strings[i_PT5Poke];
      end;
    end;
  end;
end;

// Index Get Boolean
function TuAraMain.ProfileToData(const AIndex: Integer; AHead: string; ADefault: Boolean): Boolean;
begin
  Result := (ProfileToText(AIndex, AHead, '0') = '1');
end;

// Index Get Integer
function TuAraMain.ProfileToData(const AIndex: Integer; AHead: string; ADefault: Integer): Integer;
begin
  Result := StrToIntDef(ProfileToText(AIndex, AHead, ''), ADefault);
end;

// HotKey to Key:Shift
procedure TuAraMain.Hot2KeySet(const AKind, AIndex: Integer; AHotKey: TShortCut);
begin
  case AKind of
    1: // Play Key
    begin
      Key_Play[AIndex].Hot := AHotKey;
      ShortCutToKey(AHotKey, Key_Play[AIndex].Key, Key_Play[AIndex].Shift);
    end;
    2: // Skip Key
    begin
      Key_Skip[AIndex].Hot := AHotKey;
      ShortCutToKey(AHotKey, Key_Skip[AIndex].Key, Key_Skip[AIndex].Shift);
    end;
    3: // Stop Key
    begin
      Key_Stop[AIndex].Hot := AHotKey;
      ShortCutToKey(AHotKey, Key_Stop[AIndex].Key, Key_Stop[AIndex].Shift);
    end;
    4: // Push Key
    begin
      Key_Push[AIndex].Hot := AHotKey;
      ShortCutToKey(AHotKey, Key_Push[AIndex].Key, Key_Push[AIndex].Shift);
    end;
    5: // Talk Key
    begin
      Key_Talk[AIndex].Hot := AHotKey;
      ShortCutToKey(AHotKey, Key_Talk[AIndex].Key, Key_Talk[AIndex].Shift);
    end;
  end;
end;

// HotKey To Key:Shift
procedure TuAraMain.Hot2KeyShift(const AHotKey: TShortCut; var AKey: word; var AShift: TShiftState);
begin
  ShortCutToKey(AHotKey, Akey, AShift);
end;

// Key:Shift To HotKey
function TuAraMain.KeyShift2Hot(const AKey: word; AShift: TShiftState): TShortCut;
begin
  REsult := ShortCut(AKey, AShift);
end;

// Shift To Text
function TuAraMain.Shift2Text(const AShift: TShiftState): string;
begin
  Result := '';
  if ssAlt in AShift then Result := 'Alt';
  if ssCtrl in AShift then
  begin
    if Result <> '' then Result := Result + ':';
    Result := Result+ 'Ctrl';
  end;
  if ssShift in AShift then
  begin
    if Result <> '' then Result := Result + ':';
    Result := Result + 'Shift';
  end;
  if Result <> '' then Result := '[' + Result + ']';
  Result := LeftStr(Result + StringOfChar(#32, 16), 16);
end;

// Mouse hold zone mark
procedure TuAraMain.zoneMark();
begin
  if (feBoundID.ItemIndex > 0) and
     (feBoundID.ItemIndex < feBoundID.Items.Count) and
     (feBoundID.ItemIndex - 1 < zoneBase.Count) then
  begin
    // Call Structure
    SwapList.Text := Data2Row(ZoneBase.Strings[feBoundID.ItemIndex - 1] + StringOfChar(c_DATA_PAGE, 4), c_DATA_PAGE);
    // Size
    SwapHead.Text := uAraMain.Data2Row(SwapList.Strings[ 2] + StringOfChar('X', 2), 'X');
    // Zone Mark
    uBound.Mark(ZoneBase.Strings[feBoundID.ItemIndex - 1]);
    // Active Scan
    activeScan := feBoundID.ItemIndex;
    activeName := uBound.feActive.Text;
  end
  else
  begin
    // Active Scan
    activeScan := feBoundID.ItemIndex;
    activeName := uBound.feActive.Text;
  end;
end;

// Child Form Load
procedure TuAraMain.childLoad(const AClassID: string; AMultiLoad: Boolean);
var
  i_CO5Find : Integer;
  i_CO5Load : Boolean;
begin
  // Child Multi Form On:Off
  i_CO5Load := AMultiLoad;
  // Child Form Scan Action
  if i_CO5Load = False then
  begin
    i_CO5Find := childClass.IndexOf(AClassID);
    if i_CO5Find > -1 then
    begin
      // Child Change Lock
      child_Lock := True;
      // Child Tab Index Change
      ChildIndex.TabIndex := i_CO5Find;
      // Child Form Show
      childCall(StrToIntDef(childPoint.Strings[i_CO5Find], -1));
      // Child Change Unlock
      child_Lock := False;
    end
    else
    begin
      i_CO5Load := True;
    end;
  end
  else
  begin
    i_CO5Load := True;
  end;
  // Child Form Load
  if i_CO5Load = True then
  begin
    childMask(AClassID);
  end;
end;

// Child Form Mask
procedure TuAraMain.childMask(const AClassID: string);
var
  s_CM5Name : string;
  m_CM5Seek : TFormClass;
  m_CM5Form : TForm;
  m_CM5Head : TEdit;
begin
  s_CM5Name := Trim(AClassID);
  if s_CM5Name <> '' then
  begin
    m_CM5Seek := TFormClass(GetClass(s_CM5Name));
    if Assigned(m_CM5Seek) = True  then
    begin
      // Child Create
      m_CM5Form := m_CM5Seek.Create(Application);
      // Profile Title
      m_CM5Head := TEdit(m_CM5Form.FindComponent('feProfile'));
      if Assigned(m_CM5Head) = True then
      begin
        m_CM5Head.Text := say_Action_Append;
      end;
      // Child Style Check
      if m_CM5Form.FormStyle = fsMDIChild then
      begin
        // Child No
        m_CM5Form.Tag := ChildIndex.Tabs.Count;
        // Child MDI ID(Handle)
        childClass.Add(m_CM5Form.ClassName);
        // Child MDI ID(Handle)
        childPoint.Add(IntToStr(m_CM5Form.Handle));
        // Child MDI Title
        ChildIndex.Tabs.Add(' ' + m_CM5Form.Caption + ' ');
        // Child Change Lock
        child_Lock := True;
        // Tab Last Index
        ChildIndex.TabIndex := ChildIndex.Tabs.Count - 1;
        // Child Change Unlock
        child_Lock := False;
        // Max Windows
        if m_CM5Form.WindowState <> wsMaximized then m_CM5Form.WindowState := wsMaximized;
        // Child Close
        m_CM5Form.OnClose := childExit;
        // Child Show
        m_CM5Form.Show();
      end
      else
      begin
        m_CM5Form.ShowModal();
      end;
    end
    else
    begin
      // Guide FormID Not Found
      ss0Say.Caption := 'Form Class : Not Found';
    end;
  end
  else
  begin
    // Guide FormID is emtpy
    ss0Say.Caption := 'Form Model : Not Found';
  end;
end;

// Child Action
Procedure TuAraMain.childCall(const APoint: Cardinal);
var
  i : Integer;
begin
  if APoint > 0 then
  begin
    i := 0;
    while (i > -1) and (i < MDIChildCount) do
    begin
      if MDIChildren[ i].Handle = APoint then
      begin
        MDIChildren[ i].Show();
        i := -1;
      end
      else
      begin
        inc(i);
      end;
    end;
  end;
end;

// Child Close
Procedure TuAraMain.childShut(const APoint: Cardinal);
var
  i : Integer;
begin
  if APoint > 0 then
  begin
    i := 0;
    while (i > -1) and (i < MDIChildCount) do
    begin
      if MDIChildren[ i].Handle = APoint then
      begin
        MDIChildren[ i].Close;
        i := -1;
      end
      else
      begin
        inc(i);
      end;
    end;
  end;
end;

// Child Form Close
procedure TuAraMain.childExit(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  Action := caFree;
end;

// Action Control Call - (Child)
procedure TuAraMain.action_ID(const AIndex: Integer; AActionName: string);
var
  i_PC5Call : Integer;
  m_PC5Form : TWinControl;
  m_PC5Item : TComponent;
begin
  if ChildIndex.Tabs.Count > 0 then
  begin
    if (AIndex > -1) and (AIndex < ChildIndex.Tabs.Count) then
    begin
      i_PC5Call := StrToIntDef(childPoint.Strings[AIndex], 0);
      if i_PC5Call > 0 then
      begin
        m_PC5Form := FindControl(i_PC5Call);
        if Assigned(m_PC5Form) = True then
        begin
          m_PC5Item := TForm(m_PC5Form).FindComponent(AActionName);
          if Assigned(m_PC5Item) = True then
          begin
            TAction(m_PC5Item).Execute();
          end;
        end;
      end;
    end;
  end;
end;

// Get Run Hook - Start
function TuAraMain.scan_Start(): Integer;
var
  i: Integer;
begin
  // Return Value
  Result := 0;
  // Toggle Off
  for i := 0 to c_PLAY_LIST do
  begin
    Key_Play[ i].Switch := False;
  end;
  // Talk List Clear
  Talk_Board.Clear;
  // Key Scan Shift State
  State_KeyShift := [];
  // Skip Action
  Skip_Change := resetTime;
  // Talk Change
  Talk_Change := resetTime;
  // Play Reset
  Play_Action := '';
  Play_Toggle := '';
  // Left Click
  LKey_Switch := False;
  LKey_Toggle := 0;
  // Right Click
  RKey_Switch := False;
  RKey_Toggle := 0;
  if State_KeyBoard = 0 then
  begin
    State_KeyBoard := SetWindowsHookEx(WH_KEYBOARD_LL, @HookGetKey, HInstance, 0);
    Result := 1;
  end;
  // Run Hook
  {
  if State_RunState = 0 then
  begin
    State_RunState := SetWindowsHookEx(WH_SHELL, @HookGetRun, HInstance, 0);
  end;
  //
  if (State_KeyBoard <> 0)  (State_RunState <> 0) then
  begin
  end
  else
  begin
    Result := 0;
  end;
  }
  // Start On
  if sbStart.Down = False then sbStart.Down := True;
  // Auto On
  if rAuto.Enabled = False then rAuto.Enabled := True;
end;

// Get Run Hook - Stop
function TuAraMain.scan_End(): Integer;
begin
  // Return Value
  Result := 0;
  // Time Disable
  if rAuto.Enabled = True then rAuto.Enabled := False;
  {
  // Run Hook Free
  if State_RunState <> 0 then
  begin
    UnHookWindowsHookEx(State_RunState);
    State_RunState := 0;
  end;
  }
  // Key Hook Free
  if State_KeyBoard <> 0 then
  begin
    UnHookWindowsHookEx(State_KeyBoard);
    State_KeyBoard := 0;
  end;
  // End On
  if sbEnd.Down = False then sbEnd.Down := True;
end;

// Bound Active On Check
function TuAraMain.press_Access(): Boolean;
begin
  Result := True;
  if (activeScan > 0) and (activeName <> '') then
  begin
    Result := (ActiveHead() = activeName);
  end;
end;

// Key Action CHoice(Index)
procedure TuAraMain.press_Action(const AIndex: Integer);
var
  i : Integer;
  b_PS5KeyL : Boolean;
  b_PS5KeyR : Boolean;
  s_PS5Push : string;
begin
  if press_Access() = True then
  begin
    // Click
    b_PS5KeyL := (POS(Key_Push[ 0].Kind, Key_Play[AIndex].Skill) > 0);
    b_PS5KeyR := (POS(Key_Push[ 1].Kind, Key_Play[AIndex].Skill) > 0);
    if b_PS5KeyL = True then Key_Push[ 0].Swing := resetTime;
    if b_PS5KeyR = True then Key_Push[ 1].Swing := resetTime;
    // Skill Time Clear
    s_PS5Push :=  '';
    for i := c_PUSH_MORE to c_PUSH_LIST do
    begin
      // Time Reset
      if POS(Key_Push[ i].Kind, Key_Play[AIndex].Skill) > 0 then
      begin
        Key_Push[ i].Swing := resetTime;
        s_PS5Push := s_PS5Push + Key_Push[ i].Kind;
      end;
      // Stop
      if Self.press_Stop(-1) > -1 then Exit;
    end;
    // Skill Keep
    Play_Action := s_PS5Push;
    LKey_Switch := b_PS5KeyL;
    RKey_Switch := b_PS5KeyR;
    // Stop
    if Self.press_Stop(-1) > -1 then Exit;
    // SOUND
    if sbAlert.Down = True then
    begin
      if Say_KeyIn[AIndex].Size > 0 then
      begin
        sndPlaySound(Say_KeyIn[AIndex].Memory, SND_ASYNC or SND_MEMORY);
      end;
    end;
    // StateBar
    ss1Play.Caption := IntToStr(AIndex) + ' : ' + Play_Action;
    if ss5Stop.Caption <> '' then ss5Stop.Caption := '';
    // Stop
    if Self.press_Stop(-1) > -1 then Exit;
  end;
end;

// Key Switch Choice(ON:OFF)
procedure TuAraMain.press_Switch(const AIndex: Integer);
var
  i : Integer;
  s_PT5More : string;
  s_PT5Code : string;
  s_PT5List : string;
  b_PT5KeyL : Boolean;
  b_PT5KeyR : Boolean;
  i_PT5KeyL : Integer;
  i_PT5KeyR : Integer;
begin
  if press_Access() = True then
  begin
    // Mouse State
    b_PT5KeyL := (LKey_Toggle = 1);
    b_PT5KeyR := (RKey_Toggle = 1);
     // Switch Change
    Key_Play[AIndex].Switch := (Key_Play[AIndex].Switch = False);
    // Toggle Skill
    s_PT5Code := '';
    s_PT5More := '';
    for i := 1 to c_PLAY_LIST  do
    begin
      if Key_Play[ i].Switch = True then
      begin
        s_PT5Code := s_PT5Code + IntToStr( i);
        s_PT5More := s_PT5More + Key_Play[ i].Skill;
      end;
    end;
    // Left Push
    i_PT5KeyL := 0;
    if Pos('L', s_PT5More) > 0 then i_PT5KeyL := 1
                               else if b_PT5KeyL = True then i_PT5KeyL := -1;
     // Right Push
    i_PT5KeyR := 0;
    if Pos('R', s_PT5More) > 0 then i_PT5KeyR := 1
                               else if b_PT5KeyR = True then i_PT5KeyR := -1;
    // Skill Time Clear
    s_PT5List := '';
    if s_PT5More <> '' then
    begin
      for i := 2 to c_PUSH_LIST do
      begin
        if POS(Key_Push[ i].Kind, s_PT5More) > 0 then
        begin
          Key_Push[ i].Swing := resetTime;
          s_PT5List := s_PT5List + Key_Push[ i].Kind;
        end;
      end;
    end;
    // Toggle Change
    Lkey_Toggle := i_PT5KeyL;
    Rkey_Toggle := i_PT5KeyR;
    Play_Toggle := s_PT5List;
    // Sound
    if sbAlert.Down = True then
    begin
      if (AIndex > 0) and (AIndex <= c_PLAY_LIST) then
      begin
        if Key_Play[AIndex].Switch =  True then
        begin
          if Say_KeyOn[AIndex].Size > 0 then
          begin
            sndPlaySound(Say_KeyOn[AIndex].Memory, SND_ASYNC or SND_MEMORY);
          end;
        end
        else
        begin
          if Say_KeyUn[AIndex].Size > 0 then
          begin
            sndPlaySound(Say_KeyUn[AIndex].Memory, SND_ASYNC or SND_MEMORY);
          end;
        end;
      end;
    end;
    // StateBar
    if s_PT5Code <> '' then
    begin
      ss2L_On.Caption   := C_LR_CLICKS[ 0, Lkey_Toggle = 1];
      ss3R_on.Caption   := C_LR_CLICKS[ 1, Rkey_Toggle = 1];
      ss4Toggle.Caption := s_PT5Code + ' : ' + Play_Toggle;
      if ss5Stop.Caption <> '' then ss5Stop.Caption := '';
    end
    else
    begin
      ss2L_On.Caption   := '';
      ss3R_on.Caption   := '';
      ss4Toggle.Caption := '';
    end;
  end;
end;

// Key Skip(Pause Only)
procedure TuAraMain.press_Skip(const ADelay: Integer);
var
  m_PS5Time : TDateTime;
begin
  Skip_Action := True;
  if rAuto.Enabled = True then rAuto.Enabled := False;
  m_PS5Time := IncMilliSecond(Now(), ADelay);
  if m_PS5Time > Skip_Change then Skip_Change := m_PS5Time;
  Skip_Action := False;
end;

// Cursor Hold Check
function TuAraMain.press_Cursor(): Boolean;
var
  m_PA5Scan : HWND;
  m_PA5Rect : TRect;
begin
(*  Result := True;
  if activeScan > 0 then
  begin
    try
      winapi.Windows.GetClientRect(Scan_Action, m_PA5Rect);
      Result := uBound.Hold( Mouse.CursorPos.X - m_PA5Rect.Left
                           ,  Mouse.CursorPos.Y - m_PA5Rect.Top
                           ,  m_PA5Rect.Width
                           ,  m_PA5Rect.Height
                           );
    except
      Result := False;
    end;
    {
    if m_PA5Scan > 0 then
    begin
//    GetWindowRect(m_PA5Scan, m_PA5Rect);
      winapi.Windows.GetClientRect(m_PA5Scan, m_PA5Rect);
    end;
    }
  end;
  *)
  Result := True;
  if activeScan > 0 then
  begin
    m_PA5Scan := GetForegroundWindow();
    if m_PA5Scan > 0 then
    begin
//    GetWindowRect(m_PA5Scan, m_PA5Rect);
      winapi.Windows.GetClientRect(m_PA5Scan, m_PA5Rect);
      Result := uBound.Hold( Mouse.CursorPos.X - m_PA5Rect.Left
                           , Mouse.CursorPos.Y - m_PA5Rect.Top
                           , m_PA5Rect.Width
                           , m_PA5Rect.Height
                           );
//      Result := uBound.Hold(Mouse.CursorPos.X - m_PA5Rect.Left, Mouse.CursorPos.Y - m_PA5Rect.Top);
    end;
  end;

end;

// Press Key & Mouse
procedure TuAraMain.press_Play();
var
  i, k : Integer;
  // Press Left Click
  procedure L_Left_Click();
  begin
    // Left Click
    if (LKey_Switch = True) or (LKey_Toggle <> 0) then
    begin
      if Now() >= IncMilliSecond(Key_Push[ 0].Swing, Key_Push[ 0].Delay) then
      begin
        if LKey_Toggle = 1 then
        begin
          if not(GetKeyState(VK_LBUTTON) and $800 <> 0) then
          begin
            mouse_event(MOUSEEVENTF_LEFTDOWN, 0, 0, 0, 0);
          end;
        end
        else
        begin
          if LKey_Switch = True then
          begin
            mouse_event(MOUSEEVENTF_LEFTDOWN, 0, 0, 0, 0);
            mouse_event(MOUSEEVENTF_LEFTUP, 0, 0, 0, 0);
            if LKey_Toggle = -1 then LKey_Toggle := 0;
          end;
          if LKey_Toggle = -1 then
          begin
            if GetKeyState(VK_LBUTTON) and $800 <> 0 then
            begin
              mouse_event(MOUSEEVENTF_LEFTUP, 0, 0, 0, 0);
            end;
            LKey_Toggle := 0;
          end;
        end;
        Key_Push[ 0].Swing := Now();
      end;
    end;
  end;
  // Press Right Click
  procedure L_Right_Click();
  begin
    if (RKey_Switch = True) or (RKey_Toggle <> 0) then
    begin
      if Key_Push[ 1].Delay > 0 then
      begin
        if Now() >= IncMilliSecond(Key_Push[ 1].Swing, Key_Push[ 1].Delay) then
        begin
          if RKey_Toggle = 1 then
          begin
            if not(GetKeyState(VK_RBUTTON) and $800 <> 0) then
            begin
              mouse_event(MOUSEEVENTF_RIGHTDOWN, 0, 0, 0, 0);
            end;
          end
          else
          begin
            if RKey_Switch = True then
            begin
              mouse_event(MOUSEEVENTF_RIGHTDOWN, 0, 0, 0, 0);
              mouse_event(MOUSEEVENTF_RIGHTUP, 0, 0, 0, 0);
              if RKey_Toggle = -1 then RKey_Toggle := 0;
            end;
            if RKey_Toggle = -1 then
            begin
              if GetKeyState(VK_RBUTTON)and $800 <> 0 then
              begin
                mouse_event(MOUSEEVENTF_RIGHTUP, 0, 0, 0, 0);
              end;
              RKey_Toggle := 0;
            end;
          end;
          Key_Push[ 1].Swing := Now();
        end;
      end;
    end;
  end;
  // Press KeyBoard
  procedure L_KeyBoard(const AKey: Word; AShift: TShiftState);
  begin
    // Shift Down
    if ssShift in AShift then
    begin
      keybd_event(VK_SHIFT, MapVirtualkey(VK_SHIFT, 0), KEYEVENTF_EXTENDEDKEY or 0, 0);
    end;
    // Ctrl Down
    if ssCtrl in AShift then
    begin
      keybd_event(VK_CONTROL, MapVirtualkey(VK_CONTROL, 0), KEYEVENTF_EXTENDEDKEY or 0, 0);
    end;
    // Alt Down
    if ssAlt in AShift then
    begin
      keybd_event(VK_MENU, MapVirtualkey(VK_MENU, 0), KEYEVENTF_EXTENDEDKEY or 0, 0);
    end;
    // Key Press
    keybd_event(AKey, MapVirtualKey(AKey, 0), KEYEVENTF_EXTENDEDKEY or 0, 0);
    keybd_event(AKey, MapVirtualKey(AKey, 0), KEYEVENTF_EXTENDEDKEY or KEYEVENTF_KEYUP, 0);
    // Alt Up
    if ssAlt in AShift then
    begin
      keybd_event(VK_MENU, MapVirtualkey(VK_MENU, 0), KEYEVENTF_EXTENDEDKEY or KEYEVENTF_KEYUP, 0);
    end;
    // Ctrl Up
    if ssCtrl in AShift then
    begin
      keybd_event(VK_CONTROL, MapVirtualkey(VK_CONTROL, 0), KEYEVENTF_EXTENDEDKEY or KEYEVENTF_KEYUP, 0);
    end;
    // Shift Up
    if ssShift in AShift then
    begin
      keybd_event(VK_SHIFT, MapVirtualkey(VK_SHIFT, 0), KEYEVENTF_EXTENDEDKEY or KEYEVENTF_KEYUP, 0);
    end;
  end;
begin
  // Talk Time Clear
  if Talk_Action = True then
  begin
    if Now() > Talk_Change then Talk_Action := False;
  end;
  // Check Press
  if press_Check() <> 0 then Exit;
  // Active Check
  if ((LKey_Switch = True) or (LKey_Toggle <> 0)) or
     ((RKey_Switch = True) or (RKey_Toggle <> 0)) or
     (Play_Action + Play_Toggle <> '')
  then
  begin
    if (activeScan > 0) and (activeName <> '') then
    begin
      // Key
      if Now() >= IncMilliSecond(activeKeep, 200) then
      begin
        activeKeep := Now();
        if ActiveHead() <> activeName then
        begin
          press_stop(0);
          Exit;
        end;
      end;
    end;
  end;
  // Check Press
  if press_Check() <> 0 then Exit;
  // Chat
  if press_Talk() = True then Exit;
  // Skip
  if Now() < Skip_Change then Exit;
  // Skill Mixer
  if mix_Skill = 1 then press_Mixer();
  // Check Press
  if press_Check() <> 0 then Exit;
  // Left Click
  if press_Cursor() = True then L_Left_Click();
  // Check Press
  if press_Check() <> 0 then Exit;
  // Right Click
  if press_Cursor() = True then L_Right_Click();
  // Chat
  if press_Talk() = True then Exit;
  // Key
  i := c_PUSH_MORE;
  while (Play_Action + Play_Toggle <> '') and (i <= c_PUSH_LIST)  do
  begin
    // Skill Check
    k := Key_Push[ i].Mix;
    if POS(Key_Push[ k].Kind, Play_Action + Play_Toggle) > 0 then
    begin
      // Time Chekc
      if Key_Push[ k].Delay > 0 then
      begin
        // Key
        if Now() >= IncMilliSecond(Key_Push[ k].Swing, Key_Push[ k].Delay) then
        begin
          // Chat
          if press_Talk() = True then Exit;
          // Key Press
          L_KeyBoard(Key_Push[ k].Key, Key_Push[ k].Shift);
          // Let Cursor Time
          Key_Push[ k].Swing := Now();
        end;
      end;
    end;
    // Next Skill
    Inc( i);
    // Check Press
    if press_Check() <> 0 then Exit;
    // Chat
    if press_Talk() = True then Exit;
  end;
end;

// Key Send Stop
function TuAraMain.press_Stop(const AIndex: Integer): Integer;
var
  i : Integer;
begin
  Result := AIndex;
  if AIndex = -1 then
  begin
    Result := Stop_Action;
  end;
  // Stop
  if Result > -1 then
  begin
    // Skill List Clear
    Play_Action := '';
    LKey_Switch := False;
    RKey_Switch := False;
    // Toggle List
    Play_Toggle := '';
    Lkey_Toggle := 0;
    Rkey_Toggle := 0;
    // Toggle Off
    for i := 0 to c_PLAY_LIST do
    begin
      Key_Play[ i].Switch := False;
    end;
    // Message
    // Stop Sound
    if sbAlert.Down = True then
    begin
      if Say_Pause.Size > 0 then
      begin
        sndPlaySound(Say_Pause.Memory, SND_ASYNC or SND_MEMORY);
      end;
    end;
    // Left Up
    if GetKeyState(VK_LBUTTON)and $800 <> 0 then
    begin
      mouse_event(MOUSEEVENTF_LEFTUP, 0, 0, 0, 0);
    end;
    // Right Up
    if GetKeyState(VK_RBUTTON)and $800 <> 0 then
    begin
      mouse_event(MOUSEEVENTF_RIGHTUP, 0, 0, 0, 0);
    end;
    ss1Play.Caption   := '';
    ss2L_On.Caption   := '';
    ss3R_on.Caption   := '';
    ss4Toggle.Caption := '';
    ss5Stop.Caption   := 'Stop';
    if Result > 0 then ss5Stop.Caption := ss5Stop.Caption + ' : ' + IntToStr(Result);
  end;
end;

// Talk Message
function TuAraMain.press_Talk(): Boolean;
var
  m_PT5Time : TDateTime;
begin
  Result := Talk_Board.Count > 0;
  if Result then
  begin
    // Hold
    Talk_Action := True;
    // Unlock Time
    m_PT5Time := IncMilliSecond(Now(), 32);
    if m_PT5Time > Skip_Change then Skip_Change := m_PT5Time;
    // ClipBoard Copy
    Talk_Paste.Open;
    Talk_Paste.AsText := Talk_Board.Strings[ 0];
    Talk_Paste.Close;
    // Enter
    keybd_event(VK_RETURN, MapVirtualKey(VK_RETURN, 0), KEYEVENTF_EXTENDEDKEY or 0, 0);
    keybd_event(VK_RETURN, MapVirtualKey(VK_RETURN, 0), KEYEVENTF_EXTENDEDKEY or KEYEVENTF_KEYUP, 0);
    // Ctrl + V
    keybd_event(VK_CONTROL, MapVirtualkey(VK_CONTROL, 0), KEYEVENTF_EXTENDEDKEY or 0, 0);
    keybd_event(86, MapVirtualKey(86, 0), KEYEVENTF_EXTENDEDKEY or 0, 0);
    keybd_event(86, MapVirtualKey(86, 0), KEYEVENTF_EXTENDEDKEY or KEYEVENTF_KEYUP, 0);
    keybd_event(VK_CONTROL, MapVirtualkey(VK_CONTROL, 0), KEYEVENTF_EXTENDEDKEY or KEYEVENTF_KEYUP, 0);
    // Message Delete
    Talk_Board.Delete( 0);
    // Enter
    keybd_event(VK_RETURN, MapVirtualKey(VK_RETURN, 0), KEYEVENTF_EXTENDEDKEY or 0, 0);
    keybd_event(VK_RETURN, MapVirtualKey(VK_RETURN, 0), KEYEVENTF_EXTENDEDKEY or KEYEVENTF_KEYUP, 0);
  end;
end;

// Check Run Process
function  TuAraMain.press_Check(): Integer;
begin
  Result := 0;
  if Application.Active = True then Result := 1;
end;

// Skill Mixer
procedure TuAraMain.press_Mixer();
var
  i : Integer;
  i_PM5Step : Integer;
  i_PM5Swap : Integer;
begin
  // Clear
  for i := c_PUSH_MORE to c_PUSH_LIST do
  begin
    Key_Push[ i].Mix := i;
  end;
  // Mix(Random)
  for i := c_PUSH_LIST downto c_PUSH_MORE do
  begin
    i_PM5Step := Random( i) + 1;
    if i <> i_PM5Step then
    begin
      i_PM5Swap := Key_Push[i_PM5Step].Mix;
      Key_Push[i_PM5Step].Mix := Key_Push[ i].Mix;
      Key_Push[ i].Mix := i_PM5Swap;
    end;
  end;
end;

// Replace String
function TuAraMain.Data2Row(const AData, ADelimited: string): string;
begin
  Result := ReplaceStr(AData, ADelimited, c_DATA_LFCR);
end;

// Memo To Row
function  TuAraMain.Text2Row(const AData: string): string;
begin
  Result := ReplaceStr(AData, c_DATA_LFCR, c_DATA_MORE);
end;

end.

