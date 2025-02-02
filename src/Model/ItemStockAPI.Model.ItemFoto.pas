unit ItemStockAPI.Model.ItemFoto;

interface

uses
  ItemStockAPI.DTO.Interfaces, ItemStockAPI.Model.Interfaces,
  ItemStockAPI.DAO.Interfaces;

type
  TMItemFoto = class(TInterfacedObject, IMItemFoto)
  private
    FInstance: IItemFotoDTO;
    FDAO: IDItemFoto;
  public
    constructor Create(aObject: IItemFotoDTO);
    destructor Destroy; override;
    procedure Adicionar;
    procedure Remover;
    procedure ObterFotosItem(aUUIDItem: String);
    function ObterDTO: IItemFotoDTO;
  end;

implementation

uses
  ItemStockAPI.DAO.ItemFoto, ItemStockAPI.Model.GerenciarFotos;

{ TMItemFoto }

procedure TMItemFoto.Adicionar;
begin
  TGerenciarFotos.New(FInstance). SalvarFoto;
  FDAO.Adicionar;
end;

constructor TMItemFoto.Create(aObject: IItemFotoDTO);
begin
  FInstance := aObject;
  FDAO := TDItemFoto.Create(Self);
end;

destructor TMItemFoto.Destroy;
begin

  inherited;
end;

function TMItemFoto.ObterDTO: IItemFotoDTO;
begin
  Result := FInstance;
end;

procedure TMItemFoto.ObterFotosItem(aUUIDItem: String);
begin
  FDAO.ObterFotosItem(aUUIDItem);
end;

procedure TMItemFoto.Remover;
begin
  TGerenciarFotos.New(FInstance).DeletarFoto;
  FDAO.Remover;
end;

end.
