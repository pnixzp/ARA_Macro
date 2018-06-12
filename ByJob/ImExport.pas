unit ImExport;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.StdCtrls, Vcl.Buttons, Vcl.ExtCtrls,
  Vcl.ComCtrls;

type
  TuImExport = class(TForm)
    PageTab: TPageControl;
    ptProfile: TTabSheet;
    cProfile: TPanel;
    ebProfile1: TBevel;
    sbProfileImport: TSpeedButton;
    sbProfileExport: TSpeedButton;
    fProfileDump: TMemo;
    ptBound: TTabSheet;
    cBound: TPanel;
    ebBound1: TBevel;
    sbBoundImport: TSpeedButton;
    sbBoundExport: TSpeedButton;
    fBoundDump: TMemo;
    procedure FormCreate(Sender: TObject);
    function  FormHelp(Command: Word; Data: NativeInt; var CallHelp: Boolean): Boolean;
    procedure FormShow(Sender: TObject);
    procedure PageTabEnter(Sender: TObject);
    procedure sbProfileImportClick(Sender: TObject);
    procedure sbProfileExportClick(Sender: TObject);
    procedure sbBoundImportClick(Sender: TObject);
    procedure sbBoundExportClick(Sender: TObject);
  private
    // Data To Base64
    function Base64Encode(const AText: String): string;
    // Base64 To Data
    function Base64Decode(const ACode: string): string;
  public
    { Public declarations }
  end;

const
  c_BASE64_BYTE = '0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz~_';

var
  uImExport: TuImExport;

implementation

uses
  AraMain;

{$R *.dfm}

function TuImExport.Base64Encode(const AText: String): string;
var
  i : Integer;
  i_BE5Size : Integer;
  i_BE5Byte : Integer;
  i_BE5More : Integer;
  i_BE5Mark : Integer;
  s_BE5Text : AnsiString;
begin
  Result := '';
  s_BE5Text := AnsiString(AText);
  i_BE5Size := Length(s_BE5Text);
  i_BE5Mark := 0;
  i_BE5More := 0;
  for i := 1 to i_BE5Size do
  begin
    i_BE5Byte := Ord(s_BE5Text[ i]);
    i_BE5More := i_BE5More * 256 + i_BE5Byte;
    i_BE5Mark := i_BE5Mark + 8;
    while i_BE5Mark >= 6 do
    begin
      i_BE5Mark := i_BE5Mark - 6;
      i_BE5Byte := i_BE5More div (1 shl i_BE5Mark);
      i_BE5More := i_BE5More mod (1 shl i_BE5Mark);
      Result := Result + c_BASE64_BYTE[i_BE5Byte + 1];
    end;
  end;
  if i_BE5Mark > 0 then
  begin
    i_BE5Byte := i_BE5More shl (6 - i_BE5Mark);
    Result := Result + c_BASE64_BYTE[i_BE5Byte + 1];
  end;
end;

function TuImExport.Base64Decode(const ACode: string): string;
var
  i: Integer;
  i_BD5Size : Integer;
  i_BD5Byte : Integer;
  i_BD5More : Integer;
  i_BD5Mark : Integer;
  s_BD5Code : AnsiString;
  s_BD5Text : AnsiString;
begin
  Result := '';
  i_BD5Mark := 0;
  i_BD5More := 0;
  s_BD5Text := '';
  s_BD5Code := AnsiString(ACode);
  i_BD5Size := Length(ACode);
  for i := 1 to i_BD5Size do
  begin
    i_BD5Byte := Pos(char(s_BD5Code[ i]), c_BASE64_BYTE) - 1;
    if i_BD5Byte >= 0 then
    begin
      i_BD5More := i_BD5More * 64 + i_BD5Byte;
      i_BD5Mark := i_BD5Mark + 6;
      if i_BD5Mark >= 8 then
      begin
        i_BD5Mark := i_BD5Mark - 8;
        i_BD5Byte := i_BD5More shr i_BD5Mark;
        i_BD5More := i_BD5More mod (1 shl i_BD5Mark);
        i_BD5Byte := i_BD5Byte mod 256;
        s_BD5Text := s_BD5Text + AnsiChar(i_BD5Byte);
      end;
    end
    else
    begin
      Exit;
    end;
  end;
  Result := string(s_BD5Text);
end;

procedure TuImExport.FormCreate(Sender: TObject);
begin
  uAraMain.ID_Caption( Self            , 'I&E.TITLE'          );
  uAraMain.ID_Caption( ptProfile       , 'I&E.PROFILE'        , 'I&E.TIP.PROFILE'        );
  uAraMain.ID_Caption( sbProfileImport , 'I&E.PROFILE.IMPORT' , 'I&E.TIP.PROFILE.IMPORT' );
  uAraMain.ID_Caption( sbProfileExport , 'I&E.PROFILE.EXPORT' , 'I&E.TIP.PROFILE.EXPORT' );
  uAraMain.ID_Caption( ptBound         , 'I&E.BOUND'          , 'I&E.TIP.BOUND'          );
  uAraMain.ID_Caption( sbBoundImport   , 'I&E.BOUND.IMPORT'   , 'I&E.TIP.BOUND.IMPORT'   );
  uAraMain.ID_Caption( sbBoundExport   , 'I&E.BOUND.EXPORT'   , 'I&E.TIP.BOUND.EXPORT'   );
end;

function TuImExport.FormHelp(Command: Word; Data: NativeInt; var CallHelp: Boolean): Boolean;
begin
  CallHelp := False;
  Result := CallHelp;
end;

procedure TuImExport.FormShow(Sender: TObject);
begin
  fProfileDump.Lines.Clear;
  fBoundDump.Lines.Clear;
end;

procedure TuImExport.PageTabEnter(Sender: TObject);
begin
 case PageTab.TabIndex of
    0: // Profile
    fProfileDump.SetFocus;
    1: // Bound
    fBoundDump.SetFocus;
  end;
end;

procedure TuImExport.sbProfileImportClick(Sender: TObject);
var
  s_PI5Text : string;
begin
  s_PI5Text := Base64Decode(fProfileDump.Lines.Text);
  if s_PI5Text <> '' then uAraMain.ProfileAppend( 1, s_PI5Text);
end;

procedure TuImExport.sbProfileExportClick(Sender: TObject);
begin
  fProfileDump.Lines.Text := Base64Encode(uAraMain.ProfileExport());
  fProfileDump.SetFocus;
  fProfileDump.SelectAll;
end;

procedure TuImExport.sbBoundImportClick(Sender: TObject);
var
  s_BI5Text : string;
begin
  s_BI5Text := Base64Decode(fBoundDump.Lines.Text);
  if s_BI5Text <> '' then uAraMain.BoundUpdate( 0,s_BI5Text);
end;

procedure TuImExport.sbBoundExportClick(Sender: TObject);
begin
  fBoundDump.Lines.Text := Base64Encode(uAraMain.BoundExport());
  fBoundDump.SetFocus;
  fBoundDump.SelectAll;
end;

end.
