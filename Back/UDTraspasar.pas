unit UDTraspasar;

interface

uses
  SysUtils, Classes, DB, DBTables;

type
  TRDatosPalets = record
    producto: string;
    envase: string;
    tipo_palet: string;
    palets: integer;
    cajas: integer;
    palets_quedan: integer;
    cajas_palets: integer;
  end;

  TDTraspasar = class(TDataModule)
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
    QCabCargamoneda_occ: TStringField;
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
    QPackingList: TQuery;
    QCabCargan_palets_occ: TIntegerField;
    QCabCargaporte_bonny_occ: TIntegerField;
    QCabAlbaranporte_bonny_sc: TIntegerField;
    QCabAlbarann_cmr_sc: TStringField;
    QCabAlbarann_orden_sc: TStringField;
    QCabAlbaranhigiene_sc: TIntegerField;
    QCabAlbarannota_sc: TMemoField;
    QCabCargahigiene_occ: TIntegerField;
    QKilosDetalle: TQuery;
  private
    { Private declarations }
    QLinCargaAux: TQuery;

    procedure ActualizaEstadoOrden( const AEstado: integer );

    procedure PreparaTraspasoAlbaran( const AEmpresa, ACentro: string; const AOrden: Integer );
    function ObtenerNumeroAlbaran: integer;
    procedure PasaCabeceraAlbaran;
    procedure PasaDetalleAlbaran;
    function  GetKilosDetalle: Real;
    procedure CerrarTablasAlbaran;

    (*TODO*)
    (*
    procedure RellenarPalets( const AOrden: integer );
    procedure AnyadirPalet;
    procedure PaletsLinea( var ACantidad: integer; var ATipo: string );
    *)
  public
    { Public declarations }

    Constructor Create( AOwner: TComponent ); Override;

    function PasarAlbaran( const AEmpresa, ACentro: string; const AOrden: Integer ): integer;
    (*TODO*)
    //procedure ComprobarPaletsGrabados( const ATipo: string; const AALbaran: integer );
  end;

implementation

{$R *.dfm}

uses Dialogs, Variants;

(*
var
  RDatosPalets: array of TRDatosPalets;
*)

Constructor TDTraspasar.Create( AOwner: TComponent );
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
    Add('select * from frf_orden_carga_l');
    Add('where orden_ocl = :orden');
    Add('order by producto_ocl, envase_ocl, cajas_ocl desc ');
  end;
  with QKilosDetalle.SQL do
  begin
    Clear;
    Add('');
    Add('');
    Add('');
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
end;

procedure TDTraspasar.PreparaTraspasoAlbaran( const AEmpresa, ACentro: string; const AOrden: Integer );
begin
  QCabCarga.ParamByName('orden').AsInteger:= AOrden;
  QLinCargaSalida.ParamByName('orden').AsInteger:= AOrden;
  QLinCargaAux:= QLinCargaSalida;
  QUpdateStatusCarga.ParamByName('orden').AsInteger:= AOrden;
  QUpdateCabCarga.ParamByName('orden').AsInteger:= AOrden;
  QUpdateLinCarga.ParamByName('orden').AsInteger:= AOrden;

  QCabAlbaran.Open;
  if not QCabAlbaran.IsEmpty then
  begin
    QLinAlbaran.Open;
    if not QLinAlbaran.IsEmpty then
    begin
      QGetNumeroAlbaran.ParamByName('empresa').AsString:= AEmpresa;
      QGetNumeroAlbaran.ParamByName('centro').AsString:= ACentro;
      QGetNumeroAlbaran.Open;
      QUpdateNumeroAlbaran.ParamByName('empresa').AsString:= AEmpresa;
      QUpdateNumeroAlbaran.ParamByName('centro').AsString:= ACentro;
    end
    else
    begin
      raise Exception.Create('Error al obtener los datos de la cabecera de la orden de carga');
    end;
  end
  else
  begin
    raise Exception.Create('Error al obtener los datos de la cabecera de la orden de carga');
  end;
end;

