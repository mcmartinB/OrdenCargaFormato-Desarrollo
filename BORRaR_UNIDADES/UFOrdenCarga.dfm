object FOrdenCarga: TFOrdenCarga
  Left = 339
  Top = 25
  Width = 810
  Height = 750
  BorderIcons = [biSystemMenu, biMinimize]
  Caption = '  ORDEN DE CARGA POR FORMATOS'
  Color = clBtnFace
  Constraints.MaxHeight = 750
  Constraints.MaxWidth = 810
  Constraints.MinHeight = 750
  Constraints.MinWidth = 810
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poDefault
  Visible = True
  OnClose = FormClose
  OnCloseQuery = FormCloseQuery
  OnCreate = FormCreate
  OnKeyDown = FormKeyDown
  OnKeyUp = FormKeyUp
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Label13: TLabel
    Left = 37
    Top = 75
    Width = 90
    Height = 19
    AutoSize = False
    Caption = 'Empresa'
    Color = cl3DLight
    ParentColor = False
  end
  object PageControl1: TPageControl
    Left = 0
    Top = 421
    Width = 802
    Height = 295
    ActivePage = tsLineas
    Align = alClient
    TabIndex = 0
    TabOrder = 2
    TabStop = False
    TabWidth = 300
    object tsLineas: TTabSheet
      Caption = 'Lineas de pedido por formato.'
      object RVisualizacion: TDBGrid
        Left = 0
        Top = 211
        Width = 794
        Height = 56
        Align = alClient
        BiDiMode = bdLeftToRight
        Color = clMoneyGreen
        DataSource = DSDetalle
        Options = [dgTitles, dgIndicator, dgColLines, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
        ParentBiDiMode = False
        TabOrder = 1
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
        OnDblClick = RVisualizacionDblClick
        Columns = <
          item
            Alignment = taRightJustify
            Expanded = False
            FieldName = 'centro_origen_ocl'
            Title.Alignment = taCenter
            Title.Caption = 'Origen'
            Width = 40
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'ref_transitos_ocl'
            Title.Alignment = taCenter
            Title.Caption = 'Ref. Tr'#225'nsito'
            Visible = False
          end
          item
            Expanded = False
            FieldName = 'fecha_transito_ocl'
            Title.Alignment = taCenter
            Title.Caption = 'Fecha'
            Width = 65
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'producto_base_ocl'
            Title.Alignment = taCenter
            Title.Caption = 'Prod.'
            Width = 40
            Visible = True
          end
          item
            Alignment = taRightJustify
            Expanded = False
            FieldName = 'formato_cliente_ocl'
            Title.Alignment = taCenter
            Title.Caption = 'FORMATO'
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWindowText
            Title.Font.Height = -11
            Title.Font.Name = 'MS Sans Serif'
            Title.Font.Style = [fsBold, fsUnderline]
            Width = 223
            Visible = True
          end
          item
            Alignment = taRightJustify
            Expanded = False
            FieldName = 'marca_ocl'
            Title.Alignment = taCenter
            Title.Caption = 'Marca'
            Width = 40
            Visible = True
          end
          item
            Alignment = taRightJustify
            Expanded = False
            FieldName = 'calibre_ocl'
            Title.Alignment = taCenter
            Title.Caption = 'Calibre'
            Visible = True
          end
          item
            Alignment = taRightJustify
            Expanded = False
            FieldName = 'categoria_ocl'
            Title.Alignment = taCenter
            Title.Caption = 'Categ.'
            Width = 40
            Visible = True
          end
          item
            Alignment = taRightJustify
            Expanded = False
            FieldName = 'color_ocl'
            Title.Alignment = taCenter
            Title.Caption = 'Color'
            Width = 40
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'cajas_ocl'
            Title.Alignment = taCenter
            Title.Caption = 'Cajas'
            Width = 65
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'kilos_ocl'
            Title.Alignment = taCenter
            Title.Caption = 'Kilogramos'
            Width = 65
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'precio_ocl'
            Title.Alignment = taCenter
            Title.Caption = 'Precio'
            Visible = False
          end
          item
            Expanded = False
            FieldName = 'importe_neto_ocl'
            Title.Alignment = taCenter
            Title.Caption = 'Importe'
            Visible = False
          end
          item
            Expanded = False
            FieldName = 'n_palets_ocl'
            Title.Alignment = taCenter
            Title.Caption = 'Palets'
            Width = 65
            Visible = True
          end>
      end
      object PDetalle: TPanel
        Left = 0
        Top = 0
        Width = 794
        Height = 211
        Align = alTop
        BevelInner = bvLowered
        TabOrder = 0
        object Label2: TLabel
          Left = 32
          Top = 18
          Width = 80
          Height = 19
          AutoSize = False
          Caption = ' Producto Base'
          Color = cl3DLight
          ParentColor = False
          Layout = tlCenter
        end
        object BGBProducto_ocl: TBGridButton
          Left = 177
          Top = 16
          Width = 13
          Height = 22
          Hint = 'Pulse F2 para ver una lista de valores validos. '
          Glyph.Data = {
            36040000424D3604000000000000360000002800000010000000100000000100
            2000000000000004000000000000000000000000000000000000FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FFBFFF00FF00FF00FFBFFF00FF00FF00FFBFFF00FF00FF00
            FFBFFF00FF00FF00FFBFFF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FFBFFF00FF00FF00FFBFFF00FF00FF00FFBFFF00FF00FF00
            FFBFFF00FF00FF00FFBFFF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FFBFFF00FF00FF00FFBFFF00FF00FF00FFBFFF00FF00FF00
            FFBFFF00FF00FF00FFBFFF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FFBFFF00FF00FF00FFBFFF00FF00FF00FFBFFF00FF00FF00
            FFBFFF00FF00FF00FFBFFF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FFBFFF00FF00FF00FFBFFF00FF00000000BFFF00FF00FF00
            FFBFFF00FF00FF00FFBFFF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FFBFFF00FF00FF00FF00000000000000000000000000FF00
            FFBFFF00FF00FF00FFBFFF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FFBFFF00FF00000000000000000000000000000000000000
            00BFFF00FF00FF00FFBFFF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF0000000000000000000000000000000000000000000000
            000000000000FF00FFBFFF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FFBFFF00FF00FF00FFBFFF00FF00FF00FFBFFF00FF00FF00
            FFBFFF00FF00FF00FFBFFF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FFBFFF00FF00FF00FFBFFF00FF00FF00FFBFFF00FF00FF00
            FFBFFF00FF00FF00FFBFFF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00}
          ParentShowHint = False
          ShowHint = True
          OnClick = BGBProducto_oclClick
          Control = producto_base_ocl
          GridAlignment = taDownRight
          GridWidth = 240
          GridHeigth = 200
        end
        object Label6: TLabel
          Left = 356
          Top = 18
          Width = 105
          Height = 19
          AutoSize = False
          Caption = ' Formato Cliente'
          Color = cl3DLight
          ParentColor = False
          Layout = tlCenter
        end
        object BGBFormato_cliente_ocl: TBGridButton
          Left = 571
          Top = 16
          Width = 13
          Height = 22
          Hint = 'Pulse F2 para ver una lista de valores validos. '
          Glyph.Data = {
            36040000424D3604000000000000360000002800000010000000100000000100
            2000000000000004000000000000000000000000000000000000FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FFBFFF00FF00FF00FFBFFF00FF00FF00FFBFFF00FF00FF00
            FFBFFF00FF00FF00FFBFFF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FFBFFF00FF00FF00FFBFFF00FF00FF00FFBFFF00FF00FF00
            FFBFFF00FF00FF00FFBFFF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FFBFFF00FF00FF00FFBFFF00FF00FF00FFBFFF00FF00FF00
            FFBFFF00FF00FF00FFBFFF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FFBFFF00FF00FF00FFBFFF00FF00FF00FFBFFF00FF00FF00
            FFBFFF00FF00FF00FFBFFF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FFBFFF00FF00FF00FFBFFF00FF00000000BFFF00FF00FF00
            FFBFFF00FF00FF00FFBFFF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FFBFFF00FF00FF00FF00000000000000000000000000FF00
            FFBFFF00FF00FF00FFBFFF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FFBFFF00FF00000000000000000000000000000000000000
            00BFFF00FF00FF00FFBFFF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF0000000000000000000000000000000000000000000000
            000000000000FF00FFBFFF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FFBFFF00FF00FF00FFBFFF00FF00FF00FFBFFF00FF00FF00
            FFBFFF00FF00FF00FFBFFF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FFBFFF00FF00FF00FFBFFF00FF00FF00FFBFFF00FF00FF00
            FFBFFF00FF00FF00FFBFFF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00}
          ParentShowHint = False
          ShowHint = True
          OnClick = BGBFormato_cliente_oclClick
          Control = formato_cliente_ocl
          GridAlignment = taDownRight
          GridWidth = 240
          GridHeigth = 200
        end
        object Label15: TLabel
          Left = 32
          Top = 41
          Width = 80
          Height = 19
          AutoSize = False
          Caption = ' Marca'
          Color = cl3DLight
          ParentColor = False
          Layout = tlCenter
        end
        object BGBMarca_ocl: TBGridButton
          Left = 177
          Top = 39
          Width = 13
          Height = 22
          Hint = 'Pulse F2 para ver una lista de valores validos. '
          Glyph.Data = {
            36040000424D3604000000000000360000002800000010000000100000000100
            2000000000000004000000000000000000000000000000000000FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FFBFFF00FF00FF00FFBFFF00FF00FF00FFBFFF00FF00FF00
            FFBFFF00FF00FF00FFBFFF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FFBFFF00FF00FF00FFBFFF00FF00FF00FFBFFF00FF00FF00
            FFBFFF00FF00FF00FFBFFF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FFBFFF00FF00FF00FFBFFF00FF00FF00FFBFFF00FF00FF00
            FFBFFF00FF00FF00FFBFFF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FFBFFF00FF00FF00FFBFFF00FF00FF00FFBFFF00FF00FF00
            FFBFFF00FF00FF00FFBFFF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FFBFFF00FF00FF00FFBFFF00FF00000000BFFF00FF00FF00
            FFBFFF00FF00FF00FFBFFF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FFBFFF00FF00FF00FF00000000000000000000000000FF00
            FFBFFF00FF00FF00FFBFFF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FFBFFF00FF00000000000000000000000000000000000000
            00BFFF00FF00FF00FFBFFF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF0000000000000000000000000000000000000000000000
            000000000000FF00FFBFFF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FFBFFF00FF00FF00FFBFFF00FF00FF00FFBFFF00FF00FF00
            FFBFFF00FF00FF00FFBFFF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FFBFFF00FF00FF00FFBFFF00FF00FF00FFBFFF00FF00FF00
            FFBFFF00FF00FF00FFBFFF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00}
          ParentShowHint = False
          ShowHint = True
          OnClick = BGBMarca_oclClick
          Control = marca_ocl
          GridAlignment = taDownRight
          GridWidth = 220
          GridHeigth = 200
        end
        object Label16: TLabel
          Left = 356
          Top = 41
          Width = 105
          Height = 19
          AutoSize = False
          Caption = ' Categor'#237'a'
          Color = cl3DLight
          ParentColor = False
          Layout = tlCenter
        end
        object BGBCategoria_ocl: TBGridButton
          Left = 571
          Top = 39
          Width = 13
          Height = 22
          Hint = 'Pulse F2 para ver una lista de valores validos. '
          Glyph.Data = {
            36040000424D3604000000000000360000002800000010000000100000000100
            2000000000000004000000000000000000000000000000000000FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FFBFFF00FF00FF00FFBFFF00FF00FF00FFBFFF00FF00FF00
            FFBFFF00FF00FF00FFBFFF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FFBFFF00FF00FF00FFBFFF00FF00FF00FFBFFF00FF00FF00
            FFBFFF00FF00FF00FFBFFF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FFBFFF00FF00FF00FFBFFF00FF00FF00FFBFFF00FF00FF00
            FFBFFF00FF00FF00FFBFFF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FFBFFF00FF00FF00FFBFFF00FF00FF00FFBFFF00FF00FF00
            FFBFFF00FF00FF00FFBFFF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FFBFFF00FF00FF00FFBFFF00FF00000000BFFF00FF00FF00
            FFBFFF00FF00FF00FFBFFF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FFBFFF00FF00FF00FF00000000000000000000000000FF00
            FFBFFF00FF00FF00FFBFFF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FFBFFF00FF00000000000000000000000000000000000000
            00BFFF00FF00FF00FFBFFF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF0000000000000000000000000000000000000000000000
            000000000000FF00FFBFFF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FFBFFF00FF00FF00FFBFFF00FF00FF00FFBFFF00FF00FF00
            FFBFFF00FF00FF00FFBFFF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FFBFFF00FF00FF00FFBFFF00FF00FF00FFBFFF00FF00FF00
            FFBFFF00FF00FF00FFBFFF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00}
          ParentShowHint = False
          ShowHint = True
          OnClick = BGBCategoria_oclClick
          Control = categoria_ocl
          GridAlignment = taDownRight
          GridWidth = 140
          GridHeigth = 200
        end
        object Label17: TLabel
          Left = 356
          Top = 64
          Width = 105
          Height = 19
          AutoSize = False
          Caption = ' Color'
          Color = cl3DLight
          ParentColor = False
          Layout = tlCenter
        end
        object BGBColor_ocl: TBGridButton
          Left = 571
          Top = 62
          Width = 13
          Height = 22
          Hint = 'Pulse F2 para ver una lista de valores validos. '
          Glyph.Data = {
            36040000424D3604000000000000360000002800000010000000100000000100
            2000000000000004000000000000000000000000000000000000FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FFBFFF00FF00FF00FFBFFF00FF00FF00FFBFFF00FF00FF00
            FFBFFF00FF00FF00FFBFFF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FFBFFF00FF00FF00FFBFFF00FF00FF00FFBFFF00FF00FF00
            FFBFFF00FF00FF00FFBFFF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FFBFFF00FF00FF00FFBFFF00FF00FF00FFBFFF00FF00FF00
            FFBFFF00FF00FF00FFBFFF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FFBFFF00FF00FF00FFBFFF00FF00FF00FFBFFF00FF00FF00
            FFBFFF00FF00FF00FFBFFF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FFBFFF00FF00FF00FFBFFF00FF00000000BFFF00FF00FF00
            FFBFFF00FF00FF00FFBFFF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FFBFFF00FF00FF00FF00000000000000000000000000FF00
            FFBFFF00FF00FF00FFBFFF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FFBFFF00FF00000000000000000000000000000000000000
            00BFFF00FF00FF00FFBFFF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF0000000000000000000000000000000000000000000000
            000000000000FF00FFBFFF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FFBFFF00FF00FF00FFBFFF00FF00FF00FFBFFF00FF00FF00
            FFBFFF00FF00FF00FFBFFF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FFBFFF00FF00FF00FFBFFF00FF00FF00FFBFFF00FF00FF00
            FFBFFF00FF00FF00FFBFFF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00}
          ParentShowHint = False
          ShowHint = True
          OnClick = BGBColor_oclClick
          Control = color_ocl
          GridAlignment = taDownLeft
          GridWidth = 200
          GridHeigth = 200
        end
        object Label18: TLabel
          Left = 100
          Top = 179
          Width = 60
          Height = 19
          AutoSize = False
          Caption = ' Cajas'
          Color = cl3DLight
          ParentColor = False
          Layout = tlCenter
          Visible = False
        end
        object Label21: TLabel
          Left = 295
          Top = 152
          Width = 58
          Height = 19
          AutoSize = False
          Caption = ' Precio '
          Color = cl3DLight
          ParentColor = False
          Layout = tlCenter
          Visible = False
        end
        object Label30: TLabel
          Left = 32
          Top = 64
          Width = 80
          Height = 19
          AutoSize = False
          Caption = ' Calibre'
          Color = cl3DLight
          ParentColor = False
          Layout = tlCenter
        end
        object BGBCalibre_ocl: TBGridButton
          Left = 177
          Top = 62
          Width = 13
          Height = 22
          Hint = 'Pulse F2 para ver una lista de valores validos. '
          Glyph.Data = {
            36040000424D3604000000000000360000002800000010000000100000000100
            2000000000000004000000000000000000000000000000000000FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FFBFFF00FF00FF00FFBFFF00FF00FF00FFBFFF00FF00FF00
            FFBFFF00FF00FF00FFBFFF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FFBFFF00FF00FF00FFBFFF00FF00FF00FFBFFF00FF00FF00
            FFBFFF00FF00FF00FFBFFF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FFBFFF00FF00FF00FFBFFF00FF00FF00FFBFFF00FF00FF00
            FFBFFF00FF00FF00FFBFFF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FFBFFF00FF00FF00FFBFFF00FF00FF00FFBFFF00FF00FF00
            FFBFFF00FF00FF00FFBFFF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FFBFFF00FF00FF00FFBFFF00FF00000000BFFF00FF00FF00
            FFBFFF00FF00FF00FFBFFF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FFBFFF00FF00FF00FF00000000000000000000000000FF00
            FFBFFF00FF00FF00FFBFFF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FFBFFF00FF00000000000000000000000000000000000000
            00BFFF00FF00FF00FFBFFF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF0000000000000000000000000000000000000000000000
            000000000000FF00FFBFFF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FFBFFF00FF00FF00FFBFFF00FF00FF00FFBFFF00FF00FF00
            FFBFFF00FF00FF00FFBFFF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FFBFFF00FF00FF00FFBFFF00FF00FF00FFBFFF00FF00FF00
            FFBFFF00FF00FF00FFBFFF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00}
          ParentShowHint = False
          ShowHint = True
          OnClick = BGBCalibre_oclClick
          Control = calibre_ocl
          GridAlignment = taDownRight
          GridWidth = 100
          GridHeigth = 200
        end
        object Label31: TLabel
          Left = 612
          Top = 123
          Width = 60
          Height = 19
          AutoSize = False
          Caption = ' Kilos'
          Color = cl3DLight
          ParentColor = False
          Layout = tlCenter
        end
        object Label32: TLabel
          Left = 356
          Top = 152
          Width = 58
          Height = 19
          AutoSize = False
          Caption = ' Unidad'
          Color = cl3DLight
          ParentColor = False
          Layout = tlCenter
          Visible = False
        end
        object Label33: TLabel
          Left = 417
          Top = 152
          Width = 89
          Height = 19
          AutoSize = False
          Caption = ' Importe Neto'
          Color = cl3DLight
          ParentColor = False
          Layout = tlCenter
          Visible = False
        end
        object Lporc_iva_ocl: TLabel
          Left = 509
          Top = 152
          Width = 57
          Height = 19
          AutoSize = False
          Caption = ' % IVA'
          Color = cl3DLight
          ParentColor = False
          Layout = tlCenter
          Visible = False
        end
        object Liva_ocl: TLabel
          Left = 570
          Top = 152
          Width = 89
          Height = 19
          AutoSize = False
          Caption = ' IVA'
          Color = cl3DLight
          ParentColor = False
          Layout = tlCenter
          Visible = False
        end
        object LImporteTotal: TLabel
          Left = 661
          Top = 152
          Width = 89
          Height = 19
          AutoSize = False
          Caption = ' Importe Total'
          Color = cl3DLight
          ParentColor = False
          Layout = tlCenter
          Visible = False
        end
        object lblPalets: TLabel
          Left = 356
          Top = 123
          Width = 60
          Height = 19
          AutoSize = False
          Caption = ' Palets'
          Color = cl3DLight
          ParentColor = False
          Layout = tlCenter
        end
        object Label10: TLabel
          Left = 32
          Top = 87
          Width = 80
          Height = 19
          AutoSize = False
          Caption = ' Tipo Palet'
          Color = cl3DLight
          ParentColor = False
          Layout = tlCenter
        end
        object btnTipo_palets_ocl: TBGridButton
          Left = 177
          Top = 85
          Width = 13
          Height = 22
          Hint = 'Pulse F2 para ver una lista de valores validos. '
          Enabled = False
          Glyph.Data = {
            36040000424D3604000000000000360000002800000010000000100000000100
            2000000000000004000000000000000000000000000000000000FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FFBFFF00FF00FF00FFBFFF00FF00FF00FFBFFF00FF00FF00
            FFBFFF00FF00FF00FFBFFF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FFBFFF00FF00FF00FFBFFF00FF00FF00FFBFFF00FF00FF00
            FFBFFF00FF00FF00FFBFFF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FFBFFF00FF00FF00FFBFFF00FF00FF00FFBFFF00FF00FF00
            FFBFFF00FF00FF00FFBFFF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FFBFFF00FF00FF00FFBFFF00FF00FF00FFBFFF00FF00FF00
            FFBFFF00FF00FF00FFBFFF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FFBFFF00FF00FF00FFBFFF00FF00000000BFFF00FF00FF00
            FFBFFF00FF00FF00FFBFFF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FFBFFF00FF00FF00FF00000000000000000000000000FF00
            FFBFFF00FF00FF00FFBFFF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FFBFFF00FF00000000000000000000000000000000000000
            00BFFF00FF00FF00FFBFFF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF0000000000000000000000000000000000000000000000
            000000000000FF00FFBFFF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FFBFFF00FF00FF00FFBFFF00FF00FF00FFBFFF00FF00FF00
            FFBFFF00FF00FF00FFBFFF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FFBFFF00FF00FF00FFBFFF00FF00FF00FFBFFF00FF00FF00
            FFBFFF00FF00FF00FFBFFF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00}
          ParentShowHint = False
          ShowHint = True
          OnClick = BGBTipo_Palet_oclClick
          Control = tipo_palets_ocl
          GridAlignment = taDownLeft
          GridWidth = 200
          GridHeigth = 200
        end
        object Label23: TLabel
          Left = 484
          Top = 123
          Width = 60
          Height = 19
          AutoSize = False
          Caption = ' Unidades'
          Color = cl3DLight
          ParentColor = False
          Layout = tlCenter
        end
        object Label26: TLabel
          Left = 356
          Top = 87
          Width = 105
          Height = 19
          AutoSize = False
          Caption = ' Envase'
          Color = cl3DLight
          ParentColor = False
          Layout = tlCenter
        end
        object btnEnvase_ocl: TBGridButton
          Left = 571
          Top = 85
          Width = 13
          Height = 22
          Hint = 'Pulse F2 para ver una lista de valores validos. '
          Glyph.Data = {
            36040000424D3604000000000000360000002800000010000000100000000100
            2000000000000004000000000000000000000000000000000000FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FFBFFF00FF00FF00FFBFFF00FF00FF00FFBFFF00FF00FF00
            FFBFFF00FF00FF00FFBFFF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FFBFFF00FF00FF00FFBFFF00FF00FF00FFBFFF00FF00FF00
            FFBFFF00FF00FF00FFBFFF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FFBFFF00FF00FF00FFBFFF00FF00FF00FFBFFF00FF00FF00
            FFBFFF00FF00FF00FFBFFF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FFBFFF00FF00FF00FFBFFF00FF00FF00FFBFFF00FF00FF00
            FFBFFF00FF00FF00FFBFFF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FFBFFF00FF00FF00FFBFFF00FF00000000BFFF00FF00FF00
            FFBFFF00FF00FF00FFBFFF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FFBFFF00FF00FF00FF00000000000000000000000000FF00
            FFBFFF00FF00FF00FFBFFF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FFBFFF00FF00000000000000000000000000000000000000
            00BFFF00FF00FF00FFBFFF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF0000000000000000000000000000000000000000000000
            000000000000FF00FFBFFF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FFBFFF00FF00FF00FFBFFF00FF00FF00FFBFFF00FF00FF00
            FFBFFF00FF00FF00FFBFFF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FFBFFF00FF00FF00FFBFFF00FF00FF00FFBFFF00FF00FF00
            FFBFFF00FF00FF00FFBFFF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00}
          ParentShowHint = False
          ShowHint = True
          OnClick = btnEnvase_oclClick
          Control = envase_ocl
          GridAlignment = taDownLeft
          GridWidth = 200
          GridHeigth = 200
        end
        object Label27: TLabel
          Left = 32
          Top = 122
          Width = 80
          Height = 19
          AutoSize = False
          Caption = ' Cantidad Cajas'
          Color = cl3DLight
          ParentColor = False
          Layout = tlCenter
        end
        object STProducto_base_ocl: TStaticText
          Left = 192
          Top = 19
          Width = 150
          Height = 17
          AutoSize = False
          BorderStyle = sbsSunken
          TabOrder = 2
        end
        object producto_base_ocl: TBDEdit
          Tag = 1
          Left = 118
          Top = 17
          Width = 25
          Height = 21
          ColorEdit = clMoneyGreen
          RequiredMsg = 'El c'#243'digo del producto es de obligada inserci'#243'n.'
          InputType = itInteger
          MaxLength = 3
          TabOrder = 0
          OnChange = producto_base_oclChange
          DataField = 'producto_base_ocl'
          DataSource = DSDetalle
          PrimaryKey = True
        end
        object formato_cliente_ocl: TBDEdit
          Tag = 1
          Left = 466
          Top = 17
          Width = 104
          Height = 21
          ColorEdit = clMoneyGreen
          RequiredMsg = 
            'El c'#243'digo del envase que contiene al producto es de obligada ins' +
            'ercci'#243'n.'
          MaxLength = 16
          TabOrder = 1
          OnChange = formato_cliente_oclChange
          DataField = 'formato_cliente_ocl'
          DataSource = DSDetalle
          PrimaryKey = True
        end
        object STFormato_Cliente_ocl: TStaticText
          Left = 586
          Top = 19
          Width = 150
          Height = 17
          AutoSize = False
          BorderStyle = sbsSunken
          TabOrder = 3
        end
        object marca_ocl: TBDEdit
          Tag = 1
          Left = 118
          Top = 40
          Width = 25
          Height = 21
          ColorEdit = clMoneyGreen
          Zeros = True
          RequiredMsg = 'El c'#243'digo de la marca del producto es de obligada inserci'#243'n.'
          MaxLength = 2
          TabOrder = 4
          OnChange = marca_oclChange
          DataField = 'marca_ocl'
          DataSource = DSDetalle
          PrimaryKey = True
        end
        object STMarca_ocl: TStaticText
          Left = 192
          Top = 42
          Width = 150
          Height = 17
          AutoSize = False
          BorderStyle = sbsSunken
          TabOrder = 6
        end
        object categoria_ocl: TBDEdit
          Tag = 1
          Left = 466
          Top = 40
          Width = 25
          Height = 21
          ColorEdit = clMoneyGreen
          RequiredMsg = 'El c'#243'digo de la categoria del producto es de obligada inserci'#243'n.'
          MaxLength = 2
          TabOrder = 5
          OnChange = categoria_oclChange
          DataField = 'categoria_ocl'
          DataSource = DSDetalle
          PrimaryKey = True
        end
        object STCategoria_ocl: TStaticText
          Left = 586
          Top = 42
          Width = 150
          Height = 17
          AutoSize = False
          BorderStyle = sbsSunken
          TabOrder = 7
        end
        object color_ocl: TBDEdit
          Tag = 1
          Left = 466
          Top = 63
          Width = 20
          Height = 21
          ColorEdit = clMoneyGreen
          RequiredMsg = 'El c'#243'digo del color del producto es de obligada inserci'#243'n.'
          MaxLength = 1
          TabOrder = 9
          OnChange = color_oclChange
          DataField = 'color_ocl'
          DataSource = DSDetalle
          PrimaryKey = True
        end
        object STcolor_ocl: TStaticText
          Left = 586
          Top = 65
          Width = 150
          Height = 17
          AutoSize = False
          BorderStyle = sbsSunken
          TabOrder = 10
        end
        object cajas_ocl: TBDEdit
          Left = 164
          Top = 178
          Width = 60
          Height = 21
          TabStop = False
          ColorEdit = clSilver
          ColorNormal = clSilver
          InputType = itInteger
          Visible = False
          ReadOnly = True
          TabOrder = 30
          DataField = 'cajas_ocl'
          DataSource = DSDetalle
        end
        object precio_ocl: TBDEdit
          Left = 295
          Top = 173
          Width = 58
          Height = 21
          TabStop = False
          ColorEdit = clSilver
          ColorNormal = clSilver
          InputType = itReal
          MaxDecimals = 3
          Visible = False
          ReadOnly = True
          MaxLength = 9
          TabOrder = 23
          DataField = 'precio_ocl'
          DataSource = DSDetalle
        end
        object calibre_ocl: TBDEdit
          Tag = 1
          Left = 118
          Top = 63
          Width = 58
          Height = 21
          ColorEdit = clMoneyGreen
          RequiredMsg = 'El calibre del producto es de obligada inserci'#243'n.'
          CharCase = ecNormal
          MaxLength = 6
          TabOrder = 8
          DataField = 'calibre_ocl'
          DataSource = DSDetalle
          PrimaryKey = True
        end
        object kilos_ocl: TBDEdit
          Left = 676
          Top = 122
          Width = 60
          Height = 21
          TabStop = False
          ColorEdit = clSilver
          ColorNormal = clSilver
          InputType = itReal
          MaxDecimals = 2
          ReadOnly = True
          MaxLength = 11
          TabOrder = 19
          DataField = 'kilos_ocl'
          DataSource = DSDetalle
        end
        object unidad_precio_ocl: TBDEdit
          Left = 356
          Top = 173
          Width = 58
          Height = 21
          TabStop = False
          ColorEdit = clSilver
          ColorNormal = clSilver
          Visible = False
          ReadOnly = True
          MaxLength = 3
          TabOrder = 24
          DataField = 'unidad_precio_ocl'
          DataSource = DSDetalle
        end
        object importe_neto_ocl: TBDEdit
          Left = 417
          Top = 173
          Width = 89
          Height = 21
          TabStop = False
          ColorEdit = clSilver
          ColorNormal = clSilver
          InputType = itReal
          MaxDecimals = 2
          Visible = False
          ReadOnly = True
          MaxLength = 11
          TabOrder = 25
          DataField = 'importe_neto_ocl'
          DataSource = DSDetalle
        end
        object porc_iva_ocl: TBDEdit
          Left = 509
          Top = 173
          Width = 36
          Height = 21
          TabStop = False
          ColorEdit = clSilver
          ColorNormal = clSilver
          InputType = itReal
          MaxDecimals = 2
          Visible = False
          ReadOnly = True
          MaxLength = 6
          TabOrder = 26
          DataField = 'porc_iva_ocl'
          DataSource = DSDetalle
        end
        object iva_ocl: TBDEdit
          Left = 570
          Top = 173
          Width = 89
          Height = 21
          TabStop = False
          ColorEdit = clSilver
          ColorNormal = clSilver
          InputType = itReal
          MaxDecimals = 2
          Visible = False
          ReadOnly = True
          MaxLength = 11
          TabOrder = 28
          DataField = 'iva_ocl'
          DataSource = DSDetalle
        end
        object importe_total_ocl: TBDEdit
          Left = 661
          Top = 173
          Width = 89
          Height = 21
          TabStop = False
          ColorEdit = clSilver
          ColorNormal = clSilver
          Visible = False
          ReadOnly = True
          MaxLength = 13
          TabOrder = 29
          DataField = 'importe_total_ocl'
          DataSource = DSDetalle
        end
        object tipo_iva_ocl: TBDEdit
          Left = 544
          Top = 173
          Width = 23
          Height = 21
          TabStop = False
          ColorEdit = clSilver
          ColorNormal = clSilver
          Visible = False
          ReadOnly = True
          MaxLength = 2
          TabOrder = 27
          DataField = 'tipo_iva_ocl'
          DataSource = DSDetalle
        end
        object n_palets_ocl: TBDEdit
          Left = 420
          Top = 122
          Width = 60
          Height = 21
          TabStop = False
          ColorEdit = clMoneyGreen
          InputType = itInteger
          Enabled = False
          MaxLength = 3
          TabOrder = 17
          DataField = 'n_palets_ocl'
          DataSource = DSDetalle
        end
        object tipo_palets_ocl: TBDEdit
          Left = 118
          Top = 86
          Width = 30
          Height = 21
          TabStop = False
          ColorEdit = clMoneyGreen
          MaxLength = 2
          TabOrder = 11
          OnChange = tipo_palets_oclChange
          DataField = 'tipo_palets_ocl'
          DataSource = DSDetalle
        end
        object stTipoPalet: TStaticText
          Left = 192
          Top = 88
          Width = 150
          Height = 17
          AutoSize = False
          BorderStyle = sbsSunken
          TabOrder = 13
        end
        object BDEdit1: TBDEdit
          Left = 548
          Top = 122
          Width = 60
          Height = 21
          TabStop = False
          ColorEdit = clSilver
          ColorNormal = clSilver
          InputType = itInteger
          ReadOnly = True
          TabOrder = 18
          DataField = 'unidades_ocl'
          DataSource = DSDetalle
        end
        object envase_ocl: TBDEdit
          Left = 466
          Top = 86
          Width = 30
          Height = 21
          TabStop = False
          ColorEdit = clMoneyGreen
          MaxLength = 3
          TabOrder = 12
          OnChange = envase_oclChange
          DataField = 'envase_ocl'
          DataSource = DSDetalle
        end
        object stEnvase: TStaticText
          Left = 586
          Top = 88
          Width = 150
          Height = 17
          AutoSize = False
          BorderStyle = sbsSunken
          TabOrder = 14
        end
        object cbxValoracion: TComboBox
          Left = 32
          Top = 150
          Width = 80
          Height = 21
          Style = csDropDownList
          Color = cl3DLight
          ItemHeight = 13
          ItemIndex = 0
          TabOrder = 20
          TabStop = False
          Text = 'Precio'
          Visible = False
          OnChange = CambiaValoracion
          Items.Strings = (
            'Precio'
            'Importe')
        end
        object cbxUnidadPedido: TComboBox
          Left = 190
          Top = 122
          Width = 75
          Height = 21
          Style = csDropDownList
          Color = cl3DLight
          Enabled = False
          ItemHeight = 13
          ItemIndex = 0
          TabOrder = 16
          TabStop = False
          Text = 'Cajas'
          Visible = False
          OnChange = CambiaUnidadPedido
          Items.Strings = (
            'Cajas'
            'Unidades'
            'Kilos')
        end
        object ePrecio: TBEdit
          Left = 118
          Top = 150
          Width = 72
          Height = 21
          InputType = itReal
          MaxDecimals = 3
          Visible = False
          MaxLength = 10
          TabOrder = 21
          OnChange = CambioImporte
        end
        object eCantidad: TBEdit
          Left = 118
          Top = 122
          Width = 72
          Height = 21
          InputType = itReal
          MaxDecimals = 2
          MaxLength = 9
          TabOrder = 15
          OnChange = CambiaCantidad
        end
        object cbkUnidadFacturacion: TComboBox
          Left = 190
          Top = 150
          Width = 72
          Height = 21
          Style = csDropDownList
          Color = cl3DLight
          ItemHeight = 13
          ItemIndex = 2
          TabOrder = 22
          TabStop = False
          Text = 'Kilos'
          Visible = False
          OnChange = CambiaUnidadFacturacion
          Items.Strings = (
            'Cajas'
            'Unidades'
            'Kilos')
        end
      end
    end
  end
  object PMaestro: TPanel
    Left = 0
    Top = 29
    Width = 802
    Height = 392
    Align = alTop
    BevelInner = bvRaised
    BevelOuter = bvLowered
    BevelWidth = 2
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -12
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 1
    object Bevel2: TBevel
      Left = 483
      Top = 9
      Width = 190
      Height = 49
    end
    object Shape1: TShape
      Left = 486
      Top = 12
      Width = 183
      Height = 43
      Brush.Color = clBtnFace
      Pen.Width = 4
    end
    object LEmpresa_p: TLabel
      Left = 45
      Top = 42
      Width = 69
      Height = 19
      AutoSize = False
      Caption = ' Empresa'
      Color = cl3DLight
      ParentColor = False
      Layout = tlCenter
    end
    object Label1: TLabel
      Left = 45
      Top = 63
      Width = 69
      Height = 19
      AutoSize = False
      Caption = ' Centro'
      Color = cl3DLight
      ParentColor = False
      Layout = tlCenter
    end
    object BGBCentro_occ: TBGridButton
      Left = 155
      Top = 61
      Width = 13
      Height = 22
      Hint = 'Pulse F2 para ver una lista de valores validos. '
      Glyph.Data = {
        36040000424D3604000000000000360000002800000010000000100000000100
        2000000000000004000000000000000000000000000000000000FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FFBFFF00FF00FF00FFBFFF00FF00FF00FFBFFF00FF00FF00
        FFBFFF00FF00FF00FFBFFF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FFBFFF00FF00FF00FFBFFF00FF00FF00FFBFFF00FF00FF00
        FFBFFF00FF00FF00FFBFFF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FFBFFF00FF00FF00FFBFFF00FF00FF00FFBFFF00FF00FF00
        FFBFFF00FF00FF00FFBFFF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FFBFFF00FF00FF00FFBFFF00FF00FF00FFBFFF00FF00FF00
        FFBFFF00FF00FF00FFBFFF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FFBFFF00FF00FF00FFBFFF00FF00000000BFFF00FF00FF00
        FFBFFF00FF00FF00FFBFFF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FFBFFF00FF00FF00FF00000000000000000000000000FF00
        FFBFFF00FF00FF00FFBFFF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FFBFFF00FF00000000000000000000000000000000000000
        00BFFF00FF00FF00FFBFFF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF0000000000000000000000000000000000000000000000
        000000000000FF00FFBFFF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FFBFFF00FF00FF00FFBFFF00FF00FF00FFBFFF00FF00FF00
        FFBFFF00FF00FF00FFBFFF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FFBFFF00FF00FF00FFBFFF00FF00FF00FFBFFF00FF00FF00
        FFBFFF00FF00FF00FFBFFF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00}
      ParentShowHint = False
      ShowHint = True
      OnClick = BGBCentro_occClick
      Control = centro_salida_occ
      GridAlignment = taDownRight
      GridWidth = 230
      GridHeigth = 100
    end
    object Label5: TLabel
      Left = 40
      Top = 199
      Width = 74
      Height = 19
      AutoSize = False
      Caption = ' Veh'#237'culo'
      Color = cl3DLight
      ParentColor = False
      Layout = tlCenter
    end
    object Bevel1: TBevel
      Left = 40
      Top = 90
      Width = 711
      Height = 3
      Style = bsRaised
    end
    object LAno_semana_p: TLabel
      Left = 40
      Top = 178
      Width = 74
      Height = 19
      AutoSize = False
      Caption = ' Transportista'
      Color = cl3DLight
      ParentColor = False
      Layout = tlCenter
    end
    object BGBtransporte_occ: TBGridButton
      Left = 155
      Top = 177
      Width = 13
      Height = 21
      Hint = 'Pulse F2 para ver una lista de valores validos. '
      Glyph.Data = {
        36040000424D3604000000000000360000002800000010000000100000000100
        2000000000000004000000000000000000000000000000000000FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FFBFFF00FF00FF00FFBFFF00FF00FF00FFBFFF00FF00FF00
        FFBFFF00FF00FF00FFBFFF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FFBFFF00FF00FF00FFBFFF00FF00FF00FFBFFF00FF00FF00
        FFBFFF00FF00FF00FFBFFF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FFBFFF00FF00FF00FFBFFF00FF00FF00FFBFFF00FF00FF00
        FFBFFF00FF00FF00FFBFFF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FFBFFF00FF00FF00FFBFFF00FF00FF00FFBFFF00FF00FF00
        FFBFFF00FF00FF00FFBFFF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FFBFFF00FF00FF00FFBFFF00FF00000000BFFF00FF00FF00
        FFBFFF00FF00FF00FFBFFF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FFBFFF00FF00FF00FF00000000000000000000000000FF00
        FFBFFF00FF00FF00FFBFFF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FFBFFF00FF00000000000000000000000000000000000000
        00BFFF00FF00FF00FFBFFF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF0000000000000000000000000000000000000000000000
        000000000000FF00FFBFFF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FFBFFF00FF00FF00FFBFFF00FF00FF00FFBFFF00FF00FF00
        FFBFFF00FF00FF00FFBFFF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FFBFFF00FF00FF00FFBFFF00FF00FF00FFBFFF00FF00FF00
        FFBFFF00FF00FF00FFBFFF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00}
      ParentShowHint = False
      ShowHint = True
      OnClick = BGBtransporte_occClick
      Control = transporte_occ
      GridAlignment = taDownCenter
      GridWidth = 300
      GridHeigth = 200
    end
    object BGBEmpresa_occ: TBGridButton
      Left = 155
      Top = 40
      Width = 13
      Height = 22
      Hint = 'Pulse F2 para ver una lista de valores validos. '
      Glyph.Data = {
        36040000424D3604000000000000360000002800000010000000100000000100
        2000000000000004000000000000000000000000000000000000FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FFBFFF00FF00FF00FFBFFF00FF00FF00FFBFFF00FF00FF00
        FFBFFF00FF00FF00FFBFFF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FFBFFF00FF00FF00FFBFFF00FF00FF00FFBFFF00FF00FF00
        FFBFFF00FF00FF00FFBFFF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FFBFFF00FF00FF00FFBFFF00FF00FF00FFBFFF00FF00FF00
        FFBFFF00FF00FF00FFBFFF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FFBFFF00FF00FF00FFBFFF00FF00FF00FFBFFF00FF00FF00
        FFBFFF00FF00FF00FFBFFF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FFBFFF00FF00FF00FFBFFF00FF00000000BFFF00FF00FF00
        FFBFFF00FF00FF00FFBFFF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FFBFFF00FF00FF00FF00000000000000000000000000FF00
        FFBFFF00FF00FF00FFBFFF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FFBFFF00FF00000000000000000000000000000000000000
        00BFFF00FF00FF00FFBFFF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF0000000000000000000000000000000000000000000000
        000000000000FF00FFBFFF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FFBFFF00FF00FF00FFBFFF00FF00FF00FFBFFF00FF00FF00
        FFBFFF00FF00FF00FFBFFF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FFBFFF00FF00FF00FFBFFF00FF00FF00FFBFFF00FF00FF00
        FFBFFF00FF00FF00FFBFFF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00}
      ParentShowHint = False
      ShowHint = True
      OnClick = BGBEmpresa_occClick
      Control = empresa_occ
      GridAlignment = taDownRight
      GridWidth = 250
      GridHeigth = 100
    end
    object Label11: TLabel
      Left = 210
      Top = 21
      Width = 69
      Height = 19
      AutoSize = False
      Caption = ' Fecha/Hora'
      Color = cl3DLight
      ParentColor = False
      Layout = tlCenter
    end
    object BCBFecha_occ: TBCalendarButton
      Left = 360
      Top = 20
      Width = 13
      Height = 21
      Hint = 'Pulse F2 para deplegar un calendario. '
      Glyph.Data = {
        36040000424D3604000000000000360000002800000010000000100000000100
        2000000000000004000000000000000000000000000000000000FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FFBFFF00FF00FF00FFBFFF00FF00FF00FFBFFF00FF00FF00
        FFBFFF00FF00FF00FFBFFF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FFBFFF00FF00FF00FFBFFF00FF00FF00FFBFFF00FF00FF00
        FFBFFF00FF00FF00FFBFFF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FFBFFF00FF00FF00FFBFFF00FF00FF00FFBFFF00FF00FF00
        FFBFFF00FF00FF00FFBFFF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FFBFFF00FF00FF00FFBFFF00FF00FF00FFBFFF00FF00FF00
        FFBFFF00FF00FF00FFBFFF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FFBFFF00FF00FF00FFBFFF00FF00000000BFFF00FF00FF00
        FFBFFF00FF00FF00FFBFFF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FFBFFF00FF00FF00FF00000000000000000000000000FF00
        FFBFFF00FF00FF00FFBFFF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FFBFFF00FF00000000000000000000000000000000000000
        00BFFF00FF00FF00FFBFFF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF0000000000000000000000000000000000000000000000
        000000000000FF00FFBFFF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FFBFFF00FF00FF00FFBFFF00FF00FF00FFBFFF00FF00FF00
        FFBFFF00FF00FF00FFBFFF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FFBFFF00FF00FF00FFBFFF00FF00FF00FFBFFF00FF00FF00
        FFBFFF00FF00FF00FFBFFF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00}
      ParentShowHint = False
      ShowHint = True
      OnClick = BCBFecha_occClick
      Control = fecha_occ
      CalendarAlignment = taDownRight
      CalendarWidth = 197
      CalendarHeigth = 153
    end
    object Label3: TLabel
      Left = 45
      Top = 21
      Width = 69
      Height = 19
      AutoSize = False
      Caption = 'Orden Carga'
      Color = cl3DLight
      ParentColor = False
      Layout = tlCenter
    end
    object des_status_occ: TDBText
      Left = 499
      Top = 33
      Width = 145
      Height = 16
      Alignment = taCenter
      DataField = 'des_status_occ'
      DataSource = DSMaestro
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label4: TLabel
      Left = 499
      Top = 17
      Width = 145
      Height = 13
      Alignment = taCenter
      AutoSize = False
      Caption = 'Status Orden Carga'
    end
    object DBText1: TDBText
      Left = 463
      Top = 62
      Width = 230
      Height = 16
      Alignment = taCenter
      DataField = 'des_traspasada_occ'
      DataSource = DSMaestro
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold, fsUnderline]
      ParentFont = False
    end
    object DBText2: TDBText
      Left = 524
      Top = 307
      Width = 65
      Height = 17
      Alignment = taRightJustify
      DataField = 'palets_cargados_occ'
      DataSource = DSMaestro
    end
    object Label22: TLabel
      Left = 405
      Top = 306
      Width = 84
      Height = 19
      AutoSize = False
      Caption = ' N'#186' Palets'
      Color = cl3DLight
      ParentColor = False
      Layout = tlCenter
    end
    object Label24: TLabel
      Left = 521
      Top = 309
      Width = 45
      Height = 13
      Alignment = taRightJustify
      Caption = 'Cargados'
    end
    object lblNotasAlbaran: TLabel
      Left = 40
      Top = 220
      Width = 153
      Height = 19
      AutoSize = False
      Caption = ' Observaciones Albar'#225'n'
      Color = cl3DLight
      ParentColor = False
      Layout = tlCenter
    end
    object lblPortes: TLabel
      Left = 405
      Top = 199
      Width = 109
      Height = 19
      AutoSize = False
      Caption = ' Coste Portes'
      Color = cl3DLight
      ParentColor = False
      Layout = tlCenter
    end
    object lblHigiene_occ: TLabel
      Left = 405
      Top = 220
      Width = 109
      Height = 19
      AutoSize = False
      Caption = ' Cond. Higi'#233'nicas OK'
      Color = cl3DLight
      ParentColor = False
      Layout = tlCenter
    end
    object Label9: TLabel
      Left = 540
      Top = 202
      Width = 137
      Height = 13
      Caption = '(Marcado pagamos nosotros)'
    end
    object Label12: TLabel
      Left = 40
      Top = 306
      Width = 153
      Height = 19
      AutoSize = False
      Caption = ' Observaciones Carga'
      Color = cl3DLight
      ParentColor = False
      Layout = tlCenter
    end
    object lblNombre2: TLabel
      Left = 405
      Top = 178
      Width = 109
      Height = 19
      AutoSize = False
      Caption = ' Operador'
      Color = cl3DLight
      ParentColor = False
      Layout = tlCenter
    end
    object btnOperador_transporte_occ: TBGridButton
      Left = 559
      Top = 177
      Width = 13
      Height = 21
      Hint = 'Pulse F2 para ver una lista de valores validos. '
      Glyph.Data = {
        36040000424D3604000000000000360000002800000010000000100000000100
        2000000000000004000000000000000000000000000000000000FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FFBFFF00FF00FF00FFBFFF00FF00FF00FFBFFF00FF00FF00
        FFBFFF00FF00FF00FFBFFF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FFBFFF00FF00FF00FFBFFF00FF00FF00FFBFFF00FF00FF00
        FFBFFF00FF00FF00FFBFFF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FFBFFF00FF00FF00FFBFFF00FF00FF00FFBFFF00FF00FF00
        FFBFFF00FF00FF00FFBFFF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FFBFFF00FF00FF00FFBFFF00FF00FF00FFBFFF00FF00FF00
        FFBFFF00FF00FF00FFBFFF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FFBFFF00FF00FF00FFBFFF00FF00000000BFFF00FF00FF00
        FFBFFF00FF00FF00FFBFFF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FFBFFF00FF00FF00FF00000000000000000000000000FF00
        FFBFFF00FF00FF00FFBFFF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FFBFFF00FF00000000000000000000000000000000000000
        00BFFF00FF00FF00FFBFFF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF0000000000000000000000000000000000000000000000
        000000000000FF00FFBFFF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FFBFFF00FF00FF00FFBFFF00FF00FF00FFBFFF00FF00FF00
        FFBFFF00FF00FF00FFBFFF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FFBFFF00FF00FF00FFBFFF00FF00FF00FFBFFF00FF00FF00
        FFBFFF00FF00FF00FFBFFF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00}
      ParentShowHint = False
      ShowHint = True
      OnClick = btnOperador_transporte_occClick
      Control = operador_transporte_occ
      GridAlignment = taDownCenter
      GridWidth = 300
      GridHeigth = 200
    end
    object STEmpresa_occ: TStaticText
      Left = 171
      Top = 43
      Width = 248
      Height = 17
      AutoSize = False
      BorderStyle = sbsSunken
      TabOrder = 4
    end
    object empresa_occ: TBDEdit
      Tag = 1
      Left = 117
      Top = 41
      Width = 38
      Height = 21
      ColorEdit = clMoneyGreen
      Zeros = True
      RequiredMsg = 'El c'#243'digo de centro es de obligada inserci'#243'n.'
      MaxLength = 3
      TabOrder = 3
      OnChange = empresa_occChange
      DataField = 'empresa_occ'
      DataSource = DSMaestro
      Modificable = False
      PrimaryKey = True
    end
    object centro_salida_occ: TBDEdit
      Tag = 1
      Left = 117
      Top = 62
      Width = 38
      Height = 21
      ColorEdit = clMoneyGreen
      Zeros = True
      RequiredMsg = 'El c'#243'digo de empresa es de obligada inserci'#243'n.'
      MaxLength = 1
      TabOrder = 5
      OnChange = centro_salida_occChange
      DataField = 'centro_salida_occ'
      DataSource = DSMaestro
      Modificable = False
      PrimaryKey = True
    end
    object STCentro_salida_occ: TStaticText
      Left = 171
      Top = 64
      Width = 248
      Height = 17
      AutoSize = False
      BorderStyle = sbsSunken
      TabOrder = 6
    end
    object vehiculo_occ: TBDEdit
      Left = 117
      Top = 198
      Width = 161
      Height = 21
      ColorEdit = clMoneyGreen
      MaxLength = 20
      TabOrder = 12
      DataField = 'vehiculo_occ'
      DataSource = DSMaestro
    end
    object transporte_occ: TBDEdit
      Left = 117
      Top = 177
      Width = 38
      Height = 21
      ColorEdit = clMoneyGreen
      InputType = itInteger
      MaxLength = 4
      TabOrder = 8
      OnChange = transporte_occChange
      DataField = 'transporte_occ'
      DataSource = DSMaestro
    end
    object STTransporte_occ: TStaticText
      Left = 170
      Top = 179
      Width = 216
      Height = 17
      AutoSize = False
      BorderStyle = sbsSunken
      TabOrder = 10
    end
    object fecha_occ: TBDEdit
      Left = 283
      Top = 20
      Width = 77
      Height = 21
      ColorEdit = clMoneyGreen
      RequiredMsg = 'La fecha de la salida es de obligada inserci'#243'n.'
      InputType = itDate
      MaxLength = 10
      TabOrder = 1
      DataField = 'fecha_occ'
      DataSource = DSMaestro
      Modificable = False
      PrimaryKey = True
    end
    object hora_occ: TBDEdit
      Left = 372
      Top = 20
      Width = 47
      Height = 21
      Hint = 'Formato "HH:MM" '
      ColorEdit = clMoneyGreen
      MaxLength = 5
      TabOrder = 2
      DataField = 'hora_occ'
      DataSource = DSMaestro
    end
    object nota_occ: TDBMemo
      Left = 40
      Top = 239
      Width = 721
      Height = 71
      DataField = 'nota_occ'
      DataSource = DSMaestro
      MaxLength = 511
      TabOrder = 15
    end
    object orden_occ: TBDEdit
      Left = 117
      Top = 20
      Width = 88
      Height = 21
      TabStop = False
      ColorEdit = clMoneyGreen
      ColorNormal = clSilver
      RequiredMsg = 'El n'#250'mero de albar'#225'n es de obligada inserci'#243'n.'
      InputType = itInteger
      ReadOnly = True
      TabOrder = 0
      DataField = 'orden_occ'
      DataSource = DSMaestro
      Modificable = False
      PrimaryKey = True
    end
    object n_palets_occ: TBDEdit
      Tag = 1
      Left = 486
      Top = 305
      Width = 32
      Height = 21
      TabStop = False
      ColorEdit = clMoneyGreen
      ColorNormal = clSilver
      InputType = itInteger
      ReadOnly = True
      MaxLength = 2
      TabOrder = 16
      DataField = 'n_palets_occ'
      DataSource = DSMaestro
      Modificable = False
      PrimaryKey = True
    end
    object porte_bonny_occ: TDBCheckBox
      Left = 521
      Top = 200
      Width = 17
      Height = 17
      DataField = 'porte_bonny_occ'
      DataSource = DSMaestro
      TabOrder = 13
      ValueChecked = '1'
      ValueUnchecked = '0'
      OnEnter = porte_bonny_occEnter
      OnExit = porte_bonny_occExit
    end
    object higiene_occ: TDBCheckBox
      Left = 521
      Top = 221
      Width = 17
      Height = 17
      DataField = 'higiene_occ'
      DataSource = DSMaestro
      TabOrder = 14
      ValueChecked = '1'
      ValueUnchecked = '0'
      OnEnter = porte_bonny_occEnter
      OnExit = porte_bonny_occExit
    end
    object nota_interna_occ: TDBMemo
      Left = 40
      Top = 326
      Width = 721
      Height = 51
      DataField = 'nota_interna_occ'
      DataSource = DSMaestro
      MaxLength = 511
      TabOrder = 17
    end
    object operador_transporte_occ: TBDEdit
      Left = 521
      Top = 177
      Width = 38
      Height = 21
      ColorEdit = clMoneyGreen
      InputType = itInteger
      MaxLength = 4
      TabOrder = 9
      OnChange = operador_transporte_occChange
      DataField = 'operador_transporte_occ'
      DataSource = DSMaestro
    end
    object stOperador_transporte_occ: TStaticText
      Left = 573
      Top = 179
      Width = 190
      Height = 17
      AutoSize = False
      BorderStyle = sbsSunken
      TabOrder = 11
    end
    object pgcDestino: TPageControl
      Left = 37
      Top = 85
      Width = 725
      Height = 88
      ActivePage = tsSalida
      TabIndex = 0
      TabOrder = 7
      object tsSalida: TTabSheet
        Caption = 'Salida'
        object lblCliente: TLabel
          Left = 12
          Top = 9
          Width = 74
          Height = 19
          AutoSize = False
          Caption = ' Cliente'
          Color = cl3DLight
          ParentColor = False
          Layout = tlCenter
        end
        object BGBCliente_sal_occ: TBGridButton
          Left = 127
          Top = 8
          Width = 13
          Height = 22
          Hint = 'Pulse F2 para ver una lista de valores validos. '
          Glyph.Data = {
            36040000424D3604000000000000360000002800000010000000100000000100
            2000000000000004000000000000000000000000000000000000FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FFBFFF00FF00FF00FFBFFF00FF00FF00FFBFFF00FF00FF00
            FFBFFF00FF00FF00FFBFFF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FFBFFF00FF00FF00FFBFFF00FF00FF00FFBFFF00FF00FF00
            FFBFFF00FF00FF00FFBFFF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FFBFFF00FF00FF00FFBFFF00FF00FF00FFBFFF00FF00FF00
            FFBFFF00FF00FF00FFBFFF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FFBFFF00FF00FF00FFBFFF00FF00FF00FFBFFF00FF00FF00
            FFBFFF00FF00FF00FFBFFF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FFBFFF00FF00FF00FFBFFF00FF00000000BFFF00FF00FF00
            FFBFFF00FF00FF00FFBFFF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FFBFFF00FF00FF00FF00000000000000000000000000FF00
            FFBFFF00FF00FF00FFBFFF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FFBFFF00FF00000000000000000000000000000000000000
            00BFFF00FF00FF00FFBFFF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF0000000000000000000000000000000000000000000000
            000000000000FF00FFBFFF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FFBFFF00FF00FF00FFBFFF00FF00FF00FFBFFF00FF00FF00
            FFBFFF00FF00FF00FFBFFF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FFBFFF00FF00FF00FFBFFF00FF00FF00FFBFFF00FF00FF00
            FFBFFF00FF00FF00FFBFFF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00}
          ParentShowHint = False
          ShowHint = True
          OnClick = BGBCliente_sal_occClick
          Control = cliente_sal_occ
          GridAlignment = taDownRight
          GridWidth = 240
          GridHeigth = 200
        end
        object lblNombre3: TLabel
          Left = 377
          Top = 9
          Width = 74
          Height = 19
          AutoSize = False
          Caption = ' Suministro'
          Color = cl3DLight
          ParentColor = False
          Layout = tlCenter
        end
        object BGBDir_sum_occ: TBGridButton
          Left = 492
          Top = 7
          Width = 13
          Height = 22
          Hint = 'Pulse F2 para ver una lista de valores validos. '
          Glyph.Data = {
            36040000424D3604000000000000360000002800000010000000100000000100
            2000000000000004000000000000000000000000000000000000FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FFBFFF00FF00FF00FFBFFF00FF00FF00FFBFFF00FF00FF00
            FFBFFF00FF00FF00FFBFFF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FFBFFF00FF00FF00FFBFFF00FF00FF00FFBFFF00FF00FF00
            FFBFFF00FF00FF00FFBFFF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FFBFFF00FF00FF00FFBFFF00FF00FF00FFBFFF00FF00FF00
            FFBFFF00FF00FF00FFBFFF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FFBFFF00FF00FF00FFBFFF00FF00FF00FFBFFF00FF00FF00
            FFBFFF00FF00FF00FFBFFF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FFBFFF00FF00FF00FFBFFF00FF00000000BFFF00FF00FF00
            FFBFFF00FF00FF00FFBFFF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FFBFFF00FF00FF00FF00000000000000000000000000FF00
            FFBFFF00FF00FF00FFBFFF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FFBFFF00FF00000000000000000000000000000000000000
            00BFFF00FF00FF00FFBFFF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF0000000000000000000000000000000000000000000000
            000000000000FF00FFBFFF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FFBFFF00FF00FF00FFBFFF00FF00FF00FFBFFF00FF00FF00
            FFBFFF00FF00FF00FFBFFF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FFBFFF00FF00FF00FFBFFF00FF00FF00FFBFFF00FF00FF00
            FFBFFF00FF00FF00FFBFFF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00}
          ParentShowHint = False
          ShowHint = True
          OnClick = BGBDir_sum_occClick
          Control = dir_sum_occ
          GridAlignment = taDownRight
          GridWidth = 450
          GridHeigth = 200
        end
        object lblPedido: TLabel
          Left = 12
          Top = 35
          Width = 74
          Height = 19
          AutoSize = False
          Caption = ' N'#186' Pedido'
          Color = cl3DLight
          ParentColor = False
          Layout = tlCenter
        end
        object BGBn_pedido_occ: TBGridButton
          Left = 205
          Top = 33
          Width = 13
          Height = 22
          Hint = 'Pulse F2 para ver una lista de valores validos. '
          Glyph.Data = {
            36040000424D3604000000000000360000002800000010000000100000000100
            2000000000000004000000000000000000000000000000000000FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FFBFFF00FF00FF00FFBFFF00FF00FF00FFBFFF00FF00FF00
            FFBFFF00FF00FF00FFBFFF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FFBFFF00FF00FF00FFBFFF00FF00FF00FFBFFF00FF00FF00
            FFBFFF00FF00FF00FFBFFF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FFBFFF00FF00FF00FFBFFF00FF00FF00FFBFFF00FF00FF00
            FFBFFF00FF00FF00FFBFFF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FFBFFF00FF00FF00FFBFFF00FF00FF00FFBFFF00FF00FF00
            FFBFFF00FF00FF00FFBFFF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FFBFFF00FF00FF00FFBFFF00FF00000000BFFF00FF00FF00
            FFBFFF00FF00FF00FFBFFF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FFBFFF00FF00FF00FF00000000000000000000000000FF00
            FFBFFF00FF00FF00FFBFFF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FFBFFF00FF00000000000000000000000000000000000000
            00BFFF00FF00FF00FFBFFF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF0000000000000000000000000000000000000000000000
            000000000000FF00FFBFFF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FFBFFF00FF00FF00FFBFFF00FF00FF00FFBFFF00FF00FF00
            FFBFFF00FF00FF00FFBFFF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FFBFFF00FF00FF00FFBFFF00FF00FF00FFBFFF00FF00FF00
            FFBFFF00FF00FF00FFBFFF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00}
          ParentShowHint = False
          ShowHint = True
          OnClick = BGBn_pedido_occClick
          Control = n_pedido_occ
          GridAlignment = taDownRight
          GridWidth = 240
          GridHeigth = 200
        end
        object lblNombre1: TLabel
          Left = 225
          Top = 35
          Width = 44
          Height = 19
          AutoSize = False
          Caption = ' Fecha'
          Color = cl3DLight
          ParentColor = False
          Layout = tlCenter
        end
        object BGBFecha_pedido_occ: TBCalendarButton
          Left = 345
          Top = 33
          Width = 13
          Height = 21
          Hint = 'Pulse F2 para deplegar un calendario. '
          Glyph.Data = {
            36040000424D3604000000000000360000002800000010000000100000000100
            2000000000000004000000000000000000000000000000000000FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FFBFFF00FF00FF00FFBFFF00FF00FF00FFBFFF00FF00FF00
            FFBFFF00FF00FF00FFBFFF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FFBFFF00FF00FF00FFBFFF00FF00FF00FFBFFF00FF00FF00
            FFBFFF00FF00FF00FFBFFF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FFBFFF00FF00FF00FFBFFF00FF00FF00FFBFFF00FF00FF00
            FFBFFF00FF00FF00FFBFFF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FFBFFF00FF00FF00FFBFFF00FF00FF00FFBFFF00FF00FF00
            FFBFFF00FF00FF00FFBFFF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FFBFFF00FF00FF00FFBFFF00FF00000000BFFF00FF00FF00
            FFBFFF00FF00FF00FFBFFF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FFBFFF00FF00FF00FF00000000000000000000000000FF00
            FFBFFF00FF00FF00FFBFFF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FFBFFF00FF00000000000000000000000000000000000000
            00BFFF00FF00FF00FFBFFF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF0000000000000000000000000000000000000000000000
            000000000000FF00FFBFFF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FFBFFF00FF00FF00FFBFFF00FF00FF00FFBFFF00FF00FF00
            FFBFFF00FF00FF00FFBFFF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FFBFFF00FF00FF00FFBFFF00FF00FF00FFBFFF00FF00FF00
            FFBFFF00FF00FF00FFBFFF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00}
          ParentShowHint = False
          ShowHint = True
          OnClick = btnFecha_pedido_occ
          Control = fecha_pedido_occ
          CalendarAlignment = taDownRight
          CalendarWidth = 197
          CalendarHeigth = 153
        end
        object lblNombre4: TLabel
          Left = 377
          Top = 35
          Width = 74
          Height = 19
          AutoSize = False
          Caption = ' Moneda'
          Color = cl3DLight
          ParentColor = False
          Layout = tlCenter
        end
        object BGBMoneda_occ: TBGridButton
          Left = 492
          Top = 33
          Width = 13
          Height = 22
          Hint = 'Pulse F2 para ver una lista de valores validos. '
          Glyph.Data = {
            36040000424D3604000000000000360000002800000010000000100000000100
            2000000000000004000000000000000000000000000000000000FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FFBFFF00FF00FF00FFBFFF00FF00FF00FFBFFF00FF00FF00
            FFBFFF00FF00FF00FFBFFF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FFBFFF00FF00FF00FFBFFF00FF00FF00FFBFFF00FF00FF00
            FFBFFF00FF00FF00FFBFFF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FFBFFF00FF00FF00FFBFFF00FF00FF00FFBFFF00FF00FF00
            FFBFFF00FF00FF00FFBFFF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FFBFFF00FF00FF00FFBFFF00FF00FF00FFBFFF00FF00FF00
            FFBFFF00FF00FF00FFBFFF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FFBFFF00FF00FF00FFBFFF00FF00000000BFFF00FF00FF00
            FFBFFF00FF00FF00FFBFFF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FFBFFF00FF00FF00FF00000000000000000000000000FF00
            FFBFFF00FF00FF00FFBFFF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FFBFFF00FF00000000000000000000000000000000000000
            00BFFF00FF00FF00FFBFFF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF0000000000000000000000000000000000000000000000
            000000000000FF00FFBFFF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FFBFFF00FF00FF00FFBFFF00FF00FF00FFBFFF00FF00FF00
            FFBFFF00FF00FF00FFBFFF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FFBFFF00FF00FF00FFBFFF00FF00FF00FFBFFF00FF00FF00
            FFBFFF00FF00FF00FFBFFF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00}
          ParentShowHint = False
          ShowHint = True
          OnClick = BGBMoneda_occClick
          Control = moneda_occ
          GridAlignment = taDownRight
          GridWidth = 180
          GridHeigth = 200
        end
        object cliente_sal_occ: TBDEdit
          Tag = 1
          Left = 89
          Top = 8
          Width = 38
          Height = 21
          ColorEdit = clMoneyGreen
          ColorNormal = clSkyBlue
          MaxLength = 3
          TabOrder = 0
          OnChange = cliente_sal_occChange
          DataField = 'cliente_sal_occ'
          DataSource = DSMaestro
        end
        object STCliente_sal_occ: TStaticText
          Left = 142
          Top = 10
          Width = 216
          Height = 17
          AutoSize = False
          BorderStyle = sbsSunken
          TabOrder = 2
        end
        object dir_sum_occ: TBDEdit
          Tag = 1
          Left = 454
          Top = 8
          Width = 38
          Height = 21
          ColorEdit = clMoneyGreen
          ColorNormal = clSkyBlue
          MaxLength = 3
          TabOrder = 1
          OnChange = dir_sum_occChange
          OnExit = dir_sum_occExit
          DataField = 'dir_sum_occ'
          DataSource = DSMaestro
        end
        object STDir_sum_occ: TStaticText
          Left = 507
          Top = 10
          Width = 190
          Height = 17
          AutoSize = False
          BorderStyle = sbsSunken
          TabOrder = 3
        end
        object n_pedido_occ: TBDEdit
          Left = 89
          Top = 34
          Width = 114
          Height = 21
          ColorEdit = clMoneyGreen
          ColorNormal = clSkyBlue
          MaxLength = 15
          TabOrder = 4
          DataField = 'n_pedido_occ'
          DataSource = DSMaestro
        end
        object fecha_pedido_occ: TBDEdit
          Left = 268
          Top = 34
          Width = 77
          Height = 21
          ColorEdit = clMoneyGreen
          ColorNormal = clSkyBlue
          InputType = itDate
          MaxLength = 10
          TabOrder = 5
          DataField = 'fecha_pedido_occ'
          DataSource = DSMaestro
          PrimaryKey = True
        end
        object moneda_occ: TBDEdit
          Tag = 1
          Left = 454
          Top = 34
          Width = 38
          Height = 21
          ColorEdit = clMoneyGreen
          ColorNormal = clSkyBlue
          Zeros = True
          MaxLength = 3
          TabOrder = 6
          OnChange = moneda_occChange
          DataField = 'moneda_occ'
          DataSource = DSMaestro
        end
        object STMoneda_occ: TStaticText
          Left = 507
          Top = 36
          Width = 190
          Height = 17
          AutoSize = False
          BorderStyle = sbsSunken
          TabOrder = 7
        end
      end
      object tsTransito: TTabSheet
        Caption = 'Tr'#225'nsito'
        ImageIndex = 1
        object lbl1: TLabel
          Left = 4
          Top = 33
          Width = 69
          Height = 19
          AutoSize = False
          Caption = 'Planta Destino'
          Color = cl3DLight
          ParentColor = False
          Layout = tlCenter
        end
        object btn_planta_destino_occ: TBGridButton
          Left = 117
          Top = 30
          Width = 13
          Height = 22
          Hint = 'Pulse F2 para ver una lista de valores validos. '
          Glyph.Data = {
            36040000424D3604000000000000360000002800000010000000100000000100
            2000000000000004000000000000000000000000000000000000FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FFBFFF00FF00FF00FFBFFF00FF00FF00FFBFFF00FF00FF00
            FFBFFF00FF00FF00FFBFFF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FFBFFF00FF00FF00FFBFFF00FF00FF00FFBFFF00FF00FF00
            FFBFFF00FF00FF00FFBFFF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FFBFFF00FF00FF00FFBFFF00FF00FF00FFBFFF00FF00FF00
            FFBFFF00FF00FF00FFBFFF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FFBFFF00FF00FF00FFBFFF00FF00FF00FFBFFF00FF00FF00
            FFBFFF00FF00FF00FFBFFF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FFBFFF00FF00FF00FFBFFF00FF00000000BFFF00FF00FF00
            FFBFFF00FF00FF00FFBFFF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FFBFFF00FF00FF00FF00000000000000000000000000FF00
            FFBFFF00FF00FF00FFBFFF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FFBFFF00FF00000000000000000000000000000000000000
            00BFFF00FF00FF00FFBFFF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF0000000000000000000000000000000000000000000000
            000000000000FF00FFBFFF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FFBFFF00FF00FF00FFBFFF00FF00FF00FFBFFF00FF00FF00
            FFBFFF00FF00FF00FFBFFF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FFBFFF00FF00FF00FFBFFF00FF00FF00FFBFFF00FF00FF00
            FFBFFF00FF00FF00FFBFFF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00}
          ParentShowHint = False
          ShowHint = True
          OnClick = btn_planta_destino_occClick
          Control = edt_planta_destino_occ
          GridAlignment = taDownRight
          GridWidth = 250
          GridHeigth = 100
        end
        object lblNombre5: TLabel
          Left = 4
          Top = 9
          Width = 69
          Height = 19
          AutoSize = False
          Caption = 'Planta Origen'
          Color = cl3DLight
          ParentColor = False
          Layout = tlCenter
        end
        object btn2: TBGridButton
          Left = 117
          Top = 6
          Width = 13
          Height = 22
          Hint = 'Pulse F2 para ver una lista de valores validos. '
          Enabled = False
          Glyph.Data = {
            36040000424D3604000000000000360000002800000010000000100000000100
            2000000000000004000000000000000000000000000000000000FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FFBFFF00FF00FF00FFBFFF00FF00FF00FFBFFF00FF00FF00
            FFBFFF00FF00FF00FFBFFF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FFBFFF00FF00FF00FFBFFF00FF00FF00FFBFFF00FF00FF00
            FFBFFF00FF00FF00FFBFFF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FFBFFF00FF00FF00FFBFFF00FF00FF00FFBFFF00FF00FF00
            FFBFFF00FF00FF00FFBFFF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FFBFFF00FF00FF00FFBFFF00FF00FF00FFBFFF00FF00FF00
            FFBFFF00FF00FF00FFBFFF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FFBFFF00FF00FF00FFBFFF00FF00000000BFFF00FF00FF00
            FFBFFF00FF00FF00FFBFFF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FFBFFF00FF00FF00FF00000000000000000000000000FF00
            FFBFFF00FF00FF00FFBFFF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FFBFFF00FF00000000000000000000000000000000000000
            00BFFF00FF00FF00FFBFFF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF0000000000000000000000000000000000000000000000
            000000000000FF00FFBFFF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FFBFFF00FF00FF00FFBFFF00FF00FF00FFBFFF00FF00FF00
            FFBFFF00FF00FF00FFBFFF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FFBFFF00FF00FF00FFBFFF00FF00FF00FFBFFF00FF00FF00
            FFBFFF00FF00FF00FFBFFF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00}
          ParentShowHint = False
          ShowHint = True
          Control = btn2
          GridAlignment = taDownRight
          GridWidth = 250
          GridHeigth = 100
        end
        object lblNombre6: TLabel
          Left = 390
          Top = 10
          Width = 74
          Height = 19
          AutoSize = False
          Caption = 'Centro Origen'
          Color = cl3DLight
          ParentColor = False
          Layout = tlCenter
        end
        object btn3: TBGridButton
          Left = 483
          Top = 7
          Width = 13
          Height = 22
          Hint = 'Pulse F2 para ver una lista de valores validos. '
          Enabled = False
          Glyph.Data = {
            36040000424D3604000000000000360000002800000010000000100000000100
            2000000000000004000000000000000000000000000000000000FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FFBFFF00FF00FF00FFBFFF00FF00FF00FFBFFF00FF00FF00
            FFBFFF00FF00FF00FFBFFF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FFBFFF00FF00FF00FFBFFF00FF00FF00FFBFFF00FF00FF00
            FFBFFF00FF00FF00FFBFFF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FFBFFF00FF00FF00FFBFFF00FF00FF00FFBFFF00FF00FF00
            FFBFFF00FF00FF00FFBFFF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FFBFFF00FF00FF00FFBFFF00FF00FF00FFBFFF00FF00FF00
            FFBFFF00FF00FF00FFBFFF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FFBFFF00FF00FF00FFBFFF00FF00000000BFFF00FF00FF00
            FFBFFF00FF00FF00FFBFFF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FFBFFF00FF00FF00FF00000000000000000000000000FF00
            FFBFFF00FF00FF00FFBFFF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FFBFFF00FF00000000000000000000000000000000000000
            00BFFF00FF00FF00FFBFFF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF0000000000000000000000000000000000000000000000
            000000000000FF00FFBFFF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FFBFFF00FF00FF00FFBFFF00FF00FF00FFBFFF00FF00FF00
            FFBFFF00FF00FF00FFBFFF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FFBFFF00FF00FF00FFBFFF00FF00FF00FFBFFF00FF00FF00
            FFBFFF00FF00FF00FFBFFF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00}
          ParentShowHint = False
          ShowHint = True
          Control = btn3
          GridAlignment = taDownRight
          GridWidth = 240
          GridHeigth = 200
        end
        object lblCentroDestino: TLabel
          Left = 390
          Top = 33
          Width = 74
          Height = 19
          AutoSize = False
          Caption = ' Centro Destino'
          Color = cl3DLight
          ParentColor = False
          Layout = tlCenter
        end
        object BGBCentro_destino_occ: TBGridButton
          Left = 483
          Top = 32
          Width = 13
          Height = 22
          Hint = 'Pulse F2 para ver una lista de valores validos. '
          Glyph.Data = {
            36040000424D3604000000000000360000002800000010000000100000000100
            2000000000000004000000000000000000000000000000000000FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FFBFFF00FF00FF00FFBFFF00FF00FF00FFBFFF00FF00FF00
            FFBFFF00FF00FF00FFBFFF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FFBFFF00FF00FF00FFBFFF00FF00FF00FFBFFF00FF00FF00
            FFBFFF00FF00FF00FFBFFF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FFBFFF00FF00FF00FFBFFF00FF00FF00FFBFFF00FF00FF00
            FFBFFF00FF00FF00FFBFFF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FFBFFF00FF00FF00FFBFFF00FF00FF00FFBFFF00FF00FF00
            FFBFFF00FF00FF00FFBFFF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FFBFFF00FF00FF00FFBFFF00FF00000000BFFF00FF00FF00
            FFBFFF00FF00FF00FFBFFF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FFBFFF00FF00FF00FF00000000000000000000000000FF00
            FFBFFF00FF00FF00FFBFFF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FFBFFF00FF00000000000000000000000000000000000000
            00BFFF00FF00FF00FFBFFF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF0000000000000000000000000000000000000000000000
            000000000000FF00FFBFFF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FFBFFF00FF00FF00FFBFFF00FF00FF00FFBFFF00FF00FF00
            FFBFFF00FF00FF00FFBFFF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FFBFFF00FF00FF00FFBFFF00FF00FF00FFBFFF00FF00FF00
            FFBFFF00FF00FF00FFBFFF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00}
          ParentShowHint = False
          ShowHint = True
          OnClick = BGBCentro_destino_occClick
          Control = edt_centro_destino_occ
          GridAlignment = taDownRight
          GridWidth = 230
          GridHeigth = 100
        end
        object edt_planta_destino_occ: TBDEdit
          Tag = 1
          Left = 79
          Top = 31
          Width = 38
          Height = 21
          ColorEdit = clMoneyGreen
          ColorNormal = clTeal
          Zeros = True
          MaxLength = 3
          TabOrder = 4
          OnChange = edt_planta_destino_occChange
          DataField = 'planta_destino_occ'
          DataSource = DSMaestro
          Modificable = False
        end
        object st_planta_destino_occ: TStaticText
          Left = 133
          Top = 35
          Width = 248
          Height = 17
          AutoSize = False
          BorderStyle = sbsSunken
          TabOrder = 7
        end
        object edt_planta_origen_occ: TBDEdit
          Tag = 1
          Left = 79
          Top = 7
          Width = 38
          Height = 21
          ColorEdit = clMoneyGreen
          Zeros = True
          Enabled = False
          MaxLength = 3
          TabOrder = 0
          DataField = 'planta_origen_occ'
          DataSource = DSMaestro
          Modificable = False
          PrimaryKey = True
        end
        object st_planta_origen_occ: TStaticText
          Left = 133
          Top = 11
          Width = 248
          Height = 17
          AutoSize = False
          BorderStyle = sbsSunken
          TabOrder = 2
        end
        object edt_centro_origen_occ: TBDEdit
          Tag = 1
          Left = 467
          Top = 8
          Width = 16
          Height = 21
          ColorEdit = clMoneyGreen
          ColorNormal = clTeal
          Enabled = False
          MaxLength = 1
          TabOrder = 1
          DataField = 'centro_salida_occ'
          DataSource = DSMaestro
        end
        object st_centro_origen_occ: TStaticText
          Left = 498
          Top = 12
          Width = 216
          Height = 17
          AutoSize = False
          BorderStyle = sbsSunken
          TabOrder = 3
        end
        object edt_centro_destino_occ: TBDEdit
          Tag = 1
          Left = 467
          Top = 32
          Width = 16
          Height = 21
          ColorEdit = clMoneyGreen
          ColorNormal = clTeal
          Zeros = True
          RequiredMsg = 'El c'#243'digo de empresa es de obligada inserci'#243'n.'
          MaxLength = 1
          TabOrder = 5
          OnChange = edt_centro_destino_occChange
          DataField = 'centro_destino_occ'
          DataSource = DSMaestro
          Modificable = False
          PrimaryKey = True
        end
        object ST_centro_destino_occ: TStaticText
          Left = 498
          Top = 34
          Width = 216
          Height = 17
          AutoSize = False
          BorderStyle = sbsSunken
          TabOrder = 6
        end
      end
    end
  end
  object ToolBar1: TToolBar
    Left = 0
    Top = 0
    Width = 802
    Height = 29
    ButtonWidth = 37
    Caption = 'ToolBar1'
    Images = ImageList
    ParentShowHint = False
    ShowHint = True
    TabOrder = 0
    object sep1: TToolButton
      Left = 0
      Top = 2
      Width = 8
      Caption = 'sep1'
      ImageIndex = 11
      Style = tbsDivider
    end
    object btnAlta: TToolButton
      Left = 8
      Top = 2
      Hint = 'Alta Orden (+)'
      Caption = 'btnAlta'
      ImageIndex = 0
      OnClick = btnAltaClick
    end
    object btnEditarC: TToolButton
      Left = 45
      Top = 2
      Hint = 'Modificar Orden (M)'
      Caption = 'btnEditarC'
      ImageIndex = 1
      OnClick = btnEditarCClick
    end
    object btnBorrar: TToolButton
      Left = 82
      Top = 2
      Hint = 'Borrar Orden (-)'
      Caption = 'btnBorrar'
      ImageIndex = 2
      OnClick = btnBorrarClick
    end
    object btnLocalizar: TToolButton
      Left = 119
      Top = 2
      Hint = 'Localizar Orden (L)'
      Caption = 'btnLocalizar'
      DropdownMenu = PopupMenuFiltro
      ImageIndex = 3
      Style = tbsDropDown
      OnClick = btnLocalizarClick
    end
    object sep2: TToolButton
      Left = 169
      Top = 2
      Width = 8
      Caption = 'sep2'
      ImageIndex = 4
      Style = tbsSeparator
    end
    object btnAltaD: TToolButton
      Left = 177
      Top = 2
      Hint = 'Alta Linea (Mayus +)'
      Caption = 'btnAltaD'
      ImageIndex = 4
      OnClick = btnAltaDClick
    end
    object btnEditarD: TToolButton
      Left = 214
      Top = 2
      Hint = 'Modificar Linea (Mayus M)'
      Caption = 'btnEditarD'
      ImageIndex = 5
      OnClick = btnEditarDClick
    end
    object btnBorrarD: TToolButton
      Left = 251
      Top = 2
      Hint = 'Borrar Linea (Mayus -)'
      Caption = 'btnBorrarD'
      ImageIndex = 6
      OnClick = btnBorrarDClick
    end
    object sep3: TToolButton
      Left = 288
      Top = 2
      Width = 8
      Caption = 'sep3'
      ImageIndex = 7
      Style = tbsSeparator
    end
    object btnResumen: TToolButton
      Left = 296
      Top = 2
      Caption = 'btnResumen'
      ImageIndex = 20
      OnClick = btnResumenClick
    end
    object btnImprimir: TToolButton
      Left = 333
      Top = 2
      Hint = 'Imprimir (I)'
      Caption = 'btnImprimir'
      DropdownMenu = PopupMenuImprimir
      ImageIndex = 11
      Style = tbsDropDown
      OnClick = btnImprimirClick
    end
    object ToolButton1: TToolButton
      Left = 383
      Top = 2
      Width = 8
      Caption = 'ToolButton1'
      ImageIndex = 15
      Style = tbsSeparator
    end
    object btnActivar: TToolButton
      Left = 391
      Top = 2
      Hint = 'Activar Orden (Mayus A)'
      Caption = 'btnActivar'
      ImageIndex = 15
      OnClick = btnActivarClick
    end
    object btnFinalizar: TToolButton
      Left = 428
      Top = 2
      Hint = 'Finalizar Orden (Mayus F)'
      Caption = 'btnFinalizar'
      ImageIndex = 17
      OnClick = btnFinalizarClick
    end
    object btnCrearAlbaran: TToolButton
      Left = 465
      Top = 2
      Hint = 'Crear Albar'#225'n (Mayus C)'
      Caption = 'btnCrearAlbaran'
      ImageIndex = 16
      OnClick = btnCrearAlbaranClick
    end
    object sep4: TToolButton
      Left = 502
      Top = 2
      Width = 8
      Caption = 'sep4'
      ImageIndex = 1
      Style = tbsSeparator
    end
    object btnPrimero: TToolButton
      Left = 510
      Top = 2
      Hint = 'Primera Orden (Arriba)'
      Caption = 'btnPrimero'
      ImageIndex = 7
      OnClick = btnPrimeroClick
    end
    object btnAnterior: TToolButton
      Left = 547
      Top = 2
      Hint = 'Anterior Orden (Izquierda)'
      Caption = 'btnAnterior'
      ImageIndex = 8
      OnClick = btnAnteriorClick
    end
    object btnProximo: TToolButton
      Left = 584
      Top = 2
      Hint = 'Siguiente Orden (Derecha)'
      Caption = 'btnProximo'
      ImageIndex = 9
      OnClick = btnProximoClick
    end
    object btnUltimo: TToolButton
      Left = 621
      Top = 2
      Hint = #218'ltima Orden (Abajo)'
      Caption = 'btnUltimo'
      ImageIndex = 10
      OnClick = btnUltimoClick
    end
    object sep5: TToolButton
      Left = 658
      Top = 2
      Width = 55
      Caption = 'sep5'
      ImageIndex = 16
      Style = tbsSeparator
    end
    object btnAceptar: TToolButton
      Left = 713
      Top = 2
      Hint = 'Aceptar (F1)'
      Caption = 'btnAceptar'
      ImageIndex = 12
      OnClick = btnAceptarClick
    end
    object btnCancelar: TToolButton
      Left = 750
      Top = 2
      Hint = 'Cancelar (Esc)'
      Caption = 'btnCancelar'
      ImageIndex = 13
      OnClick = btnCancelarClick
    end
  end
  object DSMaestro: TDataSource
    AutoEdit = False
    DataSet = QOrdenCargaC
    Left = 24
    Top = 56
  end
  object DSDetalle: TDataSource
    AutoEdit = False
    DataSet = QOrdenCargaL
    Left = 24
    Top = 328
  end
  object QOrdenCargaC: TQuery
    AfterOpen = QOrdenCargaCAfterOpen
    AfterEdit = QOrdenCargaCAfterEdit
    BeforePost = QOrdenCargaCBeforePost
    AfterPost = QOrdenCargaCAfterPost
    AfterScroll = QOrdenCargaCAfterScroll
    OnCalcFields = QOrdenCargaCCalcFields
    OnNewRecord = QOrdenCargaCNewRecord
    DatabaseName = 'Database'
    RequestLive = True
    SQL.Strings = (
      'select *'
      'from frf_orden_carga_c')
    Left = 6
    Top = 39
    object QOrdenCargaCorden_occ: TIntegerField
      FieldName = 'orden_occ'
      Origin = 'DATABASE.frf_orden_carga_c.orden_occ'
    end
    object QOrdenCargaCempresa_occ: TStringField
      FieldName = 'empresa_occ'
      Origin = 'DATABASE.frf_orden_carga_c.empresa_occ'
      FixedChar = True
      Size = 3
    end
    object QOrdenCargaCcentro_salida_occ: TStringField
      FieldName = 'centro_salida_occ'
      Origin = 'DATABASE.frf_orden_carga_c.centro_salida_occ'
      FixedChar = True
      Size = 1
    end
    object QOrdenCargaCn_albaran_occ: TIntegerField
      FieldName = 'n_albaran_occ'
      Origin = 'DATABASE.frf_orden_carga_c.n_albaran_occ'
    end
    object QOrdenCargaCfecha_occ: TDateField
      FieldName = 'fecha_occ'
      Origin = 'DATABASE.frf_orden_carga_c.fecha_occ'
    end
    object QOrdenCargaChora_occ: TStringField
      FieldName = 'hora_occ'
      Origin = 'DATABASE.frf_orden_carga_c.hora_occ'
      FixedChar = True
      Size = 5
    end
    object QOrdenCargaCcentro_destino_occ: TStringField
      FieldName = 'centro_destino_occ'
      Origin = 'DATABASE.frf_orden_carga_c.centro_destino_occ'
      FixedChar = True
      Size = 1
    end
    object QOrdenCargaCcliente_sal_occ: TStringField
      FieldName = 'cliente_sal_occ'
      Origin = 'DATABASE.frf_orden_carga_c.cliente_sal_occ'
      FixedChar = True
      Size = 3
    end
    object QOrdenCargaCdir_sum_occ: TStringField
      FieldName = 'dir_sum_occ'
      Origin = 'DATABASE.frf_orden_carga_c.dir_sum_occ'
      FixedChar = True
      Size = 3
    end
    object QOrdenCargaCdes_suministro_occ: TStringField
      FieldKind = fkCalculated
      FieldName = 'des_suministro_occ'
      Calculated = True
    end
    object QOrdenCargaCcliente_fac_occ: TStringField
      FieldName = 'cliente_fac_occ'
      Origin = 'DATABASE.frf_orden_carga_c.cliente_fac_occ'
      FixedChar = True
      Size = 3
    end
    object QOrdenCargaCn_pedido_occ: TStringField
      FieldName = 'n_pedido_occ'
      Origin = 'DATABASE.frf_orden_carga_c.n_pedido_occ'
      FixedChar = True
      Size = 15
    end
    object QOrdenCargaCmoneda_occ: TStringField
      FieldName = 'moneda_occ'
      Origin = 'DATABASE.frf_orden_carga_c.moneda_occ'
      FixedChar = True
      Size = 3
    end
    object QOrdenCargaCtransporte_occ: TSmallintField
      FieldName = 'transporte_occ'
      Origin = 'DATABASE.frf_orden_carga_c.transporte_occ'
    end
    object QOrdenCargaCvehiculo_occ: TStringField
      FieldName = 'vehiculo_occ'
      Origin = 'DATABASE.frf_orden_carga_c.vehiculo_occ'
      FixedChar = True
    end
    object QOrdenCargaCporte_bonny_occ: TIntegerField
      FieldName = 'porte_bonny_occ'
      Origin = '"COMER.DESARROLLO".frf_orden_carga_c.porte_bonny_occ'
    end
    object QOrdenCargaCn_palets_occ: TIntegerField
      FieldName = 'n_palets_occ'
      Origin = '"COMER.DESARROLLO".frf_orden_carga_c.n_palets_occ'
    end
    object QOrdenCargaChigiene_occ: TIntegerField
      FieldName = 'higiene_occ'
      Origin = '"COMER.DESARROLLO".frf_orden_carga_c.higiene_occ'
    end
    object QOrdenCargaCnota_occ: TMemoField
      FieldName = 'nota_occ'
      Origin = 'DATABASE.frf_orden_carga_c.nota_occ'
      BlobType = ftMemo
      Size = 511
    end
    object QOrdenCargaCnota_interna_occ: TStringField
      FieldName = 'nota_interna_occ'
      Origin = '"COMER.BDL.LOCAL".frf_orden_carga_c.nota_interna_occ'
      FixedChar = True
      Size = 255
    end
    object QOrdenCargaCstatus_occ: TIntegerField
      FieldName = 'status_occ'
      Origin = 'DATABASE.frf_orden_carga_c.status_occ'
    end
    object QOrdenCargaCdes_status_occ: TStringField
      FieldKind = fkCalculated
      FieldName = 'des_status_occ'
      Calculated = True
    end
    object QOrdenCargaCdes2_status_occ: TStringField
      FieldKind = fkCalculated
      FieldName = 'des2_status_occ'
      Size = 4
      Calculated = True
    end
    object QOrdenCargaCtraspasada_occ: TIntegerField
      FieldName = 'traspasada_occ'
      Origin = 'DATABASE.frf_orden_carga_c.traspasada_occ'
    end
    object QOrdenCargaCdes_traspasada_occ: TStringField
      DisplayWidth = 30
      FieldKind = fkCalculated
      FieldName = 'des_traspasada_occ'
      Size = 30
      Calculated = True
    end
    object QOrdenCargaCdes2_traspasada_occ: TStringField
      FieldKind = fkCalculated
      FieldName = 'des2_traspasada_occ'
      Size = 4
      Calculated = True
    end
    object QOrdenCargaCpalets_cargados_occ: TIntegerField
      FieldKind = fkCalculated
      FieldName = 'palets_cargados_occ'
      Calculated = True
    end
    object QOrdenCargaCfecha_pedido_occ: TDateField
      FieldName = 'fecha_pedido_occ'
      Origin = '"COMER.ALC_MASET".frf_orden_carga_c.fecha_pedido_occ'
    end
    object QOrdenCargaCoperador_transporte_occ: TSmallintField
      FieldName = 'operador_transporte_occ'
      Origin = '"COMER.ALC_MASET".frf_orden_carga_c.operador_transporte_occ'
    end
    object QOrdenCargaCmuelle_occ: TStringField
      FieldName = 'muelle_occ'
      Origin = '"COMER.ALC_MASET".frf_orden_carga_c.muelle_occ'
      FixedChar = True
      Size = 3
    end
    object QOrdenCargaCplanta_origen_occ: TStringField
      FieldName = 'planta_origen_occ'
      Origin = 'DATABASE.frf_orden_carga_c.planta_origen_occ'
      FixedChar = True
      Size = 3
    end
    object QOrdenCargaCplanta_destino_occ: TStringField
      FieldName = 'planta_destino_occ'
      Origin = 'DATABASE.frf_orden_carga_c.planta_destino_occ'
      FixedChar = True
      Size = 3
    end
    object QOrdenCargaCoperador_occ: TSmallintField
      FieldName = 'operador_occ'
      Origin = 'DATABASE.frf_orden_carga_c.operador_occ'
    end
  end
  object QOrdenCargaL: TQuery
    AfterInsert = QOrdenCargaLAfterInsert
    AfterEdit = QOrdenCargaLAfterEdit
    BeforePost = QOrdenCargaLBeforePost
    AfterPost = QOrdenCargaLAfterPost
    DatabaseName = 'Database'
    DataSource = DSMaestro
    RequestLive = True
    SQL.Strings = (
      'select * '
      'from frf_orden_carga_l'
      'where orden_ocl = :orden_occ')
    Left = 9
    Top = 313
    ParamData = <
      item
        DataType = ftInteger
        Name = 'orden_occ'
        ParamType = ptUnknown
        Size = 4
      end>
    object QOrdenCargaLorden_ocl: TIntegerField
      FieldName = 'orden_ocl'
      Origin = 'DATABASE.frf_orden_carga_l.orden_ocl'
    end
    object QOrdenCargaLlinea_ocl: TIntegerField
      FieldName = 'linea_ocl'
      Origin = 'DATABASE.frf_orden_carga_l.linea_ocl'
    end
    object QOrdenCargaLempresa_ocl: TStringField
      FieldName = 'empresa_ocl'
      Origin = 'DATABASE.frf_orden_carga_l.empresa_ocl'
      FixedChar = True
      Size = 3
    end
    object QOrdenCargaLcentro_salida_ocl: TStringField
      FieldName = 'centro_salida_ocl'
      Origin = 'DATABASE.frf_orden_carga_l.centro_salida_ocl'
      FixedChar = True
      Size = 1
    end
    object QOrdenCargaLn_albaran_ocl: TIntegerField
      FieldName = 'n_albaran_ocl'
      Origin = 'DATABASE.frf_orden_carga_l.n_albaran_ocl'
    end
    object QOrdenCargaLfecha_ocl: TDateField
      FieldName = 'fecha_ocl'
      Origin = 'DATABASE.frf_orden_carga_l.fecha_ocl'
    end
    object QOrdenCargaLcentro_origen_ocl: TStringField
      FieldName = 'centro_origen_ocl'
      Origin = 'DATABASE.frf_orden_carga_l.centro_origen_ocl'
      FixedChar = True
      Size = 1
    end
    object QOrdenCargaLproducto_ocl: TStringField
      FieldName = 'producto_ocl'
      Origin = 'DATABASE.frf_orden_carga_l.producto_ocl'
      FixedChar = True
      Size = 3
    end
    object QOrdenCargaLenvase_ocl: TStringField
      FieldName = 'envase_ocl'
      Origin = 'DATABASE.frf_orden_carga_l.envase_ocl'
      FixedChar = True
      Size = 3
    end
    object QOrdenCargaLmarca_ocl: TStringField
      FieldName = 'marca_ocl'
      Origin = 'DATABASE.frf_orden_carga_l.marca_ocl'
      FixedChar = True
      Size = 2
    end
    object QOrdenCargaLcategoria_ocl: TStringField
      FieldName = 'categoria_ocl'
      Origin = 'DATABASE.frf_orden_carga_l.categoria_ocl'
      FixedChar = True
      Size = 2
    end
    object QOrdenCargaLcalibre_ocl: TStringField
      FieldName = 'calibre_ocl'
      Origin = 'DATABASE.frf_orden_carga_l.calibre_ocl'
      FixedChar = True
      Size = 6
    end
    object QOrdenCargaLcolor_ocl: TStringField
      FieldName = 'color_ocl'
      Origin = 'DATABASE.frf_orden_carga_l.color_ocl'
      FixedChar = True
      Size = 1
    end
    object QOrdenCargaLref_transitos_ocl: TIntegerField
      FieldName = 'ref_transitos_ocl'
      Origin = 'DATABASE.frf_orden_carga_l.ref_transitos_ocl'
    end
    object QOrdenCargaLfecha_transito_ocl: TDateField
      FieldName = 'fecha_transito_ocl'
      Origin = 'DATABASE.frf_orden_carga_l.fecha_transito_ocl'
    end
    object QOrdenCargaLcajas_ocl: TIntegerField
      FieldName = 'cajas_ocl'
      Origin = 'DATABASE.frf_orden_carga_l.cajas_ocl'
    end
    object QOrdenCargaLkilos_ocl: TFloatField
      FieldName = 'kilos_ocl'
      Origin = 'DATABASE.frf_orden_carga_l.kilos_ocl'
    end
    object QOrdenCargaLprecio_ocl: TFloatField
      FieldName = 'precio_ocl'
      Origin = 'DATABASE.frf_orden_carga_l.precio_ocl'
    end
    object QOrdenCargaLunidad_precio_ocl: TStringField
      FieldName = 'unidad_precio_ocl'
      Origin = 'DATABASE.frf_orden_carga_l.unidad_precio_ocl'
      FixedChar = True
      Size = 3
    end
    object QOrdenCargaLimporte_neto_ocl: TFloatField
      FieldName = 'importe_neto_ocl'
      Origin = 'DATABASE.frf_orden_carga_l.importe_neto_ocl'
    end
    object QOrdenCargaLporc_iva_ocl: TFloatField
      FieldName = 'porc_iva_ocl'
      Origin = 'DATABASE.frf_orden_carga_l.porc_iva_ocl'
    end
    object QOrdenCargaLiva_ocl: TFloatField
      FieldName = 'iva_ocl'
      Origin = 'DATABASE.frf_orden_carga_l.iva_ocl'
    end
    object QOrdenCargaLimporte_total_ocl: TFloatField
      FieldName = 'importe_total_ocl'
      Origin = 'DATABASE.frf_orden_carga_l.importe_total_ocl'
    end
    object QOrdenCargaLn_palets_ocl: TSmallintField
      FieldName = 'n_palets_ocl'
      Origin = 'DATABASE.frf_orden_carga_l.n_palets_ocl'
    end
    object QOrdenCargaLtipo_palets_ocl: TStringField
      FieldName = 'tipo_palets_ocl'
      Origin = 'DATABASE.frf_orden_carga_l.tipo_palets_ocl'
      FixedChar = True
      Size = 2
    end
    object QOrdenCargaLtipo_iva_ocl: TStringField
      FieldName = 'tipo_iva_ocl'
      Origin = 'DATABASE.frf_orden_carga_l.tipo_iva_ocl'
      FixedChar = True
      Size = 2
    end
    object QOrdenCargaLfederacion_ocl: TStringField
      FieldName = 'federacion_ocl'
      Origin = 'DATABASE.frf_orden_carga_l.federacion_ocl'
      FixedChar = True
      Size = 1
    end
    object QOrdenCargaLcliente_ocl: TStringField
      FieldName = 'cliente_ocl'
      Origin = 'DATABASE.frf_orden_carga_l.cliente_ocl'
      FixedChar = True
      Size = 3
    end
    object QOrdenCargaLemp_procede_ocl: TStringField
      FieldName = 'emp_procede_ocl'
      Origin = 'DATABASE.frf_orden_carga_l.emp_procedencia_ocl'
      FixedChar = True
      Size = 3
    end
    object QOrdenCargaLproducto_base_ocl: TSmallintField
      FieldName = 'producto_base_ocl'
      Origin = 'DATABASE.frf_orden_carga_l.producto_base_ocl'
    end
    object QOrdenCargaLformato_cliente_ocl: TStringField
      FieldName = 'formato_cliente_ocl'
      Origin = 'DATABASE.frf_orden_carga_l.formato_cliente_ocl'
      FixedChar = True
      Size = 16
    end
    object QOrdenCargaLunidades_ocl: TIntegerField
      FieldName = 'unidades_ocl'
      Origin = 'DATABASE.frf_orden_carga_l.unidades_ocl'
    end
  end
  object ImageList: TImageList
    Left = 448
    Top = 32
    Bitmap = {
      494C010115001800040010001000FFFFFFFFFF10FFFFFFFFFFFFFFFF424D3600
      0000000000003600000028000000400000006000000001001000000000000030
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FF0300000000E07FFF7FE07FFF7F
      E07F000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FF030000E07FFF7FE07FFF7F0000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FF030000FF7FE07FFF7FE07FFF7F
      E07FFF7F00000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FF030000E07FFF7FE07FFF7F0000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FF030000FF7FE07FFF7FE07FFF7F
      E07FFF7FE07FFF7FE07F00000000007C007C0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FF030000E07FFF7F000000000000
      0000000000000000000000000000007C007C0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000E07FFF7FE07F0000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000EF3D0000EF3DEF3DEF3D0000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000010001000
      100010001000000000000000000000000000F75EEF3D0000EF3D000000000000
      0000000000000000EF3D0000EF3D00000000000000000000000000000000F75E
      F75EF75EF75EF75E00000000000000000000000000000000000000000000F75E
      F75EF75EF75EF75E000000000000000000000000000000001000100010001000
      10001000100010001000000000000000000000000000EF3DEF3D000000000000
      00000000000000000000EF3D0000000000000000000000000000EF3DEF3DF75E
      EF3D0000EF3DF75EEF3DEF3D0000000000000000000000000000EF3DEF3DF75E
      EF3D0000EF3DF75EEF3DEF3D0000000000000000000010001000100010001000
      100010001000100010001000000000000000F75EF75EEF3D00000000EF3D0000
      0000000000000000EF3D00000000EF3DEF3D000000000000F75EF75EF75EF75E
      EF3D0000EF3DF75EF75EF75EF75E00000000000000000000F75EF75EF75EF75E
      EF3D0000EF3DF75EF75EF75EF75E000000000000100010001000100000000000
      000000001000100010001000100000000000EF3D000000000000EF3D00000000
      000000000000000000000000EF3DEF3D0000000000000000EF3DEF3DEF3DF75E
      F75E0000F75EF75EEF3DEF3DEF3D00000000000000000000EF3DEF3DEF3DF75E
      F75E0000F75EF75EEF3DEF3DEF3D000000000000100010001000000000000000
      000000000000100010001000100000000000EF3D00000000EF3D0000EF3D0000
      000000000000000000000000F75E0000EF3D000000000000F75EF75EF75EF75E
      000000000000F75EF75EF75EF75E00000000000000000000F75EF75EF75EF75E
      000000000000F75EF75EF75EF75E000000001000100010000000000000000000
      0000000000000000100010001000100000000000000000000000000000000000
      0000000000000000EF3DEF3DF75E0000F75E000000000000EF3DEF3DEF3DEF3D
      000000000000EF3DEF3DEF3DEF3D00000000000000000000EF3DEF3DEF3DEF3D
      000000000000EF3DEF3DEF3DEF3D000000001000100010000000000000000000
      0000000000000000000010001000100000000000000000000000000000000000
      000000000000000000000000F75E0000EF3D000000000000F75EF75EF75EF75E
      F75EF75EF75EF75EF75EF75EF75E00000000E07F00000000F75EF75EF75EF75E
      F75EF75EF75EF75EF75EF75EF75E000000001000100010000000000000000000
      0000000000000000000000000000000000000000EF3D00000000EF3D00000000
      EF3D0000EF3D000000000000EF3DF75E00000000000000000000000000000000
      0000000000000000000000000000000000000000E07F00000000000000000000
      0000000000000000000000000000000000001000100010000000000000000000
      000000000000000000000000000000000000EF3D000000000000EF3D00000000
      0000EF3D00000000EF3D00000000EF3DF75E00000000000000000000F75E0000
      0000000000000000F75E000000000000000000000000E07FE07FE07FE07F0000
      0000000000000000F75E00000000000000001000100010000000000000000000
      00000000100010001000100010001000000000000000EF3DEF3DEF3DEF3DEF3D
      00000000EF3D00000000EF3D00000000000000000000000000000000F75E0000
      0000000000000000F75E0000000000000000E07FE07FE07FE07FEF3D0000EF3D
      E07FE07F00000000F75E00000000000000000000100010001000000000000000
      0000000000001000100010001000100000000000EF3DEF3D000000000000EF3D
      EF3D000000000000EF3D0000EF3D0000000000000000000000000000F75E0000
      0000000000000000F75E000000000000000000000000E07FE07F0000F75E0000
      0000000000000000F75E00000000000000000000100010001000100000000000
      0000000000001000100010001000100000000000F75E0000EF3DEF3DEF3D0000
      EF3D000000000000000000000000000000000000000000000000EF3DEF3DF75E
      000000000000F75EEF3DEF3D0000000000000000E07F0000E07F0000F75E0000
      0000000000000000F75E00000000000000000000000010001000100010001000
      100010001000100010001000100010000000EF3DF75E0000F75E0000EF3D0000
      EF3DEF3DEF3D000000000000000000000000000000000000000000000000F75E
      F75EF75EF75EF75E00000000000000000000E07F00000000E07FEF3DEF3DF75E
      000000000000F75EEF3DEF3D0000000000000000000000001000100010001000
      1000100010001000100010001000100000000000F75E0000EF3DF75EEF3D0000
      EF3D000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000E07F00000000F75E
      F75EF75EF75EF75E000000000000000000000000000000000000000010001000
      1000100010000000000000000000100000000000EF3DF75E000000000000EF3D
      EF3D000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000E07F000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000FF7F0000000000000000000000000000
      00000000FF03EF01000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000000000007C0000
      00000000000000000000000000000000000000000000000000000000FF7F0000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000FF03EF01EF0100000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000007C007C007C
      000000000000000000000000000000000000000000000000000000000000FF7F
      0000000000000000000000000000FF7F0000000000000000000000000000FF03
      FF03FF03FF03EF01EF01EF010000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000007C007C007C
      000000000000000000000000000000000000000000000000000000000000FF7F
      000000000000000000000000FF7F00000000000000000000000000000000FF03
      FF03FF03FF03EF01EF01EF01EF3D000000000000000000001F00000000000000
      000000000000000000000000000000000000000000000000007C007C007C007C
      007C000000000000000000000000000000000000000000000000000000000000
      FF7F00000000000000000000FF7F00000000000000000000000000000000EF3D
      EF3DEF3DFF03EF01EF01EF01EF3D000000001042FF7FFF7FFF031F00FF7FFF7F
      FF7FFF7FFF7FFF7FFF7F18631863FF7F000000000000007C007C007C007C007C
      007C000000000000000000000000000000000000000000000000000000000000
      0000FF7F000000000000FF7F000000000000000000000000000000000000EF3D
      EF3DEF3DFF03EF01EF01EF01EF3D000000001F001F001F00FF03FF031F00FF7F
      FF7FFF7FFF7FFF7FFF7FFF7FFF7F104200000000EF3D007C007C00000000007C
      007C007C00000000000000000000000000000000000000000000000000000000
      0000000000000000FF7F000000000000000000000000000000000000EF3DEF3D
      EF3DEF3DFF0300000000EF01EF3D00000000FF03FF03FF03FF03FF03FF031F00
      FF7FFF7F0000000000000000000000000000EF3D007C00000000000000000000
      007C007C00000000000000000000000000000000000000000000000000000000
      000000000000FF7F00000000000000000000000000000000000000000000EF3D
      EF3DEF3DFF03EF010000EF01EF3D00000000FF03FF03FF03FF03FF03FF03FF03
      1F000000FF7F1863186318630000000000000000000000000000000000000000
      007C007C007C0000000000000000000000000000000000000000000000000000
      0000000000000000FF7F00000000000000000000000000000000000000000000
      EF3DEF3DFF03EF01EF01EF01EF3D00000000FF03FF03FF03FF03FF03FF031F00
      FF7F000018631863186300000000000000000000000000000000000000000000
      0000007C007C0000000000000000000000000000000000000000000000000000
      0000FF7F00000000FF7F00000000000000000000000000000000000000000000
      EF3DEF3DFF03EF01EF01EF01EF3D00000000000000000000FF03FF031F000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000007C007C000000000000000000000000000000000000000000000000
      FF7F00000000000000000000FF7F00000000000000000000000000000000EF3D
      EF3DEF3DFF03EF01EF01EF01EF3D00000000000000000000FF031F0000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000EF3D007C0000000000000000000000000000000000000000FF7F
      0000000000000000000000000000FF7F000000000000000000000000EF3DEF3D
      EF3DEF3DFF7FEF01EF01EF01EF3D000000000000000000001F00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000EF3D007C0000000000000000000000000000FF7F00000000
      00000000000000000000000000000000FF7F000000000000000000000000EF3D
      EF3DEF3DEF3DFF7FEF01EF01EF3D000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000007C007C00000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000EF3D
      EF3DEF3DEF3DEF3DFF7FEF01EF3D000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000F75EF75EF75EF75EF75EF75E
      F75EF75EF75EF75EF75EF75EF75EF75E00000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000F75EF75EF75EF75EF75EF75E
      F75EF75EF75EF75EF75EF75EF75EF75E00000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000FF7FF75EFF7FF75EFF7FF75E
      FF7FF75EFF7FF75EFF7FF75EFF7FF75E0000000000000000000000000000EF01
      0000000000000000000000000000000000000000000000000000000000000000
      0000EF010000000000000000000000000000000000000000000000000000EF01
      00000000EF010000000000000000000000000000F75EFF7FF75EFF7FF75EFF7F
      F75EFF7FF75EFF7FF75EFF7F007CFF7F000000000000000000000000EF01EF01
      0000000000000000000000000000000000000000000000000000000000000000
      0000EF01EF01000000000000000000000000000000000000000000000000EF01
      EF010000EF01EF01000000000000000000000000FF7FF75EFF7FF75EFF7FF75E
      FF7FF75EFF7FF75EFF7FF75EFF7FF75E00000000000000000000EF01EF01EF01
      EF01EF01EF01EF01000000000000000000000000000000000000EF01EF01EF01
      EF01EF01EF01EF010000000000000000000000000000EF01EF01EF01EF01EF01
      EF01EF010000EF01EF0100000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000EF01EF01EF01EF01
      EF01EF01EF01EF01000000000000000000000000000000000000EF01EF01EF01
      EF01EF01EF01EF01EF01000000000000000000000000EF01EF01EF01EF01EF01
      EF01EF01EF010000EF01EF010000000000000000000000000000FF7FFF7FFF7F
      FF7FFF7FFF7FFF7FFF7F00000000000000000000000000000000EF01EF01EF01
      EF01EF01EF01EF01000000000000000000000000000000000000EF01EF01EF01
      EF01EF01EF01EF010000000000000000000000000000EF01EF01EF01EF01EF01
      EF01EF010000EF01EF0100000000000000000000000000000000FF7F00000000
      00000000FF7F0000FF7F000000000000000000000000000000000000EF01EF01
      0000000000000000000000000000000000000000000000000000000000000000
      0000EF01EF01000000000000000000000000000000000000000000000000EF01
      EF010000EF01EF01000000000000000000000000000000000000FF7FFF7FFF7F
      FF7FFF7FFF7FFF7FFF7F0000000000000000000000000000000000000000EF01
      0000000000000000000000000000000000000000000000000000000000000000
      0000EF010000000000000000000000000000000000000000000000000000EF01
      00000000EF010000000000000000000000000000000000000000FF7F00000000
      FF7F000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000FF7FFF7FFF7F
      FF7F0000FF7FFF7F000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000FF7F0000F75E
      FF7F0000FF7F0000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000FF7FFF7FFF7F
      FF7F000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000F75E00000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000F75E0000FF7FFF7FFF7FFF7F
      FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F00000000F75E0000FF7FFF7F00000000
      0000FF7FFF7FFF7FFF7FFF7FFF7FFF7F00000000F75E0000FF7FFF7FFF7FFF7F
      FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F00000000000000000000000000000000
      0000000000000000000000000000000000000000F75E00000000000000000000
      0000000000000000000000000000000000000000F75E00000000000000000000
      FF7F0000FF7F0000000000000000000000000000F75E00000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000F75E0000FF7FFF7FFF7FFF7F
      000000000000FF7FFF7FFF7FFF7FFF7F00000000F75E0000FF7FFF7F0000FF7F
      FF7FFF7F0000FF7FFF7FFF7FFF7FFF7F00000000F75E0000FF7FFF7FFF7FFF7F
      FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F00000000000000000000000000000000
      0000000000000000000000000000000000000000F75E00000000000000000000
      00001F0000000000000000000000000000000000F75E0000000000000000FF7F
      FF7FFF7F0000FF7F000000000000000000000000F75E00000000000000000000
      00000000000000000000000000000000000000000000000000000000EF010000
      0000EF0100000000000000000000000000000000F75E0000FF7FFF7FFF7FFF7F
      00001F000000FF7FFF7FFF7FFF7FFF7F00000000F75E0000FF7FFF7F0000FF7F
      FF7FEF3DEF3D0000FF7FFF7FFF7FFF7F00000000F75E0000FF7FFF7FFF7FFF7F
      FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F00000000000000000000EF01EF010000
      EF01EF0100000000000000000000000000000000F75E00000000000000000000
      00001F0000000000000000000000000000000000F75E000000000000FF7F0000
      FF7FEF3DE07F0000FF7F00000000000000000000F75E00000000000000000000
      000000000000000000000000000000000000000000000000EF01EF010000EF01
      EF01EF01EF01EF01EF01EF010000000000000000F75E0000FF7F00001F001F00
      1F001F001F001F001F000000FF7FFF7F00000000F75E0000FF7FFF7FFF7F0000
      EF3DE07FEF3DEF3D0000FF7FFF7FFF7F00000000F75E0000FF7F00001F001F00
      1F001F001F001F001F000000FF7FFF7F000000000000EF01EF010000EF01EF01
      EF01EF01EF01EF01EF01EF010000000000000000F75E00000000000000000000
      00001F0000000000000000000000000000000000F75E0000000000000000FF7F
      0000EF3DE07FEF3D0000FF7F0000000000000000F75E00000000000000000000
      000000000000000000000000000000000000000000000000EF01EF010000EF01
      EF01EF01EF01EF01EF01EF010000000000000000F75E0000FF7FFF7FFF7FFF7F
      00001F000000FF7FFF7FFF7FFF7FFF7F00000000F75E0000FF7FFF7FFF7FFF7F
      0000E07FEF3DE07FEF3D0000FF7FFF7F00000000F75E0000FF7FFF7FFF7FFF7F
      FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F00000000000000000000EF01EF010000
      EF01EF0100000000000000000000000000000000F75E00000000000000000000
      00001F0000000000000000000000000000000000F75E00000000000000000000
      FF7F0000E07FEF3DEF3D0000FF7F000000000000F75E00000000000000000000
      00000000000000000000000000000000000000000000000000000000EF010000
      0000EF0100000000000000000000000000000000F75E0000FF7FFF7FFF7FFF7F
      000000000000FF7FFF7FFF7FFF7FFF7F00000000F75E0000FF7FFF7FFF7FFF7F
      FF7F0000000000000000003C0000FF7F00000000F75E0000FF7FFF7FFF7FFF7F
      FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F00000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000EF3D003CEF3D0000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000F75E0000F75EF75EF75EF75E
      F75EF75EF75EF75EF75EF75EF75EF75E00000000F75E0000F75EF75EF75EF75E
      F75EF75E0000003CEF3D003C0000F75E00000000F75E0000F75EF75EF75EF75E
      F75EF75EF75EF75EF75EF75EF75EF75E00000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      1F00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000001042000000000000
      10420000E07F1042000000000000000000000000000000000000000000000000
      1F0000000000000000000000000000000000000000000000000000000000EF3D
      EF3D000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000001042104210421042
      104200000000E07F000000000000000000000000000000000000000000000000
      1F0000000000000000000000000000000000000000000000000000000000EF3D
      E07F000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000001042FF7F1863FF7F1863
      FF7F1042000000000000000000000000000000000000000000001F001F001F00
      1F001F001F001F000000000000000000000000000000000000000000EF3DE07F
      EF3DEF3D000000000000000000000000000000000000000000001F001F001F00
      1F001F001F001F000000000000000000000010421042FF7F1863FF7F1863FF7F
      1863FF7F10421042000000000000000000000000000000000000000000000000
      1F0000000000000000000000000000000000000000000000000000000000EF3D
      E07FEF3D00000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000010421863FF7F1863FF7F1863
      FF7F186310420000000000000000000000000000000000000000000000000000
      1F0000000000000000000000000000000000000000000000000000000000E07F
      EF3DE07FEF3D0000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000001042FF7F1863FF7F1863FF7F
      1863FF7F10420000000000000000000000000000000000000000000000000000
      1F00000000000000000000000000000000000000000000000000000000000000
      E07FEF3DEF3D0000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000010421863FF7F1863FF7F1863
      FF7F186310420000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000003C000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000010421042FF7F1863FF7F1863FF7F
      1863FF7F10421042000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000EF3D003CEF3D000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000001042FF7F1863FF7F1863
      FF7F104200000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000003CEF3D003C000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000001042104210421042
      1042000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000001042000000000000
      104200000000000000000000000000000000424D3E000000000000003E000000
      2800000040000000600000000100010000000000000300000000000000000000
      000000000000000000000000FFFFFF00FFFF000000000000FFF8000000000000
      20F8000000000000007F000000000000007C000000000000003C000000000000
      000F0000000000000004000000000000000C00000000000001FF000000000000
      E3FC000000000000FFFC000000000000FFFF000000000000FFF8000000000000
      FFF8000000000000FFFF00000000000081FEFC1FFC1FF83F01E2F007F007E00F
      07E0E003E003C00703E0C001C001878303F0C001C0018FC323C0C001C0011FE1
      3FC0C001C0011FF1E3C0C00140011FFF2230E003A0031FFF0020F1C7C3C71F81
      0020F1C700478FC10062F1C7C1C787C1001EF007A1C7C001001FF80F6007E001
      001FFC1FE80FF83D007FFFFFEC1FFFFFFFFFFFFFFFBFFFFFFFFFFFFCFF9FFFFF
      F9FFF3FFFF8FCFF3F0FFE1F9000087E1F0FFE1F3F8030000E07FF0E3F8030000
      C07FF847F8030000843FFC0FF00300011E3FFE1FF0030003FE1FFC0F00030007
      FF1FF84F0003000FFF8FE0E3F003E7FFFFC7C1F1F003EFFFFFE3C7F8F803FFFF
      FFF8FFFFF803FFFFFFFFFFFFF807FFFFFFFFFFFFFFFF8001FFFFFFFFFFFF0000
      FFFFFFFFFFFF0000FEFFFEFFFB7F0000FCFFFE7FF93F0000F8FFFE3FF81F0000
      F00FE01F800F0000E00FE00F80070000C00FE0078003E007E00FE00F8007E007
      F00FE01F800FE007F8FFFE3FF81FE007FCFFFE7FF93FE00FFEFFFEFFFB7FE01F
      FFFFFFFFFFFFE03FFFFFFFFFFFFFE07FFFFFFFFFFFFFFFFF000000000000FFFF
      000000000000FFFF000000000000FDBF000000000000F93F000000000000F03F
      000000000000E003000000000000C0030000000000008003000000000000C003
      000000000000E003000000000000F03F000000000000F93F000000000000FDBF
      000000000000FFFF000000000000FFFFFFFFFFFFFFFFFFFDFFFFE7FFFFFFFFF8
      FFFFE3FFFFFFFFF1FFFFE5FFFFFFFFE3FC7FEEFFFFFFFFC7FC7FEEFFFFFFE08F
      FC7FEC7FFFFFC01FE00FF47FE00F803FE00FF03FE00F001FE00FF83FE00F001F
      FC7FF81FFFFF001FFC7FFC1FFFFF001FFC7FFC0FFFFF001FFFFFFE0FFFFF803F
      FFFFFE0FFFFFC07FFFFFFF1FFFFFE0FF00000000000000000000000000000000
      000000000000}
  end
  object PopupMenuImprimir: TPopupMenu
    Left = 712
    Top = 80
    object OrdenCompleta1: TMenuItem
      Caption = 'Orden Carga Completa'
      OnClick = OrdenCompleta1Click
    end
    object mnuImprimirOrdenCarga: TMenuItem
      Caption = 'Orden Carga Solo'
      OnClick = mnuImprimirOrdenClick
    end
    object mnuImprimirPackingList: TMenuItem
      Caption = 'Packing List'
      OnClick = mnuImprimirPackingListClick
    end
    object EnvaseCalibreyColor1: TMenuItem
      Caption = 'Envase, Calibre y Color'
      OnClick = EnvaseCalibreyColor1Click
    end
    object EnvasesLogifruit1: TMenuItem
      Caption = 'Envases Logifruit'
      OnClick = EnvasesLogifruit1Click
    end
    object ipoPalets1: TMenuItem
      Caption = 'Tipo Palets'
      OnClick = ipoPalets1Click
    end
    object N1: TMenuItem
      Caption = '-'
    end
    object mnuEnviarCorreo: TMenuItem
      Caption = 'Enviar Correo'
      OnClick = mnuEnviarCorreoClick
    end
    object mnuSepPackingSimple: TMenuItem
      Caption = '-'
    end
    object mnuPackingSimple: TMenuItem
      Caption = 'Packing Simple'
      OnClick = mnuPackingSimpleClick
    end
  end
  object PopupMenuFiltro: TPopupMenu
    Left = 672
    Top = 80
    object mnuCreadas: TMenuItem
      Caption = 'Creadas'
      Checked = True
      OnClick = mnuFiltroClick
    end
    object mnuActivas: TMenuItem
      Caption = 'Activas'
      Checked = True
      OnClick = mnuFiltroClick
    end
    object mnuInicializadas: TMenuItem
      Caption = 'Inicializadas'
      Checked = True
      OnClick = mnuFiltroClick
    end
    object mnuFinalizadas: TMenuItem
      Caption = 'Finalizadas'
      Checked = True
      OnClick = mnuFiltroClick
    end
  end
  object QPalets: TQuery
    DatabaseName = 'Database'
    SQL.Strings = (
      'select count( distinct ean128_pl ) '
      'from frf_packing_list'
      'where orden_pl = :orden')
    Left = 8
    Top = 96
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'orden'
        ParamType = ptUnknown
      end>
  end
  object AFQuickMail: TAFQuickMail
    ErrorMessage = 'Error sending mail'
    ShowDialog = True
    ReceiptRequested = False
    Left = 440
    Top = 96
  end
  object qrxclfltr1: TQRExcelFilter
    Left = 760
    Top = 40
  end
  object qrpdfltr1: TQRPDFFilter
    CompressionOn = False
    Left = 760
    Top = 72
  end
end
