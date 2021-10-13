unit DPCrearAlbaran;

interface

uses
  SysUtils, Classes, DB, DBTables;

type
  TdtmPCrearAlbaran = class(TDataModule)
    QOrdenCab: TQuery;
    QSalidaCab: TQuery;
    QSalidaLin: TQuery;
    QPackingList: TQuery;
    QDetallePedido: TQuery;
    QAux: TQuery;
    DSOrdenCab: TDataSource;
    QKilosEnvase: TQuery;
    QCentroOrigen: TQuery;
    QDetalleCarga: TQuery;
    qryUnidadesCaja: TQuery;
    qryPesoVariable: TQuery;
    QMonedaCliente: TQuery;
    qryAux: TQuery;
    qryAux2: TQuery;
    procedure DataModuleCreate(Sender: TObject);
    procedure DataModuleDestroy(Sender: TObject);
  private
    { Private declarations }

    function GetNumeroAlbaran( const AOrden: integer ): integer;

    function CabeceraAlbaran( const AOrden, AAlbaran: integer; var VMsg: String ): boolean;
    function PasarDatosCabeceraAlbaran( const AAlbaran: integer; var VMsg: String ): boolean;

    function LineasAlbaran( const AOrden, AAlbaran: integer; var VMsg: String ): boolean;
    function PasarDatosLineasAlbaran( const AAlbaran: integer; var VMsg: String ): boolean;
    function GetCentroOrigen: string;
    function GetCategoria( const ACategoria:string ): string;
    function GetMarca( const AMarca:string ): string;
    function GetCalibre( const ACalibre:string ): string;
    function GetColor( const AColor:string ): string;
    (*
    procedure DatosFormato( var VMarca, VCategoria, VCalibre, VColor, VPalet: string;
                            const AEmpresa, AFormato: string );
    *)
    procedure DatosCarga( var VComercial, VMarca, VCategoria, VCalibre, VColor, VNotas: String;
                           var VUnidadFactura: string; var VPrecio: real;
                           var VTipoIva: string; var VPorcIva: real );
    (*
    procedure DatosPedido( var VMarca, VCategoria, VCalibre, VColor: String;
                           var VUnidadFactura: string; var VPrecio: real;
                           var VTipoIva: string; var VPorcIva: real );
    function GetUnidadFacturacion( const AEmpresa, ACliente, AEnvase: string;
                                   const AProducto: integer ): string;
    *)
    function GetKilos( const AEmpresa, AEnvase, AProducto: string; const ACajas: integer;
                       const APorDefecto: Real ): Real;
    function EsPesoVariable( const AEmpresa, AEnvase: string ): Boolean;
    function GetUnidades( const AOrden: integer; const AEmpresa, AEnvase, AProducto, ACalibre: string ): integer;

    function GetMonedaCliente( const AEmpresa, ACliente: string ): string;
    function EsProductoDesglose: Boolean;
    procedure ArticuloDesgloseInsertar;


  public
    { Public declarations }
    function CrearAlbaran( const AOrden: integer; var VMsg: string ): boolean;

  end;

  function CrearAlbaran( const AOwner: TComponent; const AOrden: integer; var VMsg: string ): boolean;


implementation

{$R *.dfm}

uses UDOrdenCarga, dialogs, bMath, Variants;

var
  dtmPCrearAlbaran: TdtmPCrearAlbaran;

function CrearAlbaran( const AOwner: TComponent; const AOrden: integer; var VMsg: string ): boolean;
begin
  dtmPCrearAlbaran:= TdtmPCrearAlbaran.Create( AOwner );
  try
    if not DOrdenCarga.Database.InTransaction then
    begin
      DOrdenCarga.Database.StartTransaction;
      try
        result:= dtmPCrearAlbaran.CrearALbaran( AOrden, VMsg );
        if result then
        begin
          DOrdenCarga.Database.Commit
        end
        else
        begin
          DOrdenCarga.Database.Rollback;
        end;
      except
        on e:Exception do
        begin
          if DOrdenCarga.Database.InTransaction then
            DOrdenCarga.Database.Rollback;
          result:= False;
          VMsg:= 'ERROR: No se ha podido finalizar correctamente la transacción.' +
                 #13 + #10 + e.Message;
        end;
      end;
    end
    else
    begin
      result:= False;
      VMsg:= 'ERROR: No se ha podido inicializar la transacción, por favor intentelo mas tarde.';
    end;
  finally
    FreeAndNil( dtmPCrearAlbaran );
  end;
