program ItemStockAPI;

{$APPTYPE CONSOLE}

{$R *.res}

uses
  System.SysUtils,
  ItemStockAPI.DAO.Conexao in 'src\DAO\conexao\ItemStockAPI.DAO.Conexao.pas',
  ItemStockAPI.DAO.Query in 'src\DAO\conexao\ItemStockAPI.DAO.Query.pas',
  ItemStockAPI.DAO.Interfaces in 'src\DAO\ItemStockAPI.DAO.Interfaces.pas';

begin
  try
    { TODO -oUser -cConsole Main : Insert code here }
  except
    on E: Exception do
      Writeln(E.ClassName, ': ', E.Message);
  end;
end.
