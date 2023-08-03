unit ItemStockAPI.Model.Interfaces;

interface

type

  IPublicID = interface
    ['{A81DF9F3-6AAC-4303-A870-5BE4CDEF9543}']
    function NovaChave(aDado: String): String;
  end;

  IGerenciarFotos = interface
    ['{BC5087BF-891A-4DAF-9108-632BC4485594}']
    procedure SalvarFoto;
    procedure DeletarFoto;
  end;

  IMEstado = interface
    ['{C00F5EBD-21E1-4F32-86A0-DACCF0619CCB}']
    procedure ObterEstados;
  end;

  IMContainer = interface
    ['{F5D03953-CB76-4398-8975-6C559E273416}']
    procedure Adicionar;
    procedure Editar;
    procedure Deletar;
    procedure ObterDadosContainer(aUUID: String);
    procedure ObterTodos;
    function ObterNumContainer: Integer;
  end;

  IMItemCategoria = interface
    ['{ABD26003-1A6A-43AD-B406-3CD730345559}']
    procedure Adicionar;
  end;

  IMCategoria = interface
    ['{CDC3D09D-E253-4176-9C2C-D061BA86AAF8}']
    procedure Adicionar;
    procedure Remover;
    procedure Editar;
    procedure ObterTodasCategorias;
    procedure ObterCategoria(aUUID: String);
    function ObterNumCategoria: Integer;
  end;

  IMItemFoto = interface
    ['{C072BC24-4097-4279-971E-6ADFA250ABFF}']
    procedure Adicionar;
    procedure Remover;
    procedure ObterFotosItem(aUUIDItem: String);
  end;

  IMItem = interface
    ['{56918207-A220-4FFC-915D-1A85763159CB}']
    procedure Adicionar;
    procedure Remover;
    procedure Editar;
    procedure PesquisarItem(aChave: String);
    procedure ObterDadosItem(aUUID: String);
    procedure ListarItemContainer(aUUIDContainer: String);
  end;

implementation

end.
