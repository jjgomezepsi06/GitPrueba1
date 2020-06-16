unit Uinicio;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, ADODB, DBCtrls, StdCtrls, Buttons;

type
  TForm2 = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    Edit1: TEdit;
    BitBtn1: TBitBtn;
    Label3: TLabel;
    ADOQuery1: TADOQuery;
    DataSource1: TDataSource;
    ADOQuery1usuario: TStringField;
    ADOQuery1contrasea: TStringField;
    DBLookupComboBox1: TDBLookupComboBox;
    procedure FormCreate(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure Edit1Change(Sender: TObject);
    

  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form2: TForm2;

implementation

uses Umodulodatos, Unit1;

{$R *.dfm}

procedure TForm2.FormCreate(Sender: TObject);
begin
ADOQuery1.Open;
end;



procedure TForm2.BitBtn1Click(Sender: TObject);
begin
 if(DBLookupComboBox1.Text=ADOQuery1.FieldByName('usuario').AsString)and
  (Edit1.Text=ADOQuery1.FieldByName('contraseña').AsString) then
   begin
      ShowMessage('Bienvenido'''+DBLookupComboBox1.Text+'');

      Application.CreateForm(TForm1, Form1);
      Form1.Show;
      Form2.Hide;

   end
   else
    begin
      ShowMessage('Datos incorrectos');
    end;
end;

procedure TForm2.Edit1Change(Sender: TObject);
begin
  edit1.passwordchar:='*';
end;

end.
