unit UDOrdenCarga;

interface

uses
  SysUtils, Classes, DB, DBTables;

type
  //Zona de influencia
  TZonaGeografica = (zgPeninsular, zgCanario, zgComunitario, zgExtra);

  TImpuesto = record
    sCodigo: string;
    sTipo: string;
    sDescripcion: string;
    rGeneral: Real;
    rReducido: Real;
    rSuper: Real;
  end;

  TDOrdenCarga = class(TDataModule)
    QTemp: TQuery;
    QListado: TQuery;
    QAux: TQuery;
    Database: TDatabase;
    QGetNumeroOrden: TQuery;
    QUpdateNumeroOrden: TQuery;
    QBorrarDetalle: TQuery;
    QGetNumeroLinea: TQuery;
    QCliente_es_de: TQuery;
    QSuminis_es_de: TQuery;
    QCentro_es_de: TQuery;
    QDatos_impuestos: TQuery;
    QCambiarEstado: TQuery;
    QCajasPaletsOrden: TQuery;
    QCajasPaletsPacking: TQuery;
    QExistePacking: TQuery;
    QUpdatePaletCab: TQuery;
    QResumenOrden: TQuery;
    QResumenPacking: TQuery;
    QGetProductoBase: TQuery;
    QGetProducto: TQuery;
    QExistePedido: TQuery;
    QCajasPedido: TQuery;
    QCajasOrdenes: TQuery;
    QDesfinalizarOrden: TQuery;
    QBorrarPacking: TQuery;
    QRecargo_equivalencia: TQuery;
    procedure DataModuleCreate(Sender: TObject);
    procedure DataModuleDestroy(Sender: TObject);
  private
    { Private declarations }
    //aPalets: array of TPalets;

    function IntegridadStr( const AEmpresa: string; const ATipo: integer ): string;
    function IntegridadTitle: string;

    procedure LoadQuerysValidarIntegridad;

  public
    { Public declarations }
    sDirTemp: string;

    function GetLineaOrden( const AOrden: integer ): integer;

    //function ProductoBase(  const AEmpresa, AProducto: string ): string;


    function  ClienteEsDe( const AEmpresa, ACliente, ADirSum: string ): TZonaGeografica;
    function  ImpuestosEntre(const AEmpresa, ACentro, ACliente, ASuministro: string ): string;
    function  ImpuestosCliente(const AEmpresa, ACentro, ACliente, ASuministro: string; const AFecha: TDateTime ): TImpuesto;
    function  ClienteConRecargo(const AEmpresa, ACliente: string; const AFecha: TDateTime ): Boolean;
    function  TipoIVAEnvase(const AEmpresa, AEnvase, AProducto: string ): Integer;
    function  TipoIVAEnvaseProducto(const AEmpresa, AEnvase, AProducto: string ): Integer;

    procedure CambiarEmpresaDetalle( const AOrden: integer; AEmpresa: String );
    procedure CambiarCentroDetalle( const AOrden: integer; ACentro: String );
    procedure CambiarFechaDetalle( const AOrden: integer; AFecha: TDateTime );
    procedure CambiarClienteDetalle( const AOrden: integer; ACliente: String );
    procedure CambiarImpuestoDetalle( const AOrden: integer; AImpuesto: TImpuesto );

    function  EmpProcedencia(AEmpresa, ACliente, AProducto, ACentro: string): string;

    function DatosFormatoCliente( const AEmpresa, ACliente, ASuministro, AFormatoCliente: string;
      var ADesFormato, ATipoPalet, ATipoEnvase, AUnidadPedido, AUnidadFacturacion, AProducto: string;
      var AMarca, ACategoria, ACalibre, AColor, AProductoControl: String;
      var ACajasPalet, AUnidadesCaja: integer;
      var APesoVariable: boolean; var ANetoCaja: Real ): boolean;

    function DatosEnvaseCliente( const AEmpresa, AProducto, ACliente, AEnvase: string;
                                 var ADescripcion: string;
                                 var AUnidadesCaja: integer; var AUnidadVariable: boolean;
                                 var ANetoCaja: Real;  var APesoVariable: boolean;
                                 var AUnidadFacturacion:string   ): boolean;


    function TieneSuministros( const AEmpresa, ACliente: string ): Boolean;
    function ExisteSuministro( const AEmpresa, ACliente, ASuministro: string ): Boolean;
    function EsDirSuministroValida( const AEmpresa, ACliente, ASuministro: String ): Boolean;


(*
    function ExisteTransito(
      const AEmpresa, ACentroOrigen: String; const AReferencia: Integer; const AFechaSal: TDateTime; const AProducto: string;
      var ACentro: string; var AFecha: TDateTime; var AKilos: Real ): boolean;
*)
    function ExisteTransito( const AEmpresa, ACentro: String; const AReferencia: Integer;
      const AFecha: TDateTime; const AProducto: string; var AKilos: Real ): boolean;
    function EsTransitoCorrecto( const AEmpresa, ACentro: String; const AReferencia: Integer;
      const AFecha: TDateTime; const AProducto: string; const AKilos, AKilosAnterior: Real; var AMsg: String ): boolean;
    function TransitoKilosTransito( const AEmpresa, ACentro: string; const AFecha: TDateTime;
      const AReferencia: Integer; const AProducto: String ): real;
    function TransitoKilosAlbaran( const AEmpresa, ACentro: string; const AFecha: TDateTime;
      const AReferencia: Integer; const AProducto: String ): real;
    function TransitoKilosCarga( const AEmpresa, ACentro: string; const AFecha: TDateTime;
      const AReferencia: Integer; const AProducto: String ): real;

    function GetProductoBase( const AEmpresa, AProducto: string ): string;
    function GetProducto( const AEmpresa, AProductoBase: string ): string;

    procedure CambiarEstado( const AOrden: Integer; const AEstado: Integer );
    procedure DesfinalizarOrden( const AOrden: Integer );
    //Modificaciones borrados lineas
    function  ComprobarIntegridadLinea( Const AOrden, ALinea: integer; Const AEmpresa, AFormato: string; const ACajas: Integer ): boolean;
    //Comprobar integridad con el pedido
    function  ComprobarIntegridadPedido( Const AOrden, ALinea: integer;
      const AEmpresa, ACentro, ACliente, ASumnistro, APedido, AFecha, AFormato: string;
      const ACajas: Integer ): integer;
    //Borrados orden
    function  ComprobarIntegridadOrden( Const AOrden: integer ): boolean;
    //Antes de generar albaran salida/transito
    function  ComprobarIntegridad( const AEmpresa: string; Const AOrden: integer; var AMensaje: string ): boolean;
    function  ComprobarIntegridadEx( const AEmpresa: string; Const AOrden: integer; var AMensaje: string ): boolean;
    function  UnidadesCorrectas( const AEmpresa: string; const AOrden: integer; var AMsg: string ): boolean;
    function  LineasSinKilos( const AEmpresa: string; const AOrden: integer ): boolean;


    //EL ENVASE ES CORRECTO
    function IsEnvaseCorrecto( const AEmpresa, AProducto, AEnvase: string ): boolean;

    //Poner sumatorio de palets en las lineas en la cabecera
    procedure UpdatePaletsCab( const AOrden: integer );

    function ExistePedido( const AEmpresa, ACentro, ACliente, ASumnistro, APedido, AFecha: string ): boolean;
  end;

  function ConsultaOpen( ADataSet: TDataSet; const ASQLString: String ): boolean;

var
  DOrdenCarga: TDOrdenCarga;
  gsEmpresa, gsCentro: string;

implementation

{$R *.dfm}

uses bSQLUtils, bMath, IniFiles, dialogs, AdvertenciaFD, Controls;

procedure TDOrdenCarga.DataModuleCreate(Sender: TObject);
var
  IniFile: TIniFile;
  sAux: string;
