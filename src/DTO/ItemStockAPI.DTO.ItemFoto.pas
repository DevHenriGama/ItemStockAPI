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
  public
    class function New: IItemFotoDTO;
    constructor Create;
    destructor Destroy; override;
    function ID(aID: Integer): IItemFotoDTO; overload;
    function ID: Integer; overload;
    function Path(aPath: String): IItemFotoDTO; overload;
    function Path: String; overload;
    function Stream(aStream: TStream): IItemFotoDTO; overload;
    function Stream: TStream; overload;
    function IDItem(aID: Integer): IItemFotoDTO; overload;
    function IDItem: Integer; overload;
    function Data(aData: TDataset): IItemFotoDTO; overload;
    function Data: TDataset; overload;
  end;

implementation

{ TItemFotoDTO }

constructor TItemFotoDTO.Create;
begin
FData := TDataSet.Create(nil);
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

destructor TItemFotoDTO.Destroy;
begin
  FData.Free;
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

function TItemFotoDTO.IDItem(aID: Integer): IItemFotoDTO;
begin
  Result := Self;
  FIDItem := aID;
end;

class function TItemFotoDTO.New: IItemFotoDTO;
begin
  Result := TItemFotoDTO.Create;
end;

function TItemFotoDTO.Path: String;
begin
 Result := FFotoPath;
end;

function TItemFotoDTO.Path(aPath: String): IItemFotoDTO;
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
