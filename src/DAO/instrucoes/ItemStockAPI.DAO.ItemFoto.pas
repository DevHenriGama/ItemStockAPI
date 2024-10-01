unit ItemStockAPI.DAO.ItemFoto;

interface

uses
  ItemStockAPI.Model.ItemFoto, ItemStockAPI.DAO.Interfaces;

type
  TDItemFoto = class(TInterfacedObject, IDItemFoto)
  private
    FInstance: TMItemFoto;
    Query: IQuery;
  public
    constructor Create(aObject: TMItemFoto);
    destructor Destroy; override;
    procedure Adicionar;
    procedure Remover;
    procedure ObterFotosItem(aUUIDItem: String);
    function ObterFotoPrincipal(aUUID : String) : String;
  end;

implementation

uses
  ItemStockAPI.DAO.Query, System.SysUtils, System.JSON;

{ TDItemFoto }

procedure TDItemFoto.Adicionar;
begin
  with Query.ObterQuery do
  begin
    Close;
    SQL.Clear;
    SQL.Add('INSERT INTO ITEM_FOTO (ID_ITEM, LINK, FILE_PATH) VALUES (:item, :link, :file)');
    ParamByName('item').AsInteger := FInstance.ObterDTO.IDItem;
    ParamByName('link').AsString := FInstance.ObterDTO.LinkFoto;
    ParamByName('file').AsString := FInstance.ObterDTO.CaminhoArquivo;
    ExecSQL;
  end;
end;

constructor TDItemFoto.Create(aObject: TMItemFoto);
begin
  FInstance := aObject;
  Query := TQuery.Create;
end;

destructor TDItemFoto.Destroy;
begin

  inherited;
end;

function TDItemFoto.ObterFotoPrincipal(aUUID: String): String;
var aSQL : String; joB : TJSONObject;
begin
 aSQL := 'SELECT FIRST 1 if1.LINK'+
         ' FROM ITEM_FOTO if1'+
         ' JOIN ITEM i ON i.ID = IF1.ID_ITEM'+
         ' WHERE i.UUID  = '+ QuotedStr(aUUID);

  joB := TJSONObject.Create;

  with Query.ObterQuery do begin
    Close;
    SQL.Clear;
    sql.Add(aSQL);
    Open;

    if RecordCount > 0 then begin
      joB.AddPair('LINK',FieldByName('LINK').AsString);
      Result := joB.ToString;
    end
    else
    begin
      Result := 'Not Found';
    end;

  end;
  joB.Free;
end;

procedure TDItemFoto.ObterFotosItem(aUUIDItem: String);
var
  aSQL: String;
begin
  aSQL := 'SELECT if2.ID , if2.ID_ITEM ,if2.LINK , if2.FILE_PATH' +
    ' FROM ITEM_FOTO if2' + ' JOIN ITEM i ON if2.ID_ITEM = i.ID' +
    ' WHERE i.UUID  = ' + QuotedStr(aUUIDItem);

  FInstance.ObterDTO.Data(Query.ExecutarQuery(aSQL));

end;

procedure TDItemFoto.Remover;
begin
  with Query.ObterQuery do
  begin
    Close;
    SQL.Clear;
    SQL.Add('DELETE FROM ITEM_FOTO WHERE ID = :id');
    ParamByName('id').AsInteger := FInstance.ObterDTO.ID;
    ExecSQL;
  end;
end;

end.
