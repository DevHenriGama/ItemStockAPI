program ItemStockAPI;

{$APPTYPE CONSOLE}

{$R *.res}

uses
  System.SysUtils,
  ItemStockAPI.DAO.Conexao in 'src\DAO\conexao\ItemStockAPI.DAO.Conexao.pas',
  ItemStockAPI.DAO.Query in 'src\DAO\conexao\ItemStockAPI.DAO.Query.pas',
  ItemStockAPI.DAO.Interfaces in 'src\DAO\ItemStockAPI.DAO.Interfaces.pas',
  ItemStockAPI.DTO.Item in 'src\DTO\ItemStockAPI.DTO.Item.pas',
  ItemStockAPI.DTO.Interfaces in 'src\DTO\ItemStockAPI.DTO.Interfaces.pas',
  ItemStockAPI.DTO.ItemFoto in 'src\DTO\ItemStockAPI.DTO.ItemFoto.pas',
  ItemStockAPI.DTO.Categoria in 'src\DTO\ItemStockAPI.DTO.Categoria.pas',
  ItemStockAPI.DTO.Container in 'src\DTO\ItemStockAPI.DTO.Container.pas',
  ItemStockAPI.DTO.Estado in 'src\DTO\ItemStockAPI.DTO.Estado.pas',
  ItemStockAPI.DAO.Estado in 'src\DAO\instrucoes\ItemStockAPI.DAO.Estado.pas',
  ItemStockAPI.Model.Estado in 'src\Model\ItemStockAPI.Model.Estado.pas',
  ItemStockAPI.Model.Interfaces in 'src\Model\ItemStockAPI.Model.Interfaces.pas',
  ItemStockAPI.Controller.Estado in 'src\Controller\ItemStockAPI.Controller.Estado.pas';

begin
  try
    { TODO -oUser -cConsole Main : Insert code here }
  except
    on E: Exception do
      Writeln(E.ClassName, ': ', E.Message);
  end;
end.