begin
  sAux:= GetCurrentDir + '\OrdenCarga.ini';
  if FileExists( sAux ) then
  begin
    Database.Params.Clear;
    IniFile:= TIniFile.Create( sAux );
    sAux:= IniFile.ReadString( 'BDDATA', 'ALIAS', 'comer.almacen' );
    Database.AliasName:= sAux;
    sAux:= IniFile.ReadString( 'BDDATA', 'USERNAME', 'cica' );
    Database.Params.Values['USER NAME']:= sAux;
    sAux:= IniFile.ReadString( 'BDDATA', 'PASSWORD', 'cica1' );
    Database.Params.Values['PASSWORD']:= sAux;
    sAux:= IniFile.ReadString( 'DIRECTORIOS', 'TEMP', 'c:\temp' );

    gsEmpresa:= IniFile.ReadString( 'PORDEFECTO', 'EMPRESA', '050' );
    gsCentro:= IniFile.ReadString( 'PORDEFECTO', 'CENTRO', '1' );

    sDirTemp:= sAux;
    if copy( sAux, length( sAux ), 1 ) <> '\' then
      sDirTemp:= sDirTemp + '\';
    IniFile.Free;
  end;
  Database.Connected:= True;

  LoadQuerysValidarIntegridad;

  with QExistePedido do
  begin
    SQL.Clear;
    SQL.Add(' select * from frf_pedido_cab ');
    SQL.Add(' where empresa_pdc = :empresa ');
    SQL.Add(' and centro_pdc = :centro ');
    SQL.Add(' and cliente_pdc = :cliente ');
    SQL.Add(' and dir_suministro_pdc = :suministro ');
    SQL.Add(' and ref_pedido_pdc = :pedido ');
    SQL.Add(' and fecha_pdc = :fecha ');
    Prepare;
  end;


  with QDatos_impuestos do
  begin
    SQL.Clear;
    SQL.add(' select tipo_i, descripcion_i, general_il, reducido_il, super_il, recargo_general_il, recargo_reducido_il, recargo_super_il ');
    SQL.add(' from frf_impuestos, frf_impuestos_l ');
    SQL.add(' where codigo_i = :codigo ');
    SQL.add(' and codigo_il = :codigo ');
    SQL.add(' and :fecha  between fecha_ini_il and case when fecha_fin_il is null then :fecha else fecha_fin_il end ');
  end;
  with QRecargo_equivalencia do
  begin
    SQL.Clear;
    SQL.add(' select * ');
    SQL.add(' from frf_impuestos_recargo_cli ');
    SQL.add(' where empresa_irc = :empresa ');
    SQL.add(' and cliente_irc = :cliente ');
    SQL.add(' and :fecha  between fecha_ini_irc and case when fecha_fin_irc is null then :fecha else fecha_fin_irc end ');
  end;
  with QCentro_es_de do
  begin
    SQL.Clear;
    SQL.add(' SELECT tipo_impuesto_c tipo_iva ');
    SQL.add(' FROM frf_centros Frf_centros ');
    SQL.add(' WHERE   (empresa_c = :empresa) ');
    SQL.add('    AND  (centro_c = :centro) ');
  end;
  with QCliente_es_de do
  begin
    SQL.Clear;
    SQL.add(' SELECT case when pais_fac_c is null then pais_c else pais_fac_c end pais,  ');
    SQL.add('        case when cod_postal_fac_c is null then cod_postal_c[1,2] else cod_postal_fac_c[1,2] end prov,  ');
    SQL.add('        es_comunitario_c comu, substr(nif_c,1,2) pais_nif  ');
    SQL.add(' FROM frf_clientes Frf_clientes ');
    SQL.add(' WHERE   (cliente_c = :cliente) ');
  end;
  with QSuminis_es_de do
  begin
    SQL.Clear;
    SQL.add(' select pais_ds pais, cod_postal_ds[1,2] prov ');
    SQL.add(' from frf_dir_sum ');
    SQL.add(' where cliente_ds=:cliente ');
    SQL.add(' and dir_sum_ds=:dirsum ');
    SQL.Add(' and fecha_baja_ds is null ');

  end;
end;

procedure TDOrdenCarga.LoadQuerysValidarIntegridad;
begin
  with QCajasPaletsOrden do
  begin
    SQL.Clear;
    SQL.Add(' select sum(cajas_ocl) cajas ');
    SQL.Add(' from frf_orden_carga_l ');
    SQL.Add(' where orden_ocl = :orden ');
    SQL.Add(' and linea_ocl <> :linea ');
    SQL.Add(' and empresa_ocl = :empresa ');
    SQL.Add(' and formato_cliente_ocl = :formato ');
  end;
  with QCajasPaletsPacking do
  begin
    SQL.Clear;
    SQL.Add(' select sum(cajas_pl) cajas ');
    SQL.Add(' from frf_packing_list ');
    SQL.Add(' where orden_pl = :orden ');
    SQL.Add(' and empresa_pl = :empresa ');
    SQL.Add(' and formato_cliente_pl = :formato ');
  end;
  with QCajasOrdenes do
  begin
    SQL.Clear;
    SQL.Add(' select sum( cajas_ocl ) cajas_ocl ');
    SQL.Add(' from frf_orden_carga_c, frf_orden_carga_l ');
    SQL.Add(' where empresa_occ = :empresa ');
    SQL.Add(' and centro_salida_occ = :centro ');
    SQL.Add(' and n_pedido_occ = :pedido ');
    SQL.Add(' and fecha_pedido_occ = :fecha ');
    SQL.Add(' and cliente_sal_occ = :cliente ');
    SQL.Add(' and dir_sum_occ = :suministro ');
    SQL.Add(' and orden_ocl = orden_occ ');
    SQL.Add(' and not ( orden_ocl = :orden and linea_ocl = :linea ) ');
    SQL.Add(' and formato_cliente_ocl = :formato ');
  end;
  with QCajasPedido do
  begin
    SQL.Clear;
    SQL.Add(' select sum(  nvl(cajas_aservir_pdd, cajas_pdd) ) cajas_pdd  ');
    SQL.Add(' from frf_pedido_cab, frf_pedido_det ');

    SQL.Add(' where empresa_pdc = :empresa ');
    SQL.Add(' and centro_pdc = :centro ');
    SQL.Add(' and ref_pedido_pdc = :pedido ');
    SQL.Add(' and fecha_pdc = :fecha ');
    SQL.Add(' and cliente_pdc = :cliente ');
    SQL.Add(' and dir_suministro_pdc = :suministro ');

    SQL.Add(' and empresa_pdd = :empresa ');
    SQL.Add(' and centro_pdd = :centro ');
    SQL.Add(' and pedido_pdd = pedido_pdc ');
    SQL.Add(' and formato_cliente_pdd = :formato ');
  end;
  with QExistePacking do
  begin
    SQL.Clear;
    SQL.Add(' select empresa_pl, producto_pl, envase_pl, sum(cajas_pl) cajas ');
    SQL.Add(' from frf_packing_list ');
    SQL.Add(' where orden_pl = :orden ');
    SQL.Add(' group by empresa_pl, producto_pl, envase_pl ');
    SQL.Add(' order by empresa_pl, producto_pl, envase_pl ');

  end;
  with QResumenOrden do
  begin
    SQL.Clear;
    SQL.Add(' select formato_cliente_ocl, sum(cajas_ocl) cajas_ocl ');
    SQL.Add(' from frf_orden_carga_l ');
    SQL.Add(' where orden_ocl = :orden ');
    SQL.Add(' group by formato_cliente_ocl ');
    SQL.Add(' order by formato_cliente_ocl ');
  end;
  with QResumenPacking do
  begin
    SQL.Clear;
    SQL.Add(' select formato_cliente_pl, sum(cajas_pl) cajas_pl ');
    SQL.Add(' from frf_packing_list ');
    SQL.Add(' where orden_pl = :orden ');
    SQL.Add(' group by formato_cliente_pl ');
    SQL.Add(' order  by formato_cliente_pl ');
  end;