end;
procedure TdtmPCrearAlbaran.DataModuleCreate(Sender: TObject);
begin
  with QSalidaCab do
  begin
    SQL.Clear;
    SQL.Add(' select * ');
    SQL.Add(' from frf_salidas_c ');
    RequestLive:= True;
  end;
  with QSalidaLin do
  begin
    SQL.Clear;
    SQL.Add(' select * ');
    SQL.Add(' from frf_salidas_l ');
    RequestLive:= True;
  end;
  with QOrdenCab do
  begin
    SQL.Clear;
    SQL.Add(' select * ');
    SQL.Add(' from frf_orden_carga_c ');
    SQL.Add(' where orden_occ = :orden ');
    Prepare;
  end;
  with QPackingList do
  begin
    SQL.Clear;
    SQL.Add(' select ');
    SQL.Add('        producto_base_pl, producto_pl, formato_pl, formato_cliente_pl, envase_pl, ');
    SQL.Add('        categoria_pl, marca_pl, calibre_pl, color_pl, tipo_palet_pl, unidades_caja_pl, ');
    SQL.Add('        count(distinct ean128_pl) palets_pl, sum(cajas_pl) cajas_pl, round(sum(peso_pl),2) kilos_pl ');
    SQL.Add(' from   frf_packing_list ');
    SQL.Add(' where orden_pl = :orden_occ ');
    SQL.Add(' group by  ');
    SQL.Add('          producto_base_pl,producto_pl, formato_pl, formato_cliente_pl, envase_pl, ');
    SQL.Add('          categoria_pl, marca_pl, calibre_pl, color_pl, tipo_palet_pl, unidades_caja_pl ');
    SQL.Add(' order by  ');
    SQL.Add('          producto_base_pl,producto_pl, formato_pl, formato_cliente_pl, envase_pl, ');
    SQL.Add('          categoria_pl, marca_pl, calibre_pl, color_pl, tipo_palet_pl ');
    Prepare;
  end;
  (*
  with QDetallePedido do
  begin
    SQL.Clear;
    SQL.Add(' select marca_pdd, categoria_pdd, calibre_pdd, color_pdd,  ');
    SQL.Add('        precio_pdd, unidad_precio_pdd, tipo_iva_pdd, porc_iva_pdd ');
    SQL.Add(' from frf_pedido_cab, frf_pedido_det ');
    SQL.Add(' where empresa_pdc = :empresa_occ ');
    SQL.Add(' and centro_pdc = :centro_salida_occ ');
    SQL.Add(' and fecha_pdc = :fecha_pedido_occ ');
    SQL.Add(' and ref_pedido_pdc = :n_pedido_occ ');
    SQL.Add(' and cliente_pdc = :cliente_sal_occ ');
    SQL.Add(' and dir_suministro_pdc = :dir_sum_occ ');
    SQL.Add(' and empresa_pdd = :empresa_occ ');
    SQL.Add(' and centro_pdd = :centro_salida_occ ');
    SQL.Add(' and pedido_pdd = pedido_pdc ');
    SQL.Add(' and formato_cliente_pdd = :formato ');
    //SQL.Add(' and envase_pdd = :envase ');
    SQL.Add(' order by precio_pdd desc ');
    Prepare;
  end;
  *)
  with QDetalleCarga do
  begin
    SQL.Clear;
    SQL.Add(' select comercial_ocl, marca_ocl, categoria_ocl, calibre_ocl, color_ocl,   ');
    SQL.Add('        precio_ocl, unidad_precio_ocl, tipo_iva_ocl, porc_iva_ocl, notas_ocl  ');
    SQL.Add(' from frf_orden_carga_l  ');
    SQL.Add(' where orden_ocl = :orden  ');
    SQL.Add(' and formato_cliente_ocl = :formato ');
    Prepare;
  end;
  with QKilosEnvase do
  begin
    SQL.Clear;
    SQL.Add(' select peso_neto_e from frf_envases ');
    SQL.Add(' where producto_e = :producto and envase_e = :envase ');
    Prepare;
  end;
  with qryPesoVariable do
  begin
    SQL.Clear;
    SQL.Add(' select peso_variable_e from frf_envases  ');
    SQL.Add(' where envase_e = :envase ');
    Prepare;
  end;
  with qryUnidadesCaja do
  begin
    SQL.Clear;
    SQL.Add(' select calibre_ocl, unidades_caja_ocl ');
    SQL.Add(' from frf_orden_carga_l ');
    SQL.Add(' where orden_ocl = :orden  ');
    SQL.Add(' and producto_ocl = :producto ');
    SQL.Add(' and envase_ocl = :envase ');
    SQL.Add(' group by 1,2 ');
    SQL.Add(' order by 1,2 ');
    Prepare;
  end;
  with QCentroOrigen do
  begin
    SQL.Clear;
    SQL.Add(' select centro_origen_ocl, count(*) ');
    SQL.Add(' from frf_orden_carga_l ');
    SQL.Add(' where orden_ocl = :orden ');
    SQL.Add(' and producto_ocl = :producto ');
    SQL.Add(' group by centro_origen_ocl ');
    SQL.Add(' order by 2 desc ');
  end;

  with QMonedaCliente do
  begin
    SQL.Clear;
    SQL.add(' select moneda_c ');
    SQL.add(' from frf_clientes ');
    SQL.add(' where cliente_c  = :cliente ');
  end;
end;


function TdtmPCrearAlbaran.GetMonedaCliente( const AEmpresa, ACliente: string ): string;
begin
  QMonedaCliente.ParamByName('cliente').AsString:= ACliente;
  QMonedaCliente.Open;
  if not QMonedaCliente.IsEmpty then
  begin
    result:= QMonedaCliente.Fields[0].asstring;
  end
  else
  begin
    result:= 'EUR';
  end;
  QMonedaCliente.Close;
end;

procedure TdtmPCrearAlbaran.DataModuleDestroy(Sender: TObject);
begin
  QOrdenCab.Close;
  if QOrdenCab.Prepared then
    QOrdenCab.UnPrepare;

  QPackingList.Close;
  if QPackingList.Prepared then
    QPackingList.UnPrepare;

  (*
  QDetallePedido.Close;
  if QDetallePedido.Prepared then
    QDetallePedido.UnPrepare;
  *)
  QDetalleCarga.Close;
  if QDetalleCarga.Prepared then
    QDetalleCarga.UnPrepare;

  QKilosEnvase.Close;
  if QKilosEnvase.Prepared then
    QKilosEnvase.UnPrepare;

  qryPesoVariable.Close;
  if qryPesoVariable.Prepared then
    qryPesoVariable.UnPrepare;

  qryUnidadesCaja.Close;
  if qryUnidadesCaja.Prepared then
    qryUnidadesCaja.UnPrepare;

  QCentroOrigen.Close;
  if QCentroOrigen.Prepared then
    QCentroOrigen.UnPrepare;

  QSalidaCab.Close;
  QSalidaLin.Close;
end;

function TdtmPCrearAlbaran.CrearAlbaran( const AOrden: integer; var VMsg: string ): boolean;
var
  iAlbaran: integer;
begin
  result:= False;
  //Obtener numero de albaran
  iAlbaran:= GetNumeroAlbaran( AOrden );
  //iAlbaran:= 999991;

  case iAlbaran of
    0: VMsg:= 'ERROR: Falta inicializar contadores.';
    -1: VMsg:= 'ERROR: NO puedo obtener número de albarán para la orden (' + IntToStr( AOrden ) + ')';
    -2: VMsg:= 'ERROR: Número de albarán ya usado. Verificar contadores.';
    else
    try
      if CabeceraAlbaran( AOrden, iAlbaran, VMsg ) then
      begin
        if LineasAlbaran( AOrden, iAlbaran, VMsg ) then
        begin
          with dtmPCrearAlbaran.QAux do
          begin
            SQL.Clear;
            SQL.Add(' update frf_orden_carga_c ');
            SQL.Add(' set n_albaran_occ = :albaran, ' );
            SQL.Add('     traspasada_occ = 1 ');
            SQL.Add(' where orden_occ = :orden ');
            ParamByName('albaran').AsInteger:= iAlbaran;
            ParamByName('orden').AsInteger:= AOrden;
            ExecSQL;
          end;
          VMsg:= 'OK';
          result:= True;
        end;
      end;
    finally
      QOrdenCab.Close;
    end;
  end;
