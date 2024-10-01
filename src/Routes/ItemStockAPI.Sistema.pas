unit ItemStockAPI.Sistema;

interface

type

  TRotasSistema = class

  private

  public
  class procedure Routes;
  end;

implementation

uses
  Horse;

{ TRotasSistema }

procedure onStatus(aReq : THorseRequest; aRes : THorseResponse);
begin
  aRes.Status(200);
end;

class procedure TRotasSistema.Routes;
begin
 THorse.Group.Prefix('/sistema').Get('/status',onStatus);
end;

end.
