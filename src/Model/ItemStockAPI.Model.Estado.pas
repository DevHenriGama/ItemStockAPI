unit ItemStockAPI.Model.Estado;

interface

uses
  ItemStockAPI.DTO.Interfaces,
  ItemStockAPI.Model.Interfaces,
  ItemStockAPI.DAO.Interfaces;

type
  TMEstado = class(TInterfacedObject, IMEstado)
  private
    FDTO: IEstadoDTO;
    FDAO: IDEstado;
  public
    constructor Create(aObject: IEstadoDTO);
    destructor Destroy; override;
    function ObterDTO: IEstadoDTO;
    procedure ObterEstados;
  end;

implementation

uses
  ItemStockAPI.DAO.Estado;

{ TMEstado }

constructor TMEstado.Create(aObject: IEstadoDTO);
begin
  FDTO := aObject;
  FDAO := TDEstado.Create(Self);
end;

destructor TMEstado.Destroy;
begin

  inherited;
end;

function TMEstado.ObterDTO: IEstadoDTO;
begin
  Result := FDTO;
end;

procedure TMEstado.ObterEstados;
begin
  FDAO.ObterEstados;
end;

end.
