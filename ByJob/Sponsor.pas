unit Sponsor;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

type
  TuSponsor = class(TForm)
    ListBox1: TListBox;
    function FormHelp(Command: Word; Data: NativeInt;
      var CallHelp: Boolean): Boolean;
    procedure FormHide(Sender: TObject);
  private
    { Private declarations }
  public
    // Act
    procedure ACT(const ASwitch: Boolean);
  end;

var
  uSponsor: TuSponsor;

implementation

uses
  AraMain;
{$R *.dfm}

procedure TuSponsor.ACT(const ASwitch: Boolean);
begin
  if ASwitch = True then
  begin
    if Self.Top <> uAraMain.Top  then Self.Top  := uAraMain.Top;
    if Self.Left <> uAraMain.Left + uAraMain.Width then Self.Left := uAraMain.Left + uAraMain.Width;
    Self.Show();
  end
  else
  begin
    Self.Hide();
  end;
end;

function TuSponsor.FormHelp(Command: Word; Data: NativeInt; var CallHelp: Boolean): Boolean;
begin
  CallHelp := False;
  Result := CallHelp;
end;

procedure TuSponsor.FormHide(Sender: TObject);
begin
  if uAraMain.sbSponsor.Down = True then
  begin
    uAraMain.sbSponsor.Down := False;
  end;
end;

end.
