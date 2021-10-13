program OrdenCarga;

uses
  Forms,
  UFOrdenCarga in 'UFOrdenCarga.pas' {FOrdenCarga},
  UDOrdenCarga in 'UDOrdenCarga.pas' {DOrdenCarga: TDataModule},
  UFCalendario in 'UFCalendario.pas' {FCalendario},
  UFSuministros in 'UFSuministros.pas' {FSuministros},
  UDDescripciones in 'UDDescripciones.pas' {DDescripciones: TDataModule},
  UFRejilla in 'UFRejilla.pas' {FRejilla},
  UFFiltro in 'UFFiltro.pas' {FFiltro},
  UFTransportistas in 'UFTransportistas.pas' {FTransportistas},
  UDListados in 'UDListados.pas' {DListados: TDataModule},
  UFResumen in 'UFResumen.pas' {FResumen},
  UQOrdenCompleta in 'UQOrdenCompleta.pas' {QOrdenCompleta: TQuickRep},
  UFClientes in 'UFClientes.pas' {FClientes},
  UFPedidos in 'UFPedidos.pas' {FPedidos},
  DPCrearAlbaran in 'DPCrearAlbaran.pas' {dtmPCrearAlbaran: TDataModule},
  UQOrdenPackingSimple in 'UQOrdenPackingSimple.pas' {QOrdenPackingSimple: TQuickRep},
  AdvertenciaFD in 'AdvertenciaFD.pas' {FDAdvertencia},
  UDOrden2Albaran in 'Code\UDOrden2Albaran.pas' {DOrden2Albaran: TDataModule},
  CGlobal in 'CGlobal.pas',  
  dmImportarOrdenes in 'Comun\dmImportarOrdenes.pas' {FDMImportarOrdenes: TDataModule},
  UFImportarOrdenes in 'Comun\UFImportarOrdenes.pas' {FImportarOrdenes},
  UTipos in 'Comun\UTipos.pas',
  ConexionAWSAurora in '..\..\GComer Desarrollo Git\Comun\SincronizacionWeb\ConexionAWSAurora.pas',
  ConexionAWSAuroraConstantes in '..\..\GComer Desarrollo Git\Comun\SincronizacionWeb\ConexionAWSAuroraConstantes.pas';

{$R *.res}

begin
  Application.Initialize;

  CGlobal.gProgramVersion:= pvBAG;
  Application.Title := 'Carga por Formatos';
  Application.CreateForm(TDOrdenCarga, DOrdenCarga);
  Application.CreateForm(TFOrdenCarga, FOrdenCarga);
  Application.Run;
end.