end;

function TdtmPCrearAlbaran.GetNumeroAlbaran( const AOrden: integer ): integer;
var
  sEmpresa, sCentro: string;
  dFecha: TDateTime;
  iYear, iMonth, iDay: Word;
begin
  with QAux do
  begin
    SQL.Clear;
    SQL.Add(' select empresa_c, centro_c, fecha_occ, cont_albaranes_c ');
    SQL.Add(' from frf_orden_carga_c, frf_centros ');
    SQL.Add(' where orden_occ = :orden ');
    SQL.Add(' and empresa_c = empresa_occ ');
    SQL.Add(' and centro_c = centro_salida_occ ');
    ParamByName('orden').AsInteger:= AOrden;
    try
      Open;
      if not IsEmpty then
      begin
        sEmpresa:= FieldByName('empresa_c').AsString;
        sCentro:= FieldByName('centro_c').AsString;
        dFecha:= FieldByName('fecha_occ').AsDateTime;
        result:= FieldByName('cont_albaranes_c').AsInteger;
        Close;

        //Esta duplicado
        SQL.Clear;
        SQL.Add(' select * ');
        SQL.Add(' from frf_salidas_c ');
        SQL.Add(' where empresa_sc = :empresa ');
        SQL.Add(' and centro_salida_sc = :centro ');
        SQL.Add(' and year(fecha_sc) = :anyo ');
        SQL.Add(' and n_albaran_sc = :albaran ');
        DecodeDate( dFecha, iYear, iMonth, iDay );
        ParamByName('empresa').AsString:= sEmpresa;
        ParamByName('centro').AsString:= sCentro;
        ParamByName('anyo').AsInteger:= iYear;
        ParamByName('albaran').AsInteger:= result;
        Open;
        if IsEmpty then
        begin
          Close;
          SQL.Clear;
          SQL.Add(' update frf_centros ');
          SQL.Add(' set cont_albaranes_c = :albaran');
          SQL.Add(' where empresa_c = :empresa ');
          SQL.Add(' and centro_c = :centro ');
          ParamByName('albaran').AsInteger:= result + 1;
          ParamByName('empresa').AsString:= sEmpresa;
          ParamByName('centro').AsString:= sCentro;
          ExecSQL;
        end
        else
        begin
          Close;
          Result:= -2;
        end;
      end
      else
      begin
        //No existe
        Result:= -1;
      end;
    finally
      Close;
    end;
  end;
end;

function TdtmPCrearAlbaran.CabeceraAlbaran( const AOrden, AAlbaran: integer; var VMsg: String ): boolean;
begin
  result:= False;
  with QOrdenCab do
  begin
    ParamByName('orden').AsInteger:= AOrden;
    try
      Open;
      if not IsEmpty then
      begin
        result:= PasarDatosCabeceraAlbaran( AAlbaran, VMsg );
      end
      else
      begin
        VMsg:= 'ERROR: No se ha podido localizar los datos de la orden (' + IntToStr( AOrden ) + ')';
      end;
    finally
      //Close;
    end;
  end;
end;

function TdtmPCrearAlbaran.PasarDatosCabeceraAlbaran( const AAlbaran: integer; var VMsg: String ): boolean;
begin
  result:= False;
  try
    with QSalidaCab do
    begin
      Open;
      Insert;
      FieldByname('empresa_sc').AsString:= QOrdenCab.FieldByname('empresa_occ').AsString;
      FieldByname('centro_salida_sc').AsString:= QOrdenCab.FieldByname('centro_salida_occ').AsString;
      FieldByname('n_albaran_sc').AsInteger:= AAlbaran;
      FieldByname('fecha_sc').asDateTime:= QOrdenCab.FieldByname('fecha_occ').asDateTime;
      FieldByname('hora_sc').asString:= QOrdenCab.FieldByname('hora_occ').AsString;
      FieldByname('cliente_sal_sc').AsString:= QOrdenCab.FieldByname('cliente_sal_occ').AsString;
      FieldByname('cliente_fac_sc').AsString:= QOrdenCab.FieldByname('cliente_sal_occ').AsString;
      FieldByname('dir_sum_sc').AsString:= QOrdenCab.FieldByname('dir_sum_occ').AsString;
      FieldByname('n_pedido_sc').AsString:= QOrdenCab.FieldByname('n_pedido_occ').AsString;
      if ( QOrdenCab.FieldByname('fecha_descarga_occ').Value <> 0 ) and
         ( QOrdenCab.FieldByname('fecha_descarga_occ').Value <> null ) then
        FieldByname('fecha_descarga_sc').Value:= QOrdenCab.FieldByname('fecha_descarga_occ').Value;
      FieldByname('moneda_sc').AsString:= GetMonedaCliente( QOrdenCab.FieldByname('empresa_occ').AsString,
                                                            QOrdenCab.FieldByname('cliente_sal_occ').AsString );

      if QOrdenCab.FieldByname('operador_transporte_occ').AsString <> '' then
        FieldByname('operador_transporte_sc').AsInteger:= QOrdenCab.FieldByname('operador_transporte_occ').AsInteger
      else
        FieldByname('operador_transporte_sc').AsInteger:= QOrdenCab.FieldByname('transporte_occ').AsInteger;
      FieldByname('transporte_sc').AsInteger:= QOrdenCab.FieldByname('transporte_occ').AsInteger;
      FieldByname('vehiculo_sc').AsString:= QOrdenCab.FieldByname('vehiculo_occ').AsString;
      FieldByname('porte_bonny_sc').AsInteger:= QOrdenCab.FieldByname('porte_bonny_occ').AsInteger;
      FieldByname('n_orden_sc').AsString:= QOrdenCab.FieldByname('orden_occ').AsString;
      FieldByname('higiene_sc').AsInteger:= QOrdenCab.FieldByname('higiene_occ').AsInteger;
      FieldByname('nota_sc').AsString:= QOrdenCab.FieldByname('nota_occ').AsString;

      //Incoterm
      with qryAux do
      begin
        SQL.Clear;
        SQL.Add(' select incoterm_c, plaza_incoterm_c ');
        SQL.Add(' from frf_clientes ');
        SQL.Add(' where cliente_c = :cliente ');
        ParamByName('cliente').AsString:= QOrdenCab.FieldByname('cliente_sal_occ').AsString;
        Open;
        if FieldByname('incoterm_c').AsString <> '' then
        begin
          QSalidaCab.FieldByName('incoterm_sc').AsString := FieldByname('incoterm_c').AsString;
          QSalidaCab.FieldByName('plaza_incoterm_sc').AsString := FieldByname('plaza_incoterm_c').AsString;
        end;
       Close;
      end;

      try
        Post;
        result:= True;
      except
        on e: exception do
        begin
          QSalidaCab.Cancel;
          VMsg:= 'ERROR: Problemas al intentar insertar la cabecera del albarán.' +
                 #13 + #10 + e.Message;
        end;
      end;
    end;
  finally
    QSalidaCab.Close;
  end;
