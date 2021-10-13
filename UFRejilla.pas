(*TODO*)
(*Que el ancho de la rejilla sea dinamico segun contenido*)
unit UFRejilla;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, DBTables, Grids, DBGrids, StdCtrls;

type
  TFRejilla = class(TForm)
    DBGrid: TDBGrid;
    Query: TQuery;
    DataSource: TDataSource;
    procedure DBGridDblClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure FormKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
    bFlag: boolean;

  end;

  procedure InicializaModulo( const ABaseDatos: string );
  procedure FinalizaModulo;


  function SeleccionaEmpresa( const AForm: TForm; const AControl: TControl; var AResultado: string ): Boolean;
  function SeleccionaCentro( const AForm: TForm; const AControl: TControl; const AEmpresa: string; var AResultado: string ): Boolean;
  function SeleccionaCliente( const AForm: TForm; const AControl: TControl; const AEmpresa: string; var AResultado: string ): Boolean;
  function SeleccionaComercial( const AForm: TForm; const AControl: TControl; var AResultado: string ): Boolean;
  function SeleccionaSuministro( const AForm: TForm; const AControl: TControl; const AEmpresa, ACliente: string; var AResultado: string ): Boolean;
  function SeleccionaTransportista( const AForm: TForm; const AControl: TControl; const AEmpresa: string; var AResultado: string ): Boolean;
  function SeleccionaProducto( const AForm: TForm; const AControl: TControl; const AEmpresa: string; var AResultado: string ): Boolean;
  function SeleccionaProductoBase( const AForm: TForm; const AControl: TControl; const AEmpresa: string; var AResultado: string ): Boolean;
  function SeleccionaProductoPedido( const AForm: TForm; const AControl: TControl; const AEmpresa, ACentro, ACliente, ASuministro, APedido, AFecha: string; var AResultado: string ): Boolean;
  function SeleccionaEnvase( const AForm: TForm; const AControl: TControl; const AEmpresa, AProducto: string; var AResultado: string ): Boolean;
  function SeleccionaEnvaseCliente( const AForm: TForm; const AControl: TControl; const AEmpresa, AProducto, ACliente: string; var AResultado: string ): Boolean;
  function SeleccionaFormatoCliente( const AForm: TForm; const AControl: TControl; const AEmpresa, AProducto, ACliente, ASuministro: string; var AResultado: string ): Boolean;
  function SeleccionaFormatoPedido( const AForm: TForm; const AControl: TControl; const AEmpresa, ACentro, ACliente, ASuministro, APedido, AFecha, AProducto:string; var AResultado: string ): Boolean;
  function SeleccionaMarca( const AForm: TForm; const AControl: TControl; var AResultado: string ): Boolean;
  function SeleccionaColor( const AForm: TForm; const AControl: TControl; const AEmpresa, AProducto: string; var AResultado: string ): Boolean;
  function SeleccionaCategoria( const AForm: TForm; const AControl: TControl; const AEmpresa, AProducto: string; var AResultado: string ): Boolean;
  function SeleccionaCalibre( const AForm: TForm; const AControl: TControl; const AEmpresa, AProducto: string; var AResultado: string ): Boolean;
  function SeleccionaPalet( const AForm: TForm; const AControl: TControl; var AResultado: string ): Boolean;

implementation

{$R *.dfm}

uses
  UDOrdenCarga;

var
  FRejilla: TFRejilla;

procedure InicializaModulo( const ABaseDatos: string );
begin
  FRejilla:= TFRejilla.Create( Application );
  FRejilla.Query.DatabaseName:= ABaseDatos;
end;

procedure FinalizaModulo;
begin
  FreeAndNil( FRejilla );
end;

procedure TFRejilla.DBGridDblClick(Sender: TObject);
begin
  bFlag:= True;
  Close;
end;

procedure TFRejilla.FormShow(Sender: TObject);
begin
  bFlag:= False;
end;

procedure TFRejilla.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action:= caHide;
end;

