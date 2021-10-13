unit UDOrden2Albaran;

interface

uses
  SysUtils, Classes, DB, DBTables;

type
  TDOrden2Albaran = class(TDataModule)
    QCabCarga: TQuery;
    QCabCargaorden_occ: TIntegerField;
    QCabCargaempresa_occ: TStringField;
    QCabCargacentro_salida_occ: TStringField;
    QCabCargan_albaran_occ: TIntegerField;
    QCabCargafecha_occ: TDateField;
    QCabCargahora_occ: TStringField;
    QCabCargacliente_sal_occ: TStringField;
    QCabCargadir_sum_occ: TStringField;
    QCabCargacliente_fac_occ: TStringField;
    QCabCargan_pedido_occ: TStringField;
    QCabCargatransporte_occ: TSmallintField;
    QCabCargavehiculo_occ: TStringField;
    QCabCarganota_occ: TMemoField;
    QCabCargastatus_occ: TIntegerField;
    QLinCargaSalida: TQuery;
    QCabAlbaran: TQuery;
    QLinAlbaran: TQuery;
    QGetNumeroAlbaran: TQuery;
    QUpdateNumeroAlbaran: TQuery;
    QCabAlbaranempresa_sc: TStringField;
    QCabAlbarancentro_salida_sc: TStringField;
    QCabAlbarann_albaran_sc: TIntegerField;
    QCabAlbaranfecha_sc: TDateField;
    QCabAlbaranhora_sc: TStringField;
    QCabAlbarancliente_sal_sc: TStringField;
    QCabAlbarandir_sum_sc: TStringField;
    QCabAlbarancliente_fac_sc: TStringField;
    QCabAlbarann_pedido_sc: TStringField;
    QCabAlbaranmoneda_sc: TStringField;
    QCabAlbarantransporte_sc: TSmallintField;
    QCabAlbaranvehiculo_sc: TStringField;
    QCabAlbarann_factura_sc: TIntegerField;
    QCabAlbaranfecha_factura_sc: TDateField;
    QCabAlbarandua_sc: TStringField;
    QCabAlbaranfecha_dua_sc: TDateField;
    QLinAlbaranempresa_sl: TStringField;
    QLinAlbarancentro_salida_sl: TStringField;
    QLinAlbarann_albaran_sl: TIntegerField;
    QLinAlbaranfecha_sl: TDateField;
    QLinAlbarancentro_origen_sl: TStringField;
    QLinAlbaranproducto_sl: TStringField;
    QLinAlbaranenvase_sl: TStringField;
    QLinAlbaranmarca_sl: TStringField;
    QLinAlbarancategoria_sl: TStringField;
    QLinAlbarancalibre_sl: TStringField;
    QLinAlbarancolor_sl: TStringField;
    QLinAlbaranref_transitos_sl: TIntegerField;
    QLinAlbaranunidades_caja_sl: TIntegerField;
    QLinAlbarancajas_sl: TIntegerField;
    QLinAlbarankilos_sl: TFloatField;
    QLinAlbaranprecio_sl: TFloatField;
    QLinAlbaranunidad_precio_sl: TStringField;
    QLinAlbaranimporte_neto_sl: TFloatField;
    QLinAlbaranporc_iva_sl: TFloatField;
    QLinAlbaraniva_sl: TFloatField;
    QLinAlbaranimporte_total_sl: TFloatField;
    QLinAlbarann_palets_sl: TSmallintField;
    QLinAlbarantipo_palets_sl: TStringField;
    QLinAlbarantipo_iva_sl: TStringField;
    QLinAlbaranfederacion_sl: TStringField;
    QLinAlbarancliente_sl: TStringField;
    QLinAlbaranemp_procedencia_sl: TStringField;
    QGetNumeroAlbarancont_albaranes_c: TIntegerField;
    QUpdateCabCarga: TQuery;
    QUpdateLinCarga: TQuery;
    QUpdateStatusCarga: TQuery;
    QCabCargacentro_destino_occ: TStringField;
    QCabCargatraspasada_occ: TIntegerField;
    QCabCargan_palets_occ: TIntegerField;
    QCabCargaporte_bonny_occ: TIntegerField;
    QCabAlbaranporte_bonny_sc: TIntegerField;
    QLinCargaTransito: TQuery;
    QCabAlbarann_cmr_sc: TStringField;
    QCabAlbarann_orden_sc: TStringField;
    QCabAlbaranhigiene_sc: TIntegerField;
    QCabAlbarannota_sc: TMemoField;
    QCabCargahigiene_occ: TIntegerField;
    QCabAlbaranoperador_transporte_sc: TSmallintField;
    QCabCargaoperador_transporte_occ: TSmallintField;
    QLineasPalets: TQuery;
    QLineasCarga: TQuery;
    QPesoTeorico: TQuery;
    QCabCargaplanta_origen_occ: TStringField;
    QCabCargaplanta_destino_occ: TStringField;
    QCabCargafecha_pedido_occ: TDateField;
    QCabCargaoperador_occ: TSmallintField;
    QCabCargamuelle_occ: TStringField;
    QCabCarganota_interna_occ: TStringField;
    QValidarNumeroAlbaran: TQuery;
    qryPesoVariable: TQuery;
    QLinAlbarancomercial_sl: TStringField;
    QMonedaCliente: TQuery;
    strngfldQLinAlbarannotas_sl: TStringField;
    QCabCargafecha_descarga_occ: TDateField;
    QCabAlbaranfecha_descarga_sc: TDateField;
    QCabAlbaranfecha_pedido_sc: TDateField;
    qryAux: TQuery;
    qryAux2: TQuery;
    QLinAlbaranid_linea_albaran_sl: TIntegerField;
    QCabAlbaranincoterm_sc: TStringField;
    QCabAlbaranplaza_incoterm_sc: TStringField;
  private
    { Private declarations }
    QLinCargaAux: TQuery;

    procedure ActualizaEstadoOrden( const AEstado: integer );

    procedure PreparaTraspasoAlbaran( const AEmpresa, ACentro: string; const AFecha: TDateTime; const AOrden: Integer );
    function  ObtenerNumeroAlbaran: integer;
    procedure PasaCabeceraAlbaran;
    procedure PasaDetalleAlbaran( const AIgnorarPacking: Boolean; const ALinea: integer );
    procedure CerrarTablasAlbaran;

    procedure PesosPaletToLineasOrden( const AOrden: integer; const APacking: Boolean );
    function  PesoTeorico( const AEmpresa, AEnvase, AProducto: string; const ACajas: Integer ): Real;
    function  EsPesoVariable( const AEmpresa, AEnvase: string ): Boolean;
    function  GetMonedaCliente( const AEmpresa, ACliente: string ): string;
    function EsProductoDesglose: Boolean;
    procedure ArticuloDesgloseInsertar;

    procedure PonerIncotermPorDefecto;
  public
    { Public declarations }

    Constructor Create( AOwner: TComponent ); Override;

    function  PasarAlbaran( const AEmpresa, ACentro: string; const AFecha: TDateTime;  const AOrden: Integer; const APacking: Boolean ): integer;
  end;

  procedure CrearAlbaran( const AEmpresa, ACentro: string; const AFecha: TDateTime;  const AOrden: Integer; const APacking: Boolean );

