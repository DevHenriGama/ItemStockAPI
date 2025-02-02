unit ItemStockAPI.Controller.Categoria;

interface

uses
  ItemStockAPI.DTO.Interfaces, ItemStockAPI.Controller.Interfaces,
  ItemStockAPI.Model.Interfaces;

type
TCCategoria = class(TInterfacedObject,ICCategoria)
  private
     FModel : IMCategoria;
  public
  class function New(aObject: ICategoriaDTO) : ICCategoria;
  constructor Create(aObject : ICategoriaDTO);
  destructor Destroy;override;
  procedure Adicionar;
  procedure Remover;
  procedure Editar;
  procedure ObterTodasCategorias;
  procedure ObterCategoria(aUUID : String);
  function ObterNumCategoria : Integer;
end;

implementation

uses
  ItemStockAPI.Model.Categoria;

{ TCCategoria }

procedure TCCategoria.Adicionar;
begin
   FModel.Adicionar;
end;

constructor TCCategoria.Create(aObject: ICategoriaDTO);
begin
 FModel := TMCategoria.Create(aObject);
end;

destructor TCCategoria.Destroy;
begin

  inherited;
end;

procedure TCCategoria.Editar;
begin
  FModel.Editar;
end;

class function TCCategoria.New(aObject: ICategoriaDTO): ICCategoria;
begin
  Result := TCCategoria.Create(aObject);
end;

procedure TCCategoria.ObterCategoria(aUUID: String);
begin
  FModel.ObterCategoria(aUUID);
end;

function TCCategoria.ObterNumCategoria: Integer;
begin
 Result := FModel.ObterNumCategoria;
end;

procedure TCCategoria.ObterTodasCategorias;
begin
 FModel.ObterTodasCategorias;
end;

procedure TCCategoria.Remover;
begin
  FModel.Remover;
end;

end.
