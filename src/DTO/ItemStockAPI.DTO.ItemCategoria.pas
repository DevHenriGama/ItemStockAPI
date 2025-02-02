unit ItemStockAPI.DTO.ItemCategoria;

interface

uses
  ItemStockAPI.DTO.Interfaces;

type
  TItemCategoriaDTO = class(TInterfacedObject, IItemCategoriaDTO)
  private
    FIDItem, FIDCategoria: Integer;
  public
    constructor Create;
    destructor Destroy; override;
    function IDItem(aID: Integer): IItemCategoriaDTO; overload;
    function IDItem: Integer; overload;
    function IDCategoria(aID: Integer): IItemCategoriaDTO; overload;
    function IDCategoria: Integer; overload;
  end;

implementation

{ TItemCategoriaDTO }

constructor TItemCategoriaDTO.Create;
begin

end;

destructor TItemCategoriaDTO.Destroy;
begin

  inherited;
end;

function TItemCategoriaDTO.IDCategoria(aID: Integer): IItemCategoriaDTO;
begin
 Result := Self;
 FIDCategoria := aID;
end;

function TItemCategoriaDTO.IDCategoria: Integer;
begin
Result := FIDCategoria;
end;

function TItemCategoriaDTO.IDItem(aID: Integer): IItemCategoriaDTO;
begin
Result := Self;
FIDItem := aID;
end;

function TItemCategoriaDTO.IDItem: Integer;
begin
Result := FIDItem;
end;

end.
