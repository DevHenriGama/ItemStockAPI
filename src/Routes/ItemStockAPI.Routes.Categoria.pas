unit ItemStockAPI.Routes.Categoria;

interface

type
  TCategoriaRotas = class

  public
    class procedure Routes;
  end;

implementation

uses
  Horse,
  Dataset.Serialize,
  ItemStockAPI.DTO.Interfaces,
  ItemStockAPI.DTO.Categoria,
  ItemStockAPI.Controller.Categoria,
  System.JSON, System.SysUtils;

{ TCategoriaRotas }

procedure OnObterTodos(aReq: THorseRequest; aRes: THorseResponse);
var
  aDTO: ICategoriaDTO;
begin
  aDTO := TCategoriaDTO.Create;
  try
    TCCategoria.New(aDTO).ObterTodasCategorias;

    aRes.Send<TJSONArray>(aDTO.Data.ToJSONArray).Status(200);
  except
    aRes.Status(500);
  end;
end;

procedure OnAdicionar(aReq: THorseRequest; aRes: THorseResponse);
var
  aDTO: ICategoriaDTO;
begin
  aDTO := TCategoriaDTO.Create;
  try
    TCCategoria.New(aDTO.Deserialize(aReq.Body)).Adicionar;

    aRes.Status(201);
  except
    aRes.Status(500);
  end;
end;

procedure OnEditar(aReq: THorseRequest; aRes: THorseResponse);
var
  aDTO: ICategoriaDTO;
begin
  aDTO := TCategoriaDTO.Create;
  try
    TCCategoria.New(aDTO.Deserialize(aReq.Body)).Editar;

    aRes.Status(200);
  except
    aRes.Status(500);
  end;
end;

procedure OnRemover(aReq: THorseRequest; aRes: THorseResponse);
var
  aDTO: ICategoriaDTO;
begin
  aDTO := TCategoriaDTO.Create;
  try
    aDTO.ID(aReq.Params.Field('id').AsInteger);

    TCCategoria.New(aDTO).Remover;

    aRes.Status(204);
  except
    aRes.Status(500);
  end;
end;

procedure OnQuantidade(aReq: THorseRequest; aRes: THorseResponse);
begin
   try
    aRes.Send('{"quantidade":'+ IntToStr(TCCategoria.New(nil).ObterNumCategoria) +'}').Status(200);
   except
    aRes.Status(500);
   end;
end;

procedure OnObterDados(aReq: THorseRequest; aRes: THorseResponse);
var
  aDTO: ICategoriaDTO;
begin
  aDTO := TCategoriaDTO.Create;
  try
    TCCategoria.New(aDTO).ObterCategoria(aReq.Params.Field('uuid').AsString);

    aRes.Send<TJSONObject>(aDTO.Data.ToJSONObject).Status(200);
  except
    aRes.Status(500);
  end;
end;

class procedure TCategoriaRotas.Routes;
begin
  THorse
  .Group
  .Prefix('/categoria')
    .Post('', OnAdicionar)
    .Put('', OnEditar)
    .Delete('/:id', OnRemover)
    .Get('/quantidade', OnQuantidade)
    .Get('/:uuid', OnObterDados)
    .Get('', OnObterTodos);
end;

end.
