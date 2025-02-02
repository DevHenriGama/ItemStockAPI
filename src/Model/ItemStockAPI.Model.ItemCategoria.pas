unit ItemStockAPI.Model.ItemCategoria;

interface

uses
  ItemStockAPI.DTO.Interfaces,
  ItemStockAPI.Model.Interfaces,
  ItemStockAPI.DAO.Interfaces;

type
  TMItemCategoria = class(TInterfacedObject, IMItemCategoria)
  private
    FInstance: IItemCategoriaDTO;
    FDAO: IDItemCategoria;
  public
    constructor Create(aObject: IItemCategoriaDTO);
    destructor Destroy; override;
    function ObterDTO: IItemCategoriaDTO;
    procedure Adicionar;
  end;

implementation

uses
  ItemStockAPI.DAO.ItemCategoria;

{ TMItemCategoria }

procedure TMItemCategoria.Adicionar;
begin
  FDAO.Adicionar;
end;

constructor TMItemCategoria.Create(aObject: IItemCategoriaDTO);
begin
  FInstance := aObject;
  FDAO := TDItemCategoria.Create(Self);
end;

destructor TMItemCategoria.Destroy;
begin

  inherited;
end;

function TMItemCategoria.ObterDTO: IItemCategoriaDTO;
begin
  Result := FInstance;
end;

end.
