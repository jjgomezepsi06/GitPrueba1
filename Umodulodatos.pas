unit Umodulodatos;

interface

uses
  SysUtils, Classes, DB, ADODB;

type
  TModuloDatos = class(TDataModule)
    ADOConnection1: TADOConnection;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  ModuloDatos: TModuloDatos;

implementation

{$R *.dfm}

end.