function TDTraspasar.PasarAlbaran( const AEmpresa, ACentro: string; const AOrden: Integer ): integer;
begin
  PreparaTraspasoAlbaran( AEmpresa, ACentro, AOrden);
  result:= ObtenerNumeroAlbaran;
  PasaCabeceraAlbaran;
  (*TODO*)
  //RellenarPalets( AOrden );
  QLinCargaAux.First;
  While not QLinCargaAux.Eof do
  begin
       PasaDetalleAlbaran;
       QLinCargaAux.Next;
  end;
  ActualizaEstadoOrden( 1 );
  CerrarTablasAlbaran;
end;

function TDTraspasar.ObtenerNumeroAlbaran: integer;
var
  iAlbaran: integer;
begin
  iAlbaran:= QGetNumeroAlbarancont_albaranes_c.AsInteger;
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

procedure TDTraspasar.PasaCabeceraAlbaran;
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
  QCabAlbaranmoneda_sc.Value:= QCabCargamoneda_occ.Value;
  QCabAlbarantransporte_sc.Value:= QCabCargatransporte_occ.Value;
  QCabAlbaranporte_bonny_sc.Value:= QCabCargaporte_bonny_occ.Value;
  QCabAlbaranvehiculo_sc.Value:= QCabCargavehiculo_occ.Value;

  QCabAlbaranhigiene_sc.AsInteger:= QCabCargahigiene_occ.AsInteger;
  QCabAlbarann_orden_sc.AsString:= QCabCargaorden_occ.AsString;
  QCabAlbarannota_sc.AsString:= QCabCarganota_occ.AsString;

  QCabAlbaran.Post;
end;

function  TDTraspasar.GetKilosDetalle: Real;
begin
vbhm
  result:= QLinCargaAux.FieldByName('kilos_ocl').Value;
end;

procedure TDTraspasar.PasaDetalleAlbaran;
(*
var
  iCantidad: integer;
  sTipo: string;
*)
begin
  QLinAlbaran.Insert;

  QLinAlbaranempresa_sl.Value:= QLinCargaAux.FieldByName('empresa_ocl').Value;
  QLinAlbarancentro_salida_sl.Value:= QLinCargaAux.FieldByName('centro_salida_ocl').Value;
  QLinAlbarann_albaran_sl.Value:= QLinCargaAux.FieldByName('n_albaran_ocl').Value;
  QLinAlbaranfecha_sl.Value:= QLinCargaAux.FieldByName('fecha_ocl').Value;
  QLinAlbarancentro_origen_sl.Value:= QLinCargaAux.FieldByName('centro_origen_ocl').Value;
  QLinAlbaranproducto_sl.Value:= QLinCargaAux.FieldByName('producto_ocl').Value;
  QLinAlbaranenvase_sl.Value:= QLinCargaAux.FieldByName('envase_ocl').Value;
  QLinAlbaranmarca_sl.Value:= QLinCargaAux.FieldByName('marca_ocl').Value;
  QLinAlbarancategoria_sl.Value:= QLinCargaAux.FieldByName('categoria_ocl').Value;
  QLinAlbarancalibre_sl.Value:= QLinCargaAux.FieldByName('calibre_ocl').Value;
  QLinAlbarancolor_sl.Value:= QLinCargaAux.FieldByName('color_ocl').Value;
  (*TODO*)//mirar a ver por que pasa un 0 envez de un nulo como ref transito
  QLinAlbaranref_transitos_sl.AsString:=  QLinCargaAux.FieldByName('ref_transitos_ocl').AsString;
  QLinAlbarancajas_sl.Value:= QLinCargaAux.FieldByName('cajas_ocl').Value;
  QLinAlbarankilos_sl.Value:= GetKilosDetalle;
  QLinAlbaranprecio_sl.AsFloat:= QLinCargaAux.FieldByName('precio_ocl').AsFloat;
  QLinAlbaranunidad_precio_sl.AsString:= QLinCargaAux.FieldByName('unidad_precio_ocl').AsString;
  QLinAlbaranimporte_neto_sl.AsFloat:= QLinCargaAux.FieldByName('importe_neto_ocl').AsFloat;
  QLinAlbaranporc_iva_sl.Value:= QLinCargaAux.FieldByName('porc_iva_ocl').Value;
  QLinAlbaraniva_sl.Value:= QLinCargaAux.FieldByName('iva_ocl').Value;
  QLinAlbaranimporte_total_sl.AsFloat:= QLinCargaAux.FieldByName('importe_total_ocl').AsFloat;
  QLinAlbarann_palets_sl.Value:= QLinCargaAux.FieldByName('n_palets_ocl').Value;
  QLinAlbarantipo_palets_sl.Value:= QLinCargaAux.FieldByName('tipo_palets_ocl').Value;
  (*
  PaletsLinea( iCantidad, sTipo );
  QLinAlbarann_palets_sl.Value:= iCantidad;
  if sTipo <> '' then
  begin
    QLinAlbarantipo_palets_sl.Value:= sTipo;
  end;
  *)
  QLinAlbarantipo_iva_sl.AsString:= QLinCargaAux.FieldByName('tipo_iva_ocl').AsString;
  QLinAlbaranfederacion_sl.AsString:= QLinCargaAux.FieldByName('federacion_ocl').AsString;
  QLinAlbarancliente_sl.AsString:= QLinCargaAux.FieldByName('cliente_ocl').AsString;
  QLinAlbaranemp_procedencia_sl.AsString:= QLinCargaAux.FieldByName('emp_procede_ocl').AsString;

  QLinAlbaran.Post;
