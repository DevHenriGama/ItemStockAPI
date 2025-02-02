unit ItemStockAPI.Model.Categoria;

interface

uses
  ItemStockAPI.DTO.Interfaces, ItemStockAPI.Model.Interfaces,
  ItemStockAPI.DAO.Interfaces;

type
  TMCategoria = class(TInterfacedObject, IMCategoria)
  private
    FInstance: ICategoriaDTO;
    FDAO: IDCategoria;
  public
    constructor Create(aObject: ICategoriaDTO);
    destructor Destroy; override;
    function ObterDTO: ICategoriaDTO;
    procedure Adicionar;
    procedure Remover;
    procedure Editar;
    procedure ObterTodasCategorias;
    procedure ObterCategoria(aUUID: String);
    function ObterNumCategoria : Integer;
  end;

implementation

uses
  ItemStockAPI.DAO.Categoria;

{ TMCategoria }

procedure TMCategoria.Adicionar;
begin
  FDAO.Adicionar;
end;

constructor TMCategoria.Create(aObject: ICategoriaDTO);
begin
  FInstance := aObject;
  FDAO := TDCategoria.Create(Self);
end;

destructor TMCategoria.Destroy;
begin

  inherited;
end;

procedure TMCategoria.Editar;
begin
  FDAO.Editar;
end;

procedure TMCategoria.ObterCategoria(aUUID: String);
begin
  FDAO.ObterCategoria(aUUID);
end;

function TMCategoria.ObterDTO: ICategoriaDTO;
begin
  Result := FInstance;
end;

function TMCategoria.ObterNumCategoria: Integer;
begin
Result := FDAO.ObterNumCategoria;
end;

procedure TMCategoria.ObterTodasCategorias;
begin
  FDAO.ObterTodasCategorias;
end;

procedure TMCategoria.Remover;
begin
  FDAO.Remover;
end;

end.
