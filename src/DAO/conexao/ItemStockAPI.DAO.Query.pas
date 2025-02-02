unit ItemStockAPI.DAO.Query;

interface

uses
   FireDAC.Comp.Client, ItemStockAPI.DAO.Interfaces;

type
  TQuery = class(TInterfacedObject, IQuery)
  private
    FQuery: TFDQuery;
    FConexao : IConexao;
  public
    class function New: IQuery;
    constructor Create;
    destructor Destroy; override;
    function ExecutarQuery(aSQL: String): TFDQuery;
    function ObterQuery: TFDQuery;
  end;

implementation

uses
  ItemStockAPI.DAO.Conexao;

{ TQuery }

constructor TQuery.Create;
begin
  FQuery := TFDQuery.Create(nil);
  FConexao := TConexao.Create;
  FQuery.Connection := FConexao.Conexao;
end;

destructor TQuery.Destroy;
begin
  FQuery.Free;
  inherited;
end;

function TQuery.ExecutarQuery(aSQL: String): TFDQuery;
begin
  with FQuery do
  begin
    Close;
    SQL.Clear;
    SQL.Add(aSQL);
    Open;
  end;
  Result := FQuery;
end;

class function TQuery.New: IQuery;
begin
  Result := TQuery.Create;
end;

function TQuery.ObterQuery: TFDQuery;
begin
  Result := FQuery;
end;

end.