end;

procedure TDTraspasar.ActualizaEstadoOrden( const AEstado: integer );
begin
  //0 -> SIN PASAR
  //1 -> PASADA COMO ALBARAN SALIDA
  //2 -> PASADA COMO ALBARAN TRANSITO
  QUpdateStatusCarga.ParamByName('estado').asinteger:= AEstado;
  QUpdateStatusCarga.ExecSQL;
end;

procedure TDTraspasar.CerrarTablasAlbaran;
begin
  QCabCarga.Close;
  QLinCargaAux.Close;
  QCabAlbaran.Close;
  QLinAlbaran.Close;
  QGetNumeroAlbaran.Close;
end;

(*TODO*)
(*
procedure TDTraspasar.RellenarPalets( const AOrden: integer );
var
  sCodPalet: String;
  i, cont: integer;
begin
  with QPackingList do
  begin
    SQL.Clear;
    SQL.Add(' select ean128_pl, tipo_palet_pl, sum(cajas_pl) cajas_pl, producto_pl, envase_pl ');
    SQL.Add(' from frf_packing_list ');
    SQL.Add(' where orden_pl = :orden ');
    SQL.Add(' group by ean128_pl, tipo_palet_pl, producto_pl, envase_pl ');
    SQL.Add(' order by producto_pl, envase_pl, cajas_pl desc ');
    ParamByName('orden').AsInteger:= AOrden;
    Open;
    sCodPalet:= '';
    while not Eof do
    begin
      if sCodPalet <> FieldByName('ean128_pl').AsString then
      begin
        sCodPalet:= FieldByName('ean128_pl').AsString;
        AnyadirPalet;
      end;
      Next;
    end;
  end;

  cont:= Length( RDatosPalets );
  i:= 0;
  while i < cont do
  begin
    RDatosPalets[i].cajas_palets:= RDatosPalets[i].cajas div RDatosPalets[i].Palets;
    Inc(i);
  end;
end;

procedure TDTraspasar.AnyadirPalet;
var
  i, cont: integer;
  bFlag: boolean;
begin
  cont:= Length( RDatosPalets );
  i:= 0;
  bFlag:= False;
  if cont > 0 then
  begin
    while ( i < cont ) and not bFlag do
    begin
      if ( RDatosPalets[i].producto = QPackingList.FieldByName('producto_pl').AsString ) and
         ( RDatosPalets[i].envase = QPackingList.FieldByName('envase_pl').AsString ) and
         ( RDatosPalets[i].tipo_palet = QPackingList.FieldByName('tipo_palet_pl').AsString )then
      begin
        bFlag:= True;
      end
      else
      begin
        inc(i);
      end;
    end;
  end;
  if bFlag then
  begin
    RDatosPalets[i].palets:= RDatosPalets[i].palets + 1;
    RDatosPalets[i].cajas:= RDatosPalets[i].cajas + QPackingList.FieldByName('cajas_pl').AsInteger;
    RDatosPalets[i].palets_quedan:= RDatosPalets[i].palets;
  end
  else
  begin
    SetLength( RDatosPalets, cont + 1 );
    RDatosPalets[cont].producto:= QPackingList.FieldByName('producto_pl').AsString;
    RDatosPalets[cont].envase:= QPackingList.FieldByName('envase_pl').AsString;
    RDatosPalets[cont].tipo_palet:= QPackingList.FieldByName('tipo_palet_pl').AsString;
    RDatosPalets[cont].palets:= 1;
    RDatosPalets[cont].cajas:= QPackingList.FieldByName('cajas_pl').AsInteger;
    RDatosPalets[cont].palets_quedan:= RDatosPalets[cont].palets;
  end;
end;

procedure TDTraspasar.PaletsLinea( var ACantidad: integer; var ATipo: string );
var
  i, cont: Integer;
  bFlag: boolean;
begin
  cont:= Length( RDatosPalets );
  i:= 0;
  bFlag:= false;
  while ( i < cont ) and not bFlag do
  begin
    if ( QLinCargaAux.FieldByName('producto_ocl').AsString = RDatosPalets[i].producto ) and
       ( QLinCargaAux.FieldByName('envase_ocl').AsString = RDatosPalets[i].envase ) and
       ( RDatosPalets[i].palets_quedan > 0 )then
    begin
      bFlag:= True;
      ACantidad:= QLinCargaAux.FieldByName('cajas_ocl').AsInteger div RDatosPalets[i].cajas_palets;
      if RDatosPalets[i].palets_quedan < ACantidad then
      begin
        ACantidad:= RDatosPalets[i].palets_quedan;
      end;
       RDatosPalets[i].palets_quedan:= RDatosPalets[i].palets_quedan - ACantidad;

      if RDatosPalets[i].palets_quedan > 0 then
      begin
        if ( QLinCargaAux.FieldByName('cajas_ocl').AsInteger mod RDatosPalets[i].cajas_palets ) > 0 then
        begin
          ACantidad:= ACantidad + 1;
          RDatosPalets[i].palets_quedan:= RDatosPalets[i].palets_quedan - 1;
        end;
      end;
      ATipo:= RDatosPalets[i].tipo_palet;
    end;
    inc(i);
  end;
  if not bFlag then
  begin
    ACantidad:= 0;
    ATipo:= '';
  end;
end;
*)