end;



function TdtmPCrearAlbaran.LineasAlbaran( const AOrden, AAlbaran: integer; var VMsg: String ): boolean;
begin
  result:= False;
  with QPackingList do
  begin
    try
      Open;
      if not IsEmpty then
      begin
        result:= PasarDatosLineasAlbaran( AAlbaran, VMsg );
      end
      else
      begin
        VMsg:= 'ERROR: No se ha podido localizar los datos del packing de la orden (' + IntToStr( AOrden ) + ')';
      end;
    finally
      Close;
    end;
  end;
end;

function TdtmPCrearAlbaran.EsPesoVariable( const AEmpresa, AEnvase: string ): Boolean;
begin
    with qryPesoVariable do
    begin
      ParamByName('envase').AsString:= AEnvase;
      Open;
      try
        result:= FieldByname('peso_variable_e').AsInteger = 1;
      finally
        Close;
      end;
    end;
end;

function TdtmPCrearAlbaran.GetKilos( const AEmpresa, AEnvase, AProducto: string; const ACajas: integer;
                                     const APorDefecto: Real ): Real;
begin
  result:= APorDefecto;
  if ( result = 0 ) or ( not EsPesoVariable( AEmpresa, AEnvase ) ) then
  begin
    //Si el packing no tiene kilos o es de peso fijo lo calculamos nosotros
    with QKilosEnvase do
    begin
      ParamByName('producto').AsString:= AProducto;
      ParamByName('envase').AsString:= AEnvase;
      try
        Open;
        if not IsEmpty then
        begin
          result:= bRoundTo( ACajas * FieldByname('peso_neto_e').AsFloat, 2 );
        end;
      finally
        Close;
      end;
    end;
  end;
end;

function TdtmPCrearAlbaran.GetUnidades( const AOrden: integer; const AEmpresa, AEnvase, AProducto, ACalibre: string ): integer;
var
  bFlag: Boolean;
begin
  result:= 0;
  bFlag:= False;
  with qryUnidadesCaja do
  begin
    ParamByName('orden').AsInteger:= AOrden;
    ParamByName('producto').AsString:= AProducto;
    ParamByName('envase').AsString:= AEnvase;
    try
      Open;
      while not Eof and not bFlag do
      begin
        if FieldByName('calibre_ocl').AsString = ACalibre then
        begin
          result:= FieldByname('unidades_caja_ocl').AsInteger;
          bFlag:= True;
        end;
        Next;
      end;
    finally
      Close;
    end;
  end;

  if not bFlag then
  with QAux do
  begin
    SQL.Clear;
    SQL.Add(' select unidades_e from frf_envases ');
    SQL.Add(' where envase_e = :envase ');
    ParamByName('envase').AsString:= AEnvase;
    try
      Open;
      result:= FieldByName('unidades_e').AsInteger;
    finally
      Close;
    end;
  end;
end;


function TdtmPCrearAlbaran.PasarDatosLineasAlbaran( const AAlbaran: integer; var VMsg: String ): boolean;
var
  bFlag: boolean;
  sTipoIva, sUnidadFacturacion: string;
  rValueIva, rPrecio: Real;
  rAux: Currency;
  sComercial, sMarca, sCategoria, sCalibre, sColor, sPalet, sNotas: string;
  iUnidadesCaja: Integer;
  id_linea: integer;
