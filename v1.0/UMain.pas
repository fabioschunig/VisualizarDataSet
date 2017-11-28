unit UMain;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, DB,
  DBClient, Grids, DBGrids, StdCtrls, CheckLst, Buttons, ExtCtrls, ComCtrls;

type
  TInformacoesRodape = (irLinhas, irLinhasFiltradas, irColunas, irColunasVisiveis, irArquivo);

  TfMain = class(TForm)
    cdsMain: TClientDataSet;
    dsMain: TDataSource;
    pnDados: TPanel;
    gdMain: TDBGrid;
    pnLado: TPanel;
    dlgAbrirArquivo: TOpenDialog;
    pnLadoSuperior: TPanel;
    pnLadoInferior: TPanel;
    SpeedButton1: TSpeedButton;
    edDiretorio: TEdit;
    clbArquivos: TCheckListBox;
    edFiltroArq: TEdit;
    lbFiltroClientDataSet: TLabel;
    bAplicarFiltro: TSpeedButton;
    mmFilter: TMemo;
    clbColunas: TCheckListBox;
    edFiltroColunas: TEdit;
    chkTudo: TCheckBox;
    mmOrder: TMemo;
    mmDescend: TMemo;
    pnRodape: TPanel;
    sbInfo: TStatusBar;
    lbDiretorio: TLabel;
    lbFiltroArquivos: TLabel;
    lbFiltroColunas: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure gdMainTitleClick(Column: TColumn);
    procedure clbArquivosDblClick(Sender: TObject);
    procedure edFiltroArqKeyUp(Sender: TObject; var Key: word; Shift: TShiftState);
    procedure edDiretorioKeyUp(Sender: TObject; var Key: word; Shift: TShiftState);
    procedure bAplicarFiltroClick(Sender: TObject);
    procedure ConfigurarFiltroDataSet(const sFiltro: string);
    procedure edFiltroColunasKeyUp(Sender: TObject; var Key: word; Shift: TShiftState);
    procedure clbColunasClickCheck(Sender: TObject);
    procedure chkTudoClick(Sender: TObject);
    procedure pnLadoResize(Sender: TObject);
  private
    { Private declarations }
    FsParametroInicializacao: string;
    FsExtensoes: string;
    FoItemsChecked: TStringList;
    FoItemsUnchecked: TStringList;

    procedure ArmazenarParametroInicializacao;
    procedure CarregarArquivoDados(const psArquivo: string);
    procedure ListarOutrosArquivos(const psDiretorio, psFiltro: string);
    function TestarFiltroNomeArquivo(const psNomeArquivo: string): boolean;

    function RetornarNomeArquivoINI: string;
    procedure CarregarConfiguracao;
    procedure SalvarConfiguracao;

    procedure CarregarColunas;
    function RetornarListaDeColunas: string;
    procedure RemarcarItens;

    procedure AdicionarNaLista(oLista: TStringList; const sColuna: string);
    procedure RemoverDaLista(oLista: TStringList; const sColuna: string);
    procedure ControleDasListas(const sColuna: string; const bChecked: boolean);

    procedure MostrarMensagemRodape(irInformacao: TInformacoesRodape; const sTexto: string);
  public
    { Public declarations }
  end;

var
  fMain: TfMain;

const
  S_EXTENSOES_PADRAO: string =
    '*.chd; *.dat|*.chd; *.dat|*.chd|*.chd|*.dat|*.dat|Todos os arquivos (*.*)|*.*';

implementation

{$R *.DFM}

uses
  IniFiles, StrUtils;

procedure TfMain.FormCreate(Sender: TObject);
begin
  FoItemsChecked := TStringList.Create; //PC_OK
  FoItemsChecked.Clear;
  FoItemsUnchecked := TStringList.Create; //PC_OK
  FoItemsUnchecked.Clear;

  CarregarConfiguracao;
  ArmazenarParametroInicializacao;
  CarregarArquivoDados(FsParametroInicializacao);
  ListarOutrosArquivos(edDiretorio.Text, '');
end;

procedure TfMain.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  FreeAndNil(FoItemsChecked); //PC_OK
  FreeAndNil(FoItemsUnchecked); //PC_OK

  SalvarConfiguracao;
end;

