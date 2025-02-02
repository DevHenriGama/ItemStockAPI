unit ItemStockAPI.DAO.Estado;

interface

uses
  ItemStockAPI.DAO.Interfaces,
  ItemStockAPI.Model.Estado;

type
  TDEstado = class(TInterfacedObject, IDEstado)
  private
    FInstance: TMEstado;
    Query : IQuery;
  public
    constructor Create(aObject: TMEstado);
    destructor Destroy; override;
    procedure ObterEstados;
  end;

implementation

uses
  ItemStockAPI.DAO.Query;

{ TDEstado }

constructor TDEstado.Create(aObject: TMEstado);
begin
  FInstance := aObject;
  Query := TQuery.Create;
end;

destructor TDEstado.Destroy;
begin

  inherited;
end;

procedure TDEstado.ObterEstados;
begin
 FInstance.ObterDTO.Data(Query.ExecutarQuery('SELECT * FROM ESTADO'));
end;

end.
