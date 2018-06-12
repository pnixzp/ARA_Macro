unit Profile;

interface

uses
  Winapi.Windows, Winapi.Messages, System.Variants, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Buttons,
  System.SysUtils, Vcl.StdCtrls, Vcl.ComCtrls, Vcl.ExtCtrls,
  System.Actions, Vcl.ActnList;

type
  // Form
  TuProfile = class(TForm)
    c0Profile: TPanel;
    dhProfile: TLabel;
    ebProfile: TBevel;
    feProfile: TEdit;
    ebAlert: TBevel;
    dhAlert: TLabel;
    ebSound: TBevel;
    feAlert: TComboBox;
    c1Play: TPanel;
    dhPlay: TLabel;
    ebPlay: TBevel;
    grPlay: TPanel;
    dh1ID: TLabel;
    dh1Key: TLabel;
    dh1ON: TLabel;
    dh1Skill: TLabel;
    dhPlay1: TLabel;
    dhPlay2: TLabel;
    dhPlay3: TLabel;
    dhPlay4: TLabel;
    dhPlay5: TLabel;
    dsPlay1: TLabel;
    dsPlay2: TLabel;
    dsPlay3: TLabel;
    dsPlay4: TLabel;
    dsPlay5: TLabel;
    ftPlay1: TSpeedButton;
    ftPlay2: TSpeedButton;
    ftPlay3: TSpeedButton;
    ftPlay4: TSpeedButton;
    ftPlay5: TSpeedButton;
    fcPlay1: TCheckBox;
    fcPlay2: TCheckBox;
    fcPlay3: TCheckBox;
    fcPlay4: TCheckBox;
    fcPlay5: TCheckBox;
    fhPlay1: THotKey;
    fhPlay2: THotKey;
    fhPlay3: THotKey;
    fhPlay4: THotKey;
    fhPlay5: THotKey;
    fsPlay1: TEdit;
    fsPlay2: TEdit;
    fsPlay3: TEdit;
    fsPlay4: TEdit;
    fsPlay5: TEdit;
    c2Skip: TPanel;
    dhSkip: TLabel;
    ebSkip: TBevel;
    grSkip: TPanel;
    dh2ID: TLabel;
    dh2Key: TLabel;
    dh3ms: TLabel;
    dhSkip1: TLabel;
    dhSkip2: TLabel;
    dhSkip3: TLabel;
    fcSkip1: TCheckBox;
    fcSkip2: TCheckBox;
    fcSkip3: TCheckBox;
    fhSkip1: THotKey;
    fhSkip2: THotKey;
    fhSkip3: THotKey;
    fwSkip1: TEdit;
    fwSkip2: TEdit;
    fwSkip3: TEdit;
    c3Stop: TPanel;
    dhStop: TLabel;
    ebStop: TBevel;
    grStop: TPanel;
    dh3Control: TLabel;
    dh3Key: TLabel;
    dhStop1: TLabel;
    dhStop2: TLabel;
    dhStop3: TLabel;
    dhStop4: TLabel;
    dhStop5: TLabel;
    dhStop6: TLabel;
    dhStop7: TLabel;
    dhStop8: TLabel;
    dhStop9: TLabel;
    dhStopA: TLabel;
    dhStopB: TLabel;
    fcStop1: TCheckBox;
    fcStop2: TCheckBox;
    fcStop3: TCheckBox;
    fcStop4: TCheckBox;
    fcStop5: TCheckBox;
    fcStop6: TCheckBox;
    fcStop7: TCheckBox;
    fcStop8: TCheckBox;
    fcStop9: TCheckBox;
    fcStopA: TCheckBox;
    fcStopB: TCheckBox;
    fhStop1: THotKey;
    fhStop2: THotKey;
    fhStop3: THotKey;
    fhStop4: THotKey;
    fhStop5: THotKey;
    fhStop6: THotKey;
    fhStop7: THotKey;
    fhStop8: THotKey;
    fhStop9: THotKey;
    fhStopA: THotKey;
    fhStopB: THotKey;
    c4Skill: TPanel;
    dhSkill: TLabel;
    ebSkill: TBevel;
    grSkill: TPanel;
    dh4ID: TLabel;
    dh4Key: TLabel;
    dh4ms: TLabel;
    dhClickL: TLabel;
    dhClickR: TLabel;
    dhSkill1: TLabel;
    dhSkill2: TLabel;
    dhSkill3: TLabel;
    dhSkill4: TLabel;
    dhSkill5: TLabel;
    dhSkill6: TLabel;
    dhSkill7: TLabel;
    dhSkill8: TLabel;
    dhSkill9: TLabel;
    fhClickL: TEdit;
    fhClickR: TEdit;
    fhSkill1: THotKey;
    fhSkill2: THotKey;
    fhSkill3: THotKey;
    fhSkill4: THotKey;
    fhSkill5: THotKey;
    fhSkill6: THotKey;
    fhSkill7: THotKey;
    fhSkill8: THotKey;
    fhSkill9: THotKey;
    fwClickL: TEdit;
    fwClickR: TEdit;
    fwSkill1: TEdit;
    fwSkill2: TEdit;
    fwSkill3: TEdit;
    fwSkill4: TEdit;
    fwSkill5: TEdit;
    fwSkill6: TEdit;
    fwSkill7: TEdit;
    fwSkill8: TEdit;
    fwSkill9: TEdit;
    c5Talk: TPanel;
    dhTalk: TLabel;
    ebTalk: TBevel;
    grTalk: TPanel;
    dh5ID: TLabel;
    dh5Key: TLabel;
    dh5Message: TLabel;
    dhTalk0: TLabel;
    dhTalk1: TLabel;
    dhTalk2: TLabel;
    dhTalk3: TLabel;
    dhTalk4: TLabel;
    dhTalk5: TLabel;
    dhTalk6: TLabel;
    dhTalk7: TLabel;
    dhTalk8: TLabel;
    dhTalk9: TLabel;
    dhTalkD: TLabel;
    fhTalk0: THotKey;
    fhTalk1: THotKey;
    fhTalk2: THotKey;
    fhTalk3: THotKey;
    fhTalk4: THotKey;
    fhTalk5: THotKey;
    fhTalk6: THotKey;
    fhTalk7: THotKey;
    fhTalk8: THotKey;
    fhTalk9: THotKey;
    fhTalkD: THotKey;
    ftTalk0: TEdit;
    ftTalk1: TEdit;
    ftTalk2: TEdit;
    ftTalk3: TEdit;
    ftTalk4: TEdit;
    ftTalk5: TEdit;
    ftTalk6: TEdit;
    ftTalk7: TEdit;
    ftTalk8: TEdit;
    ftTalk9: TEdit;
    ftTalkD: TEdit;
    c6Refer: TPanel;
    ebRefer: TBevel;
    dhRefer: TLabel;
    ftRefer: TMemo;
    InOut: TActionList;
    PB_Load: TAction;
    PB_Read: TAction;
    PB_Keep: TAction;
    PB_Store: TAction;
    procedure FormCreate(Sender: TObject);
    function  FormHelp(Command: Word; Data: NativeInt; var CallHelp: Boolean): Boolean;
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure feProfileEnter(Sender: TObject);
    procedure feProfileChange(Sender: TObject);
    procedure fcPlay1Click(Sender: TObject);
    procedure ftPlay1Click(Sender: TObject);
    procedure fhPlay1Change(Sender: TObject);
    procedure fsPlay1KeyPress(Sender: TObject; var Key: Char);
    procedure ftReferChange(Sender: TObject);
    procedure PB_LoadExecute(Sender: TObject);
    procedure PB_ReadExecute(Sender: TObject);
    procedure PB_KeepExecute(Sender: TObject);
    procedure PB_StoreExecute(Sender: TObject);
    procedure feAlertChange(Sender: TObject);
  private
    // Accept Item
    inputID : array[0..97] of ^TObject;
    // Item In/Out/Store
    procedure itemUpdate(const AGet, ASet, APut: Boolean; AItem: TObject);
    // Tab Control
    procedure CMDialogKey(Var Msg: TWMKey); message CM_DIALOGKEY;
  public
    { Public declarations }
  end;

