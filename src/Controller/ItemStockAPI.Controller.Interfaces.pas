unit ItemStockAPI.Controller.Interfaces;

interface

type
  ICEstado = interface
    ['{870E13C8-B5E1-4E67-8BBB-1AC0F14A52B1}']
    procedure ObterEstados;
  end;

  ICContainer = interface
    ['{027040A2-652C-49D6-9807-CE36CCBB3EDA}']
    procedure Adicionar;
    procedure Editar;
    procedure Deletar;
    procedure ObterDadosContainer(aUUID: String);
    procedure ObterTodos;
    function ObterNumContainer: Integer;
  end;

  ICItemCategoria = interface
    ['{AF125119-6F29-431E-87F0-B8D6E94E49F9}']
    procedure Adicionar;
  end;

  ICCategoria = interface
    ['{DC670698-E695-482A-A487-0FA97E3C3811}']
    procedure Adicionar;
    procedure Remover;
    procedure Editar;
    procedure ObterTodasCategorias;
    procedure ObterCategoria(aUUID: String);
    function ObterNumCategoria: Integer;
  end;

  ICItemFoto = interface
    ['{4E4AB9BD-86A1-457D-8231-0EE331A6AC7B}']
    procedure Adicionar;
    procedure Remover;
    procedure ObterFotosItem(aUUIDItem: String);
  end;

  ICItem = interface
    ['{F4CF92CB-7BC1-49A3-9D82-5EF9E35BCFA0}']
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