procedure TfMain.ArmazenarParametroInicializacao;
begin
  FsParametroInicializacao := Trim(ParamStr(1));

  if FsParametroInicializacao <> '' then
    edDiretorio.Text := ExtractFilePath(FsParametroInicializacao);
end;

procedure TfMain.CarregarArquivoDados(const psArquivo: string);
begin
  if (psArquivo = '') or (not FileExists(psArquivo)) then
    Exit;

  ConfigurarFiltroDataSet('');
  cdsMain.LoadFromFile(psArquivo);

  MostrarMensagemRodape(irLinhas, IntToStr(cdsMain.RecordCount));
  MostrarMensagemRodape(irLinhasFiltradas, IntToStr(cdsMain.RecordCount));
  MostrarMensagemRodape(irColunas, IntToStr(cdsMain.Fields.Count));
  MostrarMensagemRodape(irColunasVisiveis, IntToStr(cdsMain.Fields.Count));
  MostrarMensagemRodape(irArquivo, psArquivo);

  CarregarColunas;
end;

procedure TfMain.SpeedButton1Click(Sender: TObject);
begin
  if edDiretorio.Text <> '' then
    dlgAbrirArquivo.InitialDir := edDiretorio.Text;
  dlgAbrirArquivo.Filter := FsExtensoes;

  if not dlgAbrirArquivo.Execute then
    Exit;

  edDiretorio.Text := ExtractFilePath(dlgAbrirArquivo.FileName);
  CarregarArquivoDados(dlgAbrirArquivo.FileName);
  ListarOutrosArquivos(edDiretorio.Text, '');
end;

function TfMain.RetornarNomeArquivoINI: string;
begin
  result := ChangeFileExt(Application.ExeName, '.ini');
end;

procedure TfMain.CarregarConfiguracao;
var
  fArquivo: TIniFile;
