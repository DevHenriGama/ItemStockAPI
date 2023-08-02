program ItemStockAPI;

{$APPTYPE CONSOLE}

{$R *.res}

uses
  Horse,
  Horse.OctetStream,
  Horse.Compression,
  Horse.Logger,
  Horse.Jhonson,
  System.SysUtils,
  DataSet.Serialize,
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
  ItemStockAPI.Controller.Estado in 'src\Controller\ItemStockAPI.Controller.Estado.pas',
  ItemStockAPI.Controller.Interfaces in 'src\Controller\ItemStockAPI.Controller.Interfaces.pas',
  ItemStockAPI.Routes.Estado in 'src\Routes\ItemStockAPI.Routes.Estado.pas',
  ItemStockAPI.Controller.Container in 'src\Controller\ItemStockAPI.Controller.Container.pas',
  ItemStockAPI.Model.Container in 'src\Model\ItemStockAPI.Model.Container.pas',
  ItemStockAPI.DAO.Container in 'src\DAO\instrucoes\ItemStockAPI.DAO.Container.pas',
  ItemStockAPI.Model.PublicID in 'src\Model\Sistema\ItemStockAPI.Model.PublicID.pas',
  ItemStockAPI.Routes.Container in 'src\Routes\ItemStockAPI.Routes.Container.pas',
  ItemStockAPI.DTO.ItemCategoria in 'src\DTO\ItemStockAPI.DTO.ItemCategoria.pas',
  ItemStockAPI.Controller.ItemCategoria in 'src\Controller\ItemStockAPI.Controller.ItemCategoria.pas',
  ItemStockAPI.Model.ItemCategoria in 'src\Model\ItemStockAPI.Model.ItemCategoria.pas',
  ItemStockAPI.DAO.ItemCategoria in 'src\DAO\instrucoes\ItemStockAPI.DAO.ItemCategoria.pas';

begin

  THorse.Use(Compression());
  THorse.Use(Jhonson);
  THorse.Use(OctetStream);

  TDataSetSerializeConfig.GetInstance.CaseNameDefinition := TCaseNameDefinition.cndLower;

  TRoutesEstado.Routes;
  TContainerRoutes.Routes;

  THorse.Listen(6564,procedure
  begin
    Writeln('ItemStockAPI Inicializada na porta 6564');
  end);
end.