const
  c_ITEM_COUNT = 97;

var
  uProfile: TuProfile;

implementation

uses
  AraMain;

{$R *.dfm}

procedure TuProfile.FormCreate(Sender: TObject);
begin
  // Alert List
  feAlert.Items.Text := Alert_List.Text;
  // Append Profile
  dh1ON.Hint := uAraMain.ID_Title('PROFILE.TIP.TOGGLE');
  if dh1ON.Hint  = '' then dh1ON.Hint  := 'Mouse Push(on/off)' + c_DATA_LFCR + 'Skill Key Press';
  // Language Pack
  uAraMain.ID_Caption( dhProfile , 'PROFILE.TITLE' );
  uAraMain.ID_Caption( dhAlert   , 'PROFILE.ALERT' );
  uAraMain.ID_Caption( dhPlay    , 'PROFILE.PLAY'  );
  uAraMain.ID_Caption( dhSkip    , 'PROFILE.SKIP'  );
  uAraMain.ID_Caption( dhStop    , 'PROFILE.STOP'  );
  uAraMain.ID_Caption( dhSkill   , 'PROFILE.SKILL' );
  uAraMain.ID_Caption( dhTalk    , 'PROFILE.TALK'  );
  uAraMain.ID_Caption( dhRefer   , 'PROFILE.REFER' );
  // ID
  uAraMain.ID_Caption( dh1ID , 'PROFILE.ID' );
  dh2ID.Caption := dh1ID.Caption;
  dh4ID.Caption := dh1ID.Caption;
  dh5ID.Caption := dh1ID.Caption;
  // Key
  uAraMain.ID_Caption( dh1Key , 'PROFILE.KEY' );
  dh2Key.Caption := dh1Key.Caption;
  dh3Key.Caption := dh1Key.Caption;
  dh4Key.Caption := dh1Key.Caption;
  dh5Key.Caption := dh1Key.Caption;
  // Skill : Control : Message
  uAraMain.ID_Caption( dh1Skill   , 'PROFILE.ID.LIST' );
  uAraMain.ID_Caption( dh3Control , 'PROFILE.CONTROL' );
  uAraMain.ID_Caption( dh5Message , 'PROFILE.MESSAGE' );
  // Stop
  uAraMain.ID_Caption( dhStop1 , 'PROFILE.KEY.STOP'      );
  uAraMain.ID_Caption( dhStop2 , 'PROFILE.KEY.CANCEL'    );
  uAraMain.ID_Caption( dhStop3 , 'PROFILE.KEY.INVENTORY' );
  uAraMain.ID_Caption( dhStop4 , 'PROFILE.KEY.SKILLS'    );
  uAraMain.ID_Caption( dhStop5 , 'PROFILE.KEY.FOLLOWERS' );
  uAraMain.ID_Caption( dhStop6 , 'PROFILE.KEY.MAP'       );
  uAraMain.ID_Caption( dhStop7 , 'PROFILE.KEY.WORLD.MAP' );
  uAraMain.ID_Caption( dhStop8 , 'PROFILE.KEY.PORTAL'    );
  uAraMain.ID_Caption( dhStop9 , 'PROFILE.KEY.REPLY'     );
  uAraMain.ID_Caption( dhStopA , 'PROFILE.KEY.CHAT'      );
  uAraMain.ID_Caption( dhStopB , 'PROFILE.KEY.OTHER'     );
  // Let Point
  inputID[ 0] := @feProfile;
  inputID[ 1] := @feAlert;
  inputID[ 2] := @fcPlay1;
  inputID[ 3] := @ftPlay1;
  inputID[ 4] := @fhPlay1;
  inputID[ 5] := @fsPlay1;
  inputID[ 6] := @fcPlay2;
  inputID[ 7] := @ftPlay2;
  inputID[ 8] := @fhPlay2;
  inputID[ 9] := @fsPlay2;
  inputID[10] := @fcPlay3;
  inputID[11] := @ftPlay3;
  inputID[12] := @fhPlay3;
  inputID[13] := @fsPlay3;
  inputID[14] := @fcPlay4;
  inputID[15] := @ftPlay4;
  inputID[16] := @fhPlay4;
  inputID[17] := @fsPlay4;
  inputID[18] := @fcPlay5;
  inputID[19] := @fhPlay5;
  inputID[20] := @ftPlay5;
  inputID[21] := @fsPlay5;
  inputID[22] := @fcSkip1;
  inputID[23] := @fhSkip1;
  inputID[24] := @fwSkip1;
  inputID[25] := @fcSkip2;
  inputID[26] := @fhSkip2;
  inputID[27] := @fwSkip2;
  inputID[28] := @fcSkip3;
  inputID[29] := @fhSkip3;
  inputID[30] := @fwSkip3;
  inputID[31] := @fcStop1;
  inputID[32] := @fhStop1;
  inputID[33] := @fcStop2;
  inputID[34] := @fhStop2;
  inputID[35] := @fcStop3;
  inputID[36] := @fhStop3;
  inputID[37] := @fcStop4;
  inputID[38] := @fhStop4;
  inputID[39] := @fcStop5;
  inputID[40] := @fhStop5;
  inputID[41] := @fcStop6;
  inputID[42] := @fhStop6;
  inputID[43] := @fcStop7;
  inputID[44] := @fhStop7;
  inputID[45] := @fcStop8;
  inputID[46] := @fhStop8;
  inputID[47] := @fcStop9;
  inputID[48] := @fhStop9;
  inputID[49] := @fcStopA;
  inputID[50] := @fhStopA;
  inputID[51] := @fcStopB;
  inputID[52] := @fhStopB;
  inputID[53] := @fhClickL;
  inputID[54] := @fwClickL;
  inputID[55] := @fhClickR;
  inputID[56] := @fwClickR;
  inputID[57] := @fhSkill1;
  inputID[58] := @fwSkill1;
  inputID[59] := @fhSkill2;
  inputID[60] := @fwSkill2;
  inputID[61] := @fhSkill3;
  inputID[62] := @fwSkill3;
  inputID[63] := @fhSkill4;
  inputID[64] := @fwSkill4;
  inputID[65] := @fhSkill5;
  inputID[66] := @fwSkill5;
  inputID[67] := @fhSkill6;
  inputID[68] := @fwSkill6;
  inputID[69] := @fhSkill7;
  inputID[70] := @fwSkill7;
  inputID[71] := @fhSkill8;
  inputID[72] := @fwSkill8;
  inputID[73] := @fhSkill9;
  inputID[74] := @fwSkill9;
  inputID[75] := @fhTalk0;
  inputID[76] := @ftTalk0;
  inputID[77] := @fhTalk1;
  inputID[78] := @ftTalk1;
  inputID[79] := @fhTalk2;
  inputID[80] := @ftTalk2;
  inputID[81] := @fhTalk3;
  inputID[82] := @ftTalk3;
  inputID[83] := @fhTalk4;
  inputID[84] := @ftTalk4;
  inputID[85] := @fhTalk5;
  inputID[86] := @ftTalk5;
  inputID[87] := @fhTalk6;
  inputID[88] := @ftTalk6;
  inputID[89] := @fhTalk7;
  inputID[90] := @ftTalk7;
  inputID[91] := @fhTalk8;
  inputID[92] := @ftTalk8;
  inputID[93] := @fhTalk9;
  inputID[94] := @ftTalk9;
  inputID[95] := @fhTalkD;
  inputID[96] := @ftTalkD;
  inputID[97] := @ftRefer;
