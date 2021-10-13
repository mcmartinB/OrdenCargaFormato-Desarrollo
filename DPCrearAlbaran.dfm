object dtmPCrearAlbaran: TdtmPCrearAlbaran
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  OnDestroy = DataModuleDestroy
  Height = 446
  Width = 580
  object QOrdenCab: TQuery
    DatabaseName = 'Database'
    Left = 56
    Top = 184
  end
  object QSalidaCab: TQuery
    DatabaseName = 'Database'
    Left = 64
    Top = 96
  end
  object QSalidaLin: TQuery
    DatabaseName = 'Database'
    Left = 136
    Top = 96
  end
  object QPackingList: TQuery
    DatabaseName = 'Database'
    DataSource = DSOrdenCab
    Left = 176
    Top = 181
  end
  object QDetallePedido: TQuery
    DatabaseName = 'Database'
    Left = 176
    Top = 240
  end
  object QAux: TQuery
    DatabaseName = 'Database'
    Left = 64
    Top = 24
  end
  object DSOrdenCab: TDataSource
    DataSet = QOrdenCab
    Left = 115
    Top = 160
  end
  object QKilosEnvase: TQuery
    DatabaseName = 'Database'
    Left = 264
    Top = 240
  end
  object QCentroOrigen: TQuery
    DatabaseName = 'Database'
    Left = 336
    Top = 240
  end
  object QDetalleCarga: TQuery
    DatabaseName = 'Database'
    Left = 176
    Top = 296
  end
  object qryUnidadesCaja: TQuery
    DatabaseName = 'Database'
    Left = 265
    Top = 293
  end
  object qryPesoVariable: TQuery
    DatabaseName = 'Database'
    Left = 378
    Top = 298
  end
  object QMonedaCliente: TQuery
    DatabaseName = 'Database'
    RequestLive = True
    SQL.Strings = (
      'select moneda_c'
      'from frf_clientes'
      'where empresa_c = :empresa'
      'and cliente_c  = :cliente')
    Left = 320
    Top = 79
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'empresa'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'cliente'
        ParamType = ptUnknown
      end>
  end
  object qryAux: TQuery
    DatabaseName = 'Database'
    RequestLive = True
    SQL.Strings = (
      'select moneda_c'
      'from frf_clientes'
      'where cliente_c  = :cliente')
    Left = 432
    Top = 96
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'cliente'
        ParamType = ptUnknown
      end>
  end
  object qryAux2: TQuery
    DatabaseName = 'Database'
    RequestLive = True
    SQL.Strings = (
      'select moneda_c'
      'from frf_clientes'
      'where cliente_c  = :cliente')
    Left = 440
    Top = 152
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'cliente'
        ParamType = ptUnknown
      end>
  end
end
