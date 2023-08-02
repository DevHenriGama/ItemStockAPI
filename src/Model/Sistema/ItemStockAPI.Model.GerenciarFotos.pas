unit ItemStockAPI.Model.GerenciarFotos;

interface

uses
  ItemStockAPI.DTO.Interfaces,
  ItemStockAPI.Model.Interfaces;

type
TGerenciarFotos = class(TInterfacedObject,IGerenciarFotos)
  private
    FInstance : IItemFotoDTO;
  public
  class function New : IGerenciarFotos;
  constructor Create(aObject : IItemFotoDTO);
  destructor Destroy;override;
end;

implementation

{ TGerenciarFotos }

constructor TGerenciarFotos.Create(aObject: IItemFotoDTO);
begin
 FInstance := aObject;
end;

destructor TGerenciarFotos.Destroy;
begin

  inherited;
end;

class function TGerenciarFotos.New: IGerenciarFotos;
begin
  Result := Self.Create(nil);
end;

end.
