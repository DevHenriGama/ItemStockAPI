unit ItemStockAPI.Model.GerenciarFotos;

interface

uses
  ItemStockAPI.DTO.Interfaces,
  ItemStockAPI.Model.Interfaces;

type
  TGerenciarFotos = class(TInterfacedObject, IGerenciarFotos)
  private
    FInstance: IItemFotoDTO;
    const _DOMAIN : String = 'http://192.168.100.21/ItemStockAPI/img';
    function ServidorArquivos : String;
    function ValidarFoto(aNome : String) : Boolean;
    function GerarNome : String;
  public
    class function New(aObject: IItemFotoDTO): IGerenciarFotos;
    constructor Create(aObject: IItemFotoDTO);
    destructor Destroy; override;
    procedure SalvarFoto;
    procedure DeletarFoto;
  end;

implementation

uses
  System.SysUtils, System.Classes;

{ TGerenciarFotos }

function TGerenciarFotos.ServidorArquivos: String;
begin
//Result := ExtractFilePath(ParamStr(0)) + '/img/';

Result := 'C:\Apache24\htdocs\ItemStockAPI\img\';
end;

constructor TGerenciarFotos.Create(aObject: IItemFotoDTO);
begin
  FInstance := aObject;
end;

procedure TGerenciarFotos.DeletarFoto;
begin
DeleteFile(FInstance.CaminhoArquivo);
end;

destructor TGerenciarFotos.Destroy;
begin

  inherited;
end;

function TGerenciarFotos.GerarNome: String;
const
  Pattern: String =
    'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890';
var
  aNome: String;
  I: Integer;
  alength: Integer;
  aRange: Integer;
begin
  alength := Length(Pattern);

  for I := 0 to 10 do
  begin
    aRange := Random(alength - 1);
    aNome := aNome + Copy(Pattern, aRange, 1);
  end;

  Result := aNome + '.png';
end;

class function TGerenciarFotos.New(aObject: IItemFotoDTO): IGerenciarFotos;
begin
  Result := TGerenciarFotos.Create(aObject);
end;

procedure TGerenciarFotos.SalvarFoto;
var
  aNome, LDIR: String;
  LPicture: TMemoryStream;
begin

  if not Assigned(FInstance.Stream) or (FInstance.Stream.Size = 0) then
    exit;

  aNome := GerarNome;

  while ValidarFoto(aNome) do
  begin
    aNome := GerarNome;
  end;

  LPicture := TMemoryStream.Create;
  try
    LPicture.LoadFromStream(FInstance.Stream);
    LDIR := ServidorArquivos + aNome;

    LPicture.SaveToFile(LDIR);
  finally
    LPicture.Free;
  end;

  FInstance.LinkFoto(_DOMAIN + aNome);
  FInstance.CaminhoArquivo(LDIR);

end;

function TGerenciarFotos.ValidarFoto(aNome: String): Boolean;
begin
  Result := FileExists(ServidorArquivos + aNome);
end;

end.
