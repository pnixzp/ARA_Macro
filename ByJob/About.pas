unit About;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ComCtrls;

type
  TuAbout = class(TForm)
    Button1: TButton;
    RichEdit1: TRichEdit;
    function FormHelp(Command: Word; Data: NativeInt; var CallHelp: Boolean): Boolean;
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  uAbout: TuAbout;

implementation

{$R *.dfm}

procedure TuAbout.Button1Click(Sender: TObject);
begin
  Self.ModalResult := 1;
end;

function TuAbout.FormHelp(Command: Word; Data: NativeInt; var CallHelp: Boolean): Boolean;
begin
  CallHelp := False;
  Result := CallHelp;
end;

end.
