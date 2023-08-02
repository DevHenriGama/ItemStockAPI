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
    function ObterNumContainer : Integer;
  end;

implementation

end.