function SeleccionaEmpresa( const AForm: TForm; const AControl: TControl; var AResultado: string ): Boolean;
begin
  //FRejilla:= TFRejilla.Create( AForm );

  FRejilla.Left:= AControl.ClientOrigin.X;
  FRejilla.Top:= AControl.ClientOrigin.Y + AControl.Height;
  with FRejilla.Query do
  begin
    Close;
    SQL.Clear;
    SQL.Add('SELECT DISTINCT empresa_e Empresa, nombre_e Nombre');
    SQL.Add('FROM frf_empresas ');
    SQL.Add('ORDER BY empresa_e ');
    Open;
  end;


  try
    FRejilla.ShowModal;
    result:= FRejilla.bFlag;
    if result then
      AResultado:= FRejilla.Query.Fields[0].AsString;
  finally
    //FreeAndNil( FRejilla );
  end;
end;

function SeleccionaCentro( const AForm: TForm; const AControl: TControl;
                           const AEmpresa: string; var AResultado: string ): Boolean;
begin
  //FRejilla:= TFRejilla.Create( AForm );

  FRejilla.Left:= AControl.ClientOrigin.X;
  FRejilla.Top:= AControl.ClientOrigin.Y + AControl.Height;
  with FRejilla.Query do
  begin
    Close;
    SQL.Clear;
    SQL.Add('SELECT DISTINCT empresa_c Empresa, centro_c Centro, descripcion_c Nombre');
    SQL.Add('FROM frf_centros ');
    if Trim(AEmpresa) <> '' then
    begin
      SQL.Add('WHERE empresa_c = :empresa ');
      ParamByName('empresa').AsString:= AEmpresa;
    end;
    SQL.Add('ORDER BY empresa_c, centro_c ');
    Open;
  end;

  try
    FRejilla.ShowModal;
    result:= FRejilla.bFlag;
    if result then
      AResultado:= FRejilla.Query.Fields[1].AsString;
  finally
    //FreeAndNil( FRejilla );
  end;
end;

function SeleccionaCliente( const AForm: TForm; const AControl: TControl;
                           const AEmpresa: string; var AResultado: string ): Boolean;
begin
  //FRejilla:= TFRejilla.Create( AForm );

  FRejilla.Left:= AControl.ClientOrigin.X;
  FRejilla.Top:= AControl.ClientOrigin.Y + AControl.Height;
  with FRejilla.Query do
  begin
    Close;
    SQL.Clear;
    SQL.Add('SELECT DISTINCT cliente_c Cliente, nombre_c Nombre' +
          ' FROM frf_clientes ');
    SQL.Add('ORDER BY cliente_c ');
    Open;
  end;

  try
    FRejilla.ShowModal;
    result:= FRejilla.bFlag;
    if result then
      AResultado:= FRejilla.Query.Fields[1].AsString;
  finally
    //FreeAndNil( FRejilla );
  end;
end;

function SeleccionaSuministro( const AForm: TForm; const AControl: TControl;
                           const AEmpresa, ACliente: string; var AResultado: string ): Boolean;
var
  sWhere: string;
begin
  //FRejilla:= TFRejilla.Create( AForm );

  FRejilla.Left:= AControl.ClientOrigin.X;
  FRejilla.Top:= AControl.ClientOrigin.Y + AControl.Height;
  with FRejilla.Query do
  begin
    Close;
    SQL.Clear;
    SQL.Add('SELECT DISTINCT cliente_ds Cliente, dir_sum_ds Suministro, nombre_ds Nombre, poblacion_ds Poblacion' +
          ' FROM frf_dir_sum ');

    sWhere:= 'where fecha_baja_ds is null ';
    if Trim(ACliente) <> '' then
    begin
      if sWhere <> '' then
      begin
        sWhere:= sWhere + #13 + #10 + 'AND cliente_ds = :cliente ';
      end
      else
      begin
        sWhere:= 'WHERE cliente_ds = :cliente ';
      end;
    end;
    SQL.Add( sWhere );
    if Trim(ACliente) <> '' then
    begin
      ParamByName('cliente').AsString:= ACliente;
    end;

    SQL.Add('ORDER BY cliente_ds, nombre_ds ');
    Open;
  end;

  try
    FRejilla.Width:= 550;
    FRejilla.ShowModal;
    result:= FRejilla.bFlag;
    if result then
      AResultado:= FRejilla.Query.Fields[2].AsString;
  finally
    FRejilla.Width:= 321;
    //FreeAndNil( FRejilla );
  end;
