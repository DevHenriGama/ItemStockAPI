unit ItemStockAPI.DTO.ItemFoto;

interface

uses
  ItemStockAPI.DTO.Interfaces, System.Classes, Data.DB;

type
  TItemFotoDTO = class(TInterfacedObject, IItemFotoDTO)
  private
    FID: Integer;
    FFotoPath: String;
    FFotoStream: TStream;
    FIDItem: Integer;
    FData: TDataset;
    FLink: String;
  public
    class function New: IItemFotoDTO;
    constructor Create;
    destructor Destroy; override;
    function ID(aID: Integer): IItemFotoDTO; overload;
    function ID: Integer; overload;
    function CaminhoArquivo(aPath: String): IItemFotoDTO; overload;
    function CaminhoArquivo: String; overload;
    function LinkFoto(aPath: String): IItemFotoDTO; overload;
    function LinkFoto: String; overload;
    function Stream(aStream: TStream): IItemFotoDTO; overload;
    function Stream: TStream; overload;
    function IDItem(aID: Integer): IItemFotoDTO; overload;
    function IDItem: Integer; overload;
    function Data(aData: TDataset): IItemFotoDTO; overload;
    function Data: TDataset; overload;
    function Deserialize(aJSON: String): IItemFotoDTO;
  end;

implementation

uses
  System.JSON;

{ TItemFotoDTO }

constructor TItemFotoDTO.Create;
begin
  FData := TDataset.Create(nil);
end;

function TItemFotoDTO.Data(aData: TDataset): IItemFotoDTO;
begin
  Result := Self;
  FData := aData;
end;

function TItemFotoDTO.Data: TDataset;
begin
  Result := FData;
end;

function TItemFotoDTO.Deserialize(aJSON: String): IItemFotoDTO;
var
  JObj: TJSONObject;
begin
  Result := Self;

  JObj := TJSONObject.ParseJSONValue(aJSON) as TJSONObject;

  with JObj do
  begin
    TryGetValue<Integer>('id_item', FIDItem);
    TryGetValue<Integer>('id', FID);
    TryGetValue<String>('link', FLink);
    TryGetValue<String>('file_path', FFotoPath);
  end;

end;

destructor TItemFotoDTO.Destroy;
begin

  inherited;
end;

function TItemFotoDTO.ID: Integer;
begin
  Result := FID;
end;

function TItemFotoDTO.ID(aID: Integer): IItemFotoDTO;
begin
  Result := Self;
  FID := aID;
end;

function TItemFotoDTO.IDItem: Integer;
begin
  Result := FIDItem;
end;

function TItemFotoDTO.LinkFoto: String;
begin
  Result := FLink;
end;

function TItemFotoDTO.LinkFoto(aPath: String): IItemFotoDTO;
begin
  Result := Self;
  FLink := aPath;
end;

function TItemFotoDTO.IDItem(aID: Integer): IItemFotoDTO;
begin
  Result := Self;
  FIDItem := aID;
end;

class function TItemFotoDTO.New: IItemFotoDTO;
begin
  Result := TItemFotoDTO.Create;
end;

function TItemFotoDTO.CaminhoArquivo: String;
begin
  Result := FFotoPath;
end;

function TItemFotoDTO.CaminhoArquivo(aPath: String): IItemFotoDTO;
begin
  Result := Self;
  FFotoPath := aPath;
end;

function TItemFotoDTO.Stream(aStream: TStream): IItemFotoDTO;
begin
  Result := Self;
  FFotoStream := aStream;
end;

function TItemFotoDTO.Stream: TStream;
begin
  Result := FFotoStream;
end;

end.
