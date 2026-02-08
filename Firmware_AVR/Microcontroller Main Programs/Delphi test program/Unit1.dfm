object Form1: TForm1
  Left = 192
  Top = 107
  Width = 544
  Height = 435
  Caption = 'Form1'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 48
    Top = 80
    Width = 32
    Height = 13
    Caption = 'Label1'
  end
  object Label2: TLabel
    Left = 96
    Top = 216
    Width = 30
    Height = 13
    Caption = 'before'
  end
  object Label3: TLabel
    Left = 312
    Top = 272
    Width = 30
    Height = 13
    Caption = 'before'
  end
  object Label4: TLabel
    Left = 8
    Top = 304
    Width = 87
    Height = 13
    Caption = 'Number of Sample'
  end
  object Label5: TLabel
    Left = 120
    Top = 304
    Width = 93
    Height = 13
    Caption = 'Sampling frequency'
  end
  object Button1: TButton
    Left = 120
    Top = 144
    Width = 75
    Height = 25
    Caption = 'start'
    TabOrder = 0
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 304
    Top = 96
    Width = 75
    Height = 25
    Caption = '378 out'
    TabOrder = 1
    OnClick = Button2Click
  end
  object Button3: TButton
    Left = 48
    Top = 96
    Width = 75
    Height = 25
    Caption = '378 in'
    TabOrder = 2
    OnClick = Button3Click
  end
  object Edit1: TEdit
    Left = 304
    Top = 72
    Width = 121
    Height = 21
    TabOrder = 3
    Text = 'Edit1'
  end
  object Button4: TButton
    Left = 88
    Top = 232
    Width = 75
    Height = 25
    Caption = 'P11'
    TabOrder = 4
    OnClick = Button4Click
  end
  object Button5: TButton
    Left = 288
    Top = 24
    Width = 75
    Height = 25
    Caption = 'disable'
    TabOrder = 5
    OnClick = Button5Click
  end
  object Button6: TButton
    Left = 24
    Top = 24
    Width = 75
    Height = 25
    Caption = 'read'
    TabOrder = 6
    OnClick = Button6Click
  end
  object Button7: TButton
    Left = 112
    Top = 24
    Width = 75
    Height = 25
    Caption = 'write'
    TabOrder = 7
    OnClick = Button7Click
  end
  object Button8: TButton
    Left = 200
    Top = 24
    Width = 75
    Height = 25
    Caption = 'EEprom'
    TabOrder = 8
    OnClick = Button8Click
  end
  object Button9: TButton
    Left = 288
    Top = 144
    Width = 75
    Height = 25
    Caption = 'write 10 byte'
    TabOrder = 9
    OnClick = Button9Click
  end
  object Edit2: TEdit
    Left = 376
    Top = 144
    Width = 70
    Height = 21
    TabOrder = 10
    Text = 'gain'
  end
  object Edit3: TEdit
    Left = 376
    Top = 168
    Width = 70
    Height = 21
    TabOrder = 11
    Text = 'gain'
  end
  object Edit4: TEdit
    Left = 376
    Top = 200
    Width = 70
    Height = 21
    TabOrder = 12
    Text = 'gain'
  end
  object Edit5: TEdit
    Left = 376
    Top = 232
    Width = 70
    Height = 21
    TabOrder = 13
    Text = 'gain'
  end
  object Edit6: TEdit
    Left = 376
    Top = 264
    Width = 70
    Height = 21
    TabOrder = 14
    Text = 'gain'
  end
  object Edit7: TEdit
    Left = 376
    Top = 296
    Width = 70
    Height = 21
    TabOrder = 15
    Text = 'gain'
  end
  object Edit8: TEdit
    Left = 376
    Top = 328
    Width = 70
    Height = 21
    TabOrder = 16
    Text = 'gain'
  end
  object Edit9: TEdit
    Left = 376
    Top = 360
    Width = 70
    Height = 21
    TabOrder = 17
    Text = 'gain'
  end
  object Edit10: TEdit
    Left = 8
    Top = 320
    Width = 105
    Height = 21
    TabOrder = 18
    Text = 'Edit10'
  end
  object Button10: TButton
    Left = 8
    Top = 344
    Width = 75
    Height = 25
    Caption = 'Read Data'
    TabOrder = 19
    OnClick = Button10Click
  end
  object Button11: TButton
    Left = 264
    Top = 296
    Width = 75
    Height = 25
    Caption = 'Speed Check'
    TabOrder = 20
    OnClick = Button11Click
  end
  object Edit11: TEdit
    Left = 120
    Top = 320
    Width = 97
    Height = 21
    TabOrder = 21
    Text = '1'
  end
end
