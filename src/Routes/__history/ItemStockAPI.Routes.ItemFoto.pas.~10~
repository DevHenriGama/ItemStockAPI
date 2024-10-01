unit ItemStockAPI.Routes.ItemFoto;

interface

type
  TItemFotoRota = class

  public
    class procedure Routes;
  end;

implementation

uses
  Horse,
  Dataset.Serialize,
  ItemStockAPI.DTO.Interfaces,
  ItemStockAPI.DTO.ItemFoto,
  ItemStockAPI.Controller.ItemFoto,
  System.JSON, System.Classes;

{ TItemFotoRota }

procedure OnObterTodas(aReq: THorseRequest; aRes: THorseResponse);
var
  aDTO: IItemFotoDTO;
begin
  aDTO := TItemFotoDTO.Create;

  try
    TCItemFoto.New(aDTO).ObterFotosItem(aReq.Params.Field('uuid').AsString);

    aRes.Send<TJSONArray>(aDTO.Data.ToJSONArray).Status(200);
  except
    aRes.Status(500);
  end;
end;

procedure OnAdicionar(aReq: THorseRequest; aRes: THorseResponse);
var
  LStream: TStream;
  aDTO: IItemFotoDTO;
begin
  aDTO := TItemFotoDTO.Create;

  try
    if aReq.ContentFields.Field('picture').AsStream <> nil then begin
      LStream := aReq.ContentFields.Field('picture').AsStream;
      aDTO.Stream(LStream);
    end;

    TCItemFoto.New(aDTO.Deserialize(aReq.ContentFields.Field('json').AsString))
      .Adicionar;

    aRes.Status(201);

  except
    aRes.Status(500);
  end;
end;

procedure OnRemover(aReq: THorseRequest; aRes: THorseResponse);
var
  aDTO: IItemFotoDTO;
begin
  aDTO := TItemFotoDTO.Create;
  try
    TCItemFoto.New(aDTO.Deserialize(aReq.Body)).Remover;
    aRes.Status(204);
  except
    aRes.Status(500);
  end;
end;

class procedure TItemFotoRota.Routes;
begin
  THorse.Group.Prefix('/foto').Get('/:uuid', OnObterTodas).Post('', OnAdicionar)
    .Delete('', OnRemover);
end;

end.
