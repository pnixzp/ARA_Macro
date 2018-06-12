object uAbout: TuAbout
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  BorderStyle = bsDialog
  Caption = 'About'
  ClientHeight = 300
  ClientWidth = 380
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  OnHelp = FormHelp
  PixelsPerInch = 96
  TextHeight = 13
  object Button1: TButton
    Left = 289
    Top = 263
    Width = 87
    Height = 33
    Caption = 'OK'
    TabOrder = 0
    OnClick = Button1Click
  end
  object RichEdit1: TRichEdit
    Left = 4
    Top = 4
    Width = 372
    Height = 258
    Font.Charset = HANGEUL_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    Lines.Strings = (
      ''
      #51060#54532#47196#44536#47016#51008' '#54532#47532#50920#50612'(Freeware) '#51077#45768#45796
      #49324#50857' '#51228#50557' '#50630#49845#45768#45796'.'
      ''
      #45908' '#51339#51008' '#44060#48156#44284' '#50868#50689#51012' '#50948#54644#49436' '#44592#48512#47484' '#48155#44256
      #51080#49845#45768#45796'. '#46020#50880#51060' '#46104#49884#47732' '#51025#50896#54644#51452#49464#50836
      ''
      #48176#54252' '#54624' '#44221#50864' '#48324#46020' '#46972#51060#49468#49828' '#51201#50857#54633#45768#45796'.'
      ''
      #45453#54801' : 1079 12 080141  ('#50696#44552#51452':'#50724#51221#54596')'
      ''
      #51077#44552#54980' '#47700#51068#47196' '#50508#47140#51452#49464#50836
      'ara2lucky@daum.net'
      '('#51452#44036#48324' '#54869#51064#54633#45768#45796')')
    ParentFont = False
    ReadOnly = True
    TabOrder = 1
    Zoom = 100
  end
end
