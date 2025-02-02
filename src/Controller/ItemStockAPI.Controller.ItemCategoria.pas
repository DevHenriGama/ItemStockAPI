unit ItemStockAPI.Controller.ItemCategoria;

interface

uses
  ItemStockAPI.DTO.Interfaces,
  ItemStockAPI.Controller.Interfaces, ItemStockAPI.Model.Interfaces;

type
  TCItemCategoria = class(TInterfacedObject, ICItemCategoria)
  private
  FModel : IMItemCategoria;
  public
    class function New(aObject: IItemCategoriaDTO): ICItemCategoria;
    constructor Create(aObject: IItemCategoriaDTO);
    destructor Destroy; override;
    procedure Adicionar;
  end;

implementation

uses
  ItemStockAPI.Model.ItemCategoria;

{ TCItemCategoria }

procedure TCItemCategoria.Adicionar;
begin
FModel.Adicionar;
end;

constructor TCItemCategoria.Create(aObject: IItemCategoriaDTO);
begin
 FModel := TMItemCategoria.Create(aObject);
end;

destructor TCItemCategoria.Destroy;
begin

  inherited;
end;

class function TCItemCategoria.New(aObject: IItemCategoriaDTO): ICItemCategoria;
begin
  Result := TCItemCategoria.Create(aObject);
end;

end.