implementation

{$R *.dfm}

uses Dialogs, Variants, Math, Forms, UDOrdenCarga, bMath;

procedure CrearAlbaran( const AEmpresa, ACentro: string; const AFecha: TDateTime;  const AOrden: Integer; const APacking: Boolean );
var
  DOrden2Albaran: TDOrden2Albaran;
  iReferencia: Integer;
begin
  Application.CreateForm( TDOrden2Albaran, DOrden2Albaran );
  try
    if not DOrdenCarga.Database.InTransaction then
    begin
      DOrdenCarga.Database.StartTransaction;
      try
        iReferencia:= DOrden2Albaran.PasarAlbaran( AEmpresa, ACentro, AFecha, AOrden, APacking );
        DOrdenCarga.Database.Commit;
        ShowMessage('Salida ' + IntToStr( iReferencia  )  + ' generada con exito.');
      except
         DOrdenCarga.Database.Rollback;
        Raise;
      end;
    end;
  finally
    FreeAndNil( DOrden2Albaran );
  end;
end;

Constructor TDOrden2Albaran.Create( AOwner: TComponent );
begin
  inherited;
  //***********************************************************************
  //***********************************************************************
  // CARGA
  //***********************************************************************
  //***********************************************************************
  with QCabCarga.SQL do
  begin
    Clear;
    Add('select * from frf_orden_carga_c');
    Add('where orden_occ = :orden');
  end;
  with QLinCargaSalida.SQL do
  begin
    Clear;
    //Add('select * from frf_orden_carga_l');
    //Add('where orden_ocl = :orden');
    //Add('order by producto_ocl, envase_ocl, cajas_ocl desc ');
    Add('select empresa_ocl,centro_salida_ocl, n_albaran_ocl, fecha_ocl, centro_origen_ocl, ');
    Add('       producto_ocl, envase_ocl, marca_ocl, categoria_ocl, calibre_ocl, color_ocl, ref_transitos_ocl,    ');
    Add('       fecha_transito_ocl, unidades_caja_ocl, sum(cajas_ocl) cajas_ocl, sum(kilos_ocl) kilos_ocl, precio_ocl, unidad_precio_ocl, ');
    Add('       sum(importe_neto_ocl) importe_neto_ocl, porc_iva_ocl, sum(iva_ocl) iva_ocl, sum(importe_total_ocl) importe_total_ocl, ');
    Add('       sum(n_palets_ocl) n_palets_ocl, tipo_palets_ocl, tipo_iva_ocl, federacion_ocl, cliente_ocl, comercial_ocl, emp_procede_ocl, notas_ocl,');
    Add('       sum(cajas_packing_ocl) cajas_packing_ocl, sum(kilos_packing_ocl) kilos_packing_ocl, sum(palets_packing_ocl) palets_packing_ocl ');
    Add('from frf_orden_carga_l ');
    Add('where orden_ocl = :orden');
    Add('group by empresa_ocl,centro_salida_ocl, n_albaran_ocl, fecha_ocl, centro_origen_ocl, ');
    Add('       producto_ocl, envase_ocl, marca_ocl, categoria_ocl, calibre_ocl, color_ocl, ref_transitos_ocl, ');
    Add('       fecha_transito_ocl, unidades_caja_ocl, precio_ocl, unidad_precio_ocl, porc_iva_ocl,  ');
    Add('       tipo_palets_ocl, tipo_iva_ocl, federacion_ocl, cliente_ocl, comercial_ocl, emp_procede_ocl, notas_ocl');
    Add('order by producto_ocl, envase_ocl, cajas_ocl desc ');
  end;
  with QUpdateStatusCarga.SQL do
  begin
    Clear;
    Add('update frf_orden_carga_c ');
    Add('set traspasada_occ = :estado  ');
    Add('where orden_occ = :orden ');
  end;
  with QUpdateCabCarga.SQL do
  begin
    Clear;
    Add('update frf_orden_carga_c ');
    Add('set n_albaran_occ = :contador  ');
    Add('where orden_occ = :orden ');
  end;
  with QUpdateLinCarga.SQL do
  begin
    Clear;
    Add('update frf_orden_carga_l ');
    Add('set n_albaran_ocl = :contador  ');
    Add('where orden_ocl = :orden ');
  end;
  with QLineasCarga.SQL do
  begin
    Clear;
    Add('select * ');
    Add('from   frf_orden_carga_l ');
    Add('where orden_ocl = :orden ');
    Add('order by producto_ocl, tipo_palets_ocl, envase_ocl, marca_ocl, calibre_ocl ');
  end;
  with QLineasPalets.SQL do
  begin
    Clear;
    Add('select * ');
    Add('from   frf_packing_list ');
    Add('where orden_pl = :orden ');
    Add('order by producto_pl, tipo_palet_pl, envase_pl, marca_pl, calibre_pl ');
  end;

  //***********************************************************************
  //***********************************************************************
  // ALBARANES
  //***********************************************************************
  //***********************************************************************
  with QCabAlbaran.SQL do
  begin
    Clear;
    Add('select * from frf_salidas_c');
  end;
  with QLinAlbaran.SQL do
  begin
    Clear;
    Add('select * from frf_salidas_l');
  end;
  with QGetNumeroAlbaran.SQL do
  begin
    Clear;
    Clear;
    Add('select cont_albaranes_c ');
    Add('from frf_centros  ');
    Add('where empresa_c = :empresa ');
    Add('  and centro_c = :centro ');
  end;
  with QUpdateNumeroAlbaran.SQL do
  begin
    Clear;
    Add('update frf_centros ');
    Add('set cont_albaranes_c = :contador  ');
    Add('where empresa_c = :empresa ');
    Add('  and centro_c = :centro ');
  end;
  with QValidarNumeroAlbaran.SQL do
  begin
    Clear;
    Add(' select * ');
    Add(' from frf_salidas_c ');
    Add(' where empresa_sc = :empresa ');
    Add(' and centro_salida_sc = :centro ');
    Add(' and year(fecha_sc) = :anyo ');
    Add(' and n_albaran_sc = :albaran ');
  end;

  with QPesoTeorico.SQL do
  begin
    Clear;
    Add('select peso_neto_e peso');
    Add('from frf_envases ');
    Add('where producto_e = :producto ');
    Add('and envase_e = :envase ');
  end;
  with qryPesoVariable.SQL do
  begin
    Clear;
    Add('select peso_variable_e ');
    Add('from frf_envases ');
    Add('where envase_e = :envase ');
  end;

  with QMonedaCliente do
  begin
    SQL.Clear;
    SQL.add(' select moneda_c ');
    SQL.add(' from frf_clientes ');
    SQL.add(' where cliente_c  = :cliente ');
  end;