end;


function SeleccionaTransportista( const AForm: TForm; const AControl: TControl;
                           const AEmpresa: string; var AResultado: string ): Boolean;
begin
  //FRejilla:= TFRejilla.Create( AForm );

  FRejilla.Left:= AControl.ClientOrigin.X;
  FRejilla.Top:= AControl.ClientOrigin.Y + AControl.Height;
  with FRejilla.Query do
  begin
    Close;
    SQL.Clear;
    SQL.Add('SELECT DISTINCT transporte_t Transporte, descripcion_t Nombre' +
          ' FROM frf_transportistas ');
    SQL.Add('ORDER BY transporte_t ');
    Open;
  end;

  try
    FRejilla.ShowModal;
    result:= FRejilla.bFlag;
    if result then
      AResultado:= FRejilla.Query.Fields[1].AsString;
  finally
    //FreeAndNil( FRejilla );
  end;
end;

function SeleccionaProducto( const AForm: TForm; const AControl: TControl;
                           const AEmpresa: string; var AResultado: string ): Boolean;
begin
  //FRejilla:= TFRejilla.Create( AForm );

  FRejilla.Left:= AControl.ClientOrigin.X;
  FRejilla.Top:= AControl.ClientOrigin.Y + AControl.Height;
  with FRejilla.Query do
  begin
    Close;
    SQL.Clear;
    SQL.Add('SELECT DISTINCT producto_p Producto, descripcion_p Nombre' +
          ' FROM frf_productos ');

    SQL.Add(' WHERE fecha_baja_p is null ');
    SQL.Add('   AND tipo_venta_p = ''S'' ');
    SQL.Add('ORDER BY producto_p ');
    Open;
  end;

  try
    FRejilla.ShowModal;
    result:= FRejilla.bFlag;
    if result then
      AResultado:= FRejilla.Query.Fields[0].AsString;
  finally
    //FreeAndNil( FRejilla );
  end;
end;

function SeleccionaProductoBase( const AForm: TForm; const AControl: TControl;
                           const AEmpresa: string; var AResultado: string ): Boolean;
begin
  //FRejilla:= TFRejilla.Create( AForm );

  FRejilla.Left:= AControl.ClientOrigin.X;
  FRejilla.Top:= AControl.ClientOrigin.Y + AControl.Height;
  with FRejilla.Query do
  begin
    Close;
    SQL.Clear;
    SQL.Add('SELECT DISTINCT empresa_pb Empresa, producto_base_pb Producto, descripcion_pb Nombre' +
          ' FROM frf_productos_base ');
    if Trim(AEmpresa) <> '' then
    begin
      SQL.Add('WHERE empresa_pb = :empresa ');
      ParamByName('empresa').AsString:= AEmpresa;
    end;
    SQL.Add('ORDER BY empresa_pb, producto_base_pb ');
    Open;
  end;

  try
    FRejilla.ShowModal;
    result:= FRejilla.bFlag;
    if result then
      AResultado:= FRejilla.Query.Fields[1].AsString;
  finally
    //FreeAndNil( FRejilla );
  end;
end;

function QueryProductoPedido( ): String;
var
  slAux: TStringList;
begin
  slAux:= TStringList.Create;

  slAux.Add(' select producto_pdd Producto, descripcion_pb Descripcion');
  slAux.Add(' from frf_pedido_cab, frf_pedido_det, frf_productos ');

  slAux.Add(' where empresa_pdc = :empresa ');
  slAux.Add(' and centro_pdc = :centro ');
  slAux.Add(' and cliente_pdc = :cliente ');
  slAux.Add(' and dir_suministro_pdc = :suministro ');
  slAux.Add(' and ref_pedido_pdc = :pedido ');
  slAux.Add(' and fecha_pdc = :fecha ');

  slAux.Add(' and empresa_pdd = :empresa ');
  slAux.Add(' and centro_pdd = :centro ');
  slAux.Add(' and pedido_pdd = pedido_pdc ');

  slAux.Add(' and producto_p = producto_pdd ');

  slAux.Add(' group by producto_pdd, descripcion_pb ');
  slAux.Add(' order by producto_pdd ');

  result:= slAux.Text;
  FreeAndNil( slAux );
