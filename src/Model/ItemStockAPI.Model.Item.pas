unit ItemStockAPI.Model.Item;

interface

uses
  ItemStockAPI.DTO.Interfaces, ItemStockAPI.Model.Interfaces,
  ItemStockAPI.DAO.Interfaces;

type
  TMItem = class(TInterfacedObject, IMItem)
  private
    FInstance: IItemDTO;
    FDAO : IDItem;
  public
    constructor Create(aObject: IItemDTO);
    destructor Destroy; override;
    function ObterDTO: IItemDTO;
    procedure Adicionar;
    procedure Remover;
    procedure Editar;
    procedure PesquisarItem(aChave: String);
    procedure ObterDadosItem(aUUID: String);
    procedure ListarItemContainer(aUUIDContainer: String);
        procedure ObterTodos;
    function ObterQuantidade : Integer;
    procedure BuscasAvancadas(aJSON: String);
  end;

implementation

uses
  ItemStockAPI.DAO.Item;

{ TMItem }

procedure TMItem.Adicionar;
begin
 FDAO.Adicionar;
end;

procedure TMItem.BuscasAvancadas(aJSON: String);
begin
FDAO.BuscasAvancadas(aJSON);
end;

constructor TMItem.Create(aObject: IItemDTO);
begin
  FInstance := aObject;
  FDAO := TDItem.Create(Self);
end;

destructor TMItem.Destroy;
begin

  inherited;
end;

procedure TMItem.Editar;
begin
   FDAO.Editar;
end;

procedure TMItem.ListarItemContainer(aUUIDContainer: String);
begin
FDAO.ListarItemContainer(aUUIDContainer);
end;

procedure TMItem.ObterDadosItem(aUUID: String);
begin
 FDAO.ObterDadosItem(aUUID);
end;

function TMItem.ObterDTO: IItemDTO;
begin
  Result := FInstance;
end;

function TMItem.ObterQuantidade: Integer;
begin
 Result := FDAO.ObterQuantidade;
end;

procedure TMItem.ObterTodos;
begin
   FDAO.ObterTodos;
end;

procedure TMItem.PesquisarItem(aChave: String);
begin
   FDAO.PesquisarItem(aChave);
end;

procedure TMItem.Remover;
begin
  FDAO.Remover;
end;

end.
