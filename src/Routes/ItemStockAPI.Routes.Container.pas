unit ItemStockAPI.Routes.Container;

interface

type
  TContainerRoutes = class

  public
    class procedure Routes;
  end;

implementation

uses
  Horse,
  ItemStockAPI.DTO.Interfaces,
  ItemStockAPI.DTO.Container,
  ItemStockAPI.Controller.Container,
  DataSet.Serialize,
  System.JSON, System.SysUtils;

{ TContainerRoutes }

procedure OnAdicionar(aReq: THorseRequest; aRes: THorseResponse);
var
  aDTO: IContainerDTO;
begin
  try
    aDTO := TContainerDTO.Create;

    TCContainer.New(aDTO.Deserialize(aReq.Body)).Adicionar;

    aRes.Status(201);
  except
    aRes.Status(500);
  end;
end;

procedure OnObterTodos(aReq: THorseRequest; aRes: THorseResponse);
var
  aDTO: IContainerDTO;
begin
  try
    aDTO := TContainerDTO.Create;

    TCContainer.New(aDTO).ObterTodos;

    aRes.Send<TJSONArray>(aDTO.Data.TOJSONArray).Status(200);
  except
    aRes.Status(500);
  end;
end;

procedure OnObterDados(aReq: THorseRequest; aRes: THorseResponse);
var
  aDTO: IContainerDTO;
begin
  try
    aDTO := TContainerDTO.Create;

    TCContainer.New(aDTO).ObterDadosContainer(aReq.Params.Field('uuid')
      .AsString);

    aRes.Send<TJSONObject>(aDTO.Data.ToJSONObject).Status(200);
  except
    aRes.Status(500);
  end;

end;

procedure onDeletar(aReq: THorseRequest; aRes: THorseResponse);
var
  aDTO: IContainerDTO;
begin
  try
    aDTO := TContainerDTO.Create;
    aDTO.ID(aReq.Params.Field('id').AsInteger);
    TCContainer.New(aDTO).Deletar;
    aRes.Status(204);
  except
    aRes.Status(500);
  end;
end;

procedure OnEditar(aReq: THorseRequest; aRes: THorseResponse);
var
  aDTO: IContainerDTO;
begin
  try
    aDTO := TContainerDTO.Create;

    TCContainer.New(aDTO.Deserialize(aReq.Body)).Editar;

    aRes.Status(200);
  except
    aRes.Status(500);
  end;
end;

procedure OnQuantidade(aReq: THorseRequest; aRes: THorseResponse);
begin
  try
    aRes.Send('{"quantidade": ' + IntToStr(TCContainer.New(nil)
      .ObterNumContainer) + '}');
  except
    aRes.Status(500);
  end;
end;

class procedure TContainerRoutes.Routes;
begin
  Thorse.Group.Prefix('/container')
    .Post('', OnAdicionar)
    .Get('', OnObterTodos)
    .Get('/:uuid', OnObterDados)
    .Delete('/:id', onDeletar)
    .Put('', OnEditar)
    .Get('/quantidade', OnQuantidade);
end;

end.