end;

function TDOrden2Albaran.GetMonedaCliente( const AEmpresa, ACliente: string ): string;
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

procedure TDOrden2Albaran.PreparaTraspasoAlbaran( const AEmpresa, ACentro: string; const AFecha: TDateTime; const AOrden: Integer );
var
  iDay, iMonth, iYear: Word;
  iAlbaran: integer;
begin
  QGetNumeroAlbaran.ParamByName('empresa').AsString:= AEmpresa;
  QGetNumeroAlbaran.ParamByName('centro').AsString:= ACentro;
  QGetNumeroAlbaran.Open;
  iAlbaran:= QGetNumeroAlbarancont_albaranes_c.AsInteger;

  DecodeDate( AFecha, iYear, iMonth, iDay );
  QValidarNumeroAlbaran.ParamByName('empresa').AsString:= AEmpresa;
  QValidarNumeroAlbaran.ParamByName('centro').AsString:= ACentro;
  QValidarNumeroAlbaran.ParamByName('anyo').AsInteger:= iYear;
  QValidarNumeroAlbaran.ParamByName('albaran').AsInteger:= iAlbaran;
  QValidarNumeroAlbaran.Open;
  if not QValidarNumeroAlbaran.IsEmpty then
  begin
    QGetNumeroAlbaran.Close;
    QValidarNumeroAlbaran.Close;
    raise Exception.Create('Numero de albarán ' + IntToStr(iAlbaran) +
                           ' ya usado en el año ' + IntToStr(iYear) + #13 + #10 +
                           'Por favor revise el contador de albaranes.');
  end;
  QValidarNumeroAlbaran.Close;

  QCabCarga.ParamByName('orden').AsInteger:= AOrden;
  QLinCargaSalida.ParamByName('orden').AsInteger:= AOrden;
  QLinCargaAux:= QLinCargaSalida;
  QUpdateStatusCarga.ParamByName('orden').AsInteger:= AOrden;
  QUpdateCabCarga.ParamByName('orden').AsInteger:= AOrden;
  QUpdateLinCarga.ParamByName('orden').AsInteger:= AOrden;

  QCabAlbaran.Open;
  QLinAlbaran.Open;
  QUpdateNumeroAlbaran.ParamByName('empresa').AsString:= AEmpresa;
  QUpdateNumeroAlbaran.ParamByName('centro').AsString:= ACentro;
