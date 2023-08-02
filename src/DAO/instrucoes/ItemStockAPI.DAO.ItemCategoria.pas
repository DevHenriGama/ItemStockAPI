unit ItemStockAPI.DAO.ItemCategoria;

interface

uses
  ItemStockAPI.Model.ItemCategoria, ItemStockAPI.DAO.Interfaces;

type
  TDItemCategoria = class(TInterfacedObject, IDItemCategoria)
  private
    FInstance: TMItemCategoria;
    Query: IQuery;
  public
    constructor Create(aObject: TMItemCategoria);
    destructor Destroy; override;
    procedure Adicionar;
  end;

implementation

uses
  ItemStockAPI.DAO.Query;

{ TDItemCategoria }

procedure TDItemCategoria.Adicionar;
begin
  with Query.ObterQuery do
  begin
    Close;
    SQL.Clear;
    SQL.Add('INSERT INTO CATEGORIA_ITEM (ID_ITEM, ID_CATEGORIA) VALUES (:item, :categoria)');
    ParamByName('item').AsInteger := FInstance.ObterDTO.IDItem;
    ParamByName('categoria').AsInteger := FInstance.ObterDTO.IDCategoria;
    ExecSQL;
  end;
end;

constructor TDItemCategoria.Create(aObject: TMItemCategoria);
begin
  FInstance := aObject;
  Query := TQuery.Create;
end;

destructor TDItemCategoria.Destroy;
begin

  inherited;
end;

end.