end;

procedure TDOrdenCarga.DataModuleDestroy(Sender: TObject);
begin
  Database.CloseDataSets;

  if QExistePedido.Prepared then
    QExistePedido.UnPrepare;

  Database.Connected:= False;
end;

function ConsultaOpen( ADataSet: TDataSet; const ASQLString: String ): boolean;
begin
  result:= true;
end;

function TDOrdenCarga.GetLineaOrden( const AOrden: integer ): integer;
begin
  with QGetNumeroLinea do
  begin
    ParamByName('orden').AsInteger:= AOrden;
    Open;
    if IsEmpty then
    begin
      result:= 1;
    end
    else
    begin
      result:= Fields[0].AsInteger;
    end;
    Close
  end;
end;


//****************//****************//****************//****************
//****************CUESTIONES GEOGRAFICAS Y DE IMPUESTOS
//****************//****************//****************//****************

function ExentoImpuestos(const AEmpresa, ACliente: string): Boolean;
begin
  Result := ( ACliente = 'RET' );
end;

function TDOrdenCarga.ClienteEsDe( const AEmpresa, ACliente, ADirSum: string ): TZonaGeografica;
var
  pais, prov, comu: string;
begin
  //Cliente
  with QCliente_es_de do
  begin
    ParamByName('cliente').AsString := ACliente;
    Open;
    if FieldByName('pais_nif').AsString = 'FR' then
    begin
      pais := FieldByName('pais_nif').AsString;
    end
    else
    begin
      pais := FieldByName('pais').AsString;
    end;
    prov := FieldByName('prov').AsString;
    comu := FieldByName('comu').AsString;
    Cancel;
    Close;
  end;

  //Espa�ol
  if pais = 'ES' then
  begin
    //Direccion de suministro
    if (Trim(ADirSum) <> '') and (ADirSum <> ACliente) then
      with QSuminis_es_de do
      begin
        ParamByName('cliente').AsString := ACliente;
        ParamByName('dirsum').AsString := ADirSum;
        Open;
        pais := FieldByName('pais').AsString;
        prov := FieldByName('prov').AsString;
        Cancel;
        Close;
      end;

    //Canario
    if ( pais = 'ES' ) and ( (prov = '38') or (prov = '35') ) then
      ClienteEsDe := zgCanario
    //Peninsular
    else
      ClienteEsDe := zgPeninsular;
  end
  else
  //Extranjero
  begin
    if comu = 'S' then
      ClienteEsDe := zgComunitario
    else
      ClienteEsDe := zgExtra;
  end;
end;

function TDOrdenCarga.ImpuestosEntre(const AEmpresa, ACentro, ACliente, ASuministro: string ): string;
var
  sAux: string;
begin
  with QCentro_es_de do
  begin
    ParamByName('empresa').AsString := AEmpresa;
    ParamByName('centro').AsString := ACentro;
    Open;
    sAux:= FieldByName('tipo_iva').AsString;
    Close;
  end;

  if ( sAux = 'IVA' ) then
  begin
        case ClienteEsDe( AEmpresa, ACliente, ASuministro ) of
          zgPeninsular: //Destino peninsula IGIC normal
            ImpuestosEntre := 'IR';
          zgComunitario: //CEE sin IVA
            ImpuestosEntre := 'IC';
          zgCanario, zgExtra: //Otros sin IVA
            ImpuestosEntre := 'IE';
        end;
  end
  else
  if sAux = 'IGIC' then
  begin
        case ClienteEsDe( AEmpresa, ACliente, ASuministro ) of
          zgCanario: //Destino canario IGIC normal
            ImpuestosEntre := 'GR';
          zgPeninsular, zgComunitario, zgExtra: //Otros sin IGIC
            ImpuestosEntre := 'GE';
        end;
  end
  else
  if sAux = 'EXEN' then
  begin
    //Exento
    Result:= 'E';
  end
  else
  begin
    raise Exception.Create('Falta el tipo de IVA a aplicar al centro.');
  end;
end;

function TDOrdenCarga.ClienteConRecargo(const AEmpresa, ACliente: string; const AFecha: TDateTime ): Boolean;
begin
    with QRecargo_equivalencia do
    begin
      ParamByName('empresa').AsString := AEmpresa;
      ParamByName('cliente').AsString := ACliente;
      ParamByName('fecha').AsDate := AFecha;
      try
        Open;
        Result:= not IsEmpty;
      finally
        Close;
      end;
    end;
end;

function TDOrdenCarga.ImpuestosCliente(const AEmpresa, ACentro, ACliente, ASuministro: string; const AFecha: TDatetime ): TImpuesto;
var
  sAux: string;
  rRecargoGeneral, rRecargoReducido, rRecargoSuper: Real;
begin
  if not ExentoImpuestos(AEmpresa, ACliente) then
  begin
    sAux := ImpuestosEntre( AEmpresa, ACentro, ACliente, ASuministro );
    with QDatos_impuestos do
    begin
      ParamByName('codigo').AsString := sAux;
      ParamByName('fecha').AsDate := AFecha;
      Open;
      result.sCodigo := sAux;
      result.sTipo := FieldByName('tipo_i').AsString;
      result.sDescripcion := FieldByName('descripcion_i').AsString;
      (*IVA*)
      result.rGeneral := FieldByName('general_il').AsFloat;
      result.rReducido := FieldByName('reducido_il').AsFloat;
      result.rSuper := FieldByName('super_il').AsFloat;
      (*RECARGO*)
      rRecargoGeneral := FieldByName('recargo_general_il').AsFloat;
      rRecargoReducido:= FieldByName('recargo_reducido_il').AsFloat;
      rRecargoSuper := FieldByName('recargo_super_il').AsFloat;
      Cancel;
      Close;
    end;
    if ClienteConRecargo( AEmpresa, ACliente, AFecha ) then
    begin
      result.rGeneral := result.rGeneral + rRecargoGeneral;
      result.rReducido := result.rReducido + rRecargoReducido;
      result.rSuper := result.rSuper + rRecargoSuper;
    end;
  end
  else
  begin
    result.sCodigo := 'E';
    result.sTipo := 'EXEN';
    result.sDescripcion := 'EXENTO';
    result.rGeneral := 0;
    result.rReducido := 0;
    result.rSuper := 0;
  end;
end;

//
//Cambiar datos del detalle
//
procedure TDOrdenCarga.CambiarEmpresaDetalle( const AOrden: integer; AEmpresa: String );
begin
  QAUx.SQL.Clear;
  QAUx.SQL.Add(' update frf_orden_carga_l ');
  QAUx.SQL.Add(' set empresa_ocl = :empresa ');
  QAUx.SQL.Add(' where orden_ocl = :orden ');
  QAUx.ParamByName('empresa').AsString:= AEmpresa;
  QAUx.ParamByName('orden').AsInteger:= AOrden;
  QAUx.ExecSQL;
end;

procedure TDOrdenCarga.CambiarCentroDetalle( const AOrden: integer; ACentro: String );
begin
  QAUx.SQL.Clear;
  QAUx.SQL.Add(' update frf_orden_carga_l ');
  QAUx.SQL.Add(' set centro_salida_ocl = :centro ');
  QAUx.SQL.Add(' where orden_ocl = :orden ');
  QAUx.ParamByName('centro').AsString:= ACentro;
  QAUx.ParamByName('orden').AsInteger:= AOrden;
  QAUx.ExecSQL;
end;