end;

function TuProfile.FormHelp(Command: Word; Data: NativeInt; var CallHelp: Boolean): Boolean;
begin
  CallHelp := False;
  Result := CallHelp;
end;

procedure TuProfile.CMDialogKey(Var Msg: TWMKEY);
var
  m_DK5Push : ^THotKey;
begin
  if Msg.CharCode = VK_TAB then
  begin
    if Self.ActiveControl is THotKey then
    begin
      m_DK5Push := @THotKey(Self.ActiveControl);
      m_DK5Push.HotKey := uAraMain.KeyShift2Hot(VK_TAB, []);
      itemUpdate(False, True, True, m_DK5Push^);
    end;
  end;
  inherited;
end;

procedure TuProfile.FormKeyPress(Sender: TObject; var Key: Char);
var
  m_KP5Push : ^THotKey;
begin
  if Self.ActiveControl is THotKey then
  begin
    m_KP5Push := @THotKey(Self.ActiveControl);
    if Key = #13 then
    begin
      m_KP5Push.HotKey := uAraMain.KeyShift2Hot(VK_RETURN, []);
      itemUpdate(False, True, True, m_KP5Push^);
    end
    else
    if Key = #32 then
    begin
      m_KP5Push.HotKey := uAraMain.KeyShift2Hot(VK_SPACE, []);
      itemUpdate(False, True, True, m_KP5Push^);
    end
    else
    if Key = #27 then
    begin
      m_KP5Push.HotKey := uAraMain.KeyShift2Hot(VK_ESCAPE, []);
      itemUpdate(False, True, True, m_KP5Push^);
    end
    else
    if Key = #127 then
    begin
      m_KP5Push.HotKey := uAraMain.KeyShift2Hot(VK_DELETE, []);
      itemUpdate(False, True, True, m_KP5Push^);
    end
    else
    if Key = #8 then
    begin
      m_KP5Push.HotKey := uAraMain.KeyShift2Hot(VK_BACK, []);
      itemUpdate(False, True, True, m_KP5Push^);
    end;
  end;
