object Calibration: TCalibration
  Left = 308
  Top = 193
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Calibration'
  ClientHeight = 71
  ClientWidth = 165
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnClose = FormClose
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 8
    Top = 8
    Width = 148
    Height = 13
    Caption = 'Please enter calibration voltage'
  end
  object Label2: TLabel
    Left = 40
    Top = 24
    Width = 86
    Height = 13
    Caption = 'of sensor (mv/g) : '
  end
  object Edit1: TEdit
    Left = 56
    Top = 40
    Width = 57
    Height = 21
    TabOrder = 0
    Text = '100'
  end
end
