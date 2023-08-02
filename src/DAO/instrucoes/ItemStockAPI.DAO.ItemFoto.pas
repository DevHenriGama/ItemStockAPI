unit ItemStockAPI.DAO.ItemFoto;

interface

uses
  ItemStockAPI.Model.ItemFoto, ItemStockAPI.DAO.Interfaces;

type
  TDItemFoto = class(TInterfacedObject, IDItemFoto)
  private
    FInstance: TMItemFoto;
  public
    constructor Create(aObject: TMItemFoto);
    destructor Destroy; override;
    procedure Adicionar;
    procedure Remover;
    procedure ObterFotosItem(aUUIDItem: String);
  end;

implementation

{ TDItemFoto }

procedure TDItemFoto.Adicionar;
begin

end;

constructor TDItemFoto.Create(aObject: TMItemFoto);
begin
  FInstance := aObject;
end;

destructor TDItemFoto.Destroy;
begin

  inherited;
end;

procedure TDItemFoto.ObterFotosItem(aUUIDItem: String);
begin

end;

procedure TDItemFoto.Remover;
begin

end;

end.
