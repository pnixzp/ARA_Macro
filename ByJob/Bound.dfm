object uBound: TuBound
  Left = 0
  Top = 0
  ClientHeight = 617
  ClientWidth = 876
  Color = clBtnFace
  Constraints.MinHeight = 595
  Constraints.MinWidth = 874
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poMainFormCenter
  OnClose = FormClose
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  OnHelp = FormHelp
  OnKeyDown = FormKeyDown
  OnKeyUp = FormKeyUp
  OnResize = FormResize
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object c0Head: TPanel
    Left = 0
    Top = 0
    Width = 876
    Height = 35
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 0
    object c1Style: TPanel
      AlignWithMargins = True
      Left = 2
      Top = 3
      Width = 378
      Height = 30
      Margins.Left = 2
      Margins.Right = 0
      Margins.Bottom = 2
      Align = alLeft
      BevelInner = bvRaised
      BevelOuter = bvLowered
      TabOrder = 0
      object feMode: TLabel
        AlignWithMargins = True
        Left = 4
        Top = 4
        Width = 65
        Height = 21
        HelpType = htKeyword
        Margins.Left = 2
        Margins.Top = 2
        Align = alLeft
        Alignment = taCenter
        AutoSize = False
        Caption = 'Mode'
        Color = clGray
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindow
        Font.Height = -15
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentColor = False
        ParentFont = False
        Transparent = False
        Layout = tlCenter
        ExplicitLeft = 12
        ExplicitTop = 9
      end
      object ebMode: TBevel
        Left = 72
        Top = 2
        Width = 2
        Height = 26
        Align = alLeft
        Shape = bsLeftLine
        ExplicitLeft = 67
      end
      object dhStyle: TLabel
        AlignWithMargins = True
        Left = 76
        Top = 4
        Width = 60
        Height = 21
        HelpType = htKeyword
        Margins.Left = 2
        Margins.Top = 2
        Align = alLeft
        Alignment = taCenter
        AutoSize = False
        Caption = 'Style'
        Color = clGray
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindow
        Font.Height = -15
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentColor = False
        ParentFont = False
        Transparent = False
        Layout = tlCenter
        ExplicitLeft = 4
      end
      object ebStyle: TBevel
        Left = 139
        Top = 2
        Width = 2
        Height = 26
        Align = alLeft
        Shape = bsLeftLine
        ExplicitLeft = 133
      end
      object feStyle: TEdit
        AlignWithMargins = True
        Left = 143
        Top = 4
        Width = 230
        Height = 21
        Hint = 'Profile Name'
        HelpType = htKeyword
        Margins.Left = 2
        Margins.Top = 2
        Align = alClient
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 0
        Text = 'no style'
        ExplicitHeight = 22
      end
    end
    object c2Active: TPanel
      AlignWithMargins = True
      Left = 382
      Top = 3
      Width = 333
      Height = 30
      Margins.Left = 2
      Margins.Right = 2
      Margins.Bottom = 2
      Align = alClient
      BevelInner = bvRaised
      BevelOuter = bvLowered
      TabOrder = 1
      object dhActive: TLabel
        AlignWithMargins = True
        Left = 4
        Top = 4
        Width = 80
        Height = 21
        Margins.Left = 2
        Margins.Top = 2
        Align = alLeft
        Alignment = taCenter
        AutoSize = False
        Caption = 'Active'
        Color = clGray
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindow
        Font.Height = -15
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentColor = False
        ParentFont = False
        Transparent = False
        Layout = tlCenter
        ExplicitLeft = 12
        ExplicitTop = 9
      end
      object ebActive: TBevel
        Left = 87
        Top = 2
        Width = 2
        Height = 26
        Align = alLeft
        Shape = bsLeftLine
        ExplicitLeft = 561
      end
      object feActive: TEdit
        AlignWithMargins = True
        Left = 91
        Top = 4
        Width = 237
        Height = 21
        Hint = 'Profile Name'
        HelpType = htKeyword
        Margins.Left = 2
        Margins.Top = 2
        Align = alClient
        Alignment = taCenter
        Color = 15794144
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        ParentShowHint = False
        ReadOnly = True
        ShowHint = True
        TabOrder = 0
        ExplicitHeight = 22
      end
    end
    object c3Screen: TPanel
      AlignWithMargins = True
      Left = 717
      Top = 3
      Width = 156
      Height = 30
      Margins.Left = 0
      Margins.Bottom = 2
      Align = alRight
      BevelInner = bvRaised
      BevelOuter = bvLowered
      Enabled = False
      TabOrder = 2
      object dhScreen: TLabel
        AlignWithMargins = True
        Left = 4
        Top = 4
        Width = 60
        Height = 21
        HelpType = htKeyword
        Margins.Left = 2
        Margins.Top = 2
        Align = alLeft
        Alignment = taCenter
        AutoSize = False
        Caption = 'Screen'
        Color = clGray
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindow
        Font.Height = -15
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentColor = False
        ParentFont = False
        Transparent = False
        Layout = tlCenter
        ExplicitLeft = 12
        ExplicitTop = 9
      end
      object ebScreen: TBevel
        Left = 67
        Top = 2
        Width = 2
        Height = 26
        Hint = 'APPEND'
        Align = alLeft
        Shape = bsLeftLine
        ExplicitLeft = 795
        ExplicitTop = 0
        ExplicitHeight = 24
      end
      object feScreen: TEdit
        AlignWithMargins = True
        Left = 71
        Top = 4
        Width = 80
        Height = 21
        Hint = 'Profile Name'
        HelpKeyword = 'PROFILE'
        Margins.Left = 2
        Margins.Top = 2
        Align = alClient
        Alignment = taCenter
        Color = clInfoBk
        Enabled = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        ReadOnly = True
        TabOrder = 0
        Text = '0000X0000'
        ExplicitHeight = 22
      end
    end
  end
  object c4Tool: TPanel
    Left = 0
    Top = 35
    Width = 74
    Height = 560
    Align = alLeft
    BevelOuter = bvNone
    TabOrder = 1
    object Bevel0: TBevel
      AlignWithMargins = True
      Left = 0
      Top = 0
      Width = 74
      Height = 2
      Margins.Left = 0
      Margins.Top = 0
      Margins.Right = 0
      Margins.Bottom = 0
      Align = alTop
      Shape = bsTopLine
      ExplicitTop = 4
    end
    object Bevel1: TBevel
      AlignWithMargins = True
      Left = 3
      Top = 39
      Width = 68
      Height = 4
      Margins.Top = 0
      Margins.Bottom = 0
      Align = alTop
      Shape = bsBottomLine
      ExplicitLeft = 2
      ExplicitTop = 35
    end
    object Bevel2: TBevel
      AlignWithMargins = True
      Left = 3
      Top = 74
      Width = 68
      Height = 4
      Margins.Top = 0
      Margins.Bottom = 0
      Align = alTop
      Shape = bsBottomLine
      ExplicitLeft = 2
    end
    object Bevel3: TBevel
      AlignWithMargins = True
      Left = 3
      Top = 171
      Width = 68
      Height = 4
      Margins.Top = 0
      Margins.Bottom = 0
      Align = alTop
      Shape = bsBottomLine
      ExplicitLeft = 7
      ExplicitTop = 84
      ExplicitWidth = 80
    end
    object Bevel4: TBevel
      AlignWithMargins = True
      Left = 3
      Top = 361
      Width = 68
      Height = 4
      Margins.Top = 0
      Margins.Bottom = 0
      Align = alTop
      Shape = bsBottomLine
      ExplicitLeft = 4
      ExplicitTop = 357
    end
    object sbOpen: TSpeedButton
      AlignWithMargins = True
      Left = 2
      Top = 3
      Width = 70
      Height = 36
      Margins.Left = 2
      Margins.Top = 1
      Margins.Right = 2
      Margins.Bottom = 0
      Align = alTop
      Caption = 'ScreenShot'#13#10'File Open'
      ParentShowHint = False
      ShowHint = True
      OnClick = sbOpenClick
      ExplicitLeft = 4
      ExplicitTop = 7
    end
    object sbApply: TSpeedButton
      AlignWithMargins = True
      Left = 2
      Top = 44
      Width = 70
      Height = 30
      Margins.Left = 2
      Margins.Top = 1
      Margins.Right = 2
      Margins.Bottom = 0
      Align = alTop
      Caption = 'Apply'
      ParentShowHint = False
      ShowHint = True
      OnClick = sbApplyClick
      ExplicitTop = 75
    end
    object sbUndo: TSpeedButton
      AlignWithMargins = True
      Left = 2
      Top = 79
      Width = 70
      Height = 30
      Margins.Left = 2
      Margins.Top = 1
      Margins.Right = 2
      Margins.Bottom = 0
      Align = alTop
      Caption = 'Undo'
      ParentShowHint = False
      ShowHint = True
      OnClick = sbUndoClick
      ExplicitTop = 110
    end
    object sbClear: TSpeedButton
      AlignWithMargins = True
      Left = 2
      Top = 110
      Width = 70
      Height = 30
      Margins.Left = 2
      Margins.Top = 1
      Margins.Right = 2
      Margins.Bottom = 0
      Align = alTop
      Caption = 'Clear'
      ParentShowHint = False
      ShowHint = True
      OnClick = sbClearClick
      ExplicitTop = 141
    end
    object sbRedo: TSpeedButton
      AlignWithMargins = True
      Left = 2
      Top = 141
      Width = 70
      Height = 30
      Margins.Left = 2
      Margins.Top = 1
      Margins.Right = 2
      Margins.Bottom = 0
      Align = alTop
      Caption = 'Redo'
      ParentShowHint = False
      ShowHint = True
      OnClick = sbRedoClick
      ExplicitTop = 172
    end
    object sbMove: TSpeedButton
      AlignWithMargins = True
      Left = 2
      Top = 176
      Width = 70
      Height = 30
      Margins.Left = 2
      Margins.Top = 1
      Margins.Right = 2
      Margins.Bottom = 0
      Align = alTop
      GroupIndex = 20
      Caption = 'Move'
      ParentShowHint = False
      ShowHint = True
      OnClick = sbMoveClick
      ExplicitTop = 207
    end
    object sbPencil: TSpeedButton
      AlignWithMargins = True
      Left = 2
      Top = 207
      Width = 70
      Height = 30
      Margins.Left = 2
      Margins.Top = 1
      Margins.Right = 2
      Margins.Bottom = 0
      Align = alTop
      GroupIndex = 20
      Caption = 'Pencil'
      ParentShowHint = False
      ShowHint = True
      OnClick = sbMoveClick
      ExplicitTop = 238
    end
    object sbLine: TSpeedButton
      AlignWithMargins = True
      Left = 2
      Top = 238
      Width = 70
      Height = 30
      Margins.Left = 2
      Margins.Top = 1
      Margins.Right = 2
      Margins.Bottom = 0
      Align = alTop
      GroupIndex = 20
      Caption = 'Line'
      ParentShowHint = False
      ShowHint = True
      OnClick = sbMoveClick
      ExplicitTop = 269
    end
    object sbPloygon: TSpeedButton
      AlignWithMargins = True
      Left = 2
      Top = 269
      Width = 70
      Height = 30
      Margins.Left = 2
      Margins.Top = 1
      Margins.Right = 2
      Margins.Bottom = 0
      Align = alTop
      GroupIndex = 20
      Caption = 'Ploygon'
      ParentShowHint = False
      ShowHint = True
      OnClick = sbMoveClick
      ExplicitTop = 300
    end
    object sbRectangle: TSpeedButton
      AlignWithMargins = True
      Left = 2
      Top = 300
      Width = 70
      Height = 30
      Margins.Left = 2
      Margins.Top = 1
      Margins.Right = 2
      Margins.Bottom = 0
      Align = alTop
      GroupIndex = 20
      Caption = 'Rectangle'
      ParentShowHint = False
      ShowHint = True
      OnClick = sbMoveClick
      ExplicitTop = 331
    end
    object sbEllipse: TSpeedButton
      AlignWithMargins = True
      Left = 2
      Top = 331
      Width = 70
      Height = 30
      Margins.Left = 2
      Margins.Top = 1
      Margins.Right = 2
      Margins.Bottom = 0
      Align = alTop
      GroupIndex = 20
      Caption = 'Ellipse'
      ParentShowHint = False
      ShowHint = True
      OnClick = sbMoveClick
      ExplicitTop = 362
    end
    object sbZoom: TSpeedButton
      AlignWithMargins = True
      Left = 2
      Top = 366
      Width = 70
      Height = 30
      Margins.Left = 2
      Margins.Top = 1
      Margins.Right = 2
      Margins.Bottom = 0
      Align = alTop
      AllowAllUp = True
      GroupIndex = 30
      Caption = 'Zoom'
      ParentShowHint = False
      ShowHint = True
      OnClick = sbZoomClick
      ExplicitLeft = -1
      ExplicitTop = 358
    end
    object veColor: TPanel
      AlignWithMargins = True
      Left = 3
      Top = 398
      Width = 68
      Height = 39
      Margins.Top = 2
      Margins.Bottom = 0
      Align = alTop
      BevelOuter = bvNone
      Color = clGray
      ParentBackground = False
      TabOrder = 0
      object dhFill: TLabel
        AlignWithMargins = True
        Left = 2
        Top = 21
        Width = 45
        Height = 18
        Margins.Left = 2
        Margins.Top = 0
        Margins.Right = 0
        Margins.Bottom = 2
        Alignment = taCenter
        AutoSize = False
        Caption = 'FILL'
        Color = 14737632
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentColor = False
        ParentFont = False
        Transparent = False
        Layout = tlCenter
      end
      object dhLine: TLabel
        AlignWithMargins = True
        Left = 2
        Top = 2
        Width = 45
        Height = 18
        Margins.Left = 2
        Margins.Top = 2
        Margins.Right = 0
        Margins.Bottom = 0
        Alignment = taCenter
        AutoSize = False
        Caption = 'LINE'
        Color = 14737632
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentColor = False
        ParentFont = False
        Transparent = False
        Layout = tlCenter
      end
      object cpLine: TLabel
        AlignWithMargins = True
        Left = 48
        Top = 2
        Width = 18
        Height = 18
        Margins.Left = 2
        Margins.Top = 2
        Margins.Right = 2
        Margins.Bottom = 0
        Alignment = taCenter
        AutoSize = False
        Color = clAqua
        ParentColor = False
        Transparent = False
        Layout = tlCenter
      end
      object cpFill: TLabel
        AlignWithMargins = True
        Left = 48
        Top = 21
        Width = 18
        Height = 18
        Margins.Left = 2
        Margins.Top = 0
        Margins.Right = 2
        Margins.Bottom = 2
        Alignment = taCenter
        AutoSize = False
        Color = clBtnFace
        ParentColor = False
        Transparent = False
        Layout = tlCenter
      end
    end
    object veLine: TPanel
      AlignWithMargins = True
      Left = 3
      Top = 437
      Width = 68
      Height = 62
      Margins.Top = 0
      Margins.Bottom = 0
      Align = alTop
      BevelOuter = bvNone
      Color = clGray
      ParentBackground = False
      TabOrder = 1
      object ebDot1: TPanel
        Tag = 1
        AlignWithMargins = True
        Left = 2
        Top = 2
        Width = 64
        Height = 10
        Margins.Left = 2
        Margins.Top = 2
        Margins.Right = 2
        Margins.Bottom = 2
        Align = alTop
        BevelOuter = bvNone
        Color = clAqua
        ParentBackground = False
        TabOrder = 0
        OnClick = ebDot1Click
        object deDot1: TLabel
          Tag = 1
          AlignWithMargins = True
          Left = 5
          Top = 4
          Width = 54
          Height = 1
          Margins.Left = 5
          Margins.Top = 4
          Margins.Right = 5
          Margins.Bottom = 5
          Align = alClient
          Alignment = taCenter
          AutoSize = False
          Caption = 'FILL'
          Color = clBlack
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentColor = False
          ParentFont = False
          Transparent = False
          Layout = tlCenter
          OnClick = ebDot1Click
          ExplicitLeft = 14
          ExplicitTop = -20
          ExplicitWidth = 40
          ExplicitHeight = 18
        end
      end
      object ebDot2: TPanel
        Tag = 2
        AlignWithMargins = True
        Left = 2
        Top = 14
        Width = 64
        Height = 10
        Margins.Left = 2
        Margins.Top = 0
        Margins.Right = 2
        Margins.Bottom = 2
        Align = alTop
        BevelOuter = bvNone
        Color = 14737632
        ParentBackground = False
        TabOrder = 1
        OnClick = ebDot1Click
        object deDot2: TLabel
          Tag = 2
          AlignWithMargins = True
          Left = 5
          Top = 4
          Width = 54
          Height = 2
          Margins.Left = 5
          Margins.Top = 4
          Margins.Right = 5
          Margins.Bottom = 4
          Align = alClient
          Alignment = taCenter
          AutoSize = False
          Caption = 'LINE'
          Color = clBlack
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentColor = False
          ParentFont = False
          Transparent = False
          Layout = tlCenter
          OnClick = ebDot1Click
          ExplicitLeft = 2
          ExplicitTop = -7
          ExplicitWidth = 40
          ExplicitHeight = 18
        end
      end
      object ebDot3: TPanel
        Tag = 3
        AlignWithMargins = True
        Left = 2
        Top = 26
        Width = 64
        Height = 10
        Margins.Left = 2
        Margins.Top = 0
        Margins.Right = 2
        Margins.Bottom = 2
        Align = alTop
        BevelOuter = bvNone
        Color = 14737632
        ParentBackground = False
        TabOrder = 2
        OnClick = ebDot1Click
        object deDot3: TLabel
          Tag = 3
          AlignWithMargins = True
          Left = 5
          Top = 3
          Width = 54
          Height = 3
          Margins.Left = 5
          Margins.Right = 5
          Margins.Bottom = 4
          Align = alClient
          Alignment = taCenter
          AutoSize = False
          Caption = 'LINE'
          Color = clBlack
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentColor = False
          ParentFont = False
          Transparent = False
          Layout = tlCenter
          OnClick = ebDot1Click
          ExplicitLeft = 2
          ExplicitTop = -7
          ExplicitWidth = 40
          ExplicitHeight = 18
        end
      end
      object ebDot4: TPanel
        Tag = 4
        AlignWithMargins = True
        Left = 2
        Top = 38
        Width = 64
        Height = 10
        Margins.Left = 2
        Margins.Top = 0
        Margins.Right = 2
        Margins.Bottom = 2
        Align = alTop
        BevelOuter = bvNone
        Color = 14737632
        ParentBackground = False
        TabOrder = 3
        OnClick = ebDot1Click
        object deDot4: TLabel
          Tag = 4
          AlignWithMargins = True
          Left = 5
          Top = 3
          Width = 54
          Height = 4
          Margins.Left = 5
          Margins.Right = 5
          Align = alClient
          Alignment = taCenter
          AutoSize = False
          Caption = 'LINE'
          Color = clBlack
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentColor = False
          ParentFont = False
          Transparent = False
          Layout = tlCenter
          OnClick = ebDot1Click
          ExplicitLeft = 2
          ExplicitTop = -7
          ExplicitWidth = 40
          ExplicitHeight = 18
        end
      end
      object ebDot5: TPanel
        Tag = 5
        AlignWithMargins = True
        Left = 2
        Top = 50
        Width = 64
        Height = 10
        Margins.Left = 2
        Margins.Top = 0
        Margins.Right = 2
        Margins.Bottom = 2
        Align = alTop
        BevelOuter = bvNone
        Color = 14737632
        ParentBackground = False
        TabOrder = 4
        OnClick = ebDot1Click
        object deDot5: TLabel
          Tag = 5
          AlignWithMargins = True
          Left = 5
          Top = 2
          Width = 54
          Height = 5
          Margins.Left = 5
          Margins.Top = 2
          Margins.Right = 5
          Align = alClient
          Alignment = taCenter
          AutoSize = False
          Caption = 'LINE'
          Color = clBlack
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentColor = False
          ParentFont = False
          Transparent = False
          Layout = tlCenter
          OnClick = ebDot1Click
          ExplicitLeft = 2
          ExplicitTop = -7
          ExplicitWidth = 40
          ExplicitHeight = 18
        end
      end
    end
  end
  object c5Board: TScrollBox
    Left = 74
    Top = 35
    Width = 802
    Height = 560
    HorzScrollBar.Increment = 1
    HorzScrollBar.Tracking = True
    VertScrollBar.Increment = 1
    VertScrollBar.Tracking = True
    Align = alClient
    BevelInner = bvNone
    BevelOuter = bvNone
    DoubleBuffered = False
    Color = clSilver
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Pitch = fpFixed
    Font.Style = []
    Font.Quality = fqAntialiased
    ParentColor = False
    ParentDoubleBuffered = False
    ParentFont = False
    TabOrder = 2
    object cZone: TPanel
      Left = 2
      Top = 0
      Width = 796
      Height = 556
      AutoSize = True
      BevelOuter = bvNone
      Color = clSilver
      DoubleBuffered = True
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -18
      Font.Name = 'Tahoma'
      Font.Pitch = fpFixed
      Font.Style = []
      Font.Quality = fqAntialiased
      ParentBackground = False
      ParentDoubleBuffered = False
      ParentFont = False
      TabOrder = 0
      object dScreen: TImage
        AlignWithMargins = True
        Left = 8
        Top = 8
        Width = 780
        Height = 540
        Cursor = crCross
        Margins.Left = 8
        Margins.Top = 8
        Margins.Right = 8
        Margins.Bottom = 8
        AutoSize = True
      end
      object fPaint: TPaintBox
        AlignWithMargins = True
        Left = 8
        Top = 8
        Width = 780
        Height = 540
        Cursor = crCross
        Margins.Left = 8
        Margins.Top = 8
        Margins.Right = 8
        Margins.Bottom = 8
        Color = clBlack
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -20
        Font.Name = 'Tahoma'
        Font.Pitch = fpFixed
        Font.Style = []
        Font.Quality = fqAntialiased
        ParentColor = False
        ParentFont = False
        Touch.InteractiveGestures = [igZoom, igPan, igRotate, igTwoFingerTap, igPressAndTap]
        Touch.InteractiveGestureOptions = [igoPanSingleFingerHorizontal, igoPanSingleFingerVertical, igoPanInertia, igoPanGutter, igoParentPassthrough]
        Touch.ParentTabletOptions = False
        Touch.TabletOptions = [toPenTapFeedback, toPenBarrelFeedback, toTouchUIForceOn, toTouchUIForceOff, toTouchSwitch, toFlicks, toSmoothScrolling, toFlickFallbackKeys]
        OnMouseDown = fPaintMouseDown
        OnMouseMove = fPaintMouseMove
        OnMouseUp = fPaintMouseUp
        OnPaint = fPaintPaint
      end
      object gNode: TPanel
        Left = 8
        Top = 8
        Width = 9
        Height = 9
        BevelOuter = bvNone
        Color = clRed
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clFuchsia
        Font.Height = -10
        Font.Name = 'Tahoma'
        Font.Pitch = fpFixed
        Font.Style = []
        Font.Quality = fqAntialiased
        ParentBackground = False
        ParentFont = False
        TabOrder = 0
        Visible = False
        OnClick = gNodeClick
      end
    end
  end
  object ssState: TPanel
    Left = 0
    Top = 595
    Width = 876
    Height = 22
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 3
    object ss0Say: TPanel
      AlignWithMargins = True
      Left = 74
      Top = 0
      Width = 234
      Height = 22
      Margins.Left = 74
      Margins.Top = 0
      Margins.Right = 0
      Margins.Bottom = 0
      Align = alLeft
      Alignment = taLeftJustify
      BevelOuter = bvLowered
      TabOrder = 0
    end
    object ss1Point: TPanel
      Left = 308
      Top = 0
      Width = 38
      Height = 22
      Align = alLeft
      BevelOuter = bvLowered
      Caption = '[ + ]'
      TabOrder = 1
    end
    object ss2Cursor: TPanel
      Left = 346
      Top = 0
      Width = 68
      Height = 22
      Align = alLeft
      BevelOuter = bvLowered
      TabOrder = 2
    end
    object ss5Tool: TPanel
      Left = 520
      Top = 0
      Width = 38
      Height = 22
      Align = alLeft
      BevelOuter = bvLowered
      Caption = '+'
      TabOrder = 3
      object ss5Style: TShape
        AlignWithMargins = True
        Left = 4
        Top = 4
        Width = 31
        Height = 15
        Margins.Right = 2
        Margins.Bottom = 2
        Align = alClient
        Brush.Style = bsClear
        Shape = stSquare
        ExplicitLeft = 7
        ExplicitTop = 7
        ExplicitWidth = 73
      end
    end
    object ss6WH: TPanel
      Left = 558
      Top = 0
      Width = 38
      Height = 22
      Align = alLeft
      BevelOuter = bvLowered
      Caption = 'W,H'
      TabOrder = 4
    end
    object ss8Count: TPanel
      Left = 808
      Top = 0
      Width = 68
      Height = 22
      Align = alClient
      BevelOuter = bvLowered
      TabOrder = 5
    end
    object ss3Action: TPanel
      Left = 414
      Top = 0
      Width = 38
      Height = 22
      Align = alLeft
      BevelOuter = bvLowered
      Caption = 'X,Y'
      TabOrder = 6
    end
    object ss8Node: TPanel
      Left = 664
      Top = 0
      Width = 38
      Height = 22
      Align = alLeft
      BevelOuter = bvLowered
      Caption = '-'#7'-'
      TabOrder = 7
    end
    object ss7Length: TPanel
      Left = 596
      Top = 0
      Width = 68
      Height = 22
      Align = alLeft
      BevelOuter = bvLowered
      TabOrder = 8
    end
    object ss4Accept: TPanel
      Left = 452
      Top = 0
      Width = 68
      Height = 22
      Align = alLeft
      BevelOuter = bvLowered
      ParentBackground = False
      TabOrder = 9
    end
    object ss9List: TPanel
      Left = 702
      Top = 0
      Width = 68
      Height = 22
      Align = alLeft
      BevelOuter = bvLowered
      TabOrder = 10
    end
    object Panel1: TPanel
      Left = 770
      Top = 0
      Width = 38
      Height = 22
      Align = alLeft
      BevelOuter = bvLowered
      Caption = '='
      TabOrder = 11
    end
  end
end