end;


function TDOrden2Albaran.PasarAlbaran( const AEmpresa, ACentro: string; const AFecha: TDateTime; const AOrden: Integer; const APacking: Boolean ): integer;
var id_linea:integer;
begin
  PesosPaletToLineasOrden( AOrden, APacking );
  PreparaTraspasoAlbaran( AEmpresa, ACentro, AFecha, AOrden);
  result:= ObtenerNumeroAlbaran;

  PasaCabeceraAlbaran;
  id_linea := 0;
  QLinCargaAux.First;
  While not QLinCargaAux.Eof do
  begin
       id_linea := id_linea + 1;
       PasaDetalleAlbaran( True, id_linea );
       QLinCargaAux.Next;
  end;

  //Comprobar que todos los palets han sido pasados correctamente

  ActualizaEstadoOrden( 1 );
  CerrarTablasAlbaran;
end;

function TDOrden2Albaran.ObtenerNumeroAlbaran: integer;
var
  iAlbaran: integer;
begin
  iAlbaran:= QGetNumeroAlbarancont_albaranes_c.AsInteger;
  //iAlbaran:= 999666;
  QUpdateNumeroAlbaran.ParamByName('contador').AsInteger:= iAlbaran + 1;
  QUpdateNumeroAlbaran.ExecSQL;

  QUpdateCabCarga.ParamByName('contador').AsInteger:= iAlbaran;
  QUpdateCabCarga.ExecSQL;
  QUpdateLinCarga.ParamByName('contador').AsInteger:= iAlbaran;
  QUpdateLinCarga.ExecSQL;
  QCabCarga.Open;
  QLinCargaAux.Open;
  result:= iAlbaran;
end;

procedure TDOrden2Albaran.PasaCabeceraAlbaran;
begin
  QCabAlbaran.Insert;
  QCabAlbaranempresa_sc.Value:= QCabCargaempresa_occ.Value;
  QCabAlbarancentro_salida_sc.Value:= QCabCargacentro_salida_occ.Value;
  QCabAlbarann_albaran_sc.Value:= QCabCargan_albaran_occ.Value;
  QCabAlbaranfecha_sc.Value:= QCabCargafecha_occ.Value;
  QCabAlbaranhora_sc.Value:= QCabCargahora_occ.Value;

  QCabAlbarancliente_sal_sc.Value:= QCabCargacliente_sal_occ.Value;
  QCabAlbarandir_sum_sc.Value:= QCabCargadir_sum_occ.Value;
  QCabAlbarancliente_fac_sc.Value:= QCabCargacliente_fac_occ.Value;

  QCabAlbarann_pedido_sc.Value:= QCabCargan_pedido_occ.Value;

  if ( QCabCargafecha_pedido_occ.Value <> 0 ) and ( QCabCargafecha_pedido_occ.Value <> null ) then
    QCabAlbaranfecha_pedido_sc.Value:= QCabCargafecha_pedido_occ.Value;

  if ( QCabCargafecha_descarga_occ.Value <> 0 ) and ( QCabCargafecha_descarga_occ.Value <> null ) then
    QCabAlbaranfecha_descarga_sc.Value:= QCabCargafecha_descarga_occ.Value;

  QCabAlbaranmoneda_sc.Value:= GetMonedaCliente( QCabCargaempresa_occ.AsString, QCabCargacliente_sal_occ.Value );

  QCabAlbarantransporte_sc.Value:= QCabCargatransporte_occ.Value;
  QCabAlbaranoperador_transporte_sc.Value:= QCabCargaoperador_transporte_occ.Value;
  QCabAlbaranporte_bonny_sc.Value:= QCabCargaporte_bonny_occ.Value;
  QCabAlbaranvehiculo_sc.Value:= QCabCargavehiculo_occ.Value;

  QCabAlbaranhigiene_sc.AsInteger:= QCabCargahigiene_occ.AsInteger;
  QCabAlbarann_orden_sc.AsString:= QCabCargaorden_occ.AsString;
  QCabAlbarannota_sc.AsString:= QCabCarganota_occ.AsString;

  PonerIncotermPorDefecto;

  QCabAlbaran.Post;
end;

function  TDOrden2Albaran.PesoTeorico( const AEmpresa, AEnvase, AProducto: string; const ACajas: Integer ): Real;
begin
  with QPesoTeorico do
  begin
    ParamByName('envase').AsString:= AEnvase;
    ParamByName('producto').AsString := AProducto;
    Open;
    Result:= SimpleRoundTo(FieldByName('peso').AsFloat * ACajas, -2);
    Close;
  end;
end;

procedure TDOrden2Albaran.PonerIncotermPorDefecto;
begin
  with qryAux do
  begin
    SQL.Clear;
    SQL.Add(' select incoterm_c, plaza_incoterm_c ');
    SQL.Add(' from frf_clientes ');
    SQL.Add(' where cliente_c = :cliente ');
    ParamByName('cliente').AsString:= QCabCargacliente_sal_occ.Asstring;
    Open;
    if FieldByname('incoterm_c').AsString <> '' then
    begin
      QCabAlbaranincoterm_sc.Asstring:= FieldByname('incoterm_c').AsString;
      QCabAlbaranplaza_incoterm_sc.Asstring:= FieldByname('plaza_incoterm_c').AsString;
    end;
   Close;
  end;
