unit ItemStockAPI.DTO.Container;

interface

uses
  ItemStockAPI.DTO.Interfaces, Data.DB;

type
  TContainerDTO = class(TInterfacedObject, IContainerDTO)
  private
    FID: Integer;
    FNumero: Integer;
    FDescricao: String;
    FUUID : String;
    FData: TDataset;
  public
    class function New: IContainerDTO;
    constructor Create;
    destructor Destroy; override;
    function ID(aID: Integer): IContainerDTO; overload;
    function ID: Integer; overload;
    function UUID(aUUID: String): IContainerDTO; overload;
    function UUID: String; overload;
    function Numero(aNumero: Integer): IContainerDTO; overload;
    function Numero: Integer; overload;
    function Descricao(aDescricao: String): IContainerDTO; overload;
    function Descricao: String; overload;
    function Data(aData: TDataset): IContainerDTO; overload;
    function Data: TDataset; overload;
  end;

implementation

{ TContainerDTO }

constructor TContainerDTO.Create;
begin
  FData := TDataset.Create(nil);
end;

function TContainerDTO.Data: TDataset;
begin
  Result := FData;
end;

function TContainerDTO.Data(aData: TDataset): IContainerDTO;
begin
  Result := Self;
  FData := aData;
end;

function TContainerDTO.Descricao(aDescricao: String): IContainerDTO;
begin
  Result := Self;
  FDescricao := aDescricao;
end;

function TContainerDTO.Descricao: String;
begin
  Result := FDescricao;
end;

destructor TContainerDTO.Destroy;
begin
  FData.Free;
  inherited;
end;

function TContainerDTO.ID: Integer;
begin
  Result := FID;
end;

function TContainerDTO.ID(aID: Integer): IContainerDTO;
begin
  Result := Self;
  FID := aID;
end;

class function TContainerDTO.New: IContainerDTO;
begin
  Result := TContainerDTO.Create;
end;

function TContainerDTO.Numero(aNumero: Integer): IContainerDTO;
begin
  Result := Self;
  FNumero := aNumero;
end;

function TContainerDTO.Numero: Integer;
begin
  Result := FNumero;
end;

function TContainerDTO.UUID: String;
begin
Result := FUUID;
end;

function TContainerDTO.UUID(aUUID: String): IContainerDTO;
begin
 Result := Self;
 FUUID := aUUID;
end;

end.
