object uZoom: TuZoom
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  Caption = 'Zoom'
  ClientHeight = 300
  ClientWidth = 300
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  FormStyle = fsStayOnTop
  OldCreateOrder = False
  Position = poMainFormCenter
  OnClose = FormClose
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  OnHide = FormHide
  OnHelp = FormHelp
  OnResize = FormResize
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object ZoomView: TImage
    Left = 0
    Top = 0
    Width = 300
    Height = 300
    Align = alClient
    Visible = False
    ExplicitWidth = 150
    ExplicitHeight = 150
  end
  object cLevel: TPanel
    AlignWithMargins = True
    Left = 10
    Top = 10
    Width = 280
    Height = 80
    Margins.Left = 10
    Margins.Top = 10
    Margins.Right = 9
    Margins.Bottom = 9
    BevelInner = bvRaised
    BevelOuter = bvLowered
    TabOrder = 0
    object dhLevel: TLabel
      AlignWithMargins = True
      Left = 10
      Top = 2
      Width = 268
      Height = 24
      Margins.Left = 8
      Margins.Top = 0
      Margins.Right = 0
      Margins.Bottom = 0
      Align = alTop
      AutoSize = False
      Caption = 'Zoom Level'
      Layout = tlCenter
      ExplicitLeft = 2
      ExplicitWidth = 274
    end
    object ebLevel: TBevel
      Left = 2
      Top = 26
      Width = 276
      Height = 2
      Align = alTop
      ExplicitTop = 13
      ExplicitWidth = 314
    end
    object dh1x: TLabel
      Left = 7
      Top = 60
      Width = 20
      Height = 16
      Alignment = taCenter
      AutoSize = False
      Caption = '1 x'
      Layout = tlCenter
    end
    object dh2x: TLabel
      Left = 68
      Top = 60
      Width = 20
      Height = 16
      Alignment = taCenter
      AutoSize = False
      Caption = '2 x'
      Layout = tlCenter
    end
    object dh4x: TLabel
      Left = 130
      Top = 60
      Width = 20
      Height = 16
      Alignment = taCenter
      AutoSize = False
      Caption = '4 x'
      Layout = tlCenter
    end
    object dh6x: TLabel
      Left = 191
      Top = 60
      Width = 20
      Height = 16
      Alignment = taCenter
      AutoSize = False
      Caption = '8 x'
      Layout = tlCenter
    end
    object dh8x: TLabel
      Left = 252
      Top = 60
      Width = 20
      Height = 16
      Alignment = taCenter
      AutoSize = False
      Caption = '16 x'
      Layout = tlCenter
    end
    object fLevel: TTrackBar
      AlignWithMargins = True
      Left = 6
      Top = 34
      Width = 268
      Height = 30
      Margins.Left = 4
      Margins.Top = 6
      Margins.Right = 4
      Align = alTop
      Max = 4
      PageSize = 1
      Position = 4
      TabOrder = 0
    end
    object cbCross: TCheckBox
      Left = 202
      Top = 6
      Width = 93
      Height = 17
      Caption = ' Cross on'
      TabOrder = 1
    end
  end
  object rtScan: TTimer
    Enabled = False
    Interval = 36
    OnTimer = rtScanTimer
    Left = 260
    Top = 104
  end
end
