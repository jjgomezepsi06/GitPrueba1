unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Grids, DB, ADODB, Buttons, DBGrids, ComCtrls, ImgList,
  DBCtrls;

type
  TForm1 = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Edit2: TEdit;
    Edit3: TEdit;
    Edit4: TEdit;
    Edit5: TEdit;
    Edit6: TEdit;
    Label7: TLabel;
    Label8: TLabel;
    ADOQuery1: TADOQuery;
    DBGrid1: TDBGrid;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    BitBtn4: TBitBtn;
    DataSource1: TDataSource;
    ComboBox1: TComboBox;
    ComboBox2: TComboBox;
    DateTimePicker1: TDateTimePicker;
    QRYDEPARTAMENTOS: TADOQuery;
    DataSource2: TDataSource;
    DBLookupComboBox1: TDBLookupComboBox;
    Label9: TLabel;
    QRYDEPARTAMENTOScod_depart: TStringField;
    QRYDEPARTAMENTOSnom_depart: TStringField;
    DBLookupComboBox2: TDBLookupComboBox;
    QRYCIUDAD: TADOQuery;
    DataSource3: TDataSource;
    QRYCIUDADcod_ciudad: TStringField;
    QRYCIUDADnom_ciudad: TStringField;
    QRYCIUDADcod_depart: TStringField;
    Label10: TLabel;
    ADOQuery1TIP_DOCUMENTO_BEN: TStringField;
    ADOQuery1NUM_DOCUMENTO_BEN: TStringField;
    ADOQuery1PRI_APELLIDO: TStringField;
    ADOQuery1SEG_APELLIDO: TStringField;
    ADOQuery1PRI_NOMBRE: TStringField;
    ADOQuery1NOM_NOMBRE: TStringField;
    ADOQuery1FEC_NACIMIENTO: TStringField;
    ADOQuery1SEXO: TStringField;
    ADOQuery1COD_DEPART: TStringField;
    ADOQuery1COD_CIUDAD: TStringField;
    qryconsulta: TADOQuery;
    DataSource4: TDataSource;
    qryconsultaTIP_DOCUMENTO_BEN: TStringField;
    qryconsultaNUM_DOCUMENTO_BEN: TStringField;
    qryconsultaPRI_APELLIDO: TStringField;
    qryconsultaSEG_APELLIDO: TStringField;
    qryconsultaPRI_NOMBRE: TStringField;
    qryconsultaNOM_NOMBRE: TStringField;
    qryconsultaFEC_NACIMIENTO: TStringField;
    qryconsultaSEXO: TStringField;
    qryconsultaCOD_DEPART: TStringField;
    qryconsultaCOD_CIUDAD: TStringField;
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure Edit3Exit(Sender: TObject);
    procedure Edit4Exit(Sender: TObject);
    procedure Edit5Exit(Sender: TObject);
    procedure Edit6Exit(Sender: TObject);
    procedure Edit2KeyPress(Sender: TObject; var Key: Char);
    procedure DBLookupComboBox1Click(Sender: TObject);
    
    { Private declarations }
      procedure refrescar;
      procedure limpiar;
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

uses Umodulodatos;

procedure TForm1.refrescar;  // PROCEDMIENTO PARA REFRESCAR QUERY
  begin
     ADOQuery1.SQL.Clear;
     ADOQuery1.SQL.add('select * from formulario');
     ADOQuery1.Open;

  end;
procedure TForm1.limpiar; // PROCEDIMIENTO PARA LIMPIAR CELDAS
begin

     Edit2.Text:=('');
     Edit3.Text:=('');
     Edit4.Text:=('');
     Edit5.Text:=('');
     Edit6.Text:=('');


end;

