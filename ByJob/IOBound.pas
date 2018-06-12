unit IOBound;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.StdCtrls, Vcl.Buttons, Vcl.ExtCtrls;

type
  TuIOBound = class(TForm)
    cKey: TPanel;
    Bevel1: TBevel;
    Bevel2: TBevel;
    Bevel3: TBevel;
    Bevel4: TBevel;
    sbUndo: TSpeedButton;
    sbImport: TSpeedButton;
    sbExport: TSpeedButton;
    fDump: TMemo;
    function FormHelp(Command: Word; Data: NativeInt; var CallHelp: Boolean): Boolean;
    procedure FormShow(Sender: TObject);
    procedure sbUndoClick(Sender: TObject);
    procedure sbImportClick(Sender: TObject);
    procedure sbExportClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    // Undo
    undo_Index : Integer;
    undo_Datas : string;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  uIOBound: TuIOBound;

implementation

uses
  AraMain;

{$R *.dfm}

procedure TuIOBound.FormCreate(Sender: TObject);
begin
  uAraMain.ID_Caption( Self     , 'I&O.BOUND.TITLE'  );
  uAraMain.ID_Caption( sbUndo   , 'I&O.BOUND.UNDO'   , 'I&O.BOUND.TIP.UNDO'   );
  uAraMain.ID_Caption( sbImport , 'I&O.BOUND.IMPORT' , 'I&O.BOUND.TIP.IMPORT' );
  uAraMain.ID_Caption( sbExport , 'I&O.BOUND.EXPORT' , 'I&O.BOUND.TIP.EXPORT' );
end;

function TuIOBound.FormHelp(Command: Word; Data: NativeInt; var CallHelp: Boolean): Boolean;
begin
  CallHelp := False;
  Result := CallHelp;
end;

procedure TuIOBound.FormShow(Sender: TObject);
begin
  // Clear
  undo_Datas := '';
  // Button Off
  sbUndo.Enabled := False;
  // Clear
  fDump.Lines.Clear;
end;

procedure TuIOBound.sbUndoClick(Sender: TObject);
begin
  // Undo
  uAraMain.ProfileUndo(undo_Index, undo_Datas);
  // Button Off
  sbUndo.Enabled := False;
end;

procedure TuIOBound.sbImportClick(Sender: TObject);
var
  s_IC5Text : string;
begin
  // Base64 Decode
  s_IC5Text := Base642Data(fDump.Lines.Text);
  if s_IC5Text <> '' then
  begin
    // Button On
    sbUndo.Enabled := True;
    // Old Profile Keep
    undo_Index := uAraMain.ChildIndex.TabIndex;
    undo_Datas := uAraMain.ProfileOut();
    // Profile Change
    uARaMain.ProfileIn(s_IC5Text);
  end;
end;

procedure TuIOBound.sbExportClick(Sender: TObject);
begin
  fDump.Lines.Text := uAraMain.Data2Base64(uARaMain.ProfileOut());
  fDump.SelectAll;
end;

end.