end;

function TDOrden2Albaran.EsPesoVariable( const AEmpresa, AEnvase: string ): Boolean;
begin
  with qryPesoVariable do
  begin
    ParamByName('envase').AsString:= AEnvase;
    Open;
    Result:= FieldByName('peso_variable_e').AsInteger = 1;
    Close;
  end;
end;

function TDOrden2Albaran.EsProductoDesglose: Boolean;
begin
  with qryAux do
  begin
    SQL.Clear;
    SQL.Add('select producto_desglose_p ');
    SQL.Add('  from frf_productos ');
    SQL.Add(' where producto_p = :producto ');
    ParamByName('producto').AsString := QLinAlbaran.FieldByName('producto_sl').AsString;
    Open;
    try
      result := (FieldByName('producto_desglose_p').AsString = 'S');
    finally
      Close;
    end;
  end;
end;

procedure TDOrden2Albaran.PesosPaletToLineasOrden( const AOrden: Integer; const APacking: Boolean );
var
  sPalets: string;
  iCount: Integer;
  aiCajas, aiPalets: array of Integer;
  arKilos, arTeoricos: array of Real;
begin
  if APacking then
  begin
    sPalets:= '';
    QLineasCarga.ParamByName('orden').AsInteger:= AOrden;
    QLineasPalets.ParamByName('orden').AsInteger:= AOrden;
    QLineasCarga.Open;
    QLineasPalets.Open;

    //Inicalizar
    iCount:= 0;
    while not QLineasCarga.Eof do
    begin
      QLineasCarga.Next;
      Inc( iCount );
    end;
    SetLength( aiCajas, iCount );
    SetLength( aiPalets, iCount );
    SetLength( arKilos, iCount );
    SetLength( arTeoricos, iCount );
    for iCount:= 0 to Length( aiCajas ) - 1 do
    begin
      aiCajas[ iCount ]:= 0;
      aiPalets[ iCount ]:= 0;
      arKilos[ iCount ]:= 0;
      arTeoricos[ iCount ]:= 0;
    end;


    //Zero pasada
    QLineasCarga.First;
    iCount:= 0;
    while not QLineasCarga.Eof do
    begin
      QLineasPalets.First;
      while not QLineasPalets.Eof do
      begin
        if ( QLineasCarga.FieldByName('producto_ocl').AsString = QLineasPalets.FieldByName('producto_pl').AsString ) and
           ( QLineasCarga.FieldByName('tipo_palets_ocl').AsString = QLineasPalets.FieldByName('tipo_palet_pl').AsString ) and
           ( QLineasCarga.FieldByName('envase_ocl').AsString = QLineasPalets.FieldByName('envase_pl').AsString ) and
           ( QLineasCarga.FieldByName('marca_ocl').AsString = QLineasPalets.FieldByName('marca_pl').AsString ) and
           ( QLineasCarga.FieldByName('calibre_ocl').AsString = QLineasPalets.FieldByName('calibre_pl').AsString ) and
           //( QLineasCarga.FieldByName('unidades_caja_ocl').AsString = QLineasPalets.FieldByName('unidades_caja_pl').AsString ) and
           //solo se rellena en SAT los llanos
           ( aiCajas[ iCount ] < QLineasCarga.FieldByName('cajas_ocl').AsFloat ) then
        begin
          aiCajas[iCount]:= aiCajas[iCount] + QLineaspalets.FieldByName('cajas_pl').AsInteger;
          arKilos[iCount]:= arKilos[iCount] + QLineaspalets.FieldByName('peso_pl').AsFloat;
          if ( QLineaspalets.FieldByName('peso_pl').AsFloat = 0 ) or
             (  not EsPesoVariable( QLineaspalets.FieldByName('empresa_pl').AsString, QLineaspalets.FieldByName('envase_pl').AsString ) ) then
            arTeoricos[iCount]:= arTeoricos[iCount] + PesoTeorico( QLineaspalets.FieldByName('empresa_pl').AsString,
                                                             QLineaspalets.FieldByName('envase_pl').AsString,
                                                             QLineaspalets.FieldByName('producto_pl').AsString,
                                                             QLineaspalets.FieldByName('cajas_pl').AsInteger )
          else
            arTeoricos[iCount]:= arTeoricos[iCount] + QLineaspalets.FieldByName('peso_pl').AsFloat;
          if Pos( QLineaspalets.FieldByName('ean128_pl').AsString, sPalets ) = 0 then
          begin
            aiPalets[iCount]:= aiPalets[iCount] + 1;
            sPalets:= sPalets + QLineaspalets.FieldByName('ean128_pl').AsString + ',';
          end;
          QLineaspalets.Delete;
        end
        else
        begin
          QLineaspalets.Next;
        end;
      end;
      QLineasCarga.Next;
      inc( iCount );
    end;

    //Primera pasada
    if not QLineasPalets.IsEmpty then
    begin
      QLineasCarga.First;
      iCount:= 0;
      while not QLineasCarga.Eof do
      begin
        QLineasPalets.First;
        while not QLineasPalets.Eof do
        begin
          if ( QLineasCarga.FieldByName('producto_ocl').AsString = QLineasPalets.FieldByName('producto_pl').AsString ) and
             ( QLineasCarga.FieldByName('tipo_palets_ocl').AsString = QLineasPalets.FieldByName('tipo_palet_pl').AsString ) and
             ( QLineasCarga.FieldByName('envase_ocl').AsString = QLineasPalets.FieldByName('envase_pl').AsString ) and
             ( QLineasCarga.FieldByName('marca_ocl').AsString = QLineasPalets.FieldByName('marca_pl').AsString ) and
             //( QLineasCarga.FieldByName('unidades_caja_ocl').AsString = QLineasPalets.FieldByName('unidades_caja_pl').AsString ) and
             //solo se rellena en SAT los llanos
             ( aiCajas[ iCount ] < QLineasCarga.FieldByName('cajas_ocl').AsFloat ) then
          begin
            aiCajas[iCount]:= aiCajas[iCount] + QLineaspalets.FieldByName('cajas_pl').AsInteger;
            arKilos[iCount]:= arKilos[iCount] + QLineaspalets.FieldByName('peso_pl').AsFloat;
            if ( QLineaspalets.FieldByName('peso_pl').AsFloat = 0 ) or
               (  not EsPesoVariable( QLineaspalets.FieldByName('empresa_pl').AsString, QLineaspalets.FieldByName('envase_pl').AsString ) ) then
              arTeoricos[iCount]:= arTeoricos[iCount] + PesoTeorico( QLineaspalets.FieldByName('empresa_pl').AsString,
                                                             QLineaspalets.FieldByName('envase_pl').AsString,
                                                             QLineaspalets.FieldByName('producto_pl').AsString,
                                                             QLineaspalets.FieldByName('cajas_pl').AsInteger )
            else
              arTeoricos[iCount]:= arTeoricos[iCount] + QLineaspalets.FieldByName('peso_pl').AsFloat;
            if Pos( QLineaspalets.FieldByName('ean128_pl').AsString, sPalets ) = 0 then
            begin
              aiPalets[iCount]:= aiPalets[iCount] + 1;
              sPalets:= sPalets + QLineaspalets.FieldByName('ean128_pl').AsString + ',';
            end;
           QLineaspalets.Delete;
          end
          else
          begin
            QLineaspalets.Next;
          end;
        end;
        QLineasCarga.Next;
        inc( iCount );
      end;
    end;

    //Segunda pasada, eliminamos calibre
    if not QLineasPalets.IsEmpty then
    begin
      QLineasCarga.First;
      iCount:= 0;
      while not QLineasCarga.Eof do
      begin
        QLineasPalets.First;
        while not QLineasPalets.Eof do
        begin
          if ( QLineasCarga.FieldByName('producto_ocl').AsString = QLineasPalets.FieldByName('producto_pl').AsString ) and
             ( QLineasCarga.FieldByName('tipo_palets_ocl').AsString = QLineasPalets.FieldByName('tipo_palet_pl').AsString ) and
             ( QLineasCarga.FieldByName('envase_ocl').AsString = QLineasPalets.FieldByName('envase_pl').AsString ) and
             //( QLineasCarga.FieldByName('unidades_caja_ocl').AsString = QLineasPalets.FieldByName('unidades_caja_pl').AsString ) and
             //solo se rellena en SAT los llanos
             ( aiCajas[ iCount ] < QLineasCarga.FieldByName('cajas_ocl').AsFloat ) then
          begin
            aiCajas[iCount]:= aiCajas[iCount] + QLineaspalets.FieldByName('cajas_pl').AsInteger;
            arKilos[iCount]:= arKilos[iCount] + QLineaspalets.FieldByName('peso_pl').AsFloat;
            if ( QLineaspalets.FieldByName('peso_pl').AsFloat = 0 ) or
               (  not EsPesoVariable( QLineaspalets.FieldByName('empresa_pl').AsString, QLineaspalets.FieldByName('envase_pl').AsString ) ) then
              arTeoricos[iCount]:= arTeoricos[iCount] + PesoTeorico( QLineaspalets.FieldByName('empresa_pl').AsString,
                                                               QLineaspalets.FieldByName('envase_pl').AsString,
                                                               QLineaspalets.FieldByName('producto_pl').AsString,
                                                               QLineaspalets.FieldByName('cajas_pl').AsInteger )
            else
              arTeoricos[iCount]:= arTeoricos[iCount] + QLineaspalets.FieldByName('peso_pl').AsFloat;
            if Pos( QLineaspalets.FieldByName('ean128_pl').AsString, sPalets ) = 0 then
            begin
              aiPalets[iCount]:= aiPalets[iCount] + 1;
              sPalets:= sPalets + QLineaspalets.FieldByName('ean128_pl').AsString + ',';
            end;
            QLineaspalets.Delete;
          end
          else
          begin
            QLineaspalets.Next;
          end;
        end;
        QLineasCarga.Next;
        inc( iCount );
      end;

      //tercera pasada, eliminamos marca
      if not QLineasPalets.IsEmpty then
      begin
        QLineasCarga.First;
        iCount:= 0;
        while not QLineasCarga.Eof do
        begin
          QLineasPalets.First;
          while not QLineasPalets.Eof do
          begin
            if ( QLineasCarga.FieldByName('producto_ocl').AsString = QLineasPalets.FieldByName('producto_pl').AsString ) and
               ( QLineasCarga.FieldByName('tipo_palets_ocl').AsString = QLineasPalets.FieldByName('tipo_palet_pl').AsString ) and
               ( QLineasCarga.FieldByName('envase_ocl').AsString = QLineasPalets.FieldByName('envase_pl').AsString ) and
               ( aiCajas[ iCount ] < QLineasCarga.FieldByName('cajas_ocl').AsFloat )  then
            begin
              aiCajas[iCount]:= aiCajas[iCount] + QLineaspalets.FieldByName('cajas_pl').AsInteger;
              arKilos[iCount]:= arKilos[iCount] + QLineaspalets.FieldByName('peso_pl').AsFloat;
              if ( QLineaspalets.FieldByName('peso_pl').AsFloat = 0 ) or
                 (  not EsPesoVariable( QLineaspalets.FieldByName('empresa_pl').AsString, QLineaspalets.FieldByName('envase_pl').AsString ) ) then
               arTeoricos[iCount]:= arTeoricos[iCount] + PesoTeorico( QLineaspalets.FieldByName('empresa_pl').AsString,
                                                                QLineaspalets.FieldByName('envase_pl').AsString,
                                                                QLineaspalets.FieldByName('producto_pl').AsString,
                                                                QLineaspalets.FieldByName('cajas_pl').AsInteger )
              else
                arTeoricos[iCount]:= arTeoricos[iCount] + QLineaspalets.FieldByName('peso_pl').AsFloat;
              if Pos( QLineaspalets.FieldByName('ean128_pl').AsString, sPalets ) = 0 then
              begin
                aiPalets[iCount]:= aiPalets[iCount] + 1;
                sPalets:= sPalets + QLineaspalets.FieldByName('ean128_pl').AsString + ',';
              end;
              QLineaspalets.Delete;
            end
            else
            begin
              QLineaspalets.Next;
            end;
          end;
          QLineasCarga.Next;
          inc( iCount );
        end;
      end;
    end;


    if not QLineasPalets.IsEmpty  then
    begin
      QLineasCarga.Close;
      QLineasPalets.Close;
      raise Exception.Create('Error al extraer los detalles del packing.');
    end
    else
    begin
      QLineasCarga.First;
      iCount:= 0;
      while not QLineasCarga.Eof do
      begin
        QLineasCarga.Edit;
        QLineasCarga.FieldByName('cajas_packing_ocl').AsFloat:= aiCajas[ iCount ];
        QLineasCarga.FieldByName('palets_packing_ocl').AsInteger:= aiPalets[ iCount ];
        if arKilos[ iCount ] <> 0 then
        begin
          QLineasCarga.FieldByName('kilos_packing_ocl').AsFloat:= arTeoricos[ iCount ]
        end
        else
        begin
          QLineasCarga.FieldByName('kilos_packing_ocl').AsFloat:= QLineasCarga.FieldByName('kilos_ocl').AsFloat;
        end;
        QLineasCarga.Post;
        QLineasCarga.Next;
        Inc( iCount );
      end;
      QLineasPalets.Close;
      QLineasCarga.Close;
    end;
  end
  else
  begin
    QLineasCarga.ParamByName('orden').AsInteger:= AOrden;
    QLineasCarga.Open;
    while not QLineasCarga.Eof do
    begin
      QLineasCarga.Edit;
      QLineasCarga.FieldByName('kilos_packing_ocl').AsFloat:= QLineasCarga.FieldByName('kilos_ocl').AsFloat;
      QLineasCarga.FieldByName('cajas_packing_ocl').AsFloat:= QLineasCarga.FieldByName('cajas_ocl').AsFloat;
      QLineasCarga.FieldByName('palets_packing_ocl').AsFloat:= QLineasCarga.FieldByName('n_palets_ocl').AsFloat;
      QLineasCarga.Post;
      QLineasCarga.Next;
    end;
    QLineasCarga.Close;
  end;
