unit Zoom;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ComCtrls, Vcl.ExtCtrls, Vcl.StdCtrls;

type
  TuZoom = class(TForm)
    cLevel: TPanel;
    fLevel: TTrackBar;
    dhLevel: TLabel;
    ebLevel: TBevel;
    dh1x: TLabel;
    dh2x: TLabel;
    dh4x: TLabel;
    dh6x: TLabel;
    dh8x: TLabel;
    ZoomView: TImage;
    cbCross: TCheckBox;
    rtScan: TTimer;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormHide(Sender: TObject);
    function FormHelp(Command: Word; Data: NativeInt; var CallHelp: Boolean): Boolean;
    procedure FormShow(Sender: TObject);
    procedure FormResize(Sender: TObject);
    procedure rtScanTimer(Sender: TObject);
  private
    // Form Rect (Body)
    body_Rect : TRect;
    { Private declarations }
  public
    // ACT
    procedure ACT(const ASwitch: Boolean);
    { Public declarations }
  end;

const
  c_ZOOM_RATE : array[0..4] of Integer = ( 1, 2, 4, 8, 16);

var
  uZoom: TuZoom;
  // Desktop
  desk_Call : HWND;
  desk_Read : TCanvas;

implementation

uses
  Bound;

{$R *.dfm}

// ACT
procedure TuZoom.ACT(const ASwitch: Boolean);
begin
  if ASwitch = True then
  begin
    Self.ClientWidth  := 300;
    Self.ClientHeight := 300;
    Self.Position := poMainFormCenter;
    Self.Show();
  end
  else
  begin
    Self.Hide();
  end;
end;

procedure TuZoom.FormCreate(Sender: TObject);
begin
  desk_Read := TCanvas.Create;
end;

procedure TuZoom.FormDestroy(Sender: TObject);
begin
  desk_Read.Free;
end;

procedure TuZoom.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if rtScan.Enabled = True then rtScan.Enabled := False;
end;

procedure TuZoom.FormHide(Sender: TObject);
begin
  if uBound.sbZoom.Down = True then
  begin
    uBound.sbZoom.Down := False;
  end;
end;

function TuZoom.FormHelp(Command: Word; Data: NativeInt; var CallHelp: Boolean): Boolean;
begin
  CallHelp := False;
  Result := CallHelp;
end;

procedure TuZoom.FormShow(Sender: TObject);
begin
  if rtScan.Enabled = False then rtScan.Enabled := True;
  SetWindowPos(Handle, HWND_TOPMOST, 0, 0, 0, 0, SWP_NoMove or SWP_NoSize);
end;

procedure TuZoom.FormResize(Sender: TObject);
begin
  ZoomView.Picture := nil;
end;

procedure TuZoom.rtScanTimer(Sender: TObject);
var
  m_ST5Rect : TRect;
  m_ST5Read : TRect;
  m_ST5Keep : TRect;
  m_ST5Mark : TPoint;
begin
  if not IsIconic(Self.Handle) then
  begin
    GetWindowRect(Self.Handle, body_Rect);
    m_ST5Rect.TopLeft := Mouse.CursorPos;
    if PtInRect(body_Rect, m_ST5Rect.TopLeft) = False then
    begin
      // Zoom level Hide
      if cLevel.Visible = True then cLevel.Visible := False;
      if ZoomView.Visible = False then
      begin
        ZoomView.Align := alClient;
        ZoomView.Visible := True;
      end;
      // View Zise
      m_ST5Keep := Rect( 0, 0, ZoomView.Width, ZoomView.Height);
      // Mark Size
      m_ST5Rect.Width  := ZoomView.Width  div c_ZOOM_RATE[fLevel.Position];
      m_ST5Rect.Height := ZoomView.Height div c_ZOOM_RATE[fLevel.Position];
      // Cross Point
      m_ST5Mark.X := m_ST5Rect.Width  div 2;
      m_ST5Mark.Y := m_ST5Rect.Height div 2;
      // Cursor Point
      m_ST5Read.Left   := m_ST5Rect.Left - m_ST5Mark.X;
      m_ST5Read.Top    := m_ST5Rect.Top  - m_ST5Mark.Y;
      m_ST5Read.Width  := m_ST5Rect.Width;
      m_ST5Read.Height := m_ST5Rect.Height;
      // Refair
      If m_ST5Read.Left < 0 then OffsetRect(m_ST5Read, -m_ST5Read.Left, 0);
      If m_ST5Read.Top < 0 then OffsetRect(m_ST5Read, 0, -m_ST5Read.Top);
      If m_ST5Read.Right > Screen.Width then OffsetRect(m_ST5Read, -(m_ST5Read.Right - Screen.DesktopWidth), 0);
      If m_ST5Read.Bottom > Screen.Height then OffsetRect(m_ST5Read, 0, -(m_ST5Read.Bottom - Screen.DesktopHeight));
      // Image View
      try
        desk_Read.Handle := GetDC(GetDesktopWindow);
        ZoomView.Canvas.CopyRect(m_ST5Keep, desk_Read, m_ST5Read);
      finally
        ReleaseDC(GetDesktopWindow, desk_Read.Handle);
      end;
      // Cross Draw
      If cbCross.Checked then
      begin
        m_ST5Mark.X := ZoomView.Width  div 8;
        m_ST5Mark.Y := ZoomView.Height div 8;
        with ZoomView.Canvas do
        begin
          Pen.Color := clRed;
          MoveTo(m_ST5Mark.X * 4, m_ST5Mark.Y * 3); // -
          LineTo(m_ST5Mark.X * 4, m_ST5Mark.Y * 5); // -
          MoveTo(m_ST5Mark.X * 3, m_ST5Mark.Y * 4); // |
          LineTo(m_ST5Mark.X * 5, m_ST5Mark.Y * 4); // |
        end;
      end;
    end
    else
    begin
      // Zoom level Show
      if cLevel.Visible = False then cLevel.Visible := True;
      if ZoomView.Visible = True then ZoomView.Visible := False;
    end;
  end;
end;

end.