begin
  bFlag:= True;
  id_linea:=0;
  QSalidaLin.Open;
  try
    while not QPackingList.Eof and bFlag do
    begin
      id_linea := id_linea + 1;
      with QSalidaLin do
      begin
        Insert;
        FieldByname('empresa_sl').AsString:= QOrdenCab.FieldByname('empresa_occ').AsString;
        FieldByname('centro_salida_sl').AsString:= QOrdenCab.FieldByname('centro_salida_occ').AsString;
        FieldByname('n_albaran_sl').AsInteger:= AAlbaran;
        FieldByname('fecha_sl').asDateTime:= QOrdenCab.FieldByname('fecha_occ').AsDateTime;
        FieldByname('id_linea_albaran_sl').AsInteger:= id_linea;
        FieldByname('centro_origen_sl').AsString:=  GetCentroOrigen;
        FieldByname('cliente_sl').AsString:= QOrdenCab.FieldByname('cliente_sal_occ').AsString;
        FieldByname('emp_procedencia_sl').AsString:= QOrdenCab.FieldByname('empresa_occ').AsString;


        FieldByname('producto_sl').asString:= QPackingList.FieldByname('producto_pl').AsString;
        FieldByname('envase_sl').AsString:= QPackingList.FieldByname('envase_pl').AsString;
        FieldByname('formato_cliente_sl').AsString:= QPackingList.FieldByname('formato_cliente_pl').AsString;

        //DatosFormato( sMarca, sCategoria, sCalibre, sColor, sPalet,
        //          QOrdenCab.FieldByname('empresa_occ').AsString,
        //          QPackingList.FieldByname('formato_pl').AsString );

        (*TODO*)
        (*Añadir categoria al packing list*)
        sComercial:= '';
        sCategoria:= '';
        sMarca:= '';
        sCalibre:= '';
        sColor:= '';
        sPalet:= '';

        if QPackingList.FieldByname('categoria_pl').AsString <> '' then
          sCategoria:= QPackingList.FieldByname('categoria_pl').AsString;
        if QPackingList.FieldByname('marca_pl').AsString <> '' then
          sMarca:= QPackingList.FieldByname('marca_pl').AsString;
        if QPackingList.FieldByname('calibre_pl').AsString <> '' then
          sCalibre:= QPackingList.FieldByname('calibre_pl').AsString;
        if QPackingList.FieldByname('color_pl').AsString <> '' then
          sColor:= QPackingList.FieldByname('color_pl').AsString;
        if QPackingList.FieldByname('tipo_palet_pl').AsString <> '' then
          sPalet:= QPackingList.FieldByname('tipo_palet_pl').AsString;

        sUnidadFacturacion:= '';
        rPrecio:= 0;
        sTipoIva:= '';
        rValueIva:= 0;

        (*
        DatosPedido( sMarca, sCategoria, sCalibre, sColor,
                     sUnidadFacturacion, rPrecio, sTipoIva, rValueIva );
        *)

        DatosCarga( sComercial, sMarca, sCategoria, sCalibre, sColor, sNotas,
                     sUnidadFacturacion, rPrecio, sTipoIva, rValueIva );

        FieldByname('comercial_sl').AsString:= sComercial;
        FieldByname('notas_sl').AsString:= sNotas;
        FieldByname('marca_sl').AsString:= GetMarca( sMarca );
        FieldByname('categoria_sl').AsString:= GetCategoria( sCategoria );
        FieldByname('calibre_sl').AsString:= GetCalibre( sCalibre );
        FieldByname('color_sl').AsString:= GetColor( sColor );
        FieldByname('tipo_palets_sl').AsString:= sPalet;

        //FieldByname('unidades_caja_sl').AsInteger:= QPackingList.FieldByname('unidades_caja_pl').AsInteger;
        iUnidadesCaja:= GetUnidades( QOrdenCab.FieldByname('orden_occ').AsInteger,
                                     FieldByname('empresa_sl').AsString,
                                     FieldByname('envase_sl').AsString,
                                     FieldByname('producto_sl').asString,
                                     FieldByname('calibre_sl').AsString );
        FieldByname('unidades_caja_sl').AsInteger:= iUnidadesCaja;



        FieldByname('n_palets_sl').AsInteger:= QPackingList.FieldByname('palets_pl').AsInteger;
        FieldByname('cajas_sl').AsInteger:= QPackingList.FieldByname('cajas_pl').AsInteger;
        FieldByname('kilos_sl').AsFloat:= bRoundTo( GetKilos( QOrdenCab.FieldByname('empresa_occ').AsString,
                                                                   QPackingList.FieldByname('envase_pl').AsString,
                                                                   QPackingList.FieldByname('producto_pl').AsString,
                                                                   QPackingList.FieldByname('cajas_pl').AsInteger,
                                                                   QPackingList.FieldByname('kilos_pl').AsFloat ), 2 );

        if FieldByName('kilos_sl').Value = 0  then
        begin
          Cancel;
          raise Exception.Create('ERROR: No se pueden generar lineas con 0 kilos. Por favor revise la orden de carga y packing para comprobar que los pesos sean correctos. ');
        end;

        if sUnidadFacturacion = 'U' then
        begin
          sUnidadFacturacion:= 'UND';
        end
        else
        if sUnidadFacturacion = 'C' then
        begin
          sUnidadFacturacion:= 'CAJ';
        end
        else
        begin
        if sUnidadFacturacion = 'K' then
          sUnidadFacturacion:= 'KGS';
        end;
        FieldByname('unidad_precio_sl').AsString:= sUnidadFacturacion;

        FieldByname('precio_sl').AsFloat:= rPrecio;
        FieldByname('tipo_iva_sl').AsString:= sTipoIva;
        FieldByname('porc_iva_sl').AsFloat:= rValueIva;

        if sUnidadFacturacion = 'UND' then
        begin
          rAux:= iUnidadesCaja * FieldByname('cajas_sl').AsInteger;
        end
        else
        if sUnidadFacturacion = 'CAJ' then
        begin
          rAux:= FieldByname('cajas_sl').AsInteger;
        end
        else
        begin
          rAux:= FieldByname('kilos_sl').AsFloat;
        end;
        (*
        rAux:= rAux * rPrecio;
        rAux:= StrToFloat( FormatFloat('#.00', rAux) );
        showMessage( FloattoStr( rAux ) );
        *)
        FieldByname('importe_neto_sl').AsFloat:= bRoundTo( rAux * rPrecio, 2 );
        FieldByname('iva_sl').AsFloat:= bRoundTo( ( FieldByname('importe_neto_sl').AsFloat * rValueIva ) / 100, 2 );
        FieldByname('importe_total_sl').AsFloat:= FieldByname('importe_neto_sl').AsFloat +
                                           FieldByname('iva_sl').AsFloat;


        try
          Post;
          //Producto Desglose
          if EsProductoDesglose then
            ArticuloDesgloseInsertar;

        except
          on e: exception do
          begin
            bFlag:= False;
            QSalidaLin.Cancel;
            VMsg:= 'ERROR: Problemas al intentar insertar el detalle del albarán.' +
                   #13 + #10 + e.Message;
          end;
        end;
      end;
      QPackingList.Next;
    end;
  finally
    QSalidaLin.Close;
  end;
  result:= bFlag;
end;

