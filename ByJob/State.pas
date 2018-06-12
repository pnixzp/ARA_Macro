unit State;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics, Vcl.Forms, Vcl.Buttons,
  Vcl.StdCtrls, Vcl.ComCtrls, Vcl.ExtCtrls, Vcl.Controls;

type
  TuState = class(TForm)
    cKey: TPanel;
    Bevel1: TBevel;
    Bevel2: TBevel;
    Bevel5: TBevel;
    Bevel3: TBevel;
    Bevel4: TBevel;
    dhAccept: TLabel;
    dhKey: TLabel;
    dhShift: TLabel;
    sbExit: TSpeedButton;
    sbClear: TSpeedButton;
    sbState: TSpeedButton;
    fhAccept: THotKey;
    fsKey: TEdit;
    fsShift: TEdit;
    Logger: TMemo;
    function  FormHelp(Command: Word; Data: NativeInt; var CallHelp: Boolean): Boolean;
    procedure fhAcceptChange(Sender: TObject);
    procedure sbStateClick(Sender: TObject);
    procedure sbClearClick(Sender: TObject);
    procedure sbExitClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  uState: TuState;

implementation

uses
  AraMain;

{$R *.dfm}

function TuState.FormHelp(Command: Word; Data: NativeInt; var CallHelp: Boolean): Boolean;
begin
  CallHelp := False;
  Result := CallHelp;
end;

procedure TuState.fhAcceptChange(Sender: TObject);
var
  i_AC5Code : Word;
  m_AC5More : TShiftState;
begin
  uAraMain.Hot2KeyShift(fhAccept.HotKey, i_AC5Code, m_AC5More);
  fsKey.Text   := IntToStr(i_AC5Code);
  fsShift.Text := Trim(uAraMain.Shift2Text(m_AC5More));
end;

procedure TuState.sbStateClick(Sender: TObject);
const
  c_CHECK_OUT : array [Boolean] of string = ('( )', '(*)');
var
  i : Integer;
begin
  // PLAY
  Logger.Lines.Append( '[ PLAY ]________________________________________________');
  for i := 1 to c_PLAY_LIST do
  begin

    Logger.Lines.Append( Format('%2d', [ i]) + ' '
                       + c_CHECK_OUT[Key_Play[ i].Action] + ' - '
                       + 'Scan : ' + Format('%5d', [Key_Play[ i].Hot]) + '  '
                       + 'Key : ' + Format('%5d', [Key_Play[ i].key]) + '  '
                       + 'Shift : ' + uAraMain.Shift2Text(Key_Play[ i].Shift) + '  '
                       + 'Skill : ' + Key_Play[ i].Skill
                        );
  end;
  // SKILP
  Logger.Lines.Append( '');
  Logger.Lines.Append( '[ SKIP ]________________________________________________');
  for i := 1 to c_SKIP_LIST do
  begin
    Logger.Lines.Append( Format('%2d', [ i]) + ' '
                       + c_CHECK_OUT[Key_Skip[ i].Action] + ' - '
                       + 'Scan : ' + Format('%5d', [Key_Skip[ i].Hot]) + '  '
                       + 'Key : ' + Format('%5d', [Key_Skip[ i].key]) + '  '
                       + 'Shift : ' + uAraMain.Shift2Text(Key_Skip[ i].Shift) + '  '
                       + 'Delay : ' + Format('%7d', [Key_Skip[ i].Delay])
                        );
  end;
  // STOP
  Logger.Lines.Append( '');
  Logger.Lines.Append( '[ STOP ]________________________________________________');
  for i := 1 to c_STOP_LIST do
  begin
    Logger.Lines.Append( Format('%2d', [ i]) + ' '
                       + c_CHECK_OUT[Key_Stop[ i].Action] + ' - '
                       + 'Scan : ' + Format('%5d', [Key_Stop[ i].Hot]) + '  '
                       + 'Key : ' + Format('%5d', [Key_Stop[ i].key]) + '  '
                       + 'Shift : ' + uAraMain.Shift2Text(Key_Stop[ i].Shift) + '  '
                        );
  end;
  // PUSH
  Logger.Lines.Append( '');
  Logger.Lines.Append( '[ PUSH ]________________________________________________');
  for i := 0 to c_PUSH_LIST - 1 do
  begin
    Logger.Lines.Append( Format('%2d', [ i]) + ' '
                       + c_CHECK_OUT[i <= 6] + ' - '
                       + 'Scan : ' + Format('%5d', [Key_Push[ i].Hot]) + '  '
                       + 'Key : ' + Format('%5d', [Key_Push[ i].key]) + '  '
                       + 'Shift : ' + uAraMain.Shift2Text(Key_Push[ i].Shift) + '  '
                       + 'Delay : ' + Format('%7d', [Key_Push[ i].Delay])
                        );
  end;
  // PUSH
  Logger.Lines.Append( '');
  Logger.Lines.Append( '[ TALK ]________________________________________________');
  // TALK
  for i := 0 to c_TALK_LIST do
  begin
    Logger.Lines.Append( Format('%2d', [ i]) + ' '
                       + c_CHECK_OUT[True] + ' - '
                       + 'Scan : ' + Format('%5d', [Key_Talk[ i].Hot]) + '  '
                       + 'Key : ' + Format('%5d', [Key_Talk[ i].key]) + '  '
                       + 'Shift : ' + uAraMain.Shift2Text(Key_Talk[ i].Shift) + '  '
                       + 'Text : ' + Key_Talk[ i].Text
                        );
  end;
end;

procedure TuState.sbClearClick(Sender: TObject);
begin
  Logger.Lines.Clear();
end;

procedure TuState.sbExitClick(Sender: TObject);
begin
  Self.Hide();
end;

end.
