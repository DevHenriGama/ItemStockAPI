unit ItemStockAPI.Model.Container;

interface

uses
  ItemStockAPI.DTO.Interfaces,
  ItemStockAPI.Model.Interfaces,
  ItemStockAPI.DAO.Interfaces;

type
  TMContainer = class(TInterfacedObject, IMContainer)
  private
    DTO: IContainerDTO;
    FDAO: IDContainer;
  public
    constructor Create(aObject: IContainerDTO);
    destructor Destroy; override;
    function ObterDTO: IContainerDTO;
    procedure Adicionar;
    procedure Editar;
    procedure Deletar;
    procedure ObterDadosContainer(aUUID: String);
    procedure ObterTodos;
    function ObterNumContainer: Integer;
  end;

implementation

uses
  ItemStockAPI.DAO.Container;

{ TMContainer }

procedure TMContainer.Adicionar;
begin
  FDAO.Adicionar;
end;

constructor TMContainer.Create(aObject: IContainerDTO);
begin
  DTO := aObject;
  FDAO := TDContainer.Create(Self);
end;

procedure TMContainer.Deletar;
begin
  FDAO.Deletar;
end;

destructor TMContainer.Destroy;
begin

  inherited;
end;

procedure TMContainer.Editar;
begin
  FDAO.Editar;
end;

procedure TMContainer.ObterDadosContainer(aUUID: String);
begin
  FDAO.ObterDadosContainer(aUUID);
end;

function TMContainer.ObterDTO: IContainerDTO;
begin
  Result := DTO;
end;

function TMContainer.ObterNumContainer: Integer;
begin
   Result := FDAO.ObterNumContainer;
end;

procedure TMContainer.ObterTodos;
begin
  FDAO.ObterTodos;
end;

end.