function TdtmPCrearAlbaran.EsProductoDesglose: Boolean;
begin
  with qryAux do
  begin
    SQL.Clear;
    SQL.Add('select producto_desglose_p ');
    SQL.Add('  from frf_productos ');
    SQL.Add(' where producto_p = :producto ');
    ParamByName('producto').AsString := QSalidaLin.FieldByName('producto_sl').AsString;
    Open;
    try
      result := (FieldByName('producto_desglose_p').AsString = 'S');
    finally
      Close;
    end;
  end;
end;

procedure TdtmPCrearAlbaran.ArticuloDesgloseInsertar;
begin
  // Insertamos en frf_salidas_l2 desglose de producto
  with qryAux do
  begin
    if Active then
    begin
      Cancel;
      Close;
    end;

    SQL.Clear;
    SQL.Add(' select * from frf_articulos_desglose ');
    SQL.Add('  where articulo_ad = :articulo ');

    ParamByName('articulo').AsString := QSalidaLin.FieldByName('envase_sl').AsString;

    Open;
    if IsEmpty then
        raise Exception.Create('ERROR: No se puede generar el albarán. Falta indicar el % de desglose por producto en el Mant. de Articulos');

    while not Eof do
    begin
      with qryAux2 do
      begin
        SQL.Clear;
        SQL.Add(' insert into frf_salidas_l2 (empresa_sl2, centro_salida_sl2, n_albaran_sl2, fecha_sl2, id_linea_albaran_sl2,' );
        SQL.Add('                             articulo_sl2, producto_sl2, producto_desglose_sl2, porcentaje_sl2, kilos_desglose_sl2) ');
        SQL.Add('                     values (:empresa, :centro, :albaran, :fecha, :id_linea, ');
        SQL.Add('                             :articulo, :producto, :producto_desglose, :porcentaje_desglose, :kilos_desglose) ');
        ParamByName('empresa').AsString := QSalidaLin.FieldByName('empresa_sl').AsString;
        ParamByName('centro').AsString := QSalidaLin.FieldByName('centro_salida_sl').AsString;
        ParamByName('albaran').AsString := QSalidaLin.FieldByName('n_albaran_sl').AsString;
        ParamByName('fecha').AsString := QSalidaLin.FieldByName('fecha_sl').AsString;
        ParamByName('id_linea').AsInteger := QSalidaLin.FieldByName('id_linea_albaran_sl').AsInteger;
        ParamByName('articulo').AsString := QSalidaLin.FieldByName('envase_sl').AsString;
        ParamByName('producto').AsString := QSalidaLin.FieldByName('producto_sl').AsString;
        ParamByName('producto_desglose').AsString := qryAux.FieldByName('producto_desglose_ad').AsString;
        ParamByName('porcentaje_desglose').AsFloat := qryAux.FieldByName('porcentaje_ad').AsFloat;
        ParamByName('kilos_desglose').AsFloat := bRoundTo(QSalidaLin.FieldByName('kilos_sl').AsFloat * qryAux.FieldByName('porcentaje_ad').AsFloat / 100, 2);
        try
          ExecSQL;
        finally
          Close;
        end;
      end;

      Next;
    end;
  end;
end;


function TdtmPCrearAlbaran.GetCentroOrigen: string;
begin
  (*TODO*)
  //si construyo el albaran desde el packing, como puedo saber el exactamente el origen de la fruta
  //si esta solo aparece el detalle de la linea
  //DETALLE = PACKING -> ALBARAN SALIDA con los datos del detalle

  QCentroOrigen.ParamByName('orden').AsInteger:= QOrdenCab.FieldByName('orden_occ').AsInteger;
  QCentroOrigen.ParamByName('producto').AsString:= QPackingList.FieldByName('producto_pl').AsString;
  QCentroOrigen.Open;
  if QCentroOrigen.IsEmpty then
  begin
    result:= QOrdenCab.FieldByName('centro_salida_occ').AsString;
  end
  else
  begin
    result:= QCentroOrigen.FieldByName('centro_origen_ocl').AsString;
  end;
  QCentroOrigen.Close;
end;

function TdtmPCrearAlbaran.GetCategoria( const ACategoria:string ): string;
begin
  if ACategoria = '' then
  with QAux do
  begin
    SQL.Clear;
    SQL.Add(' select categoria_sl, count(*) ');
    SQL.Add(' from frf_salidas_l ');
    SQL.Add(' where empresa_sl = :empresa ');
    SQL.Add('   and producto_sl = :producto ');
    SQL.Add('   and cliente_sl = :cliente ');
    SQL.Add(' group by 1 ');
    SQL.Add(' order by 2 desc ');
    ParamByName('empresa').AsString:= QOrdenCab.FieldByName('empresa_occ').AsString;
    ParamByName('producto').AsString:= QPackingList.FieldByName('producto_pl').AsString;
    ParamByName('cliente').AsString:= QOrdenCab.FieldByName('cliente_sal_occ').AsString;
    try
      Open;
      result:= FieldByname('categoria_sl').AsString;
    finally
      Close;
    end;
  end
  else
  begin
    result:= ACategoria;
  end;
end;

function TdtmPCrearAlbaran.GetMarca( const AMarca:string ): string;
begin
  if AMarca = '' then
  begin
    with QAux do
    begin
      SQL.Clear;
      SQL.Add(' select marca_sl, count(*) ');
      SQL.Add(' from frf_salidas_l ');
      SQL.Add(' where empresa_sl = :empresa ');
      SQL.Add('   and producto_sl = :producto ');
      SQL.Add('   and cliente_sl = :cliente ');
      SQL.Add(' group by 1 ');
      SQL.Add(' order by 2 desc ');
      ParamByName('empresa').AsString:= QOrdenCab.FieldByName('empresa_occ').AsString;
      ParamByName('producto').AsString:= QPackingList.FieldByName('producto_pl').AsString;
      ParamByName('cliente').AsString:= QOrdenCab.FieldByName('cliente_sal_occ').AsString;
      try
        Open;
        result:= FieldByname('marca_sl').AsString;
      finally
        Close;
      end;
    end;
  end
  else
  begin
    result:= AMarca;
  end;
end;

