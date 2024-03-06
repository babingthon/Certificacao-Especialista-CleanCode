unit model.conexao.firedac;

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
  TConexao = class(TInterfacedObject, IConexao)
  private
    FConection: TFDConnection;

    constructor Create;
    destructor Destroy; override;
  public
    class function New: IConexao;
    function Connection: TCustomConnection;
  end;

implementation

{ TConexao }

function TConexao.Connection: TCustomConnection;
begin
  Result := FConection;
end;

constructor TConexao.Create;
begin
  FConection := TFDConnection.Create(nil);

  FConection.Params.Clear;
  FConection.Params.DriverID := 'SQLite';
  FConection.Params.Database := 'C:\repositorio\Certificacao-Especialista-CleanCode\src\DB\DB.sdb';
  FConection.Params.UserName := '';
  FConection.Params.Password := '';
  FConection.Params.Add('LockingMode=Normal');
  FConection.Connected := True;
end;

destructor TConexao.Destroy;
begin
  FConection.Free;
  inherited;
end;

class function TConexao.New: IConexao;
begin
  Result := Self.Create;
end;

end.
