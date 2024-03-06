unit model.interfaces;

interface

uses
  Data.DB;

type
  IConexao = interface
    function Connection: TCustomConnection;
  end;

  IQuery = interface
    function SQL(Value: String): IQuery;
    function Params(aParam: String; Value: Variant): IQuery;
    function ExecSQL: IQuery;
    function Open: IQuery;
    function DataSet: TDataSet;
  end;

implementation

end.