procedure TDOrdenCarga.CambiarFechaDetalle( const AOrden: integer; AFecha: TDateTime );
begin
  QAUx.SQL.Clear;
  QAUx.SQL.Add(' update frf_orden_carga_l ');
  QAUx.SQL.Add(' set fecha_ocl = :fecha ');
  QAUx.SQL.Add(' where orden_ocl = :orden ');
  QAUx.ParamByName('fecha').AsDate:= AFecha;
  QAUx.ParamByName('orden').AsInteger:= AOrden;
  QAUx.ExecSQL;
end;

procedure TDOrdenCarga.CambiarClienteDetalle( const AOrden: integer; ACliente: String );
begin
  QAUx.SQL.Clear;
  QAUx.SQL.Add(' update frf_orden_carga_l ');
  QAUx.SQL.Add(' set cliente_ocl = :cliente ');
  QAUx.SQL.Add(' where orden_ocl = :orden ');
  QAUx.ParamByName('cliente').AsString:= ACliente;
  QAUx.ParamByName('orden').AsInteger:= AOrden;
  QAUx.ExecSQL;
end;

(*IVA*)
//Result -> 0:super 1:reducido 2:general
function TDOrdenCarga.TipoIVAEnvase(const AEmpresa, AEnvase, AProducto: string ): Integer;
begin
  QAux.SQL.Clear;
  QAux.SQL.Add('select nvl(tipo_iva_e,0) tipo_iva_e ');
  QAux.SQL.Add('from frf_envases ');
  QAux.SQL.Add('where producto_e = :producto ');
  QAux.SQL.Add('and envase_e = :envase ');
  QAux.ParamByName('producto').AsString:= AProducto;
  QAux.ParamByName('envase').AsString:= AEnvase;
  QAux.Open;
  result:= QAux.FieldByName('tipo_iva_e').AsInteger;
  QAux.Close;
end;

function TDOrdenCarga.TipoIvaEnvaseProducto( const AEmpresa, AEnvase, AProducto: string ): Integer;
var
  sAux: string;
begin
{
  QAUx.SQL.Clear;
  QAUx.SQL.Add(' select producto_base_p');
  QAUx.SQL.Add(' from frf_productos');
  QAUx.SQL.Add(' where producto_p = :producto ');
  QAUx.ParamByName('producto').AsString:= AProducto;
  QAUx.Open;
  sAux:= QAux.FieldByName('producto_base_p').AsString;
  QAUx.Close;
}
  Result:= TipoIvaEnvase( AEmpresa, AEnvase, AProducto );
end;


procedure TDOrdenCarga.CambiarImpuestoDetalle( const AOrden: integer; AImpuesto: TImpuesto );
var
  rImporte, rTipoIva: real;
begin
  rTipoIva:=  0;

  QTemp.SQL.Clear;
  QTemp.SQL.Add(' select empresa_ocl, linea_ocl, envase_ocl, producto_ocl, importe_neto_ocl ');
  QTemp.SQL.Add(' from frf_orden_carga_l ');
  QTemp.SQL.Add(' where orden_ocl = :orden ');
  QTemp.ParamByName('orden').AsInteger:= AOrden;
  QTemp.Open;

  while not QTemp.Eof do
  begin
    rImporte:= QTemp.FieldByName('importe_neto_ocl').AsFloat;
    case TipoIvaEnvaseProducto( QTemp.FieldByName('empresa_ocl').AsString,
                      QTemp.FieldByName('envase_ocl').AsString,
                      QTemp.FieldByName('producto_ocl').AsString )of
      0: rTipoIva:=  AImpuesto.rSuper;
      1: rTipoIva:=  AImpuesto.rReducido;
      2: rTipoIva:=  AImpuesto.rGeneral;
    end;

    QAUx.SQL.Clear;
    QAUx.SQL.Add(' update frf_orden_carga_l ');
    QAUx.SQL.Add(' set porc_iva_ocl = :porcion, ');
    QAUx.SQL.Add('     tipo_iva_ocl = :tipo, ');
    QAUx.SQL.Add('     iva_ocl = :iva, ');
    QAUx.SQL.Add('     importe_total_ocl = :importe ');
    QAUx.SQL.Add(' where orden_ocl = :orden ');
    QAUx.SQL.Add('   and linea_ocl = :linea ');

    QAUx.ParamByName('porcion').AsFloat:= rTipoIva;
    QAUx.ParamByName('tipo').AsString:= AImpuesto.sCodigo;
    QAUx.ParamByName('iva').AsFloat:= bRoundTo( ( rImporte * rTipoIva ) / 100, 2);
    QAUx.ParamByName('importe').AsFloat:= QAUx.ParamByName('iva').AsFloat + rImporte;
    QAUx.ParamByName('orden').AsInteger:= AOrden;
    QAUx.ParamByName('linea').AsInteger:= QTemp.FieldByName('linea_ocl').AsInteger;
    QAUx.ExecSQL;

    QTemp.Next;
  end;
  QTemp.Close;
end;

function TDOrdenCarga.EmpProcedencia(AEmpresa, ACliente, AProducto, ACentro: string): string;
begin
  result := AEmpresa;
  if (AEmpresa = '050') and ((AProducto = 'F') or (AProducto = 'C') or (AProducto = 'M')) and (ACentro = '1') then
  begin
    Result := '501';
  end;
  if (AEmpresa = '050') and (AProducto = 'T') and (ACentro = '1') then
  begin
    if (ACliente = 'ASO') or
      (ACliente = 'CEM') or
      (ACliente = 'FSR') or
      (ACliente = 'HFR') or
      (ACliente = 'PAT') or
      (ACliente = 'SAA') or
       //EXTRANJEROS
      (ACliente = 'BUR') or
      (ACliente = 'DW') or
      (ACliente = 'FG') or
      (ACliente = 'FN') or
      (ACliente = 'HB') or
      (ACliente = 'HSP') or
      (ACliente = 'IB') or
      (ACliente = 'LE') or
      (ACliente = 'WS') then
      Result := '501';
  end;
end;

function TDOrdenCarga.DatosEnvaseCliente( const AEmpresa, AProducto, ACliente, AEnvase: string;
                                 var ADescripcion: string;
                                 var AUnidadesCaja: integer; var AUnidadVariable: boolean;
                                 var ANetoCaja: Real;  var APesoVariable: boolean;
                                 var AUnidadFacturacion:string   ): boolean;
begin
  with QAux do
  begin
    SQL.Clear;
    //SQL.Add(' select case when NVL(peso_neto_e,0) = 0 then 1 else 0 end peso_variable, ');
    SQL.Add(' select peso_variable_e peso_variable, unidades_variable_e unidades_variable, ');
    SQL.Add('        peso_neto_e peso, unidades_e unidades, ');

    SQL.Add(' (select unidad_fac_ce  from frf_clientes_env ');
    SQL.Add(' where empresa_ce = :empresa and producto_ce = producto_e ');
    SQL.Add(' and envase_ce = :envase and cliente_ce = :cliente) facturar, ');
    SQL.Add(' descripcion_e descripcion ');

    SQL.Add(' from frf_envases ');

    SQL.Add(' where producto_e = :producto ');
    SQL.Add(' and envase_e = :envase ');

    ParamByName('empresa').AsString:= AEmpresa;
    ParamByName('producto').AsString:= AProducto;
    ParamByName('envase').AsString:= AEnvase;
    ParamByName('cliente').AsString:= ACliente;

    Open;
    result:= not IsEmpty;
    if result then
    begin
      APesoVariable:= ( FieldByName('peso').AsFloat = 0 ) or ( FieldByName('peso_variable').AsInteger <> 0 );
      //AUnidadVariable:= ( FieldByName('unidades').AsFloat = 0 ) or ( FieldByName('unidades_variable').AsInteger <> 0 );
      AUnidadVariable:= ( FieldByName('unidades_variable').AsInteger <> 0 );
      ANetoCaja:= FieldByName('peso').AsFloat;
      //if FieldByName('unidades').AsInteger > 1 then
        AUnidadesCaja:= FieldByName('unidades').AsInteger;
      //else
        //AUnidadesCaja:= 1;
      AUnidadFacturacion:= FieldByName('facturar').AsString;
      if AUnidadFacturacion = '' then
      begin
        if gsEmpresa = '078' then
          AUnidadFacturacion:= 'U'
        else
          AUnidadFacturacion:= 'K';
      end;
      ADescripcion:= FieldByName('descripcion').AsString;
    end
    else
    begin
      APesoVariable:= true;
      AUnidadVariable:= True;
      ANetoCaja:= 0;
      AUnidadesCaja:= 0;
      AUnidadFacturacion:= '';
      ADescripcion:= '';
    end;
    Close;
  end;