function TdtmPCrearAlbaran.GetCalibre( const ACalibre:string ): string;
begin
  if ACalibre = '' then
  begin
    with QAux do
    begin
      SQL.Clear;
      SQL.Add(' select calibre_sl, count(*) ');
      SQL.Add(' from frf_salidas_l ');
      SQL.Add(' where empresa_sl = :empresa ');
      SQL.Add('   and producto_sl = :producto ');
      SQL.Add('   and cliente_sl = :cliente ');
      SQL.Add(' group by 1 ');
      SQL.Add(' order by 2 desc ');
      ParamByName('empresa').AsString:= QOrdenCab.FieldByName('empresa_occ').AsString;
      ParamByName('producto').AsString:= QPackingList.FieldByName('producto_pl').AsString;
      ParamByName('cliente').AsString:= QOrdenCab.FieldByName('cliente_sal_occ').AsString;
      try
        Open;
        result:= FieldByname('calibre_sl').AsString;
      finally
        Close;
      end;
    end;
  end
  else
  begin
    result:= ACalibre;
  end;
end;

function TdtmPCrearAlbaran.GetColor( const AColor:string ): string;
begin
  if AColor = '' then
  begin
    with QAux do
    begin
      SQL.Clear;
      SQL.Add(' select color_sl, count(*) ');
      SQL.Add(' from frf_salidas_l ');
      SQL.Add(' where empresa_sl = :empresa ');
      SQL.Add('   and producto_sl = :producto ');
      SQL.Add('   and cliente_sl = :cliente ');
      SQL.Add(' group by 1 ');
      SQL.Add(' order by 2 desc ');
      ParamByName('empresa').AsString:= QOrdenCab.FieldByName('empresa_occ').AsString;
      ParamByName('producto').AsString:= QPackingList.FieldByName('producto_pl').AsString;
      ParamByName('cliente').AsString:= QOrdenCab.FieldByName('cliente_sal_occ').AsString;
      try
        Open;
        result:= FieldByname('color_sl').AsString;
      finally
        Close;
      end;
    end;
  end
  else
  begin
    result:= AColor;
  end;
end;

(*
procedure TdtmPCrearAlbaran.DatosFormato( var VMarca, VCategoria, VCalibre, VColor, VPalet: string;
                            const AEmpresa, AFormato: string );
begin
  with QAux do
  begin
    SQL.Clear;
    SQL.Add(' select palet_f, marca_f, categoria_f, calibre_f, color_f ');
    SQL.Add(' from frf_formatos ');
    SQL.Add(' where empresa_f = :empresa ');
    SQL.Add(' and codigo_f = :formato ');
    ParamByName('empresa').AsString:= AEmpresa;
    ParamByName('formato').AsString:= AFormato;
    try
      Open;
      VMarca:= FieldByname('marca_f').AsString;
      VCategoria:= FieldByname('categoria_f').AsString;
      VCalibre:= FieldByname('calibre_f').AsString;
      VColor:= FieldByname('color_f').AsString;
      VPalet:= FieldByname('palet_f').AsString;
    finally
      Close;
    end;
  end;
end;
*)

(*
function TdtmPCrearAlbaran.GetUnidadFacturacion(const AEmpresa, ACliente, AEnvase: string;
                                                const AProducto: integer ): string;
begin
  with QAux do
  begin
    SQL.Clear;
    SQL.Add(' select unidad_fac_ce from frf_clientes_env ');
    SQL.Add(' where empresa_ce = :empresa ');
    SQL.Add(' and cliente_ce = :cliente ');
    SQL.Add(' and producto_base_ce = :producto ');
    SQL.Add(' and envase_ce = :envase ');
    ParamByName('empresa').AsString:= AEmpresa;
    ParamByName('cliente').AsString:= ACliente;
    ParamByName('producto').AsInteger:= AProducto;
    ParamByName('envase').AsString:= AEnvase;
    try
      Open;
      if not IsEmpty then
      begin
        if fields[0].AsString = 'U' then
        begin
          result := 'UND';
        end
        else
        if fields[0].AsString = 'C' then
        begin
          result := 'CAJ';
        end
        else
        begin
          result := 'KGS';
        end;
      end;
    finally
      Cancel;
      Close;
    end;
  end;
end;
*)

procedure TdtmPCrearAlbaran.DatosCarga( var VComercial, VMarca, VCategoria, VCalibre, VColor, VNotas: String;
                                         var VUnidadFactura: string; var VPrecio: real;
                                         var VTipoIva: string; var VPorcIva: real );
var
  sAux: string;
begin
  with QDetalleCarga do
  begin
    Filter:= '';
    Filtered:= True;

    ParamByName('orden').AsString:= QOrdenCab.FieldByName('orden_occ').AsString;
    ParamByName('formato').AsString:= QPackingList.FieldByName('formato_cliente_pl').AsString;
    Open;
    if VMarca = '' then
      VMarca:= FieldByName('marca_ocl').AsString
    else
    if VMarca <> '' then
    begin
      sAux:= Filter;
      if Filter <> '' then
        Filter:= 'marca_ocl = ' + QuotedStr( VMarca ) + ' and ' + Filter
      else
        Filter:= 'marca_ocl = ' + QuotedStr( VMarca );
      if IsEmpty then
        Filter:= sAux;
    end;

    if VCategoria = '' then
      VCategoria:= FieldByName('categoria_ocl').AsString
    else
    if VCategoria <> '' then
    begin
      sAux:= Filter;
      if Filter <> '' then
        Filter:= 'categoria_ocl = ' + QuotedStr( VCategoria ) + ' and ' + Filter
      else
        Filter:= 'categoria_ocl = ' + QuotedStr( VCategoria );
      if IsEmpty then
        Filter:= sAux;
    end;

    if VCalibre = '' then
      VCalibre:= FieldByName('calibre_ocl').AsString
    else
    if VCalibre <> '' then
    begin
      sAux:= Filter;
      if Filter <> '' then
        Filter:= 'calibre_ocl = ' + QuotedStr( VCalibre ) + ' and ' + Filter
      else
        Filter:= 'calibre_ocl = ' + QuotedStr( VCalibre );
      if IsEmpty then
        Filter:= sAux;
    end;

    if VColor = '' then
      VColor:= FieldByName('color_ocl').AsString
    else
    if VColor <> '' then
    begin
      sAux:= Filter;
      if Filter <> '' then
        Filter:= 'color_ocl = ' + QuotedStr( VColor ) + ' and ' + Filter
      else
        Filter:= 'color_ocl = ' + QuotedStr( VColor );
      if IsEmpty then
        Filter:= sAux;
    end;

    if VPrecio = 0 then
      VPrecio:= FieldByName('precio_ocl').AsFloat;
    if VUnidadFactura = '' then
      VUnidadFactura:= FieldByName('unidad_precio_ocl').AsString;
    if VTipoIva = '' then
    begin
      VTipoIva:= FieldByName('tipo_iva_ocl').AsString;
      VPorcIva:= FieldByName('porc_iva_ocl').AsFloat;
    end;
    VComercial:= FieldByName('comercial_ocl').AsString;
    VNotas:= FieldByName('notas_ocl').AsString;
    Close;
  end;
