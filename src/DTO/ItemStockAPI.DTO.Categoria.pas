unit ItemStockAPI.DTO.Categoria;

interface

uses
  ItemStockAPI.DTO.Interfaces, Data.DB;

type
  TCategoriaDTO = class(TInterfacedObject, ICategoriaDTO)
  private
    FID: Integer;
    FCategoria: String;
    FDescricao: String;
    FUUID: String;
    FData: TDataset;
    FCor: String;
  public
    class function New: ICategoriaDTO;
    constructor Create;
    destructor Destroy; override;
    function ID(aID: Integer): ICategoriaDTO; overload;
    function ID: Integer; overload;
    function UUID(aUUID: String): ICategoriaDTO; overload;
    function UUID: String; overload;
    function Categoria(aCategoria: String): ICategoriaDTO; overload;
    function Categoria: String; overload;
    function Descricao(aDescricao: String): ICategoriaDTO; overload;
    function Descricao: String; overload;
    function Data(aData: TDataset): ICategoriaDTO; overload;
    function Data: TDataset; overload;
    function Cor(aCor: String): ICategoriaDTO; overload;
    function Cor: String; overload;
    function Deserialize(aJSON  : String) : ICategoriaDTO;
  end;

implementation

uses
  System.JSON;

{ TCategoriaDTO }

function TCategoriaDTO.Categoria: String;
begin
  Result := FCategoria;
end;

function TCategoriaDTO.Cor: String;
begin
Result := FCor;
end;

function TCategoriaDTO.Cor(aCor: String): ICategoriaDTO;
begin
Result := Self;
FCor := aCor;
end;

function TCategoriaDTO.Categoria(aCategoria: String): ICategoriaDTO;
begin
  Result := Self;
  FCategoria := aCategoria;
end;

constructor TCategoriaDTO.Create;
begin
  FData := TDataset.Create(nil);
end;

function TCategoriaDTO.Data: TDataset;
begin
  Result := FData;
end;

function TCategoriaDTO.Data(aData: TDataset): ICategoriaDTO;
begin
  Result := Self;
  FData := aData;
end;

function TCategoriaDTO.Descricao: String;
begin
  Result := FDescricao;
end;

function TCategoriaDTO.Deserialize(aJSON: String): ICategoriaDTO;
var JObj : TJSONObject;
begin
  Result := Self;

  JObj := TJSONObject.ParseJSONValue(aJSON) as TJSONObject;

  with JObj do begin
    TryGetValue<Integer>('id',FID);
    TryGetValue<String>('categoria',FCategoria);
    TryGetValue<String>('cor',FCor);
    TryGetValue<String>('descricao',FDescricao);
    TryGetValue<String>('uuid',FUUID);
  end;
end;

function TCategoriaDTO.Descricao(aDescricao: String): ICategoriaDTO;
begin
  Result := Self;
  FDescricao := aDescricao;
end;

destructor TCategoriaDTO.Destroy;
begin

  inherited;
end;

function TCategoriaDTO.ID(aID: Integer): ICategoriaDTO;
begin
  Result := Self;
  FID := aID;
end;

function TCategoriaDTO.ID: Integer;
begin
  Result := FID;
end;

class function TCategoriaDTO.New: ICategoriaDTO;
begin
  Result := TCategoriaDTO.Create;
end;

function TCategoriaDTO.UUID: String;
begin
  Result := FUUID;
end;

function TCategoriaDTO.UUID(aUUID: String): ICategoriaDTO;
begin
  Result := Self;
  FUUID := aUUID;
end;

end.
