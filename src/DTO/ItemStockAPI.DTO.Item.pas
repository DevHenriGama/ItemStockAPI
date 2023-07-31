unit ItemStockAPI.DTO.Item;

interface

uses
  ItemStockAPI.DTO.Interfaces, Data.DB;

type
  TItemDTO = class(TInterfacedObject, IItemDTO)
  private
    FID: Integer;
    FUUID: String;
    FNome: String;
    FIDContainer: Integer;
    FIDEstado: Integer;
    FDescricao: String;
    FData: TDataSet;
  public
    class function New: IItemDTO;
    constructor Create;
    destructor Destroy; override;
    function ID(aID: Integer): IItemDTO; overload;
    function ID: Integer; overload;
    function UUID(aUUID: String): IItemDTO; overload;
    function UUID: String; overload;
    function Nome(aNome: String): IItemDTO; overload;
    function Nome: String; overload;
    function IDContainer(aID: Integer): IItemDTO; overload;
    function IDContainer: Integer; overload;
    function IDEstado(aID: Integer): IItemDTO; overload;
    function IDEstado: Integer; overload;
    function Descricao(aDescricao: String): IItemDTO; overload;
    function Descricao: String; overload;
    function Data(aDescricao: TDataSet): IItemDTO; overload;
    function Data: TDataSet; overload;
    function Deserialize(aJSON : String) : IItemDTO;
  end;

implementation

{ TItemDTO }

constructor TItemDTO.Create;
begin
 FData := TDataSet.Create(nil);
end;

function TItemDTO.Data: TDataSet;
begin
 Result := FData;
end;

function TItemDTO.Data(aDescricao: TDataSet): IItemDTO;
begin
Result := Self;
FData := aDescricao;
end;

function TItemDTO.Descricao(aDescricao: String): IItemDTO;
begin
 Result := Self;
 FDescricao := aDescricao;
end;

function TItemDTO.Descricao: String;
begin
Result := FDescricao;
end;

function TItemDTO.Deserialize(aJSON: String): IItemDTO;
begin

end;

destructor TItemDTO.Destroy;
begin
   FData.Free;
  inherited;
end;

function TItemDTO.ID: Integer;
begin
Result := FID;
end;

function TItemDTO.ID(aID: Integer): IItemDTO;
begin
Result := Self;
FID := aID;
end;

function TItemDTO.IDContainer(aID: Integer): IItemDTO;
begin
Result := Self;
FIDContainer := aID;
end;

function TItemDTO.IDContainer: Integer;
begin
 Result := FIDContainer;
end;

function TItemDTO.IDEstado: Integer;
begin
Result := FIDEstado;
end;

function TItemDTO.IDEstado(aID: Integer): IItemDTO;
begin
Result := Self;
FIDEstado := aID;
end;

class function TItemDTO.New: IItemDTO;
begin
  Result := TItemDTO.Create;
end;

function TItemDTO.Nome(aNome: String): IItemDTO;
begin
Result := Self;
FNome := aNome;
end;

function TItemDTO.Nome: String;
begin
Result := FNome;
end;

function TItemDTO.UUID: String;
begin
Result := FUUID;
end;

function TItemDTO.UUID(aUUID: String): IItemDTO;
begin
Result := Self;
FUUID := aUUID;
end;

end.