begin
  fArquivo := TIniFile.Create(RetornarNomeArquivoINI);
  try
    FsExtensoes := fArquivo.ReadString('Config', 'Extensoes', S_EXTENSOES_PADRAO);
    if FsExtensoes = '' then
      FsExtensoes := S_EXTENSOES_PADRAO;
    mmFilter.Lines.Text := fArquivo.ReadString('Config', 'Filtro', '');
    edDiretorio.Text := fArquivo.ReadString('Config', 'Diretorio', 'C:\');
  finally
    fArquivo.Free;
  end;
end;

procedure TfMain.SalvarConfiguracao;
var
  fArquivo: TIniFile;
begin
  fArquivo := TIniFile.Create(RetornarNomeArquivoINI);
  try
    fArquivo.WriteString('Config', 'Extensoes', FsExtensoes);
    fArquivo.WriteString('Config', 'Filtro', mmFilter.Lines.Text);
    fArquivo.WriteString('Config', 'Diretorio', edDiretorio.Text);
  finally
    fArquivo.Free;
  end;
end;

procedure TfMain.ListarOutrosArquivos(const psDiretorio, psFiltro: string);
var
  srPesquisa: TSearchRec;
  sPath: string;
begin
  clbArquivos.Items.Clear;

  try
    sPath := IncludeTrailingBackslash(psDiretorio) + '*' + psFiltro + '*.*';
    if FindFirst(sPath, faAnyFile - faDirectory, srPesquisa) <> 0 then
      Exit;

    repeat
      if TestarFiltroNomeArquivo(srPesquisa.Name) then
        clbArquivos.Items.Add(srPesquisa.Name);
    until FindNext(srPesquisa) <> 0;
  finally
    FindClose(srPesquisa);
  end;
end;

function TfMain.TestarFiltroNomeArquivo(const psNomeArquivo: string): boolean;
begin
  result := (Pos(UpperCase(ExtractFileExt(psNomeArquivo)), UpperCase(FsExtensoes)) > 0) and
    ((Pos(UpperCase(edFiltroArq.Text), UpperCase(psNomeArquivo)) > 0) or
    (edFiltroArq.Text = EmptyStr));
end;

procedure TfMain.gdMainTitleClick(Column: TColumn);
const
  sIdxMain: string = 'idxMain';
var
  bControl: boolean;
  sCampoClicado: string;
  iPosOrder, iPosDescend: integer;
  slListaIndices: TStrings;
  iPosIndice: integer;
  oIndexDef: TIndexDef;
begin
  inherited;

  bControl := (GetKeyState(VK_CONTROL) < 0);
  sCampoClicado := Column.FieldName;

  iPosOrder := mmOrder.Lines.IndexOf(sCampoClicado);
  iPosDescend := mmDescend.Lines.IndexOf(sCampoClicado);
  if (not bControl) then
  begin
    if mmOrder.Lines.Count > 1 then
      iPosOrder := -1;
    mmOrder.Lines.Text := sCampoClicado;
    if (iPosOrder < 0) then
      mmDescend.Lines.Clear
    else
    begin
      if (iPosDescend < 0) then
        mmDescend.Lines.Add(sCampoClicado)
      else
        mmDescend.Lines.Delete(iPosDescend);
    end;
  end
  else
  begin
    if iPosOrder < 0 then
    begin
      mmOrder.Lines.Add(sCampoClicado);
      if iPosDescend >= 0 then
        mmDescend.Lines.Delete(iPosDescend);
    end
    else
    begin
      if (iPosDescend >= 0) then
        mmDescend.Lines.Delete(iPosDescend)
      else if (iPosDescend < 0) then
        mmDescend.Lines.Add(sCampoClicado);
    end;
  end;

  slListaIndices := TStringList.Create;
  try
    slListaIndices.Clear;
    TClientDataSet(Column.Grid.DataSource.DataSet).GetIndexNames(slListaIndices);
    iPosIndice := slListaIndices.IndexOf(sIdxMain);
    if iPosIndice >= 0 then
      TClientDataSet(Column.Grid.DataSource.DataSet).DeleteIndex(sIdxMain);

    TClientDataSet(Column.Grid.DataSource.DataSet).IndexDefs.Update;

    oIndexDef := TClientDataSet(Column.Grid.DataSource.DataSet).IndexDefs.AddIndexDef;
    oIndexDef.Name := sIdxMain;
    oIndexDef.Fields := StringReplace(mmOrder.Lines.CommaText, ',', ';', [rfReplaceAll]);
    oIndexDef.Options := [];
    oIndexDef.DescFields := StringReplace(mmDescend.Lines.CommaText, ',', ';', [rfReplaceAll]);
    TClientDataSet(Column.Grid.DataSource.DataSet).IndexName := sIdxMain;
  finally
    FreeAndNil(slListaIndices);
  end;
end;

procedure TfMain.clbArquivosDblClick(Sender: TObject);
begin
  if clbArquivos.ItemIndex < 0 then
    Exit;

  CarregarArquivoDados(IncludeTrailingBackslash(edDiretorio.Text) +
    clbArquivos.items[clbArquivos.ItemIndex]);
end;

procedure TfMain.edFiltroArqKeyUp(Sender: TObject; var Key: word; Shift: TShiftState);
begin
  ListarOutrosArquivos(edDiretorio.Text, edFiltroArq.Text);
end;

procedure TfMain.edDiretorioKeyUp(Sender: TObject; var Key: word; Shift: TShiftState);
begin
  ListarOutrosArquivos(edDiretorio.Text, edFiltroArq.Text);
end;

procedure TfMain.bAplicarFiltroClick(Sender: TObject);
begin
  ConfigurarFiltroDataSet(mmFilter.Lines.Text);
end;

procedure TfMain.ConfigurarFiltroDataSet(const sFiltro: string);
begin
  try
    cdsMain.DisableControls;

    cdsMain.Filtered := False;
    if sFiltro <> '' then
    begin
      cdsMain.Filter := sFiltro;
      cdsMain.Filtered := True;

      MostrarMensagemRodape(irLinhasFiltradas, IntToStr(cdsMain.RecordCount));
    end;
  finally
    cdsMain.EnableControls;
  end;
end;

procedure TfMain.CarregarColunas;
var
  i: integer;
begin
  clbColunas.Items.Clear;

  clbColunas.Items.Text := RetornarListaDeColunas;
  for i := 0 to clbColunas.Items.Count - 1 do
    clbColunas.Checked[i] := True;
  FoItemsChecked.Text := clbColunas.Items.Text;
  FoItemsUnchecked.Clear;
  chkTudo.Checked := True;
end;

procedure TfMain.edFiltroColunasKeyUp(Sender: TObject; var Key: word; Shift: TShiftState);
var
  i: integer;
  cols: TStringList;
  sFiltro: string;
begin
  cols := TStringList.Create;
  try
    cols.Text := RetornarListaDeColunas;
    for i := cols.Count - 1 downto 0 do
    begin
      sFiltro := AnsiUpperCase(edFiltroColunas.Text);
      if (Pos(sFiltro, AnsiUpperCase(cols[i])) = 0) and (sFiltro <> '') then
        cols.Delete(i);
    end;
  finally
    clbColunas.Items.Text := cols.Text;
    FreeAndNil(cols);
    RemarcarItens;
  end;
end;

procedure TfMain.clbColunasClickCheck(Sender: TObject);
begin
  ControleDasListas(clbColunas.Items[clbColunas.ItemIndex],
    clbColunas.Checked[clbColunas.ItemIndex]);
end;

function TfMain.RetornarListaDeColunas: string;
var
  i: integer;
begin
  result := '';

  if not cdsMain.isEmpty then
  begin
    for i := 0 to cdsMain.FieldDefs.Count - 1 do
      result := result + cdsMain.FieldDefs.Items[i].Name + #13#10;
  end;
end;

procedure TfMain.RemarcarItens;
var
  i: integer;
  sColuna: string;
begin
  for i := 0 to clbColunas.Items.Count - 1 do
  begin
    sColuna := clbColunas.Items[i];
    if FoItemsUnchecked.IndexOf(sColuna) >= 0 then
      clbColunas.Checked[i] := False;
    if FoItemsChecked.IndexOf(sColuna) >= 0 then
      clbColunas.Checked[i] := True;
  end;
end;

procedure TfMain.chkTudoClick(Sender: TObject);
var
  i: integer;
begin
  try
    cdsMain.DisableControls;

    for i := 0 to clbColunas.Items.Count - 1 do
    begin
      clbColunas.Checked[i] := chkTudo.Checked;
      ControleDasListas(clbColunas.Items[i], chkTudo.Checked);
    end;
  finally
    cdsMain.EnableControls;
  end;
end;

procedure TfMain.AdicionarNaLista(oLista: TStringList; const sColuna: string);
var
  iPos: integer;
begin
  iPos := oLista.IndexOf(sColuna);
  if iPos < 0 then
    oLista.Add(sColuna);
end;

procedure TfMain.RemoverDaLista(oLista: TStringList; const sColuna: string);
var
  iPos: integer;
begin
  iPos := oLista.IndexOf(sColuna);
  if iPos >= 0 then
    oLista.Delete(iPos);
end;

procedure TfMain.ControleDasListas(const sColuna: string; const bChecked: boolean);
begin
  if bChecked then
  begin
    AdicionarNaLista(FoItemsChecked, sColuna);
    RemoverDaLista(FoItemsUnchecked, sColuna);
  end
  else
  begin
    AdicionarNaLista(FoItemsUnchecked, sColuna);
    RemoverDaLista(FoItemsChecked, sColuna);
  end;
  cdsMain.FieldByName(sColuna).Visible := bChecked;
  MostrarMensagemRodape(irColunasVisiveis, IntToStr(FoItemsChecked.Count));
end;

procedure TfMain.pnLadoResize(Sender: TObject);
begin
  pnLadoSuperior.Height := Trunc(pnLado.Height / 2);
  pnLadoInferior.Top := pnLadoSuperior.Height;
  pnLadoInferior.Height := Trunc(pnLado.Height / 2);
end;

procedure TfMain.MostrarMensagemRodape(irInformacao: TInformacoesRodape; const sTexto: string);
begin
  case irInformacao of
    irLinhas: sbInfo.Panels[Ord(irInformacao)].Text := 'Linhas: ' + sTexto;
    irLinhasFiltradas: sbInfo.Panels[Ord(irInformacao)].Text := 'Linhas filtradas: ' + sTexto;
    irColunas: sbInfo.Panels[Ord(irInformacao)].Text := 'Colunas: ' + sTexto;
    irColunasVisiveis: sbInfo.Panels[Ord(irInformacao)].Text := 'Colunas visíveis: ' + sTexto;
    irArquivo: sbInfo.Panels[Ord(irInformacao)].Text := 'Arquivo: ' + sTexto;
  end;
end;

end.

