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
  ItemStockAPI.Controller.Categoria in 'src\Controller\ItemStockAPI.Controller.Categoria.pas',
  ItemStockAPI.Model.Categoria in 'src\Model\ItemStockAPI.Model.Categoria.pas',
  ItemStockAPI.DAO.Categoria in 'src\DAO\instrucoes\ItemStockAPI.DAO.Categoria.pas',
  ItemStockAPI.Routes.Categoria in 'src\Routes\ItemStockAPI.Routes.Categoria.pas',
  ItemStockAPI.Controller.ItemFoto in 'src\Controller\ItemStockAPI.Controller.ItemFoto.pas',
  ItemStockAPI.Model.ItemFoto in 'src\Model\ItemStockAPI.Model.ItemFoto.pas',
  ItemStockAPI.DAO.ItemFoto in 'src\DAO\instrucoes\ItemStockAPI.DAO.ItemFoto.pas',
  ItemStockAPI.Model.GerenciarFotos in 'src\Model\Sistema\ItemStockAPI.Model.GerenciarFotos.pas',
  ItemStockAPI.Routes.ItemFoto in 'src\Routes\ItemStockAPI.Routes.ItemFoto.pas',
  ItemStockAPI.Controller.Item in 'src\Controller\ItemStockAPI.Controller.Item.pas',
  ItemStockAPI.Model.Item in 'src\Model\ItemStockAPI.Model.Item.pas',
  ItemStockAPI.DAO.Item in 'src\DAO\instrucoes\ItemStockAPI.DAO.Item.pas',
  ItemStockAPI.Routes.Item in 'src\Routes\ItemStockAPI.Routes.Item.pas',
  ItemStockAPI.Model.DELPHI_ENV in 'src\Model\Sistema\ItemStockAPI.Model.DELPHI_ENV.pas',
  ItemStockAPI.Sistema in 'src\Routes\ItemStockAPI.Sistema.pas';

begin

  THorse.Use(Compression());
  THorse.Use(Jhonson);
  THorse.Use(OctetStream);

  TDataSetSerializeConfig.GetInstance.CaseNameDefinition := TCaseNameDefinition.cndLower;

  TRoutesEstado.Routes;
  TContainerRoutes.Routes;
  TCategoriaRotas.Routes;
  TItemFotoRota.Routes;
  TItemRotas.Routes;
  TRotasSistema.Routes;

  THorse.Listen(6564,procedure
  begin
    Writeln('ItemStockAPI Inicializada na porta 6564');
  end);
end.
