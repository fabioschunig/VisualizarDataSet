program VisualizarDataSet;

uses
  Forms,
  UMain in 'UMain.pas' {fMain};

{$R *.RES}

begin
  Application.Initialize;
  Application.CreateForm(TfMain, fMain);
  Application.Run;
end.
