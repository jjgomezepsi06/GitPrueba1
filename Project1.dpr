program Project1;

uses
  Forms,
  Unit1 in 'Unit1.pas' {Form1},
  Uinicio in 'Uinicio.pas' {Form2},
  Umodulodatos in 'Umodulodatos.pas' {ModuloDatos: TDataModule};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TModuloDatos, ModuloDatos);
  Application.CreateForm(TForm2, Form2);
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