end;


function TDOrdenCarga.DatosFormatoCliente( const AEmpresa, ACliente, ASuministro, AFormatoCliente: string;
      var ADesFormato, ATipoPalet, ATipoEnvase, AUnidadPedido, AUnidadFacturacion, AProducto: string;
      var AMarca, ACategoria, ACalibre, AColor, AProductoControl: String;
      var ACajasPalet, AUnidadesCaja: integer;
      var APesoVariable: boolean; var ANetoCaja: Real ): boolean;
var
  sFormato: string;
begin
  (*TODO*)
  //Un formato de cliente puede corresponder a varios nuestros, deberiamos
  //dar a elegir cual corresponde??
  //A�adimos un campo que sea cual es que usamos por defecto ???
  with QAux do
  begin
    //Seleccionamos formato
    SQL.Clear;
    SQL.Add(' select formato_fc, descripcion_fc, unidad_pedido_fc ');
    SQL.Add(' from frf_formatos_cli, frf_formatos ');
    SQL.Add(' where empresa_fc = :empresa ');
    SQL.Add(' and cliente_fc = :cliente ');
    SQL.Add(' and suministro_fc = :dirSum ');
    SQL.Add(' and formato_cliente_fc = :formatoCliente ');
    SQL.Add(' and empresa_fc = empresa_f ');
    SQL.Add(' and formato_fc = codigo_f ');
    SQL.Add(' and fecha_baja_f is null ');

    ParamByName('empresa').AsString:= AEmpresa;
    ParamByName('cliente').AsString:= ACliente;
    ParamByName('dirsum').AsString:= ASuministro;
    ParamByName('formatoCliente').AsString:= AFormatoCliente;

    Open;

    if IsEmpty then
    begin
      Close;
      ParamByName('dirsum').AsString:= '*';
      Open;
    end;

    if IsEmpty then
    begin
      result:= False;

      ADesFormato:= '';
      ATipoPalet:= '';
      ATipoEnvase:= '';
      AUnidadPedido:= '';
      AUnidadFacturacion:= '';
      AProducto:= '';
      AProductoControl:= '';
      ACajasPalet:= 0;
      AUnidadesCaja:= 0;
      APesoVariable:= False;
      ANetoCaja:= 0;

      Close;
    end
    else
    begin
      result:= True;

      ADesFormato:= FieldByName('descripcion_fc').AsString;
      AUnidadPedido:= FieldByName('unidad_pedido_fc').AsString;
      sFormato:= FieldByName('formato_fc').AsString;
      Close;

      SQL.Clear;
      SQL.Add(' select productop_f, producto_f, envase_f, palet_f, n_cajas_f, ');
      SQL.Add('        marca_f, categoria_f, calibre_f, color_f ');
      SQL.Add(' from frf_formatos ');
      SQL.Add(' where empresa_f = :empresa ');
      SQL.Add(' and codigo_f = :formato ');

      ParamByName('empresa').AsString:= AEmpresa;
      ParamByName('formato').AsString:= sFormato;

      Open;

      AProducto := FieldByName('productop_f').AsString;
      AProductoControl := FieldByName('productop_f').AsString;
//      AProductoBase:= FieldByName('producto_f').AsInteger;
      ATipoEnvase:= FieldByName('envase_f').AsString;
      ATipoPalet:= FieldByName('palet_f').AsString;
      ACajasPalet:= FieldByName('n_cajas_f').AsInteger;
      AMarca:= FieldByName('marca_f').AsString;
      ACategoria:= FieldByName('categoria_f').AsString;
      ACalibre:= FieldByName('calibre_f').AsString;
      AColor:= FieldByName('color_f').AsString;

      Close;

      SQL.Clear;
      SQL.Add(' select peso_variable_e, peso_neto_e, unidades_e ');
      SQL.Add(' from frf_envases ');
      SQL.Add(' where ( producto_e = :producto or producto_e is null ) ');
      SQL.Add(' and envase_e = :envase  ');

      ParamByName('producto').AsString:= AProducto;
      ParamByName('envase').AsString:= ATipoEnvase;

      Open;

      APesoVariable:= FieldByName('peso_variable_e').AsInteger = 1;
      ANetoCaja:= FieldByName('peso_neto_e').AsFloat;
      AUnidadesCaja:= FieldByName('unidades_e').AsInteger;

      Close;

      SQL.Clear;
      SQL.Add(' select unidad_fac_ce ');
      SQL.Add(' from frf_clientes_env ');
      SQL.Add(' where empresa_ce = :empresa ');
      SQL.Add(' and ( producto_ce = :producto or producto_ce is null ) ');
      SQL.Add(' and envase_ce = :envase ');
      SQL.Add(' and cliente_ce = :cliente ');

      ParamByName('empresa').AsString:= AEmpresa;
      ParamByName('producto').AsString:= AProducto;
      ParamByName('envase').AsString:= ATipoEnvase;
      ParamByName('cliente').AsString:= ACliente;

      Open;

      if not IsEmpty then
      begin
        AUnidadFacturacion:= FieldByName('unidad_fac_ce').AsString;
        if AUnidadFacturacion = '' then
          AUnidadFacturacion:= AUnidadPedido;
      end
      else
      begin
        AUnidadFacturacion:= AUnidadPedido;
      end;

      Close;

      (*TODO*)
      (*
      SQL.Clear;
      SQL.Add(' select producto_p ');
      SQL.Add(' from frf_productos ');
      SQL.Add(' where empresa_P = :empresa ');
      SQL.Add(' and producto_base_P = :producto ');

      ParamByName('empresa').AsString:= AEmpresa;
      ParamByName('producto').AsInteger:= AProductoBase;

      Open;

      AProducto:= FieldByName('producto_p').AsString;
      *)
{
      SQL.Clear;
      SQL.Add(' select producto_pb ');
      SQL.Add(' from frf_productos_base ');
      SQL.Add(' where empresa_pb = :empresa ');
      SQL.Add(' and producto_base_pb = :producto ');

      ParamByName('empresa').AsString:= AEmpresa;
      ParamByName('producto').AsInteger:= AProductoBase;

      Open;
      AProducto:= FieldByName('producto_pb').AsString;

      Close;
}
    end;
  end;
end;

function TDOrdenCarga.TieneSuministros( const AEmpresa, ACliente: string ): Boolean;
begin
  with QAux do
  begin
    SQL.Clear;
    SQL.Add(' select count(*) ');
    SQL.Add(' from frf_dir_sum ');
    SQL.Add(' where cliente_ds = :cliente  ');
    SQL.Add(' and fecha_baja_ds is null ');

    ParamByName('cliente').AsString:= ACliente;
    Open;
    result:= Fields[0].AsInteger > 0;
    Close;
  end;
end;

