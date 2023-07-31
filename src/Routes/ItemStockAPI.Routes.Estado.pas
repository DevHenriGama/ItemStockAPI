unit ItemStockAPI.Routes.Estado;

interface

type

  TRoutesEstado = class

  public
    class procedure Routes;
  end;

implementation

uses
  Horse,
  Dataset.Serialize,
  System.JSON,
  ItemStockAPI.Controller.Interfaces,
  ItemStockAPI.Controller.Estado,
  ItemStockAPI.DTO.Interfaces,
  ItemStockAPI.DTO.Estado;

{ TRoutesEstado }

procedure onObterEstados(aReq: THorseRequest; aRes: THorseResponse);
var
  LDTO: IEstadoDTO;
begin
  LDTO := TEstadoDTO.Create;

  TCEstado.New(LDTO).ObterEstados;

  aRes.Status(200).Send<TJsonArray>(LDTO.Data.ToJSONArray);
end;

class procedure TRoutesEstado.Routes;
begin
  THorse.Group.Prefix('/estado').Get('', onObterEstados);
end;

end.
