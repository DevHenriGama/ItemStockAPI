unit ItemStockAPI.Controller.Estado;

interface

uses
  ItemStockAPI.DTO.Interfaces,
  ItemStockAPI.Controller.Interfaces,
  ItemStockAPI.Model.Interfaces;

type
  TCEstado = class(TInterfacedObject, ICEstado)
  private
    FModel: IMEstado;
  public
    class function New(aObject: IEstadoDTO): ICEstado;
    constructor Create(aObject: IEstadoDTO);
    destructor Destroy; override;
    procedure ObterEstados;
  end;

implementation

uses
  ItemStockAPI.Model.Estado;

{ TCEstado }

constructor TCEstado.Create(aObject: IEstadoDTO);
begin
  FModel := TMEstado.Create(aObject);
end;

destructor TCEstado.Destroy;
begin

  inherited;
end;

class function TCEstado.New(aObject: IEstadoDTO): ICEstado;
begin
  Result := TCEstado.Create(aObject);
end;

procedure TCEstado.ObterEstados;
begin
 FModel.ObterEstados;
end;

end.
