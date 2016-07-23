unit UMain;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, DB,
  DBClient, Grids, DBGrids;

type
  TfMain = class(TForm)
    cdsMain: TClientDataSet;
    gdMain: TDBGrid;
    dsMain: TDataSource;
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
    FsParametroInicializacao: string;

    procedure ArmazenarParametroInicializacao;
    procedure CarregarArquivoDados(const sArquivo: string);
  public
    { Public declarations }
  end;

var
  fMain: TfMain;

implementation

{$R *.DFM}

procedure TfMain.FormCreate(Sender: TObject);
begin
  ArmazenarParametroInicializacao;
  CarregarArquivoDados(FsParametroInicializacao);
end;

procedure TfMain.ArmazenarParametroInicializacao;
begin
  FsParametroInicializacao := Trim(ParamStr(1));
end;

procedure TfMain.CarregarArquivoDados(const sArquivo: string);
begin
  if (sArquivo = '') or (not FileExists(sArquivo)) then
    Exit;

  cdsMain.LoadFromFile(sArquivo);
end;

end.

