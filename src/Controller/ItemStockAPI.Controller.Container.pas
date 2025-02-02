unit ItemStockAPI.Controller.Container;

interface

uses
  ItemStockAPI.DTO.Interfaces,
  ItemStockAPI.Controller.Interfaces,
  ItemStockAPI.Model.Interfaces;

type
TCContainer = class(TInterfacedObject,ICContainer)
  private
     FModel : IMContainer;
  public
  class function New(aObject : IContainerDTO) : ICContainer;
  constructor Create(aObject : IContainerDTO);
  destructor Destroy;override;
  procedure Adicionar;
  procedure Editar;
  procedure Deletar;
  procedure ObterDadosContainer(aUUID : String);
  procedure ObterTodos;
  function ObterNumContainer : Integer;
end;

implementation

uses
  ItemStockAPI.Model.Container;

{ TCContainer }

procedure TCContainer.Adicionar;
begin
FModel.Adicionar;
end;

constructor TCContainer.Create(aObject: IContainerDTO);
begin
  FModel := TMContainer.Create(aObject);
end;

procedure TCContainer.Deletar;
begin
 FModel.Deletar;
end;

destructor TCContainer.Destroy;
begin

  inherited;
end;

procedure TCContainer.Editar;
begin
 FModel.Editar;
end;

class function TCContainer.New(aObject : IContainerDTO): ICContainer;
begin
  Result := TCContainer.Create(aObject);
end;

procedure TCContainer.ObterDadosContainer(aUUID: String);
begin
  FModel.ObterDadosContainer(aUUID);
end;

function TCContainer.ObterNumContainer: Integer;
begin
Result := FModel.ObterNumContainer;
end;

procedure TCContainer.ObterTodos;
begin
FModel.ObterTodos;
end;

end.
