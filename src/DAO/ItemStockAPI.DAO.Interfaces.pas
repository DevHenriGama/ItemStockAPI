unit ItemStockAPI.DAO.Interfaces;

interface

uses
  FireDAC.Comp.Client;

type

  IConexao = Interface
    ['{D846E373-754B-473E-B583-6BF3FA553BBA}']
    function Conexao: TFDConnection;

  End;

  IQuery = interface
    ['{092BFAC4-9B21-4537-940D-222ADAE310D0}']
    function ExecutarQuery(aSQL: String): TFDQuery;
    function ObterQuery: TFDQuery;
  end;

  IDEstado = interface
    ['{3D4821EC-1D80-435F-AD82-BD31F4D0A0E7}']
    procedure ObterEstados;
  end;

  IDContainer = interface
    ['{262C4CD7-4D29-4FBF-B7E9-12BDA8111DC7}']
    procedure Adicionar;
    procedure Editar;
    procedure Deletar;
    procedure ObterDadosContainer(aUUID: String);
    procedure ObterTodos;
    function ObterNumContainer: Integer;
  end;

  IDItemCategoria = interface
    ['{63345207-B03F-451F-88A9-BA128C1E6184}']
    procedure Adicionar;
  end;

  IDCategoria = interface
    ['{B732BE2B-6C78-44D3-9185-4E8670308E1E}']
    procedure Adicionar;
    procedure Remover;
    procedure Editar;
    procedure ObterTodasCategorias;
    procedure ObterCategoria(aUUID: String);
    function ObterNumCategoria: Integer;
  end;

  IDItemFoto = interface
    ['{6E964E55-D279-4127-96D6-6F89DCCD34BD}']
    procedure Adicionar;
    procedure Remover;
    procedure ObterFotosItem(aUUIDItem: String);
  end;

  IDItem = interface
    ['{8D6E02F2-95B5-4FA2-BADB-E4FBB7C62ED7}']
    procedure Adicionar;
    procedure Remover;
    procedure Editar;
    procedure PesquisarItem(aChave: String);
    procedure ObterDadosItem(aUUID: String);
    procedure ListarItemContainer(aUUIDContainer: String);
    procedure ObterTodos;
    function ObterQuantidade: Integer;
  end;

implementation

end.
