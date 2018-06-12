unit Bound;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Buttons,
  Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.Imaging.jpeg;

type
  TuBound = class(TForm)
    c0Head: TPanel;
    c1Style: TPanel;
    feMode: TLabel;
    ebMode: TBevel;
    dhStyle: TLabel;
    ebStyle: TBevel;
    feStyle: TEdit;
    c2Active: TPanel;
    dhActive: TLabel;
    ebActive: TBevel;
    feActive: TEdit;
    c3Screen: TPanel;
    dhScreen: TLabel;
    ebScreen: TBevel;
    feScreen: TEdit;
    c4Tool: TPanel;
    Bevel0: TBevel;
    Bevel1: TBevel;
    Bevel2: TBevel;
    Bevel3: TBevel;
    Bevel4: TBevel;
    sbOpen: TSpeedButton;
    sbApply: TSpeedButton;
    sbUndo: TSpeedButton;
    sbClear: TSpeedButton;
    sbRedo: TSpeedButton;
    sbMove: TSpeedButton;
    sbPencil: TSpeedButton;
    sbLine: TSpeedButton;
    sbPloygon: TSpeedButton;
    sbRectangle: TSpeedButton;
    sbEllipse: TSpeedButton;
    veColor: TPanel;
    dhFill: TLabel;
    dhLine: TLabel;
    cpLine: TLabel;
    cpFill: TLabel;
    veLine: TPanel;
    ebDot1: TPanel;
    deDot1: TLabel;
    ebDot2: TPanel;
    deDot2: TLabel;
    ebDot3: TPanel;
    deDot3: TLabel;
    ebDot4: TPanel;
    deDot4: TLabel;
    ebDot5: TPanel;
    deDot5: TLabel;
    c5Board: TScrollBox;
    cZone: TPanel;
    dScreen: TImage;
    fPaint: TPaintBox;
    gNode: TPanel;
    ssState: TPanel;
    ss0Say: TPanel;
    ss1Point: TPanel;
    ss2Cursor: TPanel;
    ss5Tool: TPanel;
    ss6WH: TPanel;
    ss8Count: TPanel;
    ss3Action: TPanel;
    ss7Length: TPanel;
    ss8Node: TPanel;
    ss5Style: TShape;
    ss4Accept: TPanel;
    ss9List: TPanel;
    Panel1: TPanel;
    sbZoom: TSpeedButton;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    function  FormHelp(Command: Word; Data: NativeInt; var CallHelp: Boolean): Boolean;
    procedure FormResize(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure fPaintPaint(Sender: TObject);
    procedure fPaintMouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure fPaintMouseMove(Sender: TObject; Shift: TShiftState; X, Y: Integer);
    procedure fPaintMouseUp(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure gNodeClick(Sender: TObject);
    procedure sbOpenClick(Sender: TObject);
    procedure sbApplyClick(Sender: TObject);
    procedure sbUndoClick(Sender: TObject);
    procedure sbClearClick(Sender: TObject);
    procedure sbRedoClick(Sender: TObject);
    procedure sbMoveClick(Sender: TObject);
    procedure ebDot1Click(Sender: TObject);
    procedure sbZoomClick(Sender: TObject);
  private
    // Language
    language_NoName : string;
    language_Append : string;
    language_Modify : string;
    language_NoShot : string;
    // Mouse Action Step
    stepPush : Integer;
    stepMove : Integer;
    // Point
    boardGet : TPoint;
    firstGet : TRect;
    finalGet : TRect;
    countGet : Integer;
    // Action Pencil
    dot_Draw : string;
    // Action Line
    dot_Line : string;
    // Action Ploygon
    dot_Ploy : string;
    // Action rectangle
    dot_Rectangle : string;
    // Action rectangle
    dot_Ellipse : string;
    // Redo
    redo_List : TStringList;
    // Work DataBase
    work_Data : TStringList;
    // Pixel Ratio
    holdRateX : Integer;
    holdRateY : Integer;
    // Hold Mark
    hold_Zone : TBitmap;
    // File Open
    procedure shotOpen(const AFileName: string);
    // Title Update
    procedure titleUpdate();
    // Board Size
    procedure boardSize(const AX, AY: Integer; AValueDisplay: Boolean);
    // Board Resize
    procedure boardUpdate();
    // keep Draw
    procedure boardKeep(AIndex: Integer; APoint: String);
    // Shape Update
    procedure penUpdate(const AShift: TShiftState; ABoardTool: Integer);
    // Undo : Redo (On/Off)
    procedure onUndoRedo();
    // Draw Icon
    function  drawID(): Integer;
    // Ploy Line
    procedure penPencil(ACanvas: TCanvas; AData: string );
    // Line
    procedure penLine(ACanvas: TCanvas; AData: string );
    // Ploygon
    procedure penPloygon(ACanvas: TCanvas; AData: string );
    // Rectangle
    procedure penRectangle(ACanvas: TCanvas; AData: string );
    // Circle
    procedure penEllipse(ACanvas: TCanvas; AData: string );
  public
    // New
    function  New(): Integer;
    // Edit
    function  Edit(const ARow: string):Integer;
    // Data
    function  Data(): string;
    // Mark
    procedure Mark(const AData: string);
    // Cursor Hold
    function  Hold(const AX, AY, AWidth, AHeight: Integer): Boolean;
    // Shot
    procedure Shot();
  end;

var
  uBound: TuBound;

implementation

uses
  AraMain, Zoom;

{$R *.dfm}

// New
function TuBound.New(): Integer;
begin
  // Style
  feStyle.Text := '';
  // Application Name
  feActive.Text := '';
  // Size
  feScreen.Text := '';
  // Board Size
  boardSize(1024, 768, True);
  // Draw List
  work_Data.Clear;
  // Append Display
  feMode.Caption := language_Append;
  // Action
  Result := Self.ShowModal();
  // Title Update
  if Result = 1 then titleUpdate();
end;

// Edit
function TuBound.Edit(const ARow: string):Integer;
begin
  // Call Structure
  SwapList.Text := uAraMain.Data2Row(ARow + StringOfChar(c_DATA_PAGE, 4), c_DATA_PAGE);
  // Style
  feStyle.Text := SwapList.Strings[ 0];
  // Application Name
  feActive.Text := SwapList.Strings[ 1];
  // Size
  SwapHead.Text := uAraMain.Data2Row(SwapList.Strings[ 2] + StringOfChar('X', 2), 'X');
  // Board Size
  boardSize(StrToIntDef(SwapHead.Strings[ 0], 0), StrToIntDef(SwapHead.Strings[ 1], 0), True);
  // Draw List
  work_Data.Text := uAraMain.Data2Row(SwapList.Strings[ 3], c_DATA_MORE);
  // Modify Display
  feMode.Caption := language_Modify;
  // Action
  Result := Self.ShowModal();
  // Title Update
  if Result = 1 then titleUpdate();
end;

// Data
function TuBound.Data(): string;
begin
  Result := feStyle.Text + c_DATA_PAGE
          + feActive.Text + c_DATA_PAGE
          + IntToStr(fPaint.Width) + 'X' + IntToStr(fPaint.Height) + c_DATA_PAGE
          + uAraMain.Text2Row(work_Data.Text);
end;

// Mark
procedure TuBound.Mark(const AData: string);
var
  i : Integer;
begin
  // Call Structure
  SwapList.Text := uAraMain.Data2Row(AData + StringOfChar(c_DATA_PAGE, 4), c_DATA_PAGE);
  // Style
  feStyle.Text := SwapList.Strings[ 0];
  // Style
  feActive.Text := SwapList.Strings[ 1];
  // Size
  SwapHead.Text := uAraMain.Data2Row(SwapList.Strings[ 2] + StringOfChar('X', 2), 'X');
  // pi
  hold_Zone.Canvas.Brush.Color := clWhite;
  hold_Zone.SetSize(StrToIntDef(SwapHead.Strings[ 0], 0), StrToIntDef(SwapHead.Strings[ 1], 0));
  hold_Zone.Canvas.FillRect(Rect( 0, 0, hold_Zone.Width, hold_Zone.Height));
  // Draw List
  work_Data.Text := uAraMain.Data2Row(SwapList.Strings[ 3], c_DATA_MORE);
  // Zone Draw
  hold_Zone.Canvas.Pen.Color   := clBlack;
  hold_Zone.Canvas.Brush.Color := clBlack;
  for i := 0 to work_Data.Count - 1 do
  begin
    swapItem.Text := uAraMain.Data2Row(work_Data.Strings[ i], c_DATA_HEAD);
    hold_Zone.Canvas.Pen.Width := StrToInt(swapItem.Strings[ 1]);
    case StrToIntDef(swapItem.Strings[ 0], -1) of
      1: // Pen
      penPencil(hold_Zone.Canvas, swapItem.Strings[ 4]);
      2: // Line
      penLine(hold_Zone.Canvas, swapItem.Strings[ 4]);
      3: // Ploy List
      penPloygon(hold_Zone.Canvas, swapItem.Strings[ 4]);
      4: // Box
      penRectangle(hold_Zone.Canvas, swapItem.Strings[ 4]);
      5: // Circle
      penEllipse(hold_Zone.Canvas, swapItem.Strings[ 4]);
    end;
  end;
end;

{
function TuBound.Ratio(AValue, ARatio: Integer): Extended;
begin
  Result := 0;
  if (AValue <> 0) and (ARatio <> 0) then Result := AValue / ARatio;
end;
}
function TuBound.Hold(const AX, AY, AWidth, AHeight: Integer): Boolean;
begin
  Result := False;
  if (AX > -1) and (AY > -1) and (AX <= hold_Zone.Width) and (AY <= hold_Zone.Height) then
  begin
    if (hold_Zone.Width <> 0) and (AWidth <> 0) then holdRateX := (hold_Zone.Width  * c_RATIO_DOT) div AWidth
                                                else holdRateX := 0;
    if (hold_Zone.Height <> 0) and (AHeight <> 0) then holdRateY := (hold_Zone.Height * c_RATIO_DOT) div AHeight
                                                  else holdRateY := 0;
    if (holdRateX <> 0) and (holdRateY <> 0) then
    begin
      Result := (hold_Zone.Canvas.Pixels[(AX * holdRateX) div c_RATIO_DOT, (AY * holdRatey) div c_RATIO_DOT] = clWhite);
    end;
  end;
end;

procedure TuBound.Shot();
var
  m_BS5Scan : HWND;
  m_BS5Rect : TRect;
  m_BS5Size : TRect;
  m_BS5Body : TPoint;
  m_BS5More : HDC;
  m_BS5Shot : TBitmap;
begin
  m_BS5Scan := GetForegroundWindow();
  if m_BS5Scan > 0 then
  begin
    // Rect Keep
    GetWindowRect(m_BS5Scan, m_BS5Rect);
    winapi.Windows.GetClientRect(m_BS5Scan, m_BS5Size);
    // Width
    m_BS5Body.X := (m_BS5Rect.Width - m_BS5Size.Width) div 2;
    if m_BS5Body.X < 0 then m_BS5Body.X := 0;
    // Height
    m_BS5Body.Y := m_BS5Rect.Height - m_BS5Body.X - m_BS5Size.Height;
    if m_BS5Body.Y < 0 then m_BS5Body.Y := 0;
    // Draw Canvas
    m_BS5More := GetWindowDC(m_BS5Scan) ;
    // Shot
    m_BS5Shot := TBitmap.Create;
    m_BS5Shot.SetSize(m_BS5Size.Width, m_BS5Size.Height);
    // Shot
    BitBlt(m_BS5Shot.Canvas.Handle, 0, 0, m_BS5Shot.Width, m_BS5Shot.Height,
                         m_BS5More, m_BS5Body.X, m_BS5Body.Y, SRCCOPY);
    // Screen Shot Keep
    TJPEGImage(dScreen.Picture).Assign(m_BS5Shot);
    // Size
    boardSize(dScreen.Width, dScreen.Height, True);
    // Release
    ReleaseDC(GetForegroundWindow, m_BS5More);
    // Free
    m_BS5Shot.FreeImage;
    m_BS5Shot.Free;
    // Message
    ss0Say.Caption := '';
  end;
end;

// Form ------------------------------------------------------------------------
procedure TuBound.FormCreate(Sender: TObject);
begin
  // No Style
  language_NoName := uAraMain.ID_Title('BOUND.EMPTY');
  if language_NoName = '' then language_NoName := 'no name';
  // Append
  language_Append := uAraMain.ID_Title('BOUND.APPEND');
  if language_Append = '' then language_Append := 'APPEND';
  // Modify
  language_Modify := uAraMain.ID_Title('BOUND.MODIFY');
  if language_Modify = '' then language_Modify := 'MODIFY';
  // No Screen Shot
  language_NoShot := uAraMain.ID_Title('BOUND.NOSHOT');
  if language_NoShot = '' then language_NoShot := 'NO SCREEN SHOT';
  // Active
  feActive.Hint := uAraMain.ID_Title('BOUND.TIP.ACTIVE');
  if feActive.Hint = '' then feActive.Hint := 'Active Program Name Sacn';
  feActive.Hint := feActive.Hint + ' [Print Screen]';
  // Language
  uAraMain.ID_Caption( Self        , 'BOUND.TITLE'     );
  uAraMain.ID_Caption( dhStyle     , 'BOUND.STYLE'     );
  uAraMain.ID_Caption( dhActive    , 'BOUND.ACTIVE'    );
  uAraMain.ID_Caption( dhScreen    , 'BOUND.SCREEN'    );
  uAraMain.ID_Caption( sbOpen      , 'BOUND.OPEN'      , 'BOUND.TIP.OPEN'      );
  uAraMain.ID_Caption( sbApply     , 'BOUND.APPLY'     , 'BOUND.TIP.APPLY'     );
  uAraMain.ID_Caption( sbUndo      , 'BOUND.UNDO'      , 'BOUND.TIP.UNDO'      );
  uAraMain.ID_Caption( sbRedo      , 'BOUND.REDO'      , 'BOUND.TIP.REDO'      );
  uAraMain.ID_Caption( sbClear     , 'BOUND.CLEAR'     , 'BOUND.TIP.CLEAR'     );
  uAraMain.ID_Caption( sbMove      , 'BOUND.MOVE'      , 'BOUND.TIP.MOVE'      );
  uAraMain.ID_Caption( sbPencil    , 'BOUND.PENCIL'    , 'BOUND.TIP.PENCIL'    );
  uAraMain.ID_Caption( sbLine      , 'BOUND.LINE'      , 'BOUND.TIP.LINE'      );
  uAraMain.ID_Caption( sbPloygon   , 'BOUND.PLOYGON'   , 'BOUND.TIP.PLOYGON'   );
  uAraMain.ID_Caption( sbRectangle , 'BOUND.RECTANGLE' , 'BOUND.TIP.RECTANGLE' );
  uAraMain.ID_Caption( sbEllipse   , 'BOUND.ELLIPSE'   , 'BOUND.TIP.ELLIPSE'   );
  uAraMain.ID_Caption( sbZoom      , 'BOUND.ZOOM'      , 'BOUND.TIP.ZOM'       );
  uAraMain.ID_Caption( dhLine      , 'BOUND.PEN'       );
  uAraMain.ID_Caption( dhFill      , 'BOUND.FILL'      );
  // Cross Style
  fPaint.Canvas.Brush.Style := bsDiagCross;
  // Redo
  redo_List := TStringList.Create;
  // DataBase
  work_Data := TStringList.Create;
  // Hold Mark
  hold_Zone := TBitmap.Create;
  hold_Zone.PixelFormat := pf1bit;
end;

procedure TuBound.FormDestroy(Sender: TObject);
begin
  // Redo
  redo_List.Free;
  // DataBase
  work_Data.Free;
  // Hold Mark
  hold_Zone.Free;
end;

procedure TuBound.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if uZoom.Visible = True then uZoom.ACT(False);
end;

function TuBound.FormHelp(Command: Word; Data: NativeInt; var CallHelp: Boolean): Boolean;
begin
  CallHelp := False;
  Result := CallHelp;
end;

procedure TuBound.FormResize(Sender: TObject);
begin
  boardUpdate();
end;

procedure TuBound.FormShow(Sender: TObject);
begin
  shotOpen(uAraMain.ScreenShotFile);
end;

procedure TuBound.FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if (stepPush = 4) or (stepPush = 5) then
  begin
    if (ssShift in Shift) or (ssCtrl in Shift) then penUpdate(Shift, stepPush);
  end;
end;

procedure TuBound.FormKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if (stepPush = 4) or (stepPush = 5) then
  begin
    penUpdate(Shift, stepPush);
  end;
end;

procedure TuBound.fPaintPaint(Sender: TObject);
var
  i : Integer;
  i_PP5Size : Integer;
begin
  i_PP5Size := fPaint.Canvas.Pen.Width;
  fPaint.Canvas.Brush.Style := bsDiagCross;
  for i := 0 to work_Data.Count - 1 do
  begin
    swapItem.Text := uAraMain.Data2Row(work_Data.Strings[ i], c_DATA_HEAD);
    fPaint.Canvas.Brush.Color := StrToInt('$' + swapItem.Strings[ 3]);
    fPaint.Canvas.Pen.Width   := StrToInt(swapItem.Strings[ 1]);
    fPaint.Canvas.Pen.Color   := StrToInt('$' + swapItem.Strings[ 2]);
    case StrToIntDef(swapItem.Strings[ 0], -1) of
      1: // Pen
      penPencil(fPaint.Canvas, swapItem.Strings[ 4]);
      2: // Line
      penLine(fPaint.Canvas, swapItem.Strings[ 4]);
      3: // Ploy List
      penPloygon(fPaint.Canvas, swapItem.Strings[ 4]);
      4: // Box
      penRectangle(fPaint.Canvas, swapItem.Strings[ 4]);
      5: // Circle
      penEllipse(fPaint.Canvas, swapItem.Strings[ 4]);
    end;
  end;
  fPaint.Canvas.Brush.Color := clWhite;
  SetBKMode(fPaint.Canvas.Handle,TRANSPARENT);  // Color set next command
  fPaint.Canvas.Brush.Style := bsClear;
  fPaint.Canvas.Pen.Width   := i_PP5Size;
  fPaint.Canvas.Pen.Color   := cpLine.Color;

  //
  SetBkMode(fPaint.Canvas.Handle, TRANSPARENT);
  // Pen
  if dot_Draw <> '' then penPencil(fPaint.Canvas, dot_Draw);
  // Line
  if dot_Line <> '' then penLine(fPaint.Canvas, dot_Line);
  // Ploy
  if dot_Ploy <> '' then penPencil(fPaint.Canvas, dot_Ploy);
  // Rectangle
  if dot_Rectangle <> '' then penRectangle(fPaint.Canvas, dot_Rectangle);
  // Ellipse
  if dot_Ellipse <> '' then penEllipse(fPaint.Canvas, dot_Ellipse);
end;

procedure TuBound.fPaintMouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  case drawID() of
    1: // Pen
    if ssLeft in Shift then
    begin
      stepPush := 1;
      countGet := 1;
      firstGet.TopLeft := fPaint.ScreenToClient(Mouse.CursorPos);
    end;
    2: // Line
    if ssLeft in Shift then
    begin
      stepPush := 2;
      firstGet.TopLeft := fPaint.ScreenToClient(Mouse.CursorPos);
    end;
    3: // Ploy
    if ssLeft in Shift then
    begin
      stepPush := 3;
    end;
    4: // Rectangle
    if ssLeft in Shift then
    begin
      stepPush := 4;
      firstGet.TopLeft := fPaint.ScreenToClient(Mouse.CursorPos);
    end;
    5: // Circle
    if ssLeft in Shift then
    begin
      stepPush := 5;
      firstGet.TopLeft := fPaint.ScreenToClient(Mouse.CursorPos);
    end;
    9: // Move
    if ssLeft in Shift then
    begin
      stepPush := 9;
      firstGet.BottomRight := Mouse.CursorPos;
    end;
  else
    begin
      stepPush := 0;
    end;
  end;
end;

procedure TuBound.fPaintMouseMove(Sender: TObject; Shift: TShiftState; X, Y: Integer);
begin
  ss2Cursor.Caption := IntToStr(X) + ',' + IntToStr(Y);
  case drawID() of
    1: // Pen
    if ssLeft in Shift then
    begin
      if stepPush <> 1 then stepPush := 1;
      firstGet.BottomRight := fPaint.ScreenToClient(Mouse.CursorPos);
      if dot_Draw = '' then dot_Draw := IntToStr(firstGet.Left) + ',' + IntToStr(firstGet.Top);
      dot_Draw := dot_Draw + ' | ' + IntToStr(firstGet.Right) + ',' + IntToStr(firstGet.Bottom);
      countGet := countGet + 1;
      ss9List.Caption := IntTostr(countGet);
      fPaint.Invalidate;
    end;
    2: // Line
    if ssLeft in Shift then
    begin
      if stepPush <> 2 then stepPush := 2;
      firstGet.BottomRight := fPaint.ScreenToClient(Mouse.CursorPos);
      dot_Line := IntToStr(firstGet.Left) + ',' + IntToStr(firstGet.Top)
                + ','
                + IntToStr(firstGet.Right) + ',' + IntToStr(firstGet.Bottom);
      fPaint.Invalidate;
    end;
    3: // Ploygon
    if ssLeft in Shift then
    begin
      if stepPush <> 3 then stepPush := 3;
    end;
    4: // Rectangle
    if (ssLeft in Shift) and (stepPush = 4) then
    begin
      if stepPush = 4 then stepPush := 4;
      penUpdate(Shift, 4);
//      fPaint.Invalidate;
    end;
    5: // Circle
    if ssLeft in Shift then
    begin
      if stepPush = 5 then stepPush := 5;
      penUpdate(Shift, 5);
//      fPaint.Invalidate;
    end;
    9: // Move
    if ssLeft in Shift then
    begin
      if stepPush = 9 then stepPush := 9;
      firstGet.TopLeft := Mouse.CursorPos;
      if (boardGet.X > 0) and
         (firstGet.Width <> 0) and
         (c5Board.HorzScrollBar.Position + firstGet.Width >= 0) and
         (c5Board.HorzScrollBar.Position + firstGet.Width <= boardGet.X) then
      begin
        c5Board.HorzScrollBar.Position := c5Board.HorzScrollBar.Position + firstGet.Width;
      end;
      if (boardGet.Y > 0) and
         (firstGet.Height <> 0) and
         (c5Board.VertScrollBar.Position + firstGet.Height >= 0) and
         (c5Board.VertScrollBar.Position + firstGet.Height <= boardGet.Y) then
      begin
        c5Board.VertScrollBar.Position := c5Board.VertScrollBar.Position + firstGet.Height;
      end;
      firstGet.BottomRight := firstGet.TopLeft;
    end;
  end;
end;

procedure TuBound.fPaintMouseUp(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  case drawID() of
    1: // Pen
    if stepPush = 1 then
    begin
      stepPush := 0;
      firstGet.BottomRight := fPaint.ScreenToClient(Mouse.CursorPos);
      if dot_Draw <> '' then dot_Draw := dot_Draw + '|';
      dot_Draw := dot_Draw + IntToStr(firstGet.Right) + ',' + IntToStr(firstGet.Bottom);
      countGet := countGet + 1;
      ss9List.Caption := IntTostr(countGet);
      // Draw DataBase Append
      boardKeep(1, dot_Draw);
      // Action Clear
      dot_Draw := '';
      // Undo:Redo Button
      onUndoRedo();
      // Display
      fPaint.Invalidate;
    end;
    2: // Line
    if stepPush = 2 then
    begin
      stepPush := 0;
      firstGet.BottomRight := fPaint.ScreenToClient(Mouse.CursorPos);
      // Draw DataBase Append
      boardKeep( 2
               , IntToStr(firstGet.Left) + ',' + IntTostr(firstGet.Top) + ',' + IntTostr(firstGet.Right) + ',' + IntTostr(firstGet.Bottom)
               );
      dot_Line := '';
      // Undo:Redo Button
      onUndoRedo();
      // Display
      fPaint.Invalidate;
    end;
    3: // PloyLine
    if stepPush = 3 then
    begin
      stepPush := 0;

//        if (stepPush = 3) or (stepMove = 3) then
//    begin
//      stepMove := 0;
      if gNode.Visible = False then
      begin
        firstGet.TopLeft := fPaint.ScreenToClient(Mouse.CursorPos);
        if (firstGet.Left >= 0) and (firstGet.Top >= 0) and
           (firstGet.Left <= fPaint.Width) and (firstGet.Top <= fPaint.Height) then
        begin
          gNode.Top     := fPaint.Margins.Top  + firstGet.Top - 4;
          gNode.Left    := fPaint.Margins.Left + firstGet.Left - 4;
          gNode.Visible := True;
          countGet := 1;
          ss9List.Caption := '1';
        end;
      end
      else
      begin
        if dot_Ploy = '' then
        begin
          dot_Ploy := IntToStr(firstGet.Left) + ',' + IntToStr(firstGet.Top);
        end;
        firstGet.BottomRight := fPaint.ScreenToClient(Mouse.CursorPos);
        dot_Ploy := dot_Ploy + ' | ' + IntToStr(firstGet.Right) + ',' + IntToStr(firstGet.Bottom);
        countGet := countGet + 1;
        ss9List.Caption := IntTostr(countGet);
        fPaint.Invalidate;
      end;
    end;
    4: // Rectangle
    if stepPush = 4 then
    begin
      stepPush := 0;
      // Cursor Point
      penUpdate(Shift, -4);
      // Draw DataBase Append
      boardKeep( 4
               , IntToStr(finalGet.Left) + ',' + IntTostr(finalGet.Top) + ',' + IntTostr(finalGet.Right) + ',' + IntTostr(finalGet.Bottom)
               );
      dot_Rectangle := '';
      // Undo:Redo Button
      onUndoRedo();
      // Display
      fPaint.Invalidate;
    end;
    5: // Circle
    if stepPush = 5 then
    begin
      stepPush := 0;
      // Cursor Point
      penUpdate(Shift, -5);
      // Draw DataBase Append
      boardKeep( 5
               , IntToStr(finalGet.Left) + ',' + IntTostr(finalGet.Top) + ',' + IntTostr(finalGet.Right) + ',' + IntTostr(finalGet.Bottom)
               );
      dot_Ellipse := '';
      // Undo:Redo Button
      onUndoRedo();
      // Display
      fPaint.Invalidate;
    end;
    9: // Move
    if stepPush = 9 then
    begin
      stepPush := 0;
    end;
  end;
end;

procedure TuBound.gNodeClick(Sender: TObject);
begin
  // Node Hide
  gNode.Visible := False;
  // Draw DataBase Append
  boardKeep( 3, dot_Ploy);
  // Draw Action Clear
  dot_Ploy := '';
  // Undo:Redo Button
  onUndoRedo();
  // Display
  fPaint.Invalidate;
end;

procedure TuBound.sbOpenClick(Sender: TObject);
var
  s_FO5File : string;
begin
  sbOpen.Update;
  s_FO5File := uAraMain.ID_FileOpen();
  if s_FO5File <> '' then
  begin
    shotOpen(s_FO5File);
  end;
end;

procedure TuBound.sbUndoClick(Sender: TObject);
begin
  if work_Data.Count > 0 then
  begin
    // Redo Append
    redo_List.Append(work_Data.Strings[work_Data.Count - 1]);
    // Delete
    work_Data.Delete(work_Data.Count - 1);
    // Undo:Redo Button
    onUndoRedo();
    // Display
    fPaint.Invalidate;
  end;
end;

procedure TuBound.sbZoomClick(Sender: TObject);
begin
  uZoom.ACT(sbZoom.Down);
end;

procedure TuBound.sbRedoClick(Sender: TObject);
begin
  if redo_List.Count > 0 then
  begin
    // Redo
    work_Data.Append(redo_List.Strings[redo_List.Count - 1]);
    // Redo Delete
    redo_List.Delete(redo_List.Count - 1);
    // Undo:Redo Button
    onUndoRedo();
    // Display
    fPaint.Invalidate;
  end;
end;

procedure TuBound.sbClearClick(Sender: TObject);
var
  i : Integer;
begin
  if work_Data.Count > 0 then
  begin
    for i := work_Data.Count - 1 downto 0 do
    begin
      redo_List.Append(work_Data.Strings[ i]);
    end;
    work_Data.Clear;
    // Undo:Redo Button
    onUndoRedo();
    // Display
    fPaint.Invalidate;
  end;
end;

procedure TuBound.sbApplyClick(Sender: TObject);
begin
  ModalResult := 1;
end;

procedure TuBound.sbMoveClick(Sender: TObject);
begin
  case drawID() of
    1: // Pen
    begin
      if ss5Style.Visible = True then  ss5Style.Hide;
      ss5Tool.Caption := '~';
      ss9List.Caption := '';
      fPaint.Cursor := crCross;
    end;
    2: // Line
    begin
      if ss5Style.Visible = True then  ss5Style.Hide;
      ss5Tool.Caption := '/';
      ss9List.Caption := '2';
      fPaint.Cursor := crCross;
    end;
    3: // Ploy
    begin
      if ss5Style.Visible = True then  ss5Style.Hide;
      ss5Tool.Caption := '^';
      ss9List.Caption := '';
      fPaint.Cursor := crCross;
    end;
    4: // Rectangle
    begin
      ss5Style.Shape := stRectangle;
      ss5Tool.Caption := '';
      ss9List.Caption := '2';
      if ss5Style.Visible = False then ss5Style.Show;
      fPaint.Cursor := crCross;
    end;
    5: // Circle
    begin
      ss5Style.Shape := stEllipse;
      ss5Tool.Caption := '';
      ss9List.Caption := '2';
      if ss5Style.Visible = False then ss5Style.Show;
      fPaint.Cursor := crCross;
    end;
    9: // Hand
    begin
      if ss5Style.Visible = True then  ss5Style.Hide;
      ss5Tool.Caption := '[ + ]';
      ss9List.Caption := '';
      fPaint.Cursor := crHandPoint;
    end;
  else // None
    if ss5Style.Visible = True then  ss5Style.Hide;
    ss5Tool.Caption := '';
    ss9List.Caption := '';
    fPaint.Cursor := crDefault;
  end;
  // Cursor Point
  stepPush := 0;
  stepMove := 0;
  // Style Draw
  dot_Draw := '';
  // Style Line
  dot_Line := '';
  //Style Ploy
  dot_Ploy := '';
  // Node Object Hide
  gNode.Visible := False;
  // Invalidate
  fPaint.Invalidate;
end;

procedure TuBound.ebDot1Click(Sender: TObject);
const
  c_LINE_SWITCH : array[Boolean] of TColor = ($00E0E0E0, clAqua);
begin
  with TControl(Sender) do
  begin
    ebDot1.Color := c_LINE_SWITCH[Tag = 1];
    ebDot2.Color := c_LINE_SWITCH[Tag = 2];
    ebDot3.Color := c_LINE_SWITCH[Tag = 3];
    ebDot4.Color := c_LINE_SWITCH[Tag = 4];
    ebDot5.Color := c_LINE_SWITCH[Tag = 5];
    fPaint.Canvas.Pen.Width := Tag;
  end;
end;

// File Open
procedure TuBound.shotOpen(const AFileName: string);
begin
  if FileExists(AFileName) = True then
  begin
    // Move Pick
    sbMove.Down := True;
    sbMove.Click();
    try
      // Image File Load
      dScreen.Picture.LoadFromFile(AFileName);
      // Size
      boardSize(dScreen.Width, dScreen.Height, True);
      // Filename Change
      uAraMain.ScreenShotFile := AFileName;
    except
      feScreen.Text := 'FAIL';
    end;
  end
  else
  begin
    ss0Say.Caption := language_NoShot;
  end;
end;

// Title Update
procedure TuBound.titleUpdate();
begin
  if feStyle.Text = '' then
  begin
    if feActive.Text <> '' then
    begin
      feStyle.Text := feActive.Text;
    end
    else
    begin
      feStyle.Text := language_NoName;
    end;
  end;
end;

// Board Size
procedure TuBound.boardSize(const AX, AY: Integer; AValueDisplay: Boolean);
var
  m_BS5Size : TPoint;
begin
  // Resize
  m_BS5Size.X := AX;
  if m_BS5Size.X < 1 then m_BS5Size.X := 1024;
  m_BS5Size.Y := AY;
  if m_BS5Size.Y < 1 then m_BS5Size.Y := 768;
  // Size
  fPaint.Width  := m_BS5Size.X;
  fPaint.Height := m_BS5Size.Y;
  // Action
  if AValueDisplay = True then
  begin
    // Color
    fPaint.Canvas.Pen.Color   := cpLine.Color;
    fPaint.Canvas.Brush.Color := cpFill.Color;
    // Resize
    boardUpdate();
    // Size Value Display
    feScreen.Text := IntToStr(m_BS5Size.X) + 'X' + IntToStr(m_BS5Size.Y);
  end;
end;

// Board Resize
procedure TuBound.boardUpdate();
begin
  boardGet.X := cZone.Width  - c5Board.ClientWidth;
  boardGet.Y := cZone.Height - c5Board.ClientHeight;
end;

// Draw Icon
function TuBound.drawID(): Integer;
begin
  Result := 0;
  if sbPencil.Down    = True then Result := 1 else
  if sbLine.Down      = True then Result := 2 else
  if sbPloygon.Down   = True then Result := 3 else
  if sbRectangle.Down = True then Result := 4 else
  if sbEllipse.Down   = True then Result := 5 else
  if sbMove.Down      = True then Result := 9;
end;

// In Board Check
{
function  TuBourn.inBoard(const APoint: TPoint): Boolean;
begin
  Result := ((APoint.X >= 0) and
             (APoint.Y >= 0) and
             (APoint.X <= fPaint.Width) and
             (APoint.Y <= fPaint.Height));
end;
}

// keep Draw
procedure TuBound.boardKeep(AIndex: Integer; APoint: String);
begin
  work_Data.Append( IntToStr(AIndex) + c_DATA_HEAD
                  + IntToStr(fpaint.Canvas.Pen.Width) + c_DATA_HEAD
                  + IntToHex(cpLine.Color) + c_DATA_HEAD
                  + IntToHex(cpFill.Color) + c_DATA_HEAD
                  + APoint);
end;

procedure TuBound.penUpdate(const AShift: TShiftState; ABoardTool: Integer);
begin
  firstGet.BottomRight := fPaint.ScreenToClient(Mouse.CursorPos);
  if ssShift in AShift then
  begin
    if firstGet.Width > firstGet.Height then firstGet.Width  := firstGet.Height else
    if firstGet.Width < firstGet.Height then firstGet.Height := firstGet.Width;
  end;
  if ssCtrl in AShift then
  begin
    ss5Tool.Caption := '+';
    finalGet.Top    := firstGet.Top  - firstGet.Height;
    finalGet.Left   := firstGet.Left - firstGet.Width;
    finalGet.Width  := firstGet.Width * 2;
    finalGet.Height := firstGet.Height * 2;
  end
  else
  begin
    ss5Tool.Caption := '';
    finalGet := firstGet;
  end;
  ss4Accept.Caption := IntToStr(firstGet.Left)  + ',' + IntToStr(firstGet.Top);
  ss7Length.Caption := IntToStr(finalGet.Width) + ',' + IntToStr(finalGet.Height);
  if ss5Style.Visible = False then ss5Style.Show;
  case ABoardTool of
    4: // Rectangle
    begin
      if ssShift in AShift then ss5Style.Shape := stSquare
                           else ss5Style.Shape := stRectangle;
      dot_Rectangle := IntToStr(finalGet.Left) + ',' + IntTostr(finalGet.Top) + ','
                     + IntTostr(finalGet.Right) + ',' + IntTostr(finalGet.Bottom);
      fPaint.Invalidate;
    end;
    5: // Ellipse
    begin
      if ssShift in AShift then ss5Style.Shape := stCircle
                           else ss5Style.Shape := stEllipse;
      dot_Ellipse := IntToStr(finalGet.Left) + ',' + IntTostr(finalGet.Top) + ','
                   + IntTostr(finalGet.Right) + ',' + IntTostr(finalGet.Bottom);
      fPaint.Invalidate;
    end;
  end;
end;

// Pencil
procedure TuBound.penPencil(ACanvas: TCanvas; AData: string );
var
  i : Integer;
  m_PP5Line : TPoint;
begin
  SwapList.Text := uAraMain.Data2Row(AData, '|');
  if SwapList.Count > 0 then
  begin
    for i := 0 to SwapList.Count - 1 do
    begin
      SwapItem.DelimitedText := SwapList.Strings[ i];
      m_PP5Line.X := StrToIntDef(SwapItem.Strings[ 0], 0);
      m_PP5Line.Y := StrToIntDef(SwapItem.Strings[ 1], 0);
      if i = 0 then
      begin
        ACanvas.MoveTo(m_PP5Line.X, m_PP5Line.Y);
      end
      else
      begin
        ACanvas.LineTo(m_PP5Line.X, m_PP5Line.Y);
      end;
    end;
  end;
end;

// Line
procedure TuBound.penLine(ACanvas: TCanvas; AData: string );
begin
  SwapItem.Text := uAraMain.Data2Row(AData, ',');
  // Move
  if SwapItem.Count > 1 then
  begin
    ACanvas.MoveTo(StrToIntDef(SwapItem.Strings[ 0], 0), StrToIntDef(SwapItem.Strings[ 1], 0));
  end;
  // Line
  if SwapItem.Count > 3 then
  begin
    ACanvas.LineTo(StrToIntDef(SwapItem.Strings[ 2], 0), StrToIntDef(SwapItem.Strings[ 3], 0));
  end;
end;

// Ploygon
procedure TuBound.penPloygon(ACanvas: TCanvas; AData: string );
var
  i : Integer;
  m_PP5Ploy : array of TPoint;
begin
  SwapList.Text := uAraMain.Data2Row(AData, '|');
  SetLength(m_PP5Ploy, SwapList.Count);
  if SwapList.Count > 0 then
  begin
    for i := 0 to SwapList.Count - 1 do
    begin
      SwapItem.DelimitedText := SwapList.Strings[ i];
      m_PP5Ploy[ i].X := StrToIntDef(SwapItem.Strings[ 0], 0);
      m_PP5Ploy[ i].Y := StrToIntDef(SwapItem.Strings[ 1], 0);
    end;
    ACanvas.Polygon(m_PP5Ploy);
  end;
end;

// Rectangle
procedure TuBound.penRectangle(ACanvas: TCanvas; AData: string );
begin
  SwapItem.DelimitedText := AData;
  ACanvas.Rectangle( StrToIntDef(SwapItem.Strings[ 0], 0)
                   , StrToIntDef(SwapItem.Strings[ 1], 0)
                   , StrToIntDef(SwapItem.Strings[ 2], 0)
                   , StrToIntDef(SwapItem.Strings[ 3], 0)
                   );
end;

// Circle
procedure TuBound.penEllipse(ACanvas: TCanvas; AData: string );
begin
  SwapItem.DelimitedText := AData;
  ACanvas.Ellipse( StrToIntDef(SwapItem.Strings[ 0], 0)
                 , StrToIntDef(SwapItem.Strings[ 1], 0)
                 , StrToIntDef(SwapItem.Strings[ 2], 0)
                 , StrToIntDef(SwapItem.Strings[ 3], 0)
                 );
end;

// Undo : Redo (On/Off)
procedure TuBound.onUndoRedo();
begin
  //  Undo
  if work_Data.Count > 0 then
  begin
    if sbUndo.Enabled = False then sbUndo.Enabled := True;
  end
  else
  begin
    if sbUndo.Enabled = True then sbUndo.Enabled := False;
  end;
  // Redo
  if redo_List.Count > 0 then
  begin
    if sbRedo.Enabled = False then sbRedo.Enabled := True;
  end
  else
  begin
    if sbRedo.Enabled = True then sbRedo.Enabled := False;
  end;
end;

end.