function TDOrdenCarga.ExisteSuministro( const AEmpresa, ACliente, ASuministro: string ): Boolean;
begin
  with QAux do
  begin
    SQL.Clear;
    SQL.Add(' select count(*) ');
    SQL.Add(' from frf_dir_sum ');
    SQL.Add(' where cliente_ds = :cliente  ');
    SQL.Add(' and dir_sum_ds = :dir_sum  ');
    SQL.Add(' and fecha_baja_ds is null ');
    
    ParamByName('cliente').AsString:= ACliente;
    ParamByName('dir_sum').AsString:= ASuministro;
    Open;
    result:= Fields[0].AsInteger > 0;
    Close;
  end;
end;

function TDOrdenCarga.EsDirSuministroValida( const AEmpresa, ACliente, ASuministro: String ): Boolean;
begin
  if ASuministro = '' then
  begin
    result:= False;
  end
  else
  begin
    if TieneSuministros( AEmpresa, ACliente ) then
    begin
      result:= ExisteSuministro( AEmpresa, ACliente, ASuministro );
      if not result then
      begin
        result:= (ASuministro = ACliente);
      end;
    end
    else
    begin
      result:= (ASuministro = ACliente);
    end;
  end;
end;

function TDOrdenCarga.ExisteTransito( const AEmpresa, ACentro: String; const AReferencia: Integer;
      const AFecha: TDateTime; const AProducto: string; var AKilos: Real ): boolean;
begin
  with QAux do
  begin
    SQL.Clear;
    SQL.Add(' select count(*) lineas, sum(kilos_tl) kilos ');
    SQL.Add(' from frf_transitos_l ');
    SQL.Add(' where empresa_tl = :empresa ');
    SQL.Add(' and centro_tl = :centro ');
    SQL.Add(' and referencia_tl = :referencia ');
    SQL.Add(' and fecha_tl = :fecha ');
    SQL.Add(' and producto_tl = :producto ');

    ParamByName('empresa').AsString:= AEmpresa;
    ParamByName('centro').AsString:= ACentro;
    ParamByName('producto').AsString:= AProducto;
    ParamByName('referencia').AsInteger:= AReferencia;
    ParamByName('fecha').AsDate:= AFecha;
    Open;
    result:= FieldByName('lineas').AsFloat > 0;
    if result then
    begin
      AKilos:= FieldByName('kilos').AsFloat;
    end;
    Close;
  end;
end;

(*
function TDOrdenCarga.ExisteTransito(
  const AEmpresa, ACentroOrigen: String; const AReferencia: Integer; const AFechaSal: TDateTime; const AProducto: string;
  var ACentro: string; var AFecha: TDateTime; var AKilos: Real ): boolean;
begin
  with QAux do
  begin
    SQL.Clear;
    SQL.Add(' select empresa_tl empresa, centro_tl centro, referencia_tl referencia, fecha_tl fecha, sum(kilos_tl) kilos ');
    SQL.Add(' from frf_transitos_l ');
    SQL.Add(' where empresa_tl = :empresa ');
    SQL.Add(' and referencia_tl = :referencia ');
    SQL.Add(' and centro_origen_tl = :centro_origen ');
    SQL.Add(' and producto_tl = :producto ');
    SQL.Add(' and ( :fecha_sal - fecha_tl ) between 0 and 60 ');
    SQL.Add(' group by empresa_tl, centro_tl, referencia_tl, fecha_tl ');
    ParamByName('empresa').AsString:= AEmpresa;
    ParamByName('centro_origen').AsString:= ACentroOrigen;
    ParamByName('producto').AsString:= AProducto;
    ParamByName('referencia').AsInteger:= AReferencia;
    ParamByName('fecha_sal').AsDate:= AFechaSal;
    Open;
    result:= not IsEmpty;
    if result then
    begin
      ACentro:= FieldByName('centro').AsString;
      AFecha:= FieldByName('fecha').AsDateTime;
      AKilos:= FieldByName('kilos').AsFloat;
    end;
    Close;
  end;
end;
*)

function TDOrdenCarga.TransitoKilosAlbaran( const AEmpresa, ACentro: string; const AFecha: TDateTime;
  const AReferencia: Integer; const AProducto: String ): real;
begin
  with QAux do
  begin
    SQL.Clear;
    SQL.Add(' select sum(kilos_sl) kilos ');
    SQL.Add(' from frf_salidas_l ');
    SQL.Add(' where empresa_sl = :empresa ');
    SQL.Add(' and centro_origen_sl = :centro ');
    SQL.Add(' and ref_transitos_sl = :referencia ');
    SQL.Add(' and ( fecha_sl - :fecha ) between 0 and 60 ');
    SQL.Add(' and producto_sl = :producto ');
    ParamByName('empresa').AsString:= AEmpresa;
    ParamByName('centro').AsString:= ACentro;
    ParamByName('referencia').AsInteger:= AReferencia;
    ParamByName('fecha').AsDate:= AFecha;
    ParamByName('producto').AsString:= AProducto;
    Open;
    result:= Fields[0].AsFloat;
    Close;
  end;
end;

function TDOrdenCarga.TransitoKilosCarga( const AEmpresa, ACentro: string; const AFecha: TDateTime;
  const AReferencia: Integer; const AProducto: String ): real;
begin
  with QAux do
  begin
    SQL.Clear;
    SQL.Add(' select sum(kilos_ocl) kilos ');
    SQL.Add(' from frf_orden_carga_l, frf_orden_carga_c ');
    SQL.Add(' where empresa_ocl = :empresa ');
    SQL.Add(' and centro_origen_ocl = :centro ');
    SQL.Add(' and ref_transitos_ocl = :referencia ');
    SQL.Add(' and ( fecha_ocl - :fecha ) between 0 and 60 ');
    SQL.Add(' and producto_ocl = :producto ');
    SQL.Add(' and orden_occ = orden_ocl ');
    SQL.Add(' and traspasada_occ = 0 ');
    ParamByName('empresa').AsString:= AEmpresa;
    ParamByName('centro').AsString:= ACentro;
    ParamByName('referencia').AsInteger:= AReferencia;
    ParamByName('fecha').AsDate:= AFecha;
    ParamByName('producto').AsString:= AProducto;
    Open;
    result:= Fields[0].AsFloat;
    Close;
  end;
end;

function TDOrdenCarga.TransitoKilosTransito( const AEmpresa, ACentro: string; const AFecha: TDateTime;
  const AReferencia: Integer; const AProducto: String ): real;
begin
  with QAux do
  begin
    SQL.Clear;
    SQL.Add(' select sum(kilos_tl) kilos ');
    SQL.Add(' from frf_transitos_l ');
    SQL.Add(' where empresa_tl = :empresa ');
    SQL.Add(' and centro_origen_tl = :centro ');
    SQL.Add(' and ref_origen_tl = :referencia ');
    SQL.Add(' and fecha_origen_tl = :fecha ');
    SQL.Add(' and producto_tl = :producto ');
    ParamByName('empresa').AsString:= AEmpresa;
    ParamByName('centro').AsString:= ACentro;
    ParamByName('referencia').AsInteger:= AReferencia;
    ParamByName('fecha').AsDate:= AFecha;
    ParamByName('producto').AsString:= AProducto;
    Open;
    result:= Fields[0].AsFloat;
    Close;
  end;
end;

function TDOrdenCarga.EsTransitoCorrecto( const AEmpresa, ACentro: String; const AReferencia: Integer;
  const AFecha: TDateTime; const AProducto: string; const AKilos, AKilosAnterior: Real; var AMsg: String ): boolean;
var
  rKilos, rKilosSalidos, rFaltan: Real;