procedure TForm1.BitBtn1Click(Sender: TObject); //////////INSERTAR
begin
  if
     (Edit2.Text='') or
     (Edit3.Text='') or
     (Edit5.Text='') then
     begin
        ShowMessage('Datos invalidos');
        Exit;
     end
      else
        ADOQuery1.SQL.Clear;
        ADOQuery1.SQL.Add('select * from formulario where num_documento_ben =:numdoc ');
        ADOQuery1.Parameters.ParamByName('numdoc').value:=trim(edit2.Text);
        ADOQuery1.Open;

        if(Edit2.Text=ADOQuery1.FieldByName('num_documento_ben').AsString)then
       begin
          ShowMessage('el documento'''+Edit2.Text+'''ya se encuentra registrado');
       end
        else
          TRY
           ModuloDatos.ADOConnection1.BEGINTRANS;  //INICIA LA TRANSACCION
           ADOQuery1.CLOSE;
           ADOQuery1.SQL.Clear;
           ADOQuery1.SQL.Add('insert into formulario values (:"TIPO",:"DOCUMENTO",'+
                              ':"APELLIDO1",:"APELLIDO2",:"NOMBRE1",:"NOMBRE2",'+
                              ':"FECHANAC",:"SEX",:"DEPART",:"CIUDAD")') ;
            ADOQuery1.Parameters[0].Value := (ComboBox1.Text);
            ADOQuery1.Parameters[1].Value := TRIM(Edit2.Text);
            ADOQuery1.Parameters[2].Value := TRIM(Edit3.Text);
            ADOQuery1.Parameters[3].Value := TRIM(Edit4.Text);
            ADOQuery1.Parameters[4].Value := TRIM(Edit5.Text);
            ADOQuery1.Parameters[5].Value := TRIM(Edit6.Text);
            ADOQuery1.Parameters[6].Value := DateToStr(DateTimePicker1.Date);
            ADOQuery1.Parameters[7].Value := (ComboBox2.Text);
            ADOQuery1.Parameters[8].Value := (DBLookupComboBox1.Text);
            ADOQuery1.Parameters[9].Value := (DBLookupComboBox2.Text);
            ADOQuery1.ExecSQL;



           ModuloDatos.ADOConnection1.CommitTrans;  //DT CONEXION ES LA CONEXION
           refrescar;
           limpiar;
           ShowMessage('Datos almacenados');
          EXCEPT
             ModuloDatos.ADOConnection1.ROLLBACKTRANS;
             SHOWMESSAGE('ERROR'+ ModuloDatos.ADOConnection1.Errors[0].Description);
             EXIT;
          END;


end;


procedure TForm1.BitBtn3Click(Sender: TObject);   ////BUSCAR
begin
  if
    (Edit2.Text='')then
    begin
        ShowMessage('Lo siento dato invalido');
        Exit;
    end
      else
        qryconsulta.SQL.Clear;
        qryconsulta.SQL.add('select * from formulario where tip_documento_ben=:TIPODOC and num_documento_ben =:NUMDOC ');
        qryconsulta.Parameters.ParamByName('TIPODOC').Value := (ComboBox1.Text);
        qryconsulta.Parameters.ParamByName('NUMDOC').Value := TRIM(Edit2.Text);
        qryconsulta.Open;
        if not qryconsulta.Eof then
          begin
          QRYDEPARTAMENTOS.Close;
          QRYDEPARTAMENTOS.Open;

          QRYCIUDAD.Close;
          QRYCIUDAD.Open;

            ComboBox1.Text:=qryconsulta.FieldByName('TIP_DOCUMENTO_BEN').AsString;
            Edit2.Text:=qryconsulta.FieldByName('NUM_DOCUMENTO_BEN').AsString;
            Edit3.Text:=qryconsulta.FieldByName('PRI_APELLIDO').AsString;
            Edit4.Text:=qryconsulta.FieldByName('SEG_APELLIDO').AsString;
            Edit5.Text:=qryconsulta.FieldByName('PRI_NOMBRE').AsString;
            Edit6.Text:=qryconsulta.FieldByName('NOM_NOMBRE').AsString;
            DateTimePicker1.date:=StrToDate(qryconsulta.FieldByName('FEC_NACIMIENTO').AsString);
            ComboBox2.Text:=qryconsulta.FieldByName('SEXO').AsString;
            DBLookupComboBox1.KeyValue:=qryconsultaCOD_DEPART.Value;
            DBLookupComboBox2.KeyValue:=qryconsultaCOD_CIUDAD.Value;
            ShowMessage('Datos encontrados');

            Exit;
          end;

        ShowMessage('Datos no encontrados');
        refrescar;
        limpiar;


end;



procedure TForm1.BitBtn2Click(Sender: TObject);  /////MODIFICAR
begin
  if
     (Edit2.Text='') or
     (Edit3.Text='') or
     (Edit4.Text='') or
     (Edit5.Text='') or
     (Edit6.Text='') then
     Begin
      ShowMessage('Datos invdalidos');
      Exit;
     end
      else
        if MessageDlg('seguro que quieres cambiar el documento '''+qryconsultaNUM_DOCUMENTO_BEN.Value+''' ??',mtConfirmation,[mbYes,mbNo],0)=mrYes then
          begin
            ADOQuery1.SQL.Clear;
            ADOQuery1.SQL.Add('Update formulario set NUM_DOCUMENTO_BEN:=DOCUMENTO ,'+
            'PRI_APELLIDO=:APELLIDO1,SEG_APELLIDO=:APELLIDO2,PRI_NOMBRE=:NOMBRE1,NOM_NOMBRE=:NOMBRE2,FEC_NACIMIENTO=:FECHANAC'
            +',SEXO=:SEX,COD_DEPART=:DEPART,COD_CIUDAD=:CIUDAD WHERE NUM_DOCUMENTO_BEN=:DOCUMENTO');


            ADOQuery1.Parameters.ParamByName('DOCUMENTO').Value:=TRIM(Edit2.Text);
            ADOQuery1.Parameters.ParamByName('APELLIDO1').Value:=TRIM(Edit3.Text);
            ADOQuery1.Parameters.ParamByName('APELLIDO2').Value:=TRIM(Edit4.Text);
            ADOQuery1.Parameters.ParamByName('NOMBRE1').Value:=TRIM(Edit5.Text);
            ADOQuery1.Parameters.ParamByName('NOMBRE2').Value:=TRIM(Edit6.Text);
            ADOQuery1.Parameters.ParamByName('FECHANAC').Value:=DateToStr(DateTimePicker1.DATE);
            ADOQuery1.Parameters.ParamByName('SEX').Value:=(ComboBox2.Text);
            ADOQuery1.Parameters.ParamByName('DEPART').Value:=(DBLookupComboBox1.Text);
            ADOQuery1.Parameters.ParamByName('CIUDAD').Value:=(DBLookupComboBox2.Text);
            ADOQuery1.Parameters.ParamByName('DOCUMENTO').Value := qryconsultaNUM_DOCUMENTO_BEN.Value;



            ADOQuery1.ExecSQL;

            refrescar;
            limpiar;
            ShowMessage('Datos modificados');
          end;
end;

procedure TForm1.BitBtn4Click(Sender: TObject); ////ELIMINAR
begin
  if
     (Edit2.Text='') then
     begin
      ShowMessage('Datos invalidos');
      Exit;
     end
       else
       ADOQuery1.SQL.Clear; //LIMPIA LA CONSULTA
       ADOQuery1.SQL.Add('select * from formulario where TIP_DOCUMENTO_BEN=:tipodoc and NUM_DOCUMENTO_BEN=:documento');
       ADOQuery1.Parameters.ParamByName('tipodoc').Value:=(ComboBox1.Text);
       ADOQuery1.Parameters.ParamByName('documento').Value:=TRIM(Edit2.Text);
       ADOQuery1.Open;  //ABRE LA CONSULTA

        if MessageDlg('seguro que quieres eliminar el documento '''+Edit2.Text+''' ??',mtConfirmation,[mbYes,mbNo],0)=mrYes then
          begin
           if (Edit2.Text <> ADOQuery1.FieldByName('NUM_DOCUMENTO_BEN').AsString)then
            begin
              ShowMessage('dato con documento'''+Edit2.Text+''' no registrado');
              refrescar;
              Exit;
            end
              else
              ADOQuery1.SQL.Clear;
              ADOQuery1.SQL.Add('delete from formulario where NUM_DOCUMENTO_BEN=:documento ');
              ADOQuery1.Parameters.ParamByName('documento').Value:=TRIM(Edit2.Text);
              ADOQuery1.ExecSQL; //EJECUTA LA CONSULTA SOLO PARA(UPDATE,INSERT Y DELETE )

              refrescar;
              ShowMessage('dato eliminado');

          end


end;



procedure TForm1.Edit3Exit(Sender: TObject); //PROCEDIMIENTO PARA CAPTURAR SOLO CARACTERES
var
i:integer;
begin


       FOR i:=1 TO Length(edit3.text) DO
            BEGIN
              IF ((edit3.text[i]='1') OR (edit3.text[i]='2') OR (edit3.text[i]='3') OR (edit3.text[i]='4') OR (edit3.text[i]='5')
               OR (edit3.text[i]='6') OR (edit3.text[i]='7') OR (edit3.text[i]='8') OR (edit3.text[i]='9') OR (edit3.text[i]='0')) THEN
                BEGIN
                    ShowMessage('ERROR! primer apellido con numeros');
                    edit3.SetFocus;
                    EXIT;
                END;
            END;

end;

procedure TForm1.Edit4Exit(Sender: TObject); //PROCEDIMIENTO PARA CAPTURAR SOLO CARACTERES
var
i:integer;
begin
  FOR i:=1 TO Length(edit4.text) DO
            BEGIN
              IF ((edit4.text[i]='1') OR (edit4.text[i]='2') OR (edit4.text[i]='3') OR (edit4.text[i]='4') OR (edit4.text[i]='5')
               OR (edit4.text[i]='6') OR (edit4.text[i]='7') OR (edit4.text[i]='8') OR (edit4.text[i]='9') OR (edit4.text[i]='0')) THEN
                BEGIN
                    ShowMessage('ERROR! Segundo apellido con numeros');
                    edit4.SetFocus;
                    EXIT;
                END;
            END;
end;

procedure TForm1.Edit5Exit(Sender: TObject); //PROCEDIMIENTO PARA CAPTURAR SOLO CARACTERES
var
i:integer;
begin
  FOR i:=1 TO Length(edit5.text) DO
            BEGIN
              IF ((edit5.text[i]='1') OR (edit5.text[i]='2') OR (edit5.text[i]='3') OR (edit5.text[i]='4') OR (edit5.text[i]='5')
               OR (edit5.text[i]='6') OR (edit5.text[i]='7') OR (edit5.text[i]='8') OR (edit5.text[i]='9') OR (edit5.text[i]='0')) THEN
                BEGIN
                    ShowMessage('ERROR! Primer Nombre con numeros');
                    edit5.SetFocus;
                    EXIT;
                END;
  END;
end;

procedure TForm1.Edit6Exit(Sender: TObject); //PROCEDIMIENTO PARA CAPTURAR SOLO CARACTERES
var
i:integer;
begin
  FOR i:=1 TO Length(edit6.text) DO
            BEGIN
              IF ((edit6.text[i]='1') OR (edit6.text[i]='2') OR (edit6.text[i]='3') OR (edit6.text[i]='4') OR (edit6.text[i]='5')
               OR (edit6.text[i]='6') OR (edit6.text[i]='7') OR (edit6.text[i]='8') OR (edit6.text[i]='9') OR (edit6.text[i]='0')) THEN
                BEGIN
                    ShowMessage('ERROR! Segundo Nombre con numeros');
                    edit6.SetFocus;
                    EXIT;
                END;
  END;
end;

procedure TForm1.Edit2KeyPress(Sender: TObject; var Key: Char); //PROCEDIMIENTO PARA CAPTURAR SOLO NUMEROS
  var
  i:integer;
begin
    //controlar entrada solo números y punto decimal
    if ( StrScan('0123456789.' + chr(7) + chr(8), Key) = nil ) then Key := #0;
    //cambiar punto decimal por coma
    if key = '.' then key := ',';
    //controlar entrada una sola coma
    for i := 1 to length(Edit2.Text) do
    if ( copy(Edit2.Text,i,1) = ',' ) and not ( StrScan(',', Key) = nil ) then Key := #0;

end;

procedure TForm1.DBLookupComboBox1Click(Sender: TObject);
begin

QRYCIUDAD.Close;
QRYCIUDAD.SQL.Clear;
QRYCIUDAD.SQL.Add('SELECT * FROM CIUDAD WHERE COD_DEPART=:"DEPARTAMENTO"');
QRYCIUDAD.PARAMETERS.PARAMBYNAME('DEPARTAMENTO').VALUE:=DBLookupComboBox1.KeyValue;
QRYCIUDAD.Open;




end;



end.
