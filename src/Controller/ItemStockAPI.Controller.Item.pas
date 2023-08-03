unit ItemStockAPI.Controller.Item;

interface

uses
  ItemStockAPI.DTO.Interfaces,
  ItemStockAPI.Controller.Interfaces,
  ItemStockAPI.Model.Interfaces;

type
  TCItem = class(TInterfacedObject, ICItem)
  private
    FModel: IMItem;
  public
    class function New(aObject: IItemDTO): ICItem;
    constructor Create(aObject: IItemDTO);
    destructor Destroy; override;
    procedure Adicionar;
    procedure Remover;
    procedure Editar;
    procedure PesquisarItem(aChave: String);
    procedure ObterDadosItem(aUUID: String);
    procedure ListarItemContainer(aUUIDContainer: String);
  end;

implementation

uses
  ItemStockAPI.Model.Item;

{ TCItem }

procedure TCItem.Adicionar;
begin
  FModel.Adicionar;
end;

constructor TCItem.Create(aObject: IItemDTO);
begin
  FModel := TMItem.Create(aObject);
end;

destructor TCItem.Destroy;
begin

  inherited;
end;

procedure TCItem.Editar;
begin
  FModel.Editar;
end;

procedure TCItem.ListarItemContainer(aUUIDContainer: String);
begin
  FModel.ListarItemContainer(aUUIDContainer);
end;

class function TCItem.New(aObject: IItemDTO): ICItem;
begin
  Result := TCItem.Create(aObject);
end;

procedure TCItem.ObterDadosItem(aUUID: String);
begin
  FModel.ObterDadosItem(aUUID);
end;

procedure TCItem.PesquisarItem(aChave: String);
begin
  FModel.PesquisarItem(aChave);
end;

procedure TCItem.Remover;
begin
  FModel.Remover;
end;

end.
