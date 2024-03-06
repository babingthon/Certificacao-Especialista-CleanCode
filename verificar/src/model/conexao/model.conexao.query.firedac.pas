unit model.conexao.query.firedac;

interface

uses
  Data.DB,
  FireDAC.Stan.Intf,
  FireDAC.Stan.Option,
  FireDAC.Stan.Error,
  FireDAC.UI.Intf,
  FireDAC.Phys.Intf,
  FireDAC.Stan.Def,
  FireDAC.Stan.Pool,
  FireDAC.Stan.Async,
  FireDAC.Phys,
  FireDAC.VCLUI.Wait,
  FireDAC.Stan.Param,
  FireDAC.DatS,
  FireDAC.DApt.Intf,
  FireDAC.DApt,
  FireDAC.Comp.DataSet,
  FireDAC.Comp.Client,
  FireDAC.Phys.SQLite,
  FireDAC.Phys.SQLiteDef,
  FireDAC.Stan.ExprFuncs,
  FireDAC.Phys.SQLiteWrapper.Stat,
  model.interfaces;

type
  TQuery = class(TInterfacedObject, IQuery)
  private
    FQuery: TFDQuery;
    FConn: IConexao;

    constructor Create;
  public
    class function New: IQuery;

    function SQL(Value: String): IQuery;
    function Params(aParam: String; Value: Variant): IQuery;
    function ExecSQL: IQuery;
    function Open: IQuery;
    function DataSet: TDataSet;
  end;

implementation

uses
  model.conexao.firedac;

{ TQuery }

constructor TQuery.Create;
begin
  FQuery := TFDQuery.Create(nil);
  FConn := TConexao.New;
  FQuery.Connection := TFDConnection(FConn.Connection);
end;

function TQuery.DataSet: TDataSet;
begin
  Result := FQuery;
end;

function TQuery.ExecSQL: IQuery;
begin
  Result := Self;
  FQuery.ExecSQL;
end;

class function TQuery.New: IQuery;
begin
  Result := Self.Create;
end;

function TQuery.Open: IQuery;
begin
  Result := Self;
  FQuery.Open;
end;

function TQuery.Params(aParam: String; Value: Variant): IQuery;
begin
  Result := Self;
  FQuery.Params.Add;
  FQuery.ParamByName(aParam).Value := Value;
end;

function TQuery.SQL(Value: String): IQuery;
begin
  result := self;
  FQuery.SQL.Clear;
  FQuery.SQL.Add(Value);
end;

end.
