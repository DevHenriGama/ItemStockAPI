unit ItemStockAPI.Model.PublicID;

interface

uses
  ItemStockAPI.Model.Interfaces;

type
  TPublicID = class(TInterfacedObject, IPublicID)

  private

  public
  class function New : IPublicID;
  function NovaChave(aDado : String) : String;
  end;

implementation

uses
  System.SysUtils,
  System.Hash;

{ TPublicID }

function TPublicID.NovaChave(aDado: String): String;
var
  LKey : String;
begin
 LKey := aDado + FormatDateTime('',Now);

 Result := THashSHA2.GetHashString(LKey);
end;

class function TPublicID.New: IPublicID;
begin
Result := TPublicID.Create;
end;

end.
