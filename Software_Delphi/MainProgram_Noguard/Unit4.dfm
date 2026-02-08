object Form4: TForm4
  Left = 343
  Top = 233
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Confirm'
  ClientHeight = 73
  ClientWidth = 142
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object l: TLabel
    Left = 24
    Top = 8
    Width = 102
    Height = 20
    Caption = 'Are you sure ?'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object Button1: TButton
    Left = 40
    Top = 40
    Width = 25
    Height = 25
    Caption = 'Y'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 80
    Top = 40
    Width = 25
    Height = 25
    Caption = 'N'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 1
    OnClick = Button2Click
  end
end