end;

procedure TDOrden2Albaran.PasaDetalleAlbaran( const AIgnorarPacking: Boolean; const ALinea:integer );
begin
  QLinAlbaran.Insert;

  QLinAlbaranempresa_sl.Value:= QLinCargaAux.FieldByName('empresa_ocl').Value;
  QLinAlbarancentro_salida_sl.Value:= QLinCargaAux.FieldByName('centro_salida_ocl').Value;
  QLinAlbarann_albaran_sl.Value:= QLinCargaAux.FieldByName('n_albaran_ocl').Value;
  QLinAlbaranfecha_sl.Value:= QCabCargafecha_occ.Value;
  QLinAlbarancentro_origen_sl.Value:= QLinCargaAux.FieldByName('centro_origen_ocl').Value;
  QLinAlbaranproducto_sl.Value:= QLinCargaAux.FieldByName('producto_ocl').Value;
  QLinAlbaranenvase_sl.Value:= QLinCargaAux.FieldByName('envase_ocl').Value;
  QLinAlbaranmarca_sl.Value:= QLinCargaAux.FieldByName('marca_ocl').Value;
  QLinAlbarancategoria_sl.Value:= QLinCargaAux.FieldByName('categoria_ocl').Value;
  QLinAlbarancalibre_sl.Value:= QLinCargaAux.FieldByName('calibre_ocl').Value;
  QLinAlbarancolor_sl.Value:= QLinCargaAux.FieldByName('color_ocl').Value;
  (*TODO*)//mirar a ver por que pasa un 0 envez de un nulo como ref transito
  QLinAlbaranref_transitos_sl.AsString:=  QLinCargaAux.FieldByName('ref_transitos_ocl').AsString;
  QLinAlbarankilos_sl.Value:= QLinCargaAux.FieldByName('kilos_packing_ocl').Value;

  if QLinAlbarankilos_sl.Value = 0  then
  begin
    QLinAlbaran.Cancel;
    raise Exception.Create('ERROR: No se pueden generar albaranes con lineas con 0 kilos. Por favor revise la orden de carga y packing para comprobar que los pesos sean correctos. ');
  end;

  QLinAlbaranunidades_caja_sl.Value:= QLinCargaAux.FieldByName('unidades_caja_ocl').Value;
  QLinAlbarancajas_sl.Value:= QLinCargaAux.FieldByName('cajas_packing_ocl').Value;
  QLinAlbarann_palets_sl.Value:= QLinCargaAux.FieldByName('palets_packing_ocl').Value;
  QLinAlbarantipo_palets_sl.Value:= QLinCargaAux.FieldByName('tipo_palets_ocl').Value;

  QLinAlbaranprecio_sl.AsFloat:= QLinCargaAux.FieldByName('precio_ocl').AsFloat;
  QLinAlbaranporc_iva_sl.Value:= QLinCargaAux.FieldByName('porc_iva_ocl').Value;
  QLinAlbaranunidad_precio_sl.AsString:= QLinCargaAux.FieldByName('unidad_precio_ocl').AsString;

  if QLinAlbaranunidad_precio_sl.AsString = 'KGS' then
  begin
    QLinAlbaranimporte_neto_sl.AsFloat:= SimpleRoundTo( QLinAlbarankilos_sl.Value * QLinAlbaranprecio_sl.AsFloat, -2);
    QLinAlbaraniva_sl.Value:= SimpleRoundTo( ( QLinAlbaranimporte_neto_sl.AsFloat * QLinAlbaranporc_iva_sl.AsFloat ) / 100, -2);
    QLinAlbaranimporte_total_sl.AsFloat:= QLinAlbaranimporte_neto_sl.AsFloat + QLinAlbaraniva_sl.Value;
  end
  else
  begin
    QLinAlbaranimporte_neto_sl.AsFloat:= QLinCargaAux.FieldByName('importe_neto_ocl').AsFloat;
    QLinAlbaraniva_sl.Value:= QLinCargaAux.FieldByName('iva_ocl').Value;
    QLinAlbaranimporte_total_sl.AsFloat:= QLinCargaAux.FieldByName('importe_total_ocl').AsFloat;
  end;

  QLinAlbarantipo_iva_sl.AsString:= QLinCargaAux.FieldByName('tipo_iva_ocl').AsString;
  QLinAlbaranfederacion_sl.AsString:= QLinCargaAux.FieldByName('federacion_ocl').AsString;
  QLinAlbarancliente_sl.AsString:= QLinCargaAux.FieldByName('cliente_ocl').AsString;
  QLinAlbarancomercial_sl.AsString:= QLinCargaAux.FieldByName('comercial_ocl').AsString;
  strngfldQLinAlbarannotas_sl.AsString:= QLinCargaAux.FieldByName('notas_ocl').AsString;
  QLinAlbaranemp_procedencia_sl.AsString:= QLinCargaAux.FieldByName('emp_procede_ocl').AsString;
  QLinAlbaranid_linea_albaran_sl.AsInteger:= ALinea;

  QLinAlbaran.Post;
  //Producto Desglose
  if EsProductoDesglose then
    ArticuloDesgloseInsertar;

