object Form1: TForm1
  Left = 402
  Top = 228
  Caption = 'Form1'
  ClientHeight = 589
  ClientWidth = 1043
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 24
    Top = 48
    Width = 98
    Height = 13
    Caption = 'TIPO DOCUMENTO'
  end
  object Label2: TLabel
    Left = 296
    Top = 48
    Width = 70
    Height = 13
    Caption = 'DOCUMENTO'
  end
  object Label3: TLabel
    Left = 512
    Top = 120
    Width = 92
    Height = 13
    Caption = 'PRIMER NOMBRE'
  end
  object Label4: TLabel
    Left = 752
    Top = 120
    Width = 96
    Height = 13
    Caption = 'SEUNDO NOMBRE'
  end
  object Label5: TLabel
    Left = 16
    Top = 120
    Width = 97
    Height = 13
    Caption = 'PRIMER APELLIDO'
  end
  object Label6: TLabel
    Left = 248
    Top = 120
    Width = 109
    Height = 13
    Caption = 'SEGUNDO APELLIDO'
  end
  object Label7: TLabel
    Left = 24
    Top = 176
    Width = 105
    Height = 13
    Caption = 'FECHA NACIMIENTO'
  end
  object Label8: TLabel
    Left = 264
    Top = 176
    Width = 29
    Height = 13
    Caption = 'SEXO'
  end
  object Label9: TLabel
    Left = 456
    Top = 176
    Width = 90
    Height = 13
    Caption = 'DEPARTAMENTO'
  end
  object Label10: TLabel
    Left = 704
    Top = 176
    Width = 41
    Height = 13
    Caption = 'CIUDAD'
  end
  object Edit2: TEdit
    Left = 376
    Top = 40
    Width = 121
    Height = 21
    TabOrder = 0
    OnKeyPress = Edit2KeyPress
  end
  object Edit3: TEdit
    Left = 120
    Top = 112
    Width = 121
    Height = 21
    TabOrder = 1
    OnExit = Edit3Exit
  end
  object Edit4: TEdit
    Left = 368
    Top = 112
    Width = 121
    Height = 21
    TabOrder = 2
    OnExit = Edit4Exit
  end
  object Edit5: TEdit
    Left = 616
    Top = 112
    Width = 121
    Height = 21
    TabOrder = 3
    OnExit = Edit5Exit
  end
  object Edit6: TEdit
    Left = 856
    Top = 112
    Width = 121
    Height = 21
    TabOrder = 4
    OnExit = Edit6Exit
  end
  object DBGrid1: TDBGrid
    Left = 24
    Top = 296
    Width = 993
    Height = 233
    DataSource = DataSource1
    TabOrder = 5
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
  end
  object BitBtn1: TBitBtn
    Left = 144
    Top = 248
    Width = 75
    Height = 25
    Caption = 'INSERTAR'
    TabOrder = 6
    OnClick = BitBtn1Click
  end
  object BitBtn2: TBitBtn
    Left = 376
    Top = 248
    Width = 75
    Height = 25
    Caption = 'MODIFICAR'
    TabOrder = 7
    OnClick = BitBtn2Click
  end
  object BitBtn3: TBitBtn
    Left = 600
    Top = 248
    Width = 75
    Height = 25
    Caption = 'BUSCAR'
    TabOrder = 8
    OnClick = BitBtn3Click
  end
  object BitBtn4: TBitBtn
    Left = 808
    Top = 248
    Width = 75
    Height = 25
    Caption = 'ELIMINAR'
    TabOrder = 9
    OnClick = BitBtn4Click
  end
  object ComboBox1: TComboBox
    Left = 128
    Top = 40
    Width = 145
    Height = 21
    ItemIndex = 0
    TabOrder = 10
    Text = 'CC'
    Items.Strings = (
      'CC'
      'TI'
      'RC'
      'CN')
  end
  object ComboBox2: TComboBox
    Left = 304
    Top = 168
    Width = 145
    Height = 21
    ItemIndex = 0
    TabOrder = 11
    Text = 'FEMENINO'
    Items.Strings = (
      'FEMENINO'
      'MASCULINO')
  end
  object DateTimePicker1: TDateTimePicker
    Left = 136
    Top = 168
    Width = 121
    Height = 21
    Date = 43993.000000000000000000
    Time = 0.557645138891530200
    TabOrder = 12
  end
  object DBLookupComboBox1: TDBLookupComboBox
    Left = 553
    Top = 168
    Width = 145
    Height = 21
    KeyField = 'cod_depart'
    ListField = 'nom_depart'
    ListSource = DataSource2
    TabOrder = 13
    OnClick = DBLookupComboBox1Click
  end
  object DBLookupComboBox2: TDBLookupComboBox
    Left = 752
    Top = 168
    Width = 145
    Height = 21
    KeyField = 'cod_ciudad'
    ListField = 'nom_ciudad'
    ListSource = DataSource3
    TabOrder = 14
  end
  object ADOQuery1: TADOQuery
    Connection = ModuloDatos.ADOConnection1
    CursorType = ctStatic
    Filtered = True
    Parameters = <>
    SQL.Strings = (
      'select * from formulario')
    Left = 624
    Top = 16
    object ADOQuery1TIP_DOCUMENTO_BEN: TStringField
      FieldName = 'TIP_DOCUMENTO_BEN'
      Size = 5
    end
    object ADOQuery1NUM_DOCUMENTO_BEN: TStringField
      FieldName = 'NUM_DOCUMENTO_BEN'
    end
    object ADOQuery1PRI_APELLIDO: TStringField
      FieldName = 'PRI_APELLIDO'
      Size = 50
    end
    object ADOQuery1SEG_APELLIDO: TStringField
      FieldName = 'SEG_APELLIDO'
      Size = 50
    end
    object ADOQuery1PRI_NOMBRE: TStringField
      FieldName = 'PRI_NOMBRE'
      Size = 50
    end
    object ADOQuery1NOM_NOMBRE: TStringField
      FieldName = 'NOM_NOMBRE'
      Size = 50
    end
    object ADOQuery1FEC_NACIMIENTO: TStringField
      FieldName = 'FEC_NACIMIENTO'
      Size = 50
    end
    object ADOQuery1SEXO: TStringField
      FieldName = 'SEXO'
      Size = 50
    end
    object ADOQuery1COD_DEPART: TStringField
      FieldName = 'COD_DEPART'
      Size = 6
    end
    object ADOQuery1COD_CIUDAD: TStringField
      FieldName = 'COD_CIUDAD'
      Size = 6
    end
  end
  object DataSource1: TDataSource
    DataSet = ADOQuery1
    Left = 664
    Top = 16
  end
  object QRYDEPARTAMENTOS: TADOQuery
    Connection = ModuloDatos.ADOConnection1
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'SELECT * FROM DEPARTAMENTO')
    Left = 640
    Top = 192
    object QRYDEPARTAMENTOScod_depart: TStringField
      FieldName = 'cod_depart'
      Size = 6
    end
    object QRYDEPARTAMENTOSnom_depart: TStringField
      FieldName = 'nom_depart'
    end
  end
  object DataSource2: TDataSource
    DataSet = QRYDEPARTAMENTOS
    Left = 672
    Top = 192
  end
  object QRYCIUDAD: TADOQuery
    Connection = ModuloDatos.ADOConnection1
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'SELECT * FROM CIUDAD')
    Left = 840
    Top = 192
    object QRYCIUDADcod_ciudad: TStringField
      FieldName = 'cod_ciudad'
      Size = 6
    end
    object QRYCIUDADnom_ciudad: TStringField
      FieldName = 'nom_ciudad'
      Size = 50
    end
    object QRYCIUDADcod_depart: TStringField
      FieldName = 'cod_depart'
      Size = 6
    end
  end
  object DataSource3: TDataSource
    DataSet = QRYCIUDAD
    Left = 872
    Top = 192
  end
  object qryconsulta: TADOQuery
    Active = True
    Connection = ModuloDatos.ADOConnection1
    CursorType = ctStatic
    Filtered = True
    DataSource = DataSource1
    Parameters = <>
    SQL.Strings = (
      'select * from formulario')
    Left = 816
    Top = 16
    object qryconsultaTIP_DOCUMENTO_BEN: TStringField
      FieldName = 'TIP_DOCUMENTO_BEN'
      Size = 5
    end
    object qryconsultaNUM_DOCUMENTO_BEN: TStringField
      FieldName = 'NUM_DOCUMENTO_BEN'
    end
    object qryconsultaPRI_APELLIDO: TStringField
      FieldName = 'PRI_APELLIDO'
      Size = 50
    end
    object qryconsultaSEG_APELLIDO: TStringField
      FieldName = 'SEG_APELLIDO'
      Size = 50
    end
    object qryconsultaPRI_NOMBRE: TStringField
      FieldName = 'PRI_NOMBRE'
      Size = 50
    end
    object qryconsultaNOM_NOMBRE: TStringField
      FieldName = 'NOM_NOMBRE'
      Size = 50
    end
    object qryconsultaFEC_NACIMIENTO: TStringField
      FieldName = 'FEC_NACIMIENTO'
      Size = 50
    end
    object qryconsultaSEXO: TStringField
      FieldName = 'SEXO'
      Size = 50
    end
    object qryconsultaCOD_DEPART: TStringField
      FieldName = 'COD_DEPART'
      Size = 6
    end
    object qryconsultaCOD_CIUDAD: TStringField
      FieldName = 'COD_CIUDAD'
      Size = 6
    end
  end
  object DataSource4: TDataSource
    DataSet = qryconsulta
    Left = 872
    Top = 16
  end
end