end;

procedure TuProfile.feProfileEnter(Sender: TObject);
begin
  uAraMain.ss0Say.Caption := TWinControl(Sender).Hint;
end;

procedure TuProfile.feProfileChange(Sender: TObject);
begin
  itemUpdate(False, True, True, Sender);
end;

procedure TuProfile.feAlertChange(Sender: TObject);
begin
  itemUpdate(False, True, True, Sender);
end;

procedure TuProfile.fcPlay1Click(Sender: TObject);
begin
  itemUpdate(False, True, True, Sender);
end;

procedure TuProfile.ftPlay1Click(Sender: TObject);
begin
  itemUpdate(False, True, True, Sender);
end;

procedure TuProfile.fhPlay1Change(Sender: TObject);
begin
  itemUpdate(False, True, True, Sender);
end;

procedure TuProfile.fsPlay1KeyPress(Sender: TObject; var Key: Char);
begin
  if (Key > #31) and (Key <> #127) then
  begin
    if POS(Key, 'LRlr1234567890') = 0  then Key := #0;
  end;
end;

procedure TuProfile.ftReferChange(Sender: TObject);
begin
  itemUpdate(False, True, True, Sender);
end;

procedure TuProfile.PB_LoadExecute(Sender: TObject);
var
  i: Integer;
begin
  for i := 0 to c_ITEM_COUNT do
  begin
    itemUpdate(True, False, False, inputID[ i]^);
  end;
end;

procedure TuProfile.PB_ReadExecute(Sender: TObject);
var
  i: Integer;
begin
  for i := 0 to c_ITEM_COUNT do
  begin
    itemUpdate(True, True, False, inputID[ i]^);
  end;
end;

procedure TuProfile.PB_KeepExecute(Sender: TObject);
var
  i: Integer;
begin
  for i := 0 to c_ITEM_COUNT do
  begin
    itemUpdate(False, True, False, inputID[ i]^);
  end;
end;

procedure TuProfile.PB_StoreExecute(Sender: TObject);
var
  i: Integer;
begin
  for i := 0 to c_ITEM_COUNT do
  begin
    itemUpdate(False, True, True, inputID[ i]^);
  end;
end;

// Item In/Out/Store
procedure TuProfile.itemUpdate(const AGet, ASet, APut: Boolean; AItem: TObject);
var
  i_IU5Open : Integer;
  i_IU5Seek : Integer;
begin
  i_IU5Open := uAraMain.ProfileIndex(Self);
  if AItem is TEdit then
  begin
    with TEdit(AItem) do
    begin
      if Enabled = True then
      begin
        // DataBase Restore
        if AGet = True then
        begin
          case HelpContext of
            0: // Profile
            Text := uAraMain.ProfileToText(i_IU5Open, HelpKeyWord, 'no name');
            1: // Play Skill List
            Text := uAraMain.ProfileToText(i_IU5Open, HelpKeyWord, '');
            2: // Skip Delay
            Text := IntToStr(uAraMain.ProfileToData(i_IU5Open, HelpKeyWord, 0));
            4: // Skill Delay
            Text := IntToStr(uAraMain.ProfileToData(i_IU5Open, HelpKeyWord, 0));
            5: // Talk
            Text := uAraMain.ProfileToText(i_IU5Open, HelpKeyWord, '');
          end;
        end;
        // Memory Register
        if ASet = True then
        begin
          case HelpContext of
            0: // Profile
            uAraMain.ProfileTitle(Self, Text);
            1: // Skill
            Key_Play[Tag].Skill := Text;
            2: // Delay
            Key_Skip[Tag].Delay := StrToIntDef(Text, 0);
            4: // Delay
            Key_Push[Tag].Delay := StrToIntDef(Text, 0);
            5: // Talk
            Key_Talk[Tag].Text := Text;
          end;
        end;
        // Database Register
        if APut = True then
        begin
          uAraMain.ProfileInText(i_IU5Open, HelpKeyWord, Text);
        end;
      end;
    end;
  end
  else
  if AItem is TComboBox then
  begin
    with TComboBox(AItem) do
    begin
      if Enabled = True then
      begin
        // DataBase Restore
        if AGet = True then
        begin
          i_IU5Seek := Items.IndexOf(uAraMain.ProfileToText(i_IU5Open, HelpKeyWord, #128));
          if i_IU5Seek > 0 then ItemIndex := i_IU5Seek
                           else ItemIndex := 0;
        end;
        // Memory Register
        if ASet = True then
        begin
          if ItemIndex > 0 then Alert_Kind := Text
                           else Alert_Kind := '';
          uAraMain.ID_Alert(Alert_Kind);
        end;
        // Database Register
        if APut = True then
        begin
          if ItemIndex > 0 then
          begin
            uAraMain.ProfileInText(i_IU5Open, HelpKeyWord, Text);
          end
          else
          begin
            uAraMain.ProfileInText(i_IU5Open, HelpKeyWord, '');
          end;
        end;
      end;
    end;
  end
  else
  if AItem is TCheckBox then
  begin
    with TCheckBox(AItem) do
    begin
      if Enabled = True then
      begin
        // DataBase Restore
        if AGet = True then
        begin
          Checked := uAraMain.ProfileToData(i_IU5Open, HelpKeyWord, False);
        end;
        // Memory Register
        if ASet = True then
        begin
          case HelpContext of
            1: // Play Check
            Key_Play[Tag].Action := Checked;
            2: // Skip Check
            Key_Skip[Tag].Action := Checked;
            3: // Stop Check
            Key_Stop[Tag].Action := Checked;
          end;
        end;
        // Database Register
        if APut = True then
        begin
          uAraMain.ProfileInData(i_IU5Open, HelpKeyWord, Checked);
        end;
      end;
    end;
  end
  else
  if TObject(AItem) is TSpeedButton then
  begin
    with TSpeedButton(AItem) do
    begin
      if Enabled = True then
      begin
        // DataBase Restore
        if AGet = True then
        begin
          Down := uAraMain.ProfileToData(i_IU5Open, HelpKeyWord, False);
        end;
        // Memory Register
        if ASet = True then
        begin
          case HelpContext of
            1: // Play Check
            Key_Play[Tag].Toggle := Down;
          end;
        end;
        // Database Register
        if APut = True then
        begin
          uAraMain.ProfileInData(i_IU5Open, HelpKeyWord, Down);
        end;
      end;
    end;
  end
  else
  if AItem is THotKey then
  begin
    with THotKey(AItem) do
    begin
      if Enabled = True then
      begin
        // DataBase Restore
        if AGet = True then
        begin
          HotKey := uAraMain.ProfileToData(i_IU5Open, HelpKeyWord, 0);
        end;
        // Memory Register
        if ASet = True then
        begin
          uAraMain.Hot2KeySet(HelpContext, Tag, HotKey);
        end;
        // Database Register
        if APut = True then
        begin
          uAraMain.ProfileInData(i_IU5Open, HelpKeyWord, HotKey);
        end;
      end;
    end;
  end
  else
  if AItem is TMemo then
  begin
    with TMemo(AItem) do
    begin
      if Enabled = True then
      begin
        // DataBase Restore
        if AGet = True then
        begin
          Lines.Text := uAraMain.Data2Row(uAraMain.ProfileToText(i_IU5Open, HelpKeyWord, ''), c_DATA_MORE);
        end;
        // Database Register
        if APut = True then
        begin
          uAraMain.ProfileInText(i_IU5Open, HelpKeyWord, uAraMain.Text2Row(Lines.Text));
        end;
      end;
    end;
  end;
end;

initialization
begin
  RegisterClass(TuProfile);
end;

finalization
begin
  UnregisterClass(TuProfile);
end;

end.
