unit ItemStockAPI.Routes.Item;

interface

type
  TItemRotas = class

  public
    class procedure Routes;
  end;

implementation

uses
  Horse,
  ItemStockAPI.DTO.Interfaces,
  ItemStockAPI.DTO.Item,
  ItemStockAPI.Controller.Item,
  Dataset.Serialize,
  System.JSON, System.SysUtils;

{ TItemRotas }

procedure OnRemover(aReq: THorseRequest; aRes: THorseResponse);
var
  aDTO: IItemDTO;
begin
  aDTO := TITemDTO.Create;
  try
    aDTO.ID(aReq.Params.Field('id').AsInteger);

    TCItem.New(aDTO).Remover;
    aRes.Status(204);
  except

  end;
end;

procedure OnAdicionar(aReq: THorseRequest; aRes: THorseResponse);
var
  aDTO: IItemDTO;
begin
  aDTO := TITemDTO.Create;
  try
    TCItem.New(aDTO.Deserialize(aReq.Body)).Adicionar;

    aRes.Status(201);
  except
    aRes.Status(500);
  end;
end;

procedure OnEditar(aReq: THorseRequest; aRes: THorseResponse);
var
  aDTO: IItemDTO;
begin
  aDTO := TITemDTO.Create;
  try
    TCItem.New(aDTO.Deserialize(aReq.Body)).Editar;

    aRes.Status(200);
  except
   aRes.Status(500);
  end;
end;

procedure OnObterDados(aReq: THorseRequest; aRes: THorseResponse);
var
  aDTO: IItemDTO;
begin
  aDTO := TITemDTO.Create;
  try
   TCItem.New(aDTO).ObterDadosItem(aReq.Params.Field('uuid').AsString);

   aRes.Send<TJSONObject>(aDTO.Data.ToJSONObject).Status(200);
  except
   aRes.Status(500);
  end;
end;

procedure OnPesquisar(aReq: THorseRequest; aRes: THorseResponse);
var
  aDTO: IItemDTO;
begin
  aDTO := TITemDTO.Create;
  try
    TCItem.New(aDTO).PesquisarItem(aReq.Params.Field('key').AsString);

    aRes.Send<TJSONArray>(aDTO.Data.ToJSONArray).Status(200);
  except
    aRes.Status(500);
  end;
end;

procedure OnObterTodos(aReq: THorseRequest; aRes: THorseResponse);
var
  aDTO: IItemDTO;
begin
  aDTO := TITemDTO.Create;
  try
   TCItem.New(aDTO).ObterTodos;

   aRes.Send<TJSONArray>(aDTO.Data.ToJSONArray).Status(200);

  except
   aRes.Status(500);
  end;
end;

procedure OnItemContainer(aReq: THorseRequest; aRes: THorseResponse);
var
  aDTO: IItemDTO;
begin
  aDTO := TITemDTO.Create;
  try
   TCItem.New(aDTO).ListarItemContainer(aReq.Params.Field('uuid').AsString);

   aRes.Send<TJSONArray>(aDTO.Data.ToJSONArray).Status(200);
  except
   aRes.Status(500);
  end;
end;

procedure onQuantidade(aReq: THorseRequest; aRes: THorseResponse);
var
  aDTO: IItemDTO;
begin
  aDTO := TITemDTO.Create;
  try
   aRes.Send('{"quantidade": '+ IntToStr(TCItem.New(nil).ObterQuantidade)+'}').Status(200);
  except
   aRes.Status(500);
  end;
end;

class procedure TItemRotas.Routes;
begin
  Thorse.Group.Prefix('/item').Post('', OnAdicionar).Put('', OnEditar)
    .Delete('/:id', OnRemover).Get('/:uuid', OnObterDados)
    .Get('/buscar/:key', OnPesquisar).Get('', OnObterTodos)
    .Get('/container/:uuid', OnItemContainer).Get('/quantidade', onQuantidade);
end;

end.