end;

(*
procedure TdtmPCrearAlbaran.DatosPedido( var VMarca, VCategoria, VCalibre, VColor: String;
                                         var VUnidadFactura: string; var VPrecio: real;
                                         var VTipoIva: string; var VPorcIva: real );
var
  rImpuesto: TImpuesto;
  sAux: string;
begin
  VUnidadFactura:= GetUnidadFacturacion( QOrdenCab.FieldByName('empresa_occ').AsString,
                                         QOrdenCab.FieldByName('cliente_sal_occ').AsString,
                                         QPackingList.FieldByName('envase_pl').AsString,
                                         QPackingList.FieldByName('producto_base_pl').AsInteger );

  if VTipoIva = '' then
  begin
    rImpuesto:= DOrdenCarga.ImpuestosCliente( QOrdenCab.FieldByName('empresa_occ').AsString,
                                QOrdenCab.FieldByName('centro_salida_occ').AsString,
                                QOrdenCab.FieldByName('cliente_sal_occ').AsString,
                                QOrdenCab.FieldByName('dir_sum_occ').AsString,
                                QOrdenCab.FieldByName('fecha_occ').AsDateTime );
    VTipoIva:= rImpuesto.sCodigo;
    case DOrdenCarga.TipoIvaEnvase( QOrdenCab.FieldByName('empresa_occ').AsString,
                                    QPackingList.FieldByName('envase_pl').AsString,
                                    QPackingList.FieldByName('producto_base_pl').AsString ) of
       0: VPorcIva:= rImpuesto.rSuper;
       1: VPorcIva:= rImpuesto.rReducido;
       2: VPorcIva:= rImpuesto.rGeneral;
    end;
  end;


  with QDetallePedido do
  begin
    Filter:= '';
    Filtered:= True;

    ParamByName('empresa_occ').AsString:= QOrdenCab.FieldByName('empresa_occ').AsString;
    ParamByName('centro_salida_occ').AsString:= QOrdenCab.FieldByName('centro_salida_occ').AsString;
    ParamByName('fecha_pedido_occ').AsString:= QOrdenCab.FieldByName('fecha_pedido_occ').AsString;
    ParamByName('n_pedido_occ').AsString:= QOrdenCab.FieldByName('n_pedido_occ').AsString;
    ParamByName('cliente_sal_occ').AsString:= QOrdenCab.FieldByName('cliente_sal_occ').AsString;
    ParamByName('dir_sum_occ').AsString:= QOrdenCab.FieldByName('dir_sum_occ').AsString;

    ParamByName('formato').AsString:= QPackingList.FieldByName('formato_cliente_pl').AsString;
    //ParamByName('envase').AsString:= QPackingList.FieldByName('envase_pl').AsString;
    try
      Open;
      if not IsEmpty then
      begin
        Filter:= '';
        Filtered:= True;
        if VMarca <> '' then
        begin
          sAux:= Filter;
          if Filter <> '' then
            Filter:= 'marca_pdd = ' + QuotedStr( VMarca ) + ' and ' + Filter
          else
            Filter:= 'marca_pdd = ' + QuotedStr( VMarca );
          if IsEmpty then
            Filter:= sAux;
        end;
        if VCategoria <> '' then
        begin
          sAux:= Filter;
          if Filter <> '' then
            Filter:= 'categoria_pdd = ' + QuotedStr( VCategoria ) + ' and ' + Filter
          else
            Filter:= 'categoria_pdd = ' + QuotedStr( VCategoria );
          if IsEmpty then
            Filter:= sAux;
        end;
        if VCalibre <> '' then
        begin
          sAux:= Filter;
          if Filter <> '' then
            Filter:= 'calibre_pdd = ' + QuotedStr( VCalibre ) + ' and ' + Filter
          else
            Filter:= 'calibre_pdd = ' + QuotedStr( VCalibre );
          if IsEmpty then
            Filter:= sAux;
        end;
        if VColor <> '' then
        begin
          sAux:= Filter;
          if Filter <> '' then
            Filter:= 'color_pdd = ' + QuotedStr( VColor ) + ' and ' + Filter
          else
            Filter:= 'color_pdd = ' + QuotedStr( VColor );
          if IsEmpty then
            Filter:= sAux;
        end;

        if FieldByName('precio_pdd').AsFloat <> 0 then
        begin
          VPrecio:= FieldByName('precio_pdd').AsFloat;
          if FieldByName('unidad_precio_pdd').AsString <> '' then
            VUnidadFactura:= FieldByName('unidad_precio_pdd').AsString;
        end;

        if FieldByName('tipo_iva_pdd').AsString <> '' then
        begin
          VTipoIva:= FieldByName('tipo_iva_pdd').AsString;
          VPorcIva:= FieldByName('porc_iva_pdd').AsFloat;
        end;

        if VMarca = '' then
          VMarca:= FieldByName('marca_pdd').AsString;
        if VCategoria = '' then
          VCategoria:= FieldByName('categoria_pdd').AsString;
        if VCalibre = '' then
          VCalibre:= FieldByName('calibre_pdd').AsString;
        if VColor =  '' then
          VColor:= FieldByName('color_pdd').AsString;
      end;
    finally
      Filter:= '';
      Filtered:= False;
      Close;
    end;
  end;
end;
*)

end.

