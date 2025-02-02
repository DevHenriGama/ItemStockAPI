unit ItemStockAPI.DAO.Categoria;

interface

uses
  ItemStockAPI.DAO.Interfaces, ItemStockAPI.Model.Categoria;

type
  TDCategoria = class(TInterfacedObject, IDCategoria)
  private
    FInstance: TMCategoria;
    Query: IQuery;
  public
    constructor Create(aObject: TMCategoria);
    destructor Destroy; override;
    procedure Adicionar;
    procedure Remover;
    procedure Editar;
    procedure ObterTodasCategorias;
    procedure ObterCategoria(aUUID: String);
    function ObterNumCategoria: Integer;
  end;

implementation

uses
  ItemStockAPI.DAO.Query, ItemStockAPI.Model.PublicID, System.SysUtils;

{ TDCategoria }

procedure TDCategoria.Adicionar;
begin
  with Query.ObterQuery do
  begin
    Close;
    SQL.Clear;
    SQL.Add('INSERT INTO CATEGORIA (CATEGORIA, DESCRICAO, COR, UUID) VALUES (:cat, :desc, :cor, :uuid)');
    ParamByName('cat').AsString := FInstance.ObterDTO.Categoria;
    ParamByName('desc').AsString := FInstance.ObterDTO.Descricao;
    ParamByName('cor').AsString := FInstance.ObterDTO.Cor;
    ParamByName('uuid').AsString := TPublicID.New.NovaChave
      (FInstance.ObterDTO.Categoria);
    ExecSQL;
  end;
end;

constructor TDCategoria.Create(aObject: TMCategoria);
begin
  FInstance := aObject;
  Query := TQuery.Create;
end;

destructor TDCategoria.Destroy;
begin

  inherited;
end;

procedure TDCategoria.Editar;
begin
  with Query.ObterQuery do
  begin
    Close;
    SQL.Clear;
    SQL.Add('UPDATE CATEGORIA SET CATEGORIA = :cat, DESCRICAO = :desc, COR = :cor WHERE ID = :id');
    ParamByName('cat').AsString := FInstance.ObterDTO.Categoria;
    ParamByName('desc').AsString := FInstance.ObterDTO.Descricao;
    ParamByName('cor').AsString := FInstance.ObterDTO.Cor;
    ParamByName('id').asInteger := FInstance.ObterDTO.ID;
    ExecSQL;
  end;
end;

procedure TDCategoria.ObterCategoria(aUUID: String);
begin
  FInstance.ObterDTO.Data(Query.ExecutarQuery('SELECT * FROM CATEGORIA WHERE UUID = ' + QuotedStr(aUUID)));
end;

function TDCategoria.ObterNumCategoria: Integer;
begin
 Result := Query.ExecutarQuery('SELECT COUNT(c.ID) FROM CATEGORIA c').FieldByName('COUNT').AsInteger;
end;

procedure TDCategoria.ObterTodasCategorias;
begin
  FInstance.ObterDTO.Data(Query.ExecutarQuery('SELECT * FROM CATEGORIA'));
end;

procedure TDCategoria.Remover;
begin
   with Query.ObterQuery do
  begin
    Close;
    SQL.Clear;
    SQL.Add('DELETE FROM CATEGORIA WHERE ID = :id');
    ParamByName('id').asInteger := FInstance.ObterDTO.ID;
    ExecSQL;
  end;
end;

end.
