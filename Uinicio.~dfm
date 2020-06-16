object Form2: TForm2
  Left = 596
  Top = 269
  Width = 339
  Height = 417
  Caption = 'Form2'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 40
    Top = 112
    Width = 49
    Height = 13
    Caption = 'USUARIO'
  end
  object Label2: TLabel
    Left = 40
    Top = 152
    Width = 74
    Height = 13
    Caption = 'CONTRASE'#209'A'
  end
  object Label3: TLabel
    Left = 120
    Top = 48
    Width = 66
    Height = 13
    Caption = 'BIENVENIDO'
  end
  object Edit1: TEdit
    Left = 128
    Top = 144
    Width = 121
    Height = 21
    TabOrder = 0
    OnChange = Edit1Change
  end
  object BitBtn1: TBitBtn
    Left = 136
    Top = 232
    Width = 75
    Height = 25
    Caption = 'INGRESAR'
    TabOrder = 1
    OnClick = BitBtn1Click
  end
  object DBLookupComboBox1: TDBLookupComboBox
    Left = 128
    Top = 104
    Width = 145
    Height = 21
    KeyField = 'usuario'
    ListField = 'usuario'
    ListSource = DataSource1
    TabOrder = 2
  end
  object ADOQuery1: TADOQuery
    Connection = ModuloDatos.ADOConnection1
    Parameters = <>
    SQL.Strings = (
      'SELECT * FROM flogin')
    Left = 216
    Top = 16
    object ADOQuery1usuario: TStringField
      FieldName = 'usuario'
      Size = 50
    end
    object ADOQuery1contrasea: TStringField
      FieldName = 'contrase'#241'a'
      Size = 50
    end
  end
  object DataSource1: TDataSource
    DataSet = ADOQuery1
    Left = 264
    Top = 16
  end
end