begin
  if ExisteTransito( AEmpresa, ACentro, AReferencia, AFecha, AProducto, rKilos ) then
  begin
    if AKilos <= rKilos then
    begin
      rKilosSalidos:= TransitoKilosAlbaran( AEmpresa, ACentro, AFecha, AReferencia, AProducto );
      rKilosSalidos:= rKilosSalidos + TransitoKilosCarga( AEmpresa, ACentro, AFecha, AReferencia, AProducto);
      rKilosSalidos:= rKilosSalidos + TransitoKilosTransito( AEmpresa, ACentro, AFecha, AReferencia, AProducto);
      rFaltan:= Abs( rKilos - rKilosSalidos - AKilosAnterior );
      rKilosSalidos:= rKilosSalidos + ( AKilos - AKilosAnterior );
      if rKilosSalidos <= rKilos then
      begin
        result:= True;
      end
      else
      begin
        AMsg:= 'Se esta intentanto asignar a la salida mas kilos que quedan en el tr�nsito (' + FloatToStr(rFaltan) + 'Kgs).';
        result:= False;
      end;
    end
    else
    begin
      AMsg:= 'Se esta intentanto asignar a la salida mas kilos que el tr�nsito tiene (' + FloatToStr(rKilos) + 'Kgs).';
      result:= False;
    end;
  end
  else
  begin
    AMsg:= 'No existe el transito o producto incorrecto.';
    result:= False;
  end;
end;

procedure TDOrdenCarga.CambiarEstado( const AOrden: Integer; const AEstado: Integer );
begin
  With QCambiarEstado do
  begin
    ParamByName('orden').AsInteger:= AOrden;
    ParamByName('estado').AsInteger:= AEstado;
    ExecSQL;
  end;
end;

procedure TDOrdenCarga.DesfinalizarOrden( const AOrden: Integer );
begin
  With QDesfinalizarOrden do
  begin
    ParamByName('orden').AsInteger:= AOrden;
    ExecSQL;
  end;
end;

function TDOrdenCarga.ComprobarIntegridadLinea( Const AOrden, ALinea: integer; Const AEmpresa, AFormato: string; const ACajas: Integer ): boolean;
var
  iCajasOrden, iCajasPacking: integer;
begin
  with QCajasPaletsOrden do
  begin
    ParamByName('orden').AsInteger:= AOrden;
    ParamByName('linea').AsInteger:= ALinea;
    ParamByName('empresa').AsString:= AEmpresa;
    ParamByName('formato').AsString:= AFormato;
    Open;
    iCajasOrden:= Fields[0].AsInteger + ACajas;
    Close;
  end;
  with QCajasPaletsPacking do
  begin
    ParamByName('orden').AsInteger:= AOrden;
    ParamByName('empresa').AsString:= AEmpresa;
    ParamByName('formato').AsString:= AFormato;
    Open;
    iCajasPacking:= Fields[0].AsInteger;
    Close;
  end;
  result:= ( iCajasPacking <= iCajasOrden );
end;

function TDOrdenCarga.ComprobarIntegridadPedido( Const AOrden, ALinea: integer;
  const AEmpresa, ACentro, ACliente, ASumnistro, APedido, AFecha, AFormato: string;
  const ACajas: Integer ): integer;
var
  iCajasOrden, iCajasPedido: integer;
begin
  with QCajasOrdenes do
  begin
    ParamByname('empresa').AsString:= AEmpresa;
    ParamByname('centro').AsString:= ACentro;
    ParamByname('cliente').AsString:= ACliente;
    ParamByname('suministro').AsString:= ASumnistro;
    ParamByname('pedido').AsString:= APedido;
    ParamByname('fecha').AsString:= AFecha;
    ParamByName('formato').AsString:= AFormato;
    ParamByName('orden').AsInteger:= AOrden;
    ParamByName('linea').AsInteger:= ALinea;
    Open;
    iCajasOrden:= Fields[0].AsInteger + ACajas;
    Close;
  end;
  with QCajasPedido do
  begin
    ParamByname('empresa').AsString:= AEmpresa;
    ParamByname('centro').AsString:= ACentro;
    ParamByname('cliente').AsString:= ACliente;
    ParamByname('suministro').AsString:= ASumnistro;
    ParamByname('pedido').AsString:= APedido;
    ParamByname('fecha').AsString:= AFecha;
    ParamByName('formato').AsString:= AFormato;

    try
      Open;
    except
      SQL.SaveToFile('c:\SQLError.sql');
      raise;
    end;
    iCajasPedido:= Fields[0].AsInteger;
    Close;
  end;
  result:= iCajasPedido - iCajasOrden;
end;

function TDOrdenCarga.ComprobarIntegridadOrden( Const AOrden: integer ): boolean;
begin
  with QExistePacking do
  begin
    ParamByName('orden').AsInteger:= AOrden;
    Open;
    result:= IsEmpty;
    Close;
  end;
end;


function TDOrdenCarga.IsEnvaseCorrecto( const AEmpresa, AProducto, AEnvase: string ): boolean;
var
  iProductoBase: integer;
begin
  if ( Trim(AEmpresa) <> '' ) and ( Trim(AProducto) <> '' ) and ( Trim( AEnvase ) <> '' )then
  with QAux do
  begin
{
    SQL.Clear;
    //Producto base
    SQL.Add( 'select producto_base_p from frf_productos ' );
    SQL.Add( 'where empresa_p = :empresa and producto_p = :producto ');
    ParamByName('empresa').AsString:= AEmpresa;
    ParamByName('producto').AsString:= AProducto;
    Open;
    iProductoBase:= FieldByName('producto_base_p').AsInteger;
    Close;
 }
    //Existe el envase para ese producto base
    SQL.Clear;
    SQL.Add('select * from frf_envases ');
    SQL.Add('where producto_e = :producto ');
    SQL.Add('  and envase_e = :envase ');
    ParamByName('producto').AsString:= AProducto;
    ParamByName('envase').AsString:= AEnvase;
    Open;

    if IsEmpty then
    begin
      Close;
      //Existe el envase sin producto base (para todos los productos)
      SQL.Clear;
      SQL.Add('select * from frf_envases ');
      SQL.Add('where producto_e is null ');
      SQL.Add('  and envase_e = :envase ');
      ParamByName('envase').AsString:= AEnvase;
      Open;

      Result:= not IsEmpty;
      Close;
    end
    else
    begin
      result:= True;
    end;
  end
  else
  begin
    result:= False;
  end;
end;

procedure TDOrdenCarga.UpdatePaletsCab( const AOrden: integer );
begin
  with QUpdatePaletCab do
  begin
    ParamByName('orden').AsInteger:= AOrden;
    ExecSQL;
  end;
end;

function TDOrdenCarga.GetProductoBase( const AEmpresa, AProducto: string ): string;
begin
  with QGetProductoBase do
  begin
    ParamByName('producto').AsString:= AProducto;
    Open;
    result:= FieldByName('producto_base_p').AsString;
    Close;
  end;
end;

function TDOrdenCarga.GetProducto( const AEmpresa, AProductoBase: string ): string;
begin
  with QGetProducto do
  begin
    ParamByName('producto').AsString:= AProductoBase;
    Open;
    result:= FieldByName('producto_p').AsString;
    Close;
  end;
end;

function TDOrdenCarga.IntegridadTitle: string;
begin
  result:= '---------------------------------------------------------'  + #13 + #10 +
           'Formato Cliente  | Cajas Orden  | Cajas Packing'  + #13 + #10 +
           '---------------------------------------------------------'  + #13 + #10;
end;