(*TODO*)
(*
procedure TDTraspasar.ComprobarPaletsGrabados( const ATipo: string; const AALbaran: integer );
var
  i, cont: integer;
  bFlag: Boolean;
  sAux: string;
begin
  cont:= Length( RDatosPalets );
  i:= 0;
  bFlag:= False;
  while i < cont do
  begin
    if RDatosPalets[i].palets_quedan > 0 then
    begin
      if bFlag then
      begin
        sAux:= sAux + #13 + #10 + 'Producto= ' + RDatosPalets[i].producto +
                                  ' Envase= ' + RDatosPalets[i].envase +
                                  ' Palets= ' + IntToStr( RDatosPalets[i].palets_quedan );
      end
      else
      begin
        sAux:= 'Producto= ' + RDatosPalets[i].producto +
               ' Envase= ' + RDatosPalets[i].envase +
               ' Palets= ' + IntToStr( RDatosPalets[i].palets_quedan );
        bFlag:= True;
      end;
    end;
    inc(i);
  end;
  SetLength( RDatosPalets, 0 );
  if bFlag then
  begin
    ShowMessage( ATipo + ' ' + IntToStr( AALbaran ) + ' generado con errores.' + #13 + #10 + #13 + #10 +
                'ERROR AL ASIGNAR LOS PALETS AL '+ UpperCase( ATipo ) + ' ' + IntToStr( AALbaran ) + #13 + #10 +
                'Faltan por asignar los siguientes palets -> ' + #13 + #10 +
                sAux + #13 + #10 + #13 + #10 +
                'Por favor revise el ' + LowerCase( ATipo ) + ' generado.');
  end
  else
  begin
    ShowMessage('Albarán ' + IntToStr( AALbaran ) + ' generado con exito.');
  end;
end;
*)

end.
