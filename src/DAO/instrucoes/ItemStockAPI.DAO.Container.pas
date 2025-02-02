unit ItemStockAPI.DAO.Container;

interface

uses
  ItemStockAPI.DAO.Interfaces, ItemStockAPI.Model.Container;

type
  TDContainer = class(TInterfacedObject, IDContainer)
  private
    FInstance: TMContainer;
    Query : IQuery;
  public
    constructor Create(aObject: TMContainer);
    destructor Destroy; override;
    procedure Adicionar;
    procedure Editar;
    procedure Deletar;
    procedure ObterDadosContainer(aUUID: String);
    procedure ObterTodos;
    function ObterNumContainer : Integer;
  end;

implementation

uses
  ItemStockAPI.DAO.Query,
  ItemStockAPI.Model.PublicID,
  System.Classes,
  System.SysUtils;

{ TDContainer }

procedure TDContainer.Adicionar;
begin
  with Query.ObterQuery do begin
    Close;
    SQL.Clear;
    SQL.Add('INSERT INTO CONTAINER (NUMERO , DESCRICAO, UUID) VALUES (:num, :desc, :uuid)');
    ParamByName('num').AsInteger := FInstance.ObterDTO.Numero;
    ParamByName('desc').AsString := FInstance.ObterDTO.Descricao;
    ParamByName('uuid').AsString := TPublicID.New.NovaChave(IntToStr(FInstance.ObterDTO.Numero));
    ExecSQL;
  end;
end;

constructor TDContainer.Create(aObject: TMContainer);
begin
  FInstance := aObject;
  Query := TQuery.Create;
end;

procedure TDContainer.Deletar;
begin
   with Query.ObterQuery do begin
    Close;
    SQL.Clear;
    SQL.Add('DELETE FROM CONTAINER WHERE ID = :id');
    ParamByName('id').AsInteger := FInstance.ObterDTO.ID;
    ExecSQL;
  end;
end;

destructor TDContainer.Destroy;
begin

  inherited;
end;

procedure TDContainer.Editar;
begin
   with Query.ObterQuery do begin
    Close;
    SQL.Clear;
    SQL.Add('UPDATE CONTAINER SET NUMERO = :num , DESCRICAO = :desc WHERE ID = :id');
    ParamByName('num').AsInteger := FInstance.ObterDTO.Numero;
    ParamByName('desc').AsString := FInstance.ObterDTO.Descricao;
    ParamByName('id').AsInteger := FInstance.ObterDTO.ID;
    ExecSQL;
  end;
end;

procedure TDContainer.ObterDadosContainer(aUUID: String);
var aSQL : String;
begin
 aSQL := 'SELECT * FROM CONTAINER c  WHERE UUID = ' + QuotedStr(aUUID);

 FInstance.ObterDTO.Data(Query.ExecutarQuery(aSQL));
end;

function TDContainer.ObterNumContainer: Integer;
begin
 Result := Query.ExecutarQuery('SELECT COUNT(C.ID)  FROM CONTAINER c ').FieldByName('COUNT').AsInteger;
end;

procedure TDContainer.ObterTodos;
begin
 FInstance.ObterDTO.Data(Query.ExecutarQuery('SELECT * FROM CONTAINER'));
end;

end.
