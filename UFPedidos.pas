unit UFPedidos;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, DBTables, Grids, DBGrids, StdCtrls, Buttons;

type
  TFPedidos = class(TForm)
    DBGrid: TDBGrid;
    Query: TQuery;
    DataSource: TDataSource;
    edtFiltro: TEdit;
    btnFiltrar: TSpeedButton;
    Label1: TLabel;
    procedure DBGridDblClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure FormKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btnFiltrarClick(Sender: TObject);
    procedure edtFiltroKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }

    procedure FiltrarPedidos;
  public
    { Public declarations }
    bFlag: boolean;
    sEmpresa, sCentro, sCliente, sSuministro, sFecha: string;
  end;

  procedure InicializaModulo( const ABaseDatos: string );
  procedure FinalizaModulo;


  function SeleccionaPedido( const AForm: TForm; const AControl: TControl;
                             var   VEmpresa, VCentro, VCliente, VSuministro, VPedido, VFecha: string ): Boolean;

implementation

{$R *.dfm}

uses UDOrdenCarga;

var
  FPedidos: TFPedidos;

procedure InicializaModulo( const ABaseDatos: string );
begin
  FPedidos:= TFPedidos.Create( Application );
  FPedidos.Query.DatabaseName:= ABaseDatos;
end;

procedure FinalizaModulo;
begin
  FreeAndNil( FPedidos );
end;

function SeleccionaPedido( const AForm: TForm; const AControl: TControl;
                           var   VEmpresa, VCentro, VCliente, VSuministro, VPedido, VFecha: string ): Boolean;
begin
  FPedidos:= TFPedidos.Create( AForm );

  FPedidos.Left:= AControl.ClientOrigin.X;
  FPedidos.Top:= AControl.ClientOrigin.Y + AControl.Height;

  FPedidos.sEmpresa:= VEmpresa;
  FPedidos.sCentro:= VCentro;
  FPedidos.sCliente:= VCliente;
  FPedidos.sSuministro:= VSuministro;
  FPedidos.edtFiltro.Text:= VFecha;
  FPedidos.FiltrarPedidos;

  try
    FPedidos.ShowModal;
    result:= FPedidos.bFlag;
    if result then
    begin
      VEmpresa:= FPedidos.Query.Fields[0].AsString;
      VCentro:= FPedidos.Query.Fields[1].AsString;
      VCliente:= FPedidos.Query.Fields[2].AsString;
      VSuministro:= FPedidos.Query.Fields[3].AsString;
      VPedido:= FPedidos.Query.Fields[4].AsString;
      VFecha:= FPedidos.Query.Fields[5].AsString;
    end;
  finally
    FreeAndNil( FPedidos );
  end;
end;


procedure TFPedidos.DBGridDblClick(Sender: TObject);
begin
  bFlag:= True;
  Close;
end;

procedure TFPedidos.FormShow(Sender: TObject);
begin
  bFlag:= False;
end;

procedure TFPedidos.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action:= caHide;
end;

procedure TFPedidos.FiltrarPedidos;
var
  dFecha: TDatetime;
  bFiltro: boolean;
begin
  with FPedidos.Query do
  begin
    DisableControls;
    Close;
    SQL.Clear;

    SQL.Add(' select DISTINCT empresa_pdc Empresa, centro_pdc Centro, cliente_pdc Cliente, ');
    SQL.Add('        dir_suministro_pdc suministro, ref_pedido_pdc Pedido, fecha_pdc Fecha ');
    SQL.Add(' from frf_pedido_cab ');
    if Trim(sEmpresa) <> '' then
    begin
      SQL.Add('WHERE empresa_pdc = :empresa ');
      ParamByName('empresa').AsString:= sEmpresa;
      bFiltro:= True;
    end;

    if Trim(sCentro) <> '' then
    begin
      if bFiltro then
      begin
        SQL.Add('  AND centro_pdc = :centro ');
      end
      else
      begin
        SQL.Add('WHERE centro_pdc = :centro ');
      end;
      ParamByName('centro').AsString:= sCentro;
      bFiltro:= True;
    end;

    if Trim(sCliente) <> '' then
    begin
      if bFiltro then
      begin
        SQL.Add('  AND cliente_pdc = :cliente ');
      end
      else
      begin
        SQL.Add('WHERE cliente_pdc = :cliente ');
      end;
      ParamByName('cliente').AsString:= sCliente;
      bFiltro:= True;
    end;

    if Trim(sSuministro) <> '' then
    begin
      if Trim(sSuministro) <>  Trim(sCliente) then
      begin
        if bFiltro then
        begin
          SQL.Add('  AND dir_suministro_pdc = :suministro ');
        end
        else
        begin
          SQL.Add('WHERE dir_suministro_pdc = :suministro ');
        end;
        ParamByName('suministro').AsString:= sSuministro;
        bFiltro:= True;
      end;
    end;

    if TryStrToDate( edtFiltro.Text, dFecha ) then
    begin
      if bFiltro then
        SQL.Add('  and fecha_pdc = ' + QuotedStr( edtFiltro.Text ) )
      else
        SQL.Add('Where fecha_pdc = ' + QuotedStr( edtFiltro.Text ) );
    end
    else
    begin
      ShowMessage('Fecha incorrecta.');
    end;

    SQL.Add('ORDER BY empresa_pdc, centro_pdc, cliente_pdc, dir_suministro_pdc, ref_pedido_pdc ');
    try
      Open;
    finally
      EnableControls;
    end;
  end;
end;

procedure TFPedidos.FormKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  case Key of
    vk_return:
      begin
        DBGrid.SetFocus;
        bFlag:= True;
        Close;
      end;
    vk_escape:
      begin
        Close;
      end;
    vk_f2:
      begin
        btnFiltrar.Click;
      end;
  end;
end;

procedure TFPedidos.btnFiltrarClick(Sender: TObject);
begin
  FiltrarPedidos;
end;

procedure TFPedidos.edtFiltroKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  case Key of
    vk_up:
      begin
        Query.Prior;
      end;
    vk_down:
      begin
        Query.Next;
      end;
  end;
end;

end.
