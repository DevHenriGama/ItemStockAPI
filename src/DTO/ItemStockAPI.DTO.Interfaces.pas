unit ItemStockAPI.DTO.Interfaces;

interface

uses
  Data.DB, System.Classes;

type
  IItemDTO = interface
    ['{C765D09A-AEC0-4F4C-957D-9DE0BD4C0D62}']
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
    function IDCategoria(aID: Integer): IItemDTO; overload;
    function IDCategoria: Integer; overload;
    function Data(aDescricao: TDataSet): IItemDTO; overload;
    function Data: TDataSet; overload;
    function Deserialize(aJSON: String): IItemDTO;
  end;

  IItemFotoDTO = interface
    ['{C1F49088-DF6F-4AF2-9371-87837258E4E8}']
    function ID(aID: Integer): IItemFotoDTO; overload;
    function ID: Integer; overload;
    function CaminhoArquivo(aPath: String): IItemFotoDTO; overload;
    function CaminhoArquivo: String; overload;
    function Stream(aStream: TStream): IItemFotoDTO; overload;
    function Stream: TStream; overload;
    function IDItem(aID: Integer): IItemFotoDTO; overload;
    function IDItem: Integer; overload;
    function Data(aData: TDataSet): IItemFotoDTO; overload;
    function Data: TDataSet; overload;
    function LinkFoto(aPath: String): IItemFotoDTO; overload;
    function LinkFoto: String; overload;
    function Deserialize(aJSON: String): IItemFotoDTO;
  end;

  ICategoriaDTO = interface
    ['{EDABD265-8A2E-4AC9-A0DD-E288277B6A96}']
    function ID(aID: Integer): ICategoriaDTO; overload;
    function ID: Integer; overload;
    function Categoria(aCategoria: String): ICategoriaDTO; overload;
    function Categoria: String; overload;
    function UUID(aUUID: String): ICategoriaDTO; overload;
    function UUID: String; overload;
    function Descricao(aDescricao: String): ICategoriaDTO; overload;
    function Descricao: String; overload;
    function Data(aData: TDataSet): ICategoriaDTO; overload;
    function Data: TDataSet; overload;
    function Cor(aCor: String): ICategoriaDTO; overload;
    function Cor: String; overload;
    function Deserialize(aJSON: String): ICategoriaDTO;
  end;

  IContainerDTO = interface
    ['{4C3268E2-37AA-4D8E-8D2C-7948AC5A1AB1}']
    function ID(aID: Integer): IContainerDTO; overload;
    function ID: Integer; overload;
    function Numero(aNumero: Integer): IContainerDTO; overload;
    function Numero: Integer; overload;
    function UUID(aUUID: String): IContainerDTO; overload;
    function UUID: String; overload;
    function Descricao(aDescricao: String): IContainerDTO; overload;
    function Descricao: String; overload;
    function Data(aData: TDataSet): IContainerDTO; overload;
    function Data: TDataSet; overload;
    function Deserialize(aJSON: String): IContainerDTO;
  end;

  IEstadoDTO = interface
    ['{13DE32B6-99CD-4773-A375-1BBA196BCD1A}']
    function Data(aData: TDataSet): IEstadoDTO; overload;
    function Data: TDataSet; overload;
  end;

  IItemCategoriaDTO = interface
    ['{D4B6110C-F4B4-442D-B664-28B157EC0E6B}']
    function IDItem(aID: Integer): IItemCategoriaDTO; overload;
    function IDItem: Integer; overload;
    function IDCategoria(aID: Integer): IItemCategoriaDTO; overload;
    function IDCategoria: Integer; overload;
  end;

implementation

end.
