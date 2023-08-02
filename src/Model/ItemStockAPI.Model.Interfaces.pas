unit ItemStockAPI.Model.Interfaces;

interface

type

  IPublicID = interface
    ['{A81DF9F3-6AAC-4303-A870-5BE4CDEF9543}']
    function NovaChave(aDado : String) : String;
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

implementation

end.