function TDOrdenCarga.IntegridadStr( const AEmpresa: string; const ATipo: integer ): string;
begin
  case ATipo of
    1: result:= 'Formato: ' + QResumenOrden.FieldByName('formato_cliente_ocl').AsString + ' -> '  +
                'Orden: ' + QResumenOrden.FieldByName('cajas_ocl').AsString + ' - '  +
                'Packing: 0 ' + #13 + #10;

    2: result:= 'Formato: ' + QResumenPacking.FieldByName('formato_cliente_pl').AsString + ' -> '  +
                'Orden: 0 ' +  ' - '  +
                'Packing: ' + QResumenPacking.FieldByName('cajas_pl').AsString + #13 + #10;

    3: result:= 'Formato: ' + QResumenOrden.FieldByName('formato_cliente_ocl').AsString + ' -> '  +
                'Orden: ' + QResumenOrden.FieldByName('cajas_ocl').AsString + ' - '  +
                'Packing: ' + QResumenPacking.FieldByName('cajas_pl').AsString + #13 + #10;
  end;
end;

procedure AddMsg( var AMsg: string; const ACad: string );
begin
  if AMsg = '' then
    AMsg:=  ACad
  else
    AMsg:=  AMsg + #13 + #10 + ACad;
end;

function TDOrdenCarga.LineasSinKilos( const AEmpresa: string; const AOrden: integer ): boolean;
begin
  with QAux do
  begin
    SQL.Clear;
    SQL.Add('select *  ');
    SQL.Add('from frf_orden_carga_l   ');
    SQL.Add('where empresa_ocl = :empresa  ');
    SQL.Add('and orden_ocl = :orden ');
    SQL.Add('and kilos_ocl = 0 ');
    ParamByName('empresa').AsString:= AEmpresa;
    ParamByName('orden').AsInteger:= AOrden;
    Open;
    Result:= not IsEmpty;
    Close;
  end;
end;

function TDOrdenCarga.UnidadesCorrectas( const AEmpresa: string; const AOrden: integer; var AMsg: string ): Boolean;
begin
  Result:= false;
  AMsg:= '';
  with QAux do
  begin
    SQL.Clear;
    SQL.Add('select orden_ocl, producto_ocl, envase_ocl, unidades_caja_ocl, unidades_variable_e, unidades_e,  kilos_ocl, peso_variable_e, round( peso_neto_e * cajas_ocl, 2) peso  ');
    SQL.Add('from frf_orden_carga_l join frf_envases on envase_e = envase_ocl  ');
    SQL.Add('where empresa_ocl = :empresa  ');
    SQL.Add('and orden_ocl = :orden ');
    ParamByName('empresa').AsString:= AEmpresa;
    ParamByName('orden').AsInteger:= AOrden;
    Open;
    if not IsEmpty then
    begin
      while not Eof do
      begin
        //Kilos
        if FieldByName('peso_variable_e').AsInteger = 0 then
        begin
          if FieldByName('kilos_ocl').AsInteger <> FieldByName('peso').AsInteger then
          begin
            AddMsg( AMsg, 'ERROR: No coincide los kilos para el envase ' + FieldByname('envase_ocl').AsString +
                          ' Albaran: ' +  FieldByname('kilos_ocl').AsString +  ' Esperado: ' +
                          FieldByname('peso').AsString );
          end;
        end;
        //Unidades
        if FieldByName('unidades_variable_e').AsInteger = 0 then
        begin
          if FieldByName('unidades_caja_ocl').AsInteger <> FieldByName('unidades_e').AsInteger then
          begin
            AddMsg( AMsg, 'ERROR: No coincide las unidades por caja para el envase ' + FieldByname('envase_ocl').AsString +
                          ' Albaran: ' +  FieldByname('unidades_caja_ocl').AsString +  ' Esperado: ' +
                          FieldByname('unidades_e').AsString );
          end;
        end;
        Next;
      end;
      Result:= AMsg = '';
    end
    else
    begin
      AMsg:= 'ERROR: Albaran sin lineas.';
    end;
    Close;
  end;
end;

function TDOrdenCarga.ComprobarIntegridad( const AEmpresa: string; const AOrden: integer; var AMensaje: string ): boolean;
var
  sMsg: string;
begin
  sMsg:= '';
  (*
  if LineasSinKilos(  AEmpresa, AOrden )   then
  begin
    AMensaje:= 'ERROR: Orden de carga con lineas sin kilogramos.';
    Result:= False;
  end
  else
  *)
  begin
    if UnidadesCorrectas( AEmpresa, AOrden, sMsg ) then
    begin
      result:= ComprobarIntegridadEx( AEmpresa, AOrden, AMensaje );
    end
    else
    begin
      if VerAdvertencia( Self, Trim( sMsg ) ) = mrIgnore then
      begin
        Result:= ComprobarIntegridadEx( AEmpresa, AOrden, AMensaje );
      end
      else
      begin
        Result:= False;
        AMensaje:= sMsg;
      end;
    end;
  end;
end;

function TDOrdenCarga.ComprobarIntegridadEx( const AEmpresa: string; const AOrden: integer; var AMensaje: string ): boolean;
var AError: Boolean;
begin
  result:= False;
  AMensaje:= '';
  AError := False;

  with QResumenOrden do
  begin
    ParamByName('orden').AsInteger:= AOrden;
    Open;
  end;
  with QResumenPacking do
  begin
    ParamByName('orden').AsInteger:= AOrden;
    Open;
  end;
  if QResumenOrden.IsEmpty then
  begin
    AMensaje:= 'Orden sin lineas.';
  end
  else
  if QResumenPacking.IsEmpty then
  begin
    AMensaje:= 'Orden sin packing.';
  end
  else
  begin
    if not AError then
    begin
      while ( not QResumenOrden.Eof ) or ( not QResumenPacking.Eof ) do
      begin
        if ( not QResumenOrden.Eof ) and ( not QResumenPacking.Eof ) then
        begin
          if ( QResumenOrden.FieldByName('formato_cliente_ocl').AsString = QResumenPacking.FieldByName('formato_cliente_pl').AsString ) then
          begin
            if ( QResumenOrden.FieldByName('cajas_ocl').AsInteger - QResumenPacking.FieldByName('cajas_pl').AsInteger ) <> 0 then
            begin
              AMensaje:= AMensaje + IntegridadStr( AEmpresa, 3 );
            end;
            QResumenOrden.Next;
            QResumenPacking.Next;
          end
          else
          begin
            if ( QResumenOrden.FieldByName('formato_cliente_ocl').AsString  ) <
               ( QResumenPacking.FieldByName('formato_cliente_pl').AsString ) then
            begin
              AMensaje:= AMensaje + IntegridadStr( AEmpresa, 1 );;
              QResumenOrden.Next;
            end
            else
            begin
              AMensaje:= AMensaje + IntegridadStr( AEmpresa, 2 );
              QResumenPacking.Next;
            end;
          end;
        end
        else
        begin
          if not QResumenOrden.Eof then
          begin
            AMensaje:= AMensaje + IntegridadStr( AEmpresa, 1 );
            QResumenOrden.Next;
          end
          else
          begin
            AMensaje:= AMensaje + IntegridadStr( AEmpresa, 2 );
            QResumenPacking.Next;
          end;
        end;
      end;
      if AMensaje <> '' then
      begin
        AMensaje:= 'No coinciden los datos de la orden con los del packing.' + #13 + #10 + IntegridadTitle + AMensaje;
      end;
    end;
  end;

  if AMensaje = '' then
  begin
    result:= True;
    AMensaje:= 'OK';
  end;
  QResumenOrden.Close;
  QResumenPacking.Close;
end;

function TDOrdenCarga.ExistePedido( const AEmpresa, ACentro, ACliente, ASumnistro, APedido, AFecha: string ): boolean;
begin
  with QExistePedido do
  begin
    ParamByname('empresa').AsString:= AEmpresa;
    ParamByname('centro').AsString:= ACentro;
    ParamByname('cliente').AsString:= ACliente;
    ParamByname('suministro').AsString:= ASumnistro;
    ParamByname('pedido').AsString:= APedido;
    ParamByname('fecha').AsString:= AFecha;
    try
      Open;
      result:= not IsEmpty;
    finally
      Close;
    end;
  end;
end;

end.