end;

function SeleccionaProductoPedido( const AForm: TForm; const AControl: TControl;
           const AEmpresa, ACentro, ACliente, ASuministro, APedido, AFecha: string; var AResultado: string ): Boolean;
begin

  //FRejilla:= TFRejilla.Create( AForm );

  FRejilla.Left:= AControl.ClientOrigin.X;
  FRejilla.Top:= AControl.ClientOrigin.Y + AControl.Height;

  with FRejilla.Query do
  begin
    Close;
    SQL.Clear;
    SQL.Add( QueryProductoPedido ( ) );

    ParamByName('empresa').AsString:= AEmpresa;
    ParamByName('centro').AsString:= ACentro;
    ParamByName('cliente').AsString:= ACliente;
    ParamByName('suministro').AsString:= ASuministro;
    ParamByName('pedido').AsString:= APedido;
    ParamByName('fecha').AsString:= AFecha;

    Open;
  end;

  try
    //FRejilla.Width:= 550;
    FRejilla.ShowModal;
    result:= FRejilla.bFlag;
    if result then
      AResultado:= FRejilla.Query.Fields[0].AsString;
  finally
    FRejilla.Width:= 321;
    //FreeAndNil( FRejilla );
  end;
end;

function SeleccionaEnvase( const AForm: TForm; const AControl: TControl;
                           const AEmpresa, AProducto: string;
                           var AResultado: string ): Boolean;
begin
  //FRejilla:= TFRejilla.Create( AForm );

  FRejilla.Left:= AControl.ClientOrigin.X;
  FRejilla.Top:= AControl.ClientOrigin.Y + AControl.Height;
  with FRejilla.Query do
  begin
    Close;
    SQL.Clear;

    SQL.Add('select DISTINCT envase_e envase, descripcion_e nombre ');
    SQL.Add('from frf_envases ');
    SQL.Add(' where 1=1 ');

    if Trim(AProducto) <> '' then
    begin
      SQL.Add('  and producto_e  = :producto  ');
      ParamByName('producto').AsString:= AProducto;
    end;

    SQL.Add('and fecha_baja_e is null ');
    SQL.Add('ORDER BY envase_e ');
    Open;
  end;

  try
    FRejilla.ShowModal;
    result:= FRejilla.bFlag;
    if result then
      AResultado:= FRejilla.Query.Fields[0].AsString;
  finally
    //FreeAndNil( FRejilla );
  end;
end;

function QueryFormatoCliente( const AEmpresa, AProducto, ACliente, ASuministro:string ): String;
var
  slAux: TStringList;
