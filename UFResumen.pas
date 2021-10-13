unit UFResumen;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, Grids, DBGrids, ComCtrls, ToolWin, ImgList, DBTables;

type
  TFResumen = class(TForm)
    DBGridResumen: TDBGrid;
    DataSource: TDataSource;
    ToolBar1: TToolBar;
    ToolButton1: TToolButton;
    btnRefrescar: TToolButton;
    btnCerrar: TToolButton;
    ImageList: TImageList;
    QOrdenCargaC: TQuery;
    procedure DBGridResumenDblClick(Sender: TObject);
    procedure btnRefrescarClick(Sender: TObject);
    procedure btnCerrarClick(Sender: TObject);
  private
    { Private declarations }

  public
    { Public declarations }
  end;

  function VerResumenOrdenes( const AOwner: TComponent; const AFiltro: String ): integer;



implementation

{$R *.dfm}

uses
  UFOrdenCarga, UDDescripciones;

function VerResumenOrdenes( const AOwner: TComponent; const AFiltro: String ): integer;
var
  FResumen: TFResumen;
begin
  FResumen:= TFResumen.Create( AOwner );
  try
    //FResumen.DataSource.DataSet:= DataSet;
    FResumen.QOrdenCargaC.SQL.Clear;

    FResumen.QOrdenCargaC.SQL.Add(' select orden_occ, fecha_occ, n_albaran_occ, cliente_sal_occ, dir_sum_occ, n_pedido_occ,vehiculo_occ, n_palets_occ, ');
    FResumen.QOrdenCargaC.SQL.Add('        ( select nombre_ds from frf_dir_sum ');
    FResumen.QOrdenCargaC.SQL.Add('          where cliente_ds = cliente_sal_occ ');
    FResumen.QOrdenCargaC.SQL.Add('          and dir_sum_occ = dir_sum_ds)des_suministro_occ, ');
    FResumen.QOrdenCargaC.SQL.Add('        case when traspasada_occ = 1 then ''ALBA'' ');
    FResumen.QOrdenCargaC.SQL.Add('             when traspasada_occ = 2 then ''TRAN'' ');
    FResumen.QOrdenCargaC.SQL.Add('             else '''' end des2_traspasada_occ, ');
    FResumen.QOrdenCargaC.SQL.Add('        case when status_occ = 1 then ''ACTI'' ');
    FResumen.QOrdenCargaC.SQL.Add('             when status_occ = 2 then ''INIC'' ');
    FResumen.QOrdenCargaC.SQL.Add('             when status_occ = 3 then ''FINA'' ');
    FResumen.QOrdenCargaC.SQL.Add('             else '''' end des2_status_occ, ');
    FResumen.QOrdenCargaC.SQL.Add('        ( select count( distinct ean128_pl ) ');
    FResumen.QOrdenCargaC.SQL.Add('          from frf_packing_list ');
    FResumen.QOrdenCargaC.SQL.Add('          where orden_pl = orden_occ ) palets_cargados_occ ');
    FResumen.QOrdenCargaC.SQL.Add(' from frf_orden_carga_c ');
    FResumen.QOrdenCargaC.SQL.Add( AFiltro );
    FResumen.QOrdenCargaC.SQL.Add(' order by fecha_occ desc, status_occ, orden_occ desc ');
    //FResumen.QOrdenCargaC.SQL.SaveToFile('c:\pepe.sql');
    FResumen.QOrdenCargaC.Open;

    FResumen.Top:= TForm(AOwner).Top;
    FResumen.Left:= TForm(AOwner).Left;
    FResumen.Height:= TForm(AOwner).Height;
    FResumen.Width:= TForm(AOwner).Width;

    FResumen.ShowModal;
    result:= FResumen.QOrdenCargaC.FieldByName('orden_occ').AsInteger;
  finally
    FResumen.QOrdenCargaC.Close;
    FreeAndNil( FResumen );
  end;
end;

procedure TFResumen.DBGridResumenDblClick(Sender: TObject);
begin
  Close;
end;

procedure TFResumen.btnRefrescarClick(Sender: TObject);
var
  BookMark: TBookMark;
begin
  DataSource.DataSet.DisableControls;
  BookMark:= DataSource.DataSet.GetBookmark;
  DataSource.DataSet.Close;
  DataSource.DataSet.Open;


  UFOrdenCarga.bCalcular:= True;
  DataSource.DataSet.GotoBookmark( BookMark );
  DataSource.DataSet.FreeBookmark( BookMark );
  DataSource.DataSet.EnableControls;
  UFOrdenCarga.bCalcular:= False;
end;

procedure TFResumen.btnCerrarClick(Sender: TObject);
begin
  Close;
end;

end.
