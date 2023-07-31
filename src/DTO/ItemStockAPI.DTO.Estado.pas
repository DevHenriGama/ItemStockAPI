unit ItemStockAPI.DTO.Estado;

interface

uses
  ItemStockAPI.DTO.Interfaces, Data.DB;

type
TEstadoDTO = class(TInterfacedObject,IEstadoDTO)
  private
    FData : TDataset;
  public
  class function New : IEstadoDTO;
  constructor Create;
  destructor Destroy;override;
  function Data(aData : TDataSet) : IEstadoDTO; overload;
  function Data : TDataSet;overload;
end;

implementation

{ TEstadoDTO }

constructor TEstadoDTO.Create;
begin
 FData := TDataSet.Create(nil);
end;

function TEstadoDTO.Data: TDataSet;
begin
Result :=FData;
end;

function TEstadoDTO.Data(aData: TDataSet): IEstadoDTO;
begin
 Result := Self;
 FData := aData;
end;

destructor TEstadoDTO.Destroy;
begin

  inherited;
end;

class function TEstadoDTO.New: IEstadoDTO;
begin
  Result := TEstadoDTO.Create;
end;

end.