begin
  slAux:= TStringList.Create;
  slAux.Add(' select empresa_f, cliente_fc, suministro_fc, codigo_f, formato_cliente_fc, descripcion_fc ');
  slAux.Add(' from frf_formatos, frf_formatos_cli ');
  slAux.Add(' where empresa_fc = empresa_f ');
  slAux.Add(' and formato_fc = codigo_f ');
  slAux.Add(' and fecha_baja_f is null ');
  if Trim(AEmpresa) <> '' then
  begin
     slAux.Add(' and empresa_fc = :empresa ');
  end;
  if Trim(AProducto) <> '' then
  begin
     slAux.Add(' and productop_f = :producto ');
  end;
  if Trim(ACliente) <> '' then
  begin
     slAux.Add(' and cliente_fc = :cliente ');
  end;
  if Trim(ASuministro) <> '' then
  begin
     slAux.Add(' and ( suministro_fc = ''*'' or suministro_fc = '''' or suministro_fc = :dirsum ) ');
  end;
  slAux.Add(' group by empresa_f, cliente_fc, suministro_fc, codigo_f, formato_cliente_fc, descripcion_fc ');
  slAux.Add(' order by empresa_f, codigo_f, formato_cliente_fc, cliente_fc, suministro_fc ');
  result:= slAux.Text;
  FreeAndNil( slAux );
end;

function QueryFormatoPedido( const AProducto:string ): String;
var
  slAux: TStringList;
begin
  slAux:= TStringList.Create;

  slAux.Add(' select formato_cliente_pdd, descripcion_fc ');
  slAux.Add(' from frf_pedido_cab, frf_pedido_det, frf_formatos_cli, frf_formatos ');

  slAux.Add(' where empresa_pdc = :empresa ');
  slAux.Add(' and centro_pdc = :centro ');
  slAux.Add(' and cliente_pdc = :cliente ');
  slAux.Add(' and dir_suministro_pdc = :suministro ');
  slAux.Add(' and ref_pedido_pdc = :pedido ');
  slAux.Add(' and fecha_pdc = :fecha ');

  slAux.Add(' and empresa_pdd = :empresa ');
  slAux.Add(' and centro_pdd = :centro ');
  slAux.Add(' and pedido_pdd = pedido_pdc ');
  if Trim(AProducto) <> '' then
    slAux.Add(' and producto_pdd = :producto ');

  slAux.Add(' and empresa_fc = :empresa ');
  slAux.Add(' and formato_cliente_fc = formato_cliente_pdd ');
  slAux.Add(' and cliente_fc = :cliente ');
  slAux.Add(' and ( suministro_fc = ''*'' or suministro_fc = '''' or suministro_fc = :suministro ) ');

  slAux.Add(' and empresa_f = :empresa ');
  slAux.Add(' and codigo_f = formato_fc ');
  slAux.Add(' and fecha_baja_f is null ');

  slAux.Add(' group by formato_cliente_pdd, descripcion_fc ');
  slAux.Add(' order by formato_cliente_pdd ');

  result:= slAux.Text;
  FreeAndNil( slAux );
end;

function QueryEnvaseCliente( const AEmpresa, AProducto, ACliente:string ): String;
var
  slAux: TStringList;
  bFlag: boolean;
begin
  slAux:= TStringList.Create;
  slAux.Add('select DISTINCT empresa_ce empresa, envase_ce envase, ');
  slAux.Add('       case when descripcion_ce is not null then descripcion_ce else ');
  slAux.Add('       ( select descripcion_e from frf_envases where envase_e = envase_ce and producto_e = producto_ce ) end nombre ');


  slAux.Add('from frf_clientes_env ');

  bFlag:= False;
  if Trim(AEmpresa) <> '' then
  begin
    slAux.Add('WHERE empresa_ce = :empresa ');
    if Trim(AProducto) <> '' then
    begin
      slAux.Add('  and producto_ce = :producto ');
    end;
    bFlag:= True;
  end;
  if Trim(ACliente) <> '' then
  begin
    if not bFlag then
    begin
      slAux.Add('  Where cliente_ce = :cliente ');
      bFlag:= True;
    end
    else
    begin
      slAux.Add('  and cliente_ce = :cliente ');
    end;
  end;

  if bFlag then
  begin
    slAux.Add('and exists ( select envase_e from frf_envases where envase_e = envase_ce and producto_e = producto_ce and fecha_baja_e is  null ) ');
  end
  else
  begin
    slAux.Add('where exists ( select envase_e from frf_envases where envase_e = envase_ce and producto_e = producto_ce and fecha_baja_e is  null ) ');
  end;

  slAux.Add('ORDER BY empresa_ce, envase_ce ');
  result:= slAux.Text;
  FreeAndNil( slAux );
end;

function QueryBondeliciuos( const AEmpresa, AProducto:string ): String;
var
  slAux: TStringList;
begin
  slAux:= TStringList.Create;
  slAux.Add(' select DISTINCT envase_e envase, descripcion_e nombre ');
  slAux.Add(' from frf_envases ');
  slAux.Add(' WHERE 1=1 ');
  if AProducto<> '' then
    slAux.Add('   and producto_e = :producto  ');
  slAux.Add(' and nvl(fecha_baja_e,'''') = '''' ');
  slAux.Add(' ORDER BY envase_e ');
  result:= slAux.Text;
  FreeAndNil( slAux );
end;


function SeleccionaEnvaseCliente( const AForm: TForm; const AControl: TControl;
                             const AEmpresa, AProducto, ACliente: string;
                             var AResultado: string ): Boolean;
