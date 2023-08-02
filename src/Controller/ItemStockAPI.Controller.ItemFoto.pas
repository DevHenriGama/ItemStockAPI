unit ItemStockAPI.Controller.ItemFoto;

interface

uses
  ItemStockAPI.DTO.Interfaces, ItemStockAPI.Controller.Interfaces,
  ItemStockAPI.Model.Interfaces;

type
  TCItemFoto = class(TInterfacedObject, ICItemFoto)
  private
    FModel: IMItemFoto;
  public
    class function New(aObject: IItemFotoDTO): ICItemFoto;
    constructor Create(aObject: IItemFotoDTO);
    destructor Destroy; override;
    procedure Adicionar;
    procedure Remover;
    procedure ObterFotosItem(aUUIDItem: String);
  end;

implementation

uses
  ItemStockAPI.Model.ItemFoto;

{ TCItemFoto }

procedure TCItemFoto.Adicionar;
begin
  FModel.Adicionar;
end;

constructor TCItemFoto.Create(aObject: IItemFotoDTO);
begin
  FModel := TMItemFoto.Create(aObject);
end;

destructor TCItemFoto.Destroy;
begin

  inherited;
end;

class function TCItemFoto.New(aObject: IItemFotoDTO): ICItemFoto;
begin
  Result := TCItemFoto.Create(aObject);
end;

procedure TCItemFoto.ObterFotosItem(aUUIDItem: String);
begin
  FModel.ObterFotosItem(aUUIDItem);
end;

procedure TCItemFoto.Remover;
begin
  FModel.Remover;
end;

end.
