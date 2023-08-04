unit ItemStockAPI.DAO.Item;

interface

uses
  ItemStockAPI.Model.Item,
  ItemStockAPI.DAO.Interfaces;

type
  TDItem = class(TInterfacedObject, IDItem)
  private
    FInstance: TMItem;
    Query: IQuery;
  public
    constructor Create(aObject: TMItem);
    destructor Destroy; override;
    procedure Adicionar;
    procedure Remover;
    procedure Editar;
    procedure PesquisarItem(aChave: String);
    procedure ObterDadosItem(aUUID: String);
    procedure ListarItemContainer(aUUIDContainer: String);
    procedure ObterTodos;
    function ObterQuantidade: Integer;
  end;

implementation

uses
  ItemStockAPI.DAO.Query, System.SysUtils, ItemStockAPI.Model.PublicID;

{ TDItem }

procedure TDItem.Adicionar;
begin
  with Query.ObterQuery do
  begin
    Close;
    SQL.Clear;
    SQL.Add('INSERT INTO ITEM (NOME, ID_CONTAINER, ID_ESTADO, DESCRICAO, UUID) VALUES (:nome, :cont, :est, :desc, :uid)');
    ParamByName('nome').AsString := FInstance.ObterDTO.Nome;
    ParamByName('cont').AsInteger := FInstance.ObterDTO.IDContainer;
    ParamByName('est').AsInteger := FInstance.ObterDTO.IDEstado;
    ParamByName('desc').AsString := FInstance.ObterDTO.Descricao;
    ParamByName('uid').AsString := TPublicID.New.NovaChave(FInstance.ObterDTO.Nome);
    ExecSQL;
  end;
end;

constructor TDItem.Create(aObject: TMItem);
begin
  FInstance := aObject;
  Query := TQuery.Create;
end;

destructor TDItem.Destroy;
begin

  inherited;
end;

procedure TDItem.Editar;
begin
  with Query.ObterQuery do
  begin
    Close;
    SQL.Clear;
    SQL.Add('UPDATE ITEM SET NOME = :nome, ID_CONTAINER = :cont, ID_ESTADO = :est, DESCRICAO = :desc WHERE ID = :id');
    ParamByName('nome').AsString := FInstance.ObterDTO.Nome;
    ParamByName('cont').AsInteger := FInstance.ObterDTO.IDContainer;
    ParamByName('est').AsInteger := FInstance.ObterDTO.IDEstado;
    ParamByName('desc').AsString := FInstance.ObterDTO.Descricao;
    ParamByName('id').AsInteger := FInstance.ObterDTO.ID;
    ExecSQL;
  end;
end;

procedure TDItem.ListarItemContainer(aUUIDContainer: String);
var
  aSQL: String;
begin
  aSQL := 'SELECT i.ID , i.NOME ,i.ID_CONTAINER ,i.ID_ESTADO ,i.DESCRICAO , i.UUID'
    + ' FROM ITEM i' + ' JOIN CONTAINER c ON i.ID_CONTAINER = c.ID' +
    ' WHERE c.UUID  = ' + QuotedStr(aUUIDContainer);

  FInstance.ObterDTO.Data(Query.ExecutarQuery(aSQL));
end;

procedure TDItem.ObterDadosItem(aUUID: String);
var
  aSQL: String;
begin
  aSQL := 'SELECT * FROM ITEM WHERE UUID = ' + QuotedStr(aUUID);

  FInstance.ObterDTO.Data(Query.ExecutarQuery(aSQL));
end;

function TDItem.ObterQuantidade: Integer;
var
  aSQL: String;
begin
  aSQL := 'SELECT COUNT(i.ID) FROM ITEM i ';
  Result := Query.ExecutarQuery(aSQL).FieldByName('COUNT').AsInteger;
end;

procedure TDItem.ObterTodos;
begin
  FInstance.ObterDTO.Data(Query.ExecutarQuery('SELECT * FROM ITEM'));
end;

procedure TDItem.PesquisarItem(aChave: String);
var
  aSQL: String;
begin
  aSQL := 'SELECT * FROM ITEM i' + ' WHERE i.NOME  LIKE ' +
    QuotedStr('%' + aChave + '%');

  FInstance.ObterDTO.Data(Query.ExecutarQuery(aSQL));
end;

procedure TDItem.Remover;
begin
  with Query.ObterQuery do
  begin
    Close;
    SQL.Clear;
    SQL.Add('DELETE FROM ITEM WHERE ID = :id');
    ParamByName('id').AsInteger := FInstance.ObterDTO.ID;
    ExecSQL;
  end;
end;

end.