begin
  //FRejilla:= TFRejilla.Create( AForm );

  FRejilla.Left:= AControl.ClientOrigin.X;
  FRejilla.Top:= AControl.ClientOrigin.Y + AControl.Height;
  with FRejilla.Query do
  begin
    Close;
    SQL.Clear;
    SQL.Add( QueryEnvaseCliente ( AEmpresa, AProducto, ACliente ) );
    if Trim(AProducto) <> '' then
    begin
      ParamByName('producto').AsString:= AProducto;
    end;
    if Trim(AEmpresa) <> '' then
    begin
      ParamByName('empresa').AsString:= AEmpresa;
    end;
    if Trim(ACliente) <> '' then
    begin
      ParamByName('cliente').AsString:= ACliente;
    end;

    Open;

    if IsEmpty and ( gsEmpresa = '078' ) then
    begin
      Close;
      SQL.Clear;
      SQL.Add( QueryBondeliciuos ( AEmpresa, AProducto ) );
      ParamByName('empresa').AsString:= AEmpresa;
      if Trim(AProducto) <> '' then
      begin
        ParamByName('producto').AsString:= AProducto;
      end;

      Open;
    end;
  end;

  try
    FRejilla.ShowModal;
    result:= FRejilla.bFlag;
    if result then
      AResultado:= FRejilla.Query.Fields[1].AsString;
  finally
    //FreeAndNil( FRejilla );
  end;
end;

function SeleccionaFormatoCliente( const AForm: TForm; const AControl: TControl;
  const AEmpresa, AProducto, ACliente, ASuministro: string; var AResultado: string ): Boolean;
begin
  //FRejilla:= TFRejilla.Create( AForm );

  FRejilla.Left:= AControl.ClientOrigin.X;
  FRejilla.Top:= AControl.ClientOrigin.Y + AControl.Height;

  with FRejilla.Query do
  begin
    Close;
    SQL.Clear;
    SQL.Add( QueryFormatoCliente ( AEmpresa, AProducto, ACliente, ASuministro ) );

    if Trim(AProducto) <> '' then
    begin
      ParamByName('producto').AsString:= AProducto;
    end;
    if Trim(AEmpresa) <> '' then
    begin
      ParamByName('empresa').AsString:= AEmpresa;
    end;
    if Trim(ACliente) <> '' then
    begin
      ParamByName('cliente').AsString:= ACliente;
    end;
    if Trim(ASuministro) <> '' then
    begin
      ParamByName('dirsum').AsString:= ASuministro;
    end;

    Open;
  end;

  try
    FRejilla.Width:= 550;
    FRejilla.ShowModal;
    result:= FRejilla.bFlag;
    if result then
      AResultado:= FRejilla.Query.Fields[4].AsString;
  finally
    FRejilla.Width:= 321;
    //FreeAndNil( FRejilla );
  end;
end;

function SeleccionaFormatoPedido( const AForm: TForm; const AControl: TControl;
  const AEmpresa, ACentro, ACliente, ASuministro, APedido, AFecha, AProducto:string; var AResultado: string ): Boolean;
begin
  //FRejilla:= TFRejilla.Create( AForm );

  FRejilla.Left:= AControl.ClientOrigin.X;
  FRejilla.Top:= AControl.ClientOrigin.Y + AControl.Height;

  with FRejilla.Query do
  begin
    Close;
    SQL.Clear;
    SQL.Add( QueryFormatoPedido ( AProducto ) );

    if Trim(AProducto) <> '' then
    begin
      ParamByName('producto').AsString:= AProducto;
    end;

    ParamByName('empresa').AsString:= AEmpresa;
    ParamByName('centro').AsString:= ACentro;
    ParamByName('cliente').AsString:= ACliente;
    ParamByName('suministro').AsString:= ASuministro;
    ParamByName('pedido').AsString:= APedido;
    ParamByName('fecha').AsString:= AFecha;

    Open;
  end;

  try
    FRejilla.Width:= 550;
    FRejilla.ShowModal;
    result:= FRejilla.bFlag;
    if result then
      AResultado:= FRejilla.Query.Fields[0].AsString;
  finally
    FRejilla.Width:= 321;
    //FreeAndNil( FRejilla );
  end;
end;

