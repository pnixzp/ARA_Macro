object uIOBound: TuIOBound
  Left = 0
  Top = 0
  BorderStyle = bsSingle
  Caption = 'Bound Import/Export'
  ClientHeight = 610
  ClientWidth = 710
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  OnCreate = FormCreate
  OnHelp = FormHelp
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object cKey: TPanel
    Left = 0
    Top = 567
    Width = 710
    Height = 43
    Align = alBottom
    BevelOuter = bvNone
    ParentBackground = False
    ParentColor = True
    TabOrder = 0
    object Bevel1: TBevel
      Left = 0
      Top = 0
      Width = 710
      Height = 4
      Align = alTop
      Shape = bsBottomLine
      ExplicitWidth = 700
    end
    object Bevel2: TBevel
      AlignWithMargins = True
      Left = 74
      Top = 7
      Width = 2
      Height = 33
      Margins.Right = 0
      Align = alLeft
      ExplicitLeft = 69
      ExplicitTop = 6
    end
    object Bevel3: TBevel
      AlignWithMargins = True
      Left = 199
      Top = 7
      Width = 2
      Height = 33
      Margins.Left = 2
      Margins.Right = 0
      Align = alLeft
      ExplicitLeft = 214
      ExplicitTop = 10
    end
    object Bevel4: TBevel
      AlignWithMargins = True
      Left = 585
      Top = 7
      Width = 2
      Height = 33
      Margins.Right = 0
      Align = alRight
      ExplicitLeft = 424
      ExplicitTop = 6
    end
    object sbUndo: TSpeedButton
      AlignWithMargins = True
      Left = 1
      Top = 6
      Width = 70
      Height = 35
      Margins.Left = 1
      Margins.Top = 2
      Margins.Right = 0
      Margins.Bottom = 2
      Align = alLeft
      Caption = 'Undo'
      OnClick = sbUndoClick
    end
    object sbImport: TSpeedButton
      AlignWithMargins = True
      Left = 77
      Top = 6
      Width = 120
      Height = 35
      Margins.Left = 1
      Margins.Top = 2
      Margins.Right = 0
      Margins.Bottom = 2
      Align = alLeft
      Caption = 'Bound Import(Add)'
      OnClick = sbImportClick
    end
    object sbExport: TSpeedButton
      AlignWithMargins = True
      Left = 588
      Top = 6
      Width = 120
      Height = 35
      Margins.Left = 1
      Margins.Top = 2
      Margins.Right = 2
      Margins.Bottom = 2
      Align = alRight
      Caption = 'Bound Export'
      OnClick = sbExportClick
      ExplicitLeft = 516
      ExplicitTop = 5
    end
  end
  object fDump: TMemo
    Left = 0
    Top = 0
    Width = 710
    Height = 567
    Align = alClient
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = #48148#53461#52404
    Font.Style = []
    ParentFont = False
    TabOrder = 1
    WantReturns = False
  end
end