end;

procedure TDOrden2Albaran.ActualizaEstadoOrden( const AEstado: integer );
begin
  //0 -> SIN PASAR
  //1 -> PASADA COMO ALBARAN SALIDA
  //2 -> PASADA COMO ALBARAN TRANSITO
  QUpdateStatusCarga.ParamByName('estado').asinteger:= AEstado;
  QUpdateStatusCarga.ExecSQL;
end;

procedure TDOrden2Albaran.ArticuloDesgloseInsertar;
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

    ParamByName('articulo').AsString := QLinAlbaran.FieldByName('envase_sl').AsString;

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
        ParamByName('empresa').AsString := QLinAlbaran.FieldByName('empresa_sl').AsString;
        ParamByName('centro').AsString := QLinAlbaran.FieldByName('centro_salida_sl').AsString;
        ParamByName('albaran').AsString := QLinAlbaran.FieldByName('n_albaran_sl').AsString;
        ParamByName('fecha').AsString := QLinAlbaran.FieldByName('fecha_sl').AsString;
        ParamByName('id_linea').AsInteger := QLinAlbaran.FieldByName('id_linea_albaran_sl').AsInteger;
        ParamByName('articulo').AsString := QLinAlbaran.FieldByName('envase_sl').AsString;
        ParamByName('producto').AsString := QLinAlbaran.FieldByName('producto_sl').AsString;
        ParamByName('producto_desglose').AsString := qryAux.FieldByName('producto_desglose_ad').AsString;
        ParamByName('porcentaje_desglose').AsFloat := qryAux.FieldByName('porcentaje_ad').AsFloat;
        ParamByName('kilos_desglose').AsFloat := bRoundTo(QLinAlbaran.FieldByName('kilos_sl').AsFloat * qryAux.FieldByName('porcentaje_ad').AsFloat / 100, 2);
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

procedure TDOrden2Albaran.CerrarTablasAlbaran;
begin
  QCabCarga.Close;
  QLinCargaAux.Close;
  QCabAlbaran.Close;
  QLinAlbaran.Close;
  QGetNumeroAlbaran.Close;
end;
end.
