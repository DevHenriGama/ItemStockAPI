unit ItemStockAPI.DAO.Conexao;

interface

uses
  FireDAC.Comp.Client,
  FireDAC.Phys.FB,
  FireDAC.DApt,
  FireDAC.Stan.Def,
  FireDAC.Stan.Async,
  ItemStockAPI.DAO.Interfaces;

type
TConexao = class(TInterfacedObject,IConexao)
  private
    FConexao : TFDConnection;
    function DatabasePath : String;
    procedure ConfigurarConexao;
  public
    class function New : IConexao;
    constructor Create;
    destructor Destroy;override;
    function Conexao: TFDConnection;
end;

implementation

uses
  System.SysUtils;

{ TConexao }

function TConexao.Conexao: TFDConnection;
begin
 Result := FConexao;
end;

procedure TConexao.ConfigurarConexao;
begin
  with FConexao do
  begin
    ConnectionName := 'FIREBIRD';
    Params.UserName := 'SYSDBA';
    Params.Password := 'masterkey';
    Params.DriverID := 'FB';
   Params.Database := DatabasePath;
    LoginPrompt := False;
  end;

end;

constructor TConexao.Create;
begin
 FConexao := TFDConnection.Create(nil);
 ConfigurarConexao;
end;

function TConexao.DatabasePath: String;
begin
//Result := ExtractFileDir(ParamStr(0)) + '/database/DATABASE.FDB';
Result := 'D:\Progamação\Projects\Extended\ItemStockV3.1\Project\API\src\DAO\database\DATABASE.FDB';
end;

destructor TConexao.Destroy;
begin
  FConexao.Free;
  inherited;
end;

class function TConexao.New: IConexao;
begin
  Result := TConexao.Create;
end;

end.