function SeleccionaComercial( const AForm: TForm; const AControl: TControl; var AResultado: string ): Boolean;
begin
  //FRejilla:= TFRejilla.Create( AForm );

  FRejilla.Left:= AControl.ClientOrigin.X;
  FRejilla.Top:= AControl.ClientOrigin.Y + AControl.Height;
  with FRejilla.Query do
  begin
    Close;
    SQL.Clear;
    SQL.Add(' select * ');
    SQL.Add(' from frf_comerciales ');
    //SQL.Add( where codigo_c = :comercial );
    Open;
  end;

  try
    FRejilla.ShowModal;
    result:= FRejilla.bFlag;
    if result then
      AResultado:= FRejilla.Query.Fields[0].AsString;
  finally
    //FreeAndNil( FRejilla );
  end;
end;


function SeleccionaMarca( const AForm: TForm; const AControl: TControl; var AResultado: string ): Boolean;
begin
  //FRejilla:= TFRejilla.Create( AForm );

  FRejilla.Left:= AControl.ClientOrigin.X;
  FRejilla.Top:= AControl.ClientOrigin.Y + AControl.Height;
  with FRejilla.Query do
  begin
    Close;
    SQL.Clear;
    SQL.Add('SELECT codigo_m, descripcion_m ');
    SQL.Add('FROM frf_marcas ');
    SQL.Add('ORDER BY codigo_m ');
    Open;
  end;

  try
    FRejilla.ShowModal;
    result:= FRejilla.bFlag;
    if result then
      AResultado:= FRejilla.Query.Fields[0].AsString;
  finally
    //FreeAndNil( FRejilla );
  end;
end;

function SeleccionaColor( const AForm: TForm; const AControl: TControl;
                           const AEmpresa, AProducto: string; var AResultado: string ): Boolean;
begin
  //FRejilla:= TFRejilla.Create( AForm );

  FRejilla.Left:= AControl.ClientOrigin.X;
  FRejilla.Top:= AControl.ClientOrigin.Y + AControl.Height;
  with FRejilla.Query do
  begin
    Close;
    SQL.Clear;

    (*TODO*)
    (*
    SQL.Add('select empresa_c empresa, producto_c producto, color_c color, descripcion_c nombre ');
    SQL.Add('from frf_colores ');
    if Trim(AEmpresa) <> '' then
    begin
      SQL.Add('WHERE empresa_c = :empresa ');
      if Trim(AProducto) <> '' then
      begin
        SQL.Add('  and producto_c = :producto ');
        ParamByName('producto').AsString:= AProducto;
      end;
      ParamByName('empresa').AsString:= AEmpresa;
    end
    else
    begin
      if Trim(AProducto) <> '' then
      begin
        SQL.Add('  Where producto_c  = :producto ');
        ParamByName('producto').AsString:= AProducto;
      end;
    end;
    SQL.Add('order by empresa_c, producto_c, color_c ');
    *)
    SQL.Add('select producto_c producto, color_c color, descripcion_c nombre ');
    SQL.Add('from frf_colores ');
    if Trim(AProducto) <> '' then
    begin
      SQL.Add('  where producto_c = :producto ');
      ParamByName('producto').AsString:= AProducto;
    end;
    SQL.Add('order by producto_c, color_c ');

    Open;
  end;

  try
    FRejilla.ShowModal;
    result:= FRejilla.bFlag;
    if result then
      AResultado:= FRejilla.Query.Fields[1].AsString;
  finally
    //FreeAndNil( FRejilla );
  end;
end;

function SeleccionaCategoria( const AForm: TForm; const AControl: TControl;
                           const AEmpresa, AProducto: string; var AResultado: string ): Boolean;
begin
  //FRejilla:= TFRejilla.Create( AForm );

  FRejilla.Left:= AControl.ClientOrigin.X;
  FRejilla.Top:= AControl.ClientOrigin.Y + AControl.Height;
  with FRejilla.Query do
  begin
    Close;
    SQL.Clear;
    (*TODO*)
    (*
    SQL.Add('select empresa_c empresa, producto_c producto, categoria_c categoria, descripcion_c nombre ');
    SQL.Add('from frf_categorias ');
    if Trim(AEmpresa) <> '' then
    begin
      SQL.Add('WHERE empresa_c = :empresa ');
      if Trim(AProducto) <> '' then
      begin
        SQL.Add('  and producto_c = :producto ');
        ParamByName('producto').AsString:= AProducto;
      end;
      ParamByName('empresa').AsString:= AEmpresa;
    end
    else
    begin
      if Trim(AProducto) <> '' then
      begin
        SQL.Add('  Where producto_c  = :producto ');
        ParamByName('producto').AsString:= AProducto;
      end;
    end;
    SQL.Add('order by empresa_c, producto_c, categoria_c ');
    *)

    SQL.Add('select producto_c producto, categoria_c categoria, descripcion_c nombre ');
    SQL.Add('from frf_categorias ');

    if Trim(AProducto) <> '' then
    begin
      SQL.Add('  where producto_c = :producto ');
      ParamByName('producto').AsString:= AProducto;
    end;
    SQL.Add('order by producto_c, categoria_c ');
    Open;
  end;

  try
    FRejilla.ShowModal;
    result:= FRejilla.bFlag;
    if result then
      AResultado:= FRejilla.Query.Fields[1].AsString;
  finally
    //FreeAndNil( FRejilla );
  end;
end;

function SeleccionaPalet( const AForm: TForm; const AControl: TControl; var AResultado: string ): Boolean;
begin
  //FRejilla:= TFRejilla.Create( AForm );

  FRejilla.Left:= AControl.ClientOrigin.X;
  FRejilla.Top:= AControl.ClientOrigin.Y + AControl.Height;
  with FRejilla.Query do
  begin
    Close;
    SQL.Clear;

    SQL.Add('select codigo_tp Tipo, descripcion_tp Descripcion ');
    SQL.Add('from frf_tipo_palets ');
    SQL.Add('order by codigo_tp ');
    Open;
  end;

  try
    FRejilla.ShowModal;
    result:= FRejilla.bFlag;
    if result then
      AResultado:= FRejilla.Query.Fields[0].AsString;
  finally
    //FreeAndNil( FRejilla );
  end;
end;

function SeleccionaCalibre( const AForm: TForm; const AControl: TControl;
                           const AEmpresa, AProducto: string; var AResultado: string ): Boolean;
begin
  //FRejilla:= TFRejilla.Create( AForm );

  FRejilla.Left:= AControl.ClientOrigin.X;
  FRejilla.Top:= AControl.ClientOrigin.Y + AControl.Height;
  with FRejilla.Query do
  begin
    Close;
    SQL.Clear;

    (*TODO*)
    (*
    SQL.Add('select empresa_c empresa, producto_c producto, calibre_c calibre ');
    SQL.Add('from frf_calibres ');
    if Trim(AEmpresa) <> '' then
    begin
      SQL.Add('WHERE empresa_c = :empresa ');
      if Trim(AProducto) <> '' then
      begin
        SQL.Add('  and producto_c = :producto ');
        ParamByName('producto').AsString:= AProducto;
      end;
      ParamByName('empresa').AsString:= AEmpresa;
    end
    else
    begin
      if Trim(AProducto) <> '' then
      begin
        SQL.Add('  Where producto_c  = :producto ');
        ParamByName('producto').AsString:= AProducto;
      end;
    end;
    SQL.Add('order by empresa_c, producto_c, calibre_c ');
    *)
    SQL.Add('select producto_c producto, calibre_c calibre ');
    SQL.Add('from frf_calibres ');
    if Trim(AProducto) <> '' then
    begin
      SQL.Add('  where producto_c = :producto ');
      ParamByName('producto').AsString:= AProducto;
    end;
    SQL.Add('order by producto_c, calibre_c ');
    Open;
  end;

  try
    FRejilla.ShowModal;
    result:= FRejilla.bFlag;
    if result then
      AResultado:= FRejilla.Query.Fields[1].AsString;
  finally
    //FreeAndNil( FRejilla );
  end;
end;

procedure TFRejilla.FormKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  case Key of
    vk_return:
      begin
        bFlag:= True;
        Close;
      end;
    vk_escape:
      begin
        Close;
      end;
  end;
end;

end.
