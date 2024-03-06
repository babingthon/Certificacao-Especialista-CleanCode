unit model.entity.usuario;

interface

uses
  model.entity.interfaces,
  model.interfaces;

type
  TUsuario = class(TInterfacedObject, IUsuario)
  private
    FQuery: IQuery;
    FID: Integer;
    FUsuario: String;
    FSenha: String;

    constructor Create;
  public
    class function New: IUsuario;

    function Id(Value: Integer): IUsuario;
    function Usuario(Value: String): IUsuario;
    function Senha(Value: String): IUsuario;
    function Login: Boolean;
  end;

implementation

uses
  System.Variants, model.conexao.query.firedac;

{ TUsuario }

constructor TUsuario.Create;
begin
  FQuery := TQuery.New;
end;

function TUsuario.Id(Value: Integer): IUsuario;
begin
  Result := Self;
  FID := Value;
end;

function TUsuario.Login: Boolean;
begin
  Result := FQuery
              .SQL('select * from usuario where login=:login and senha=:senha')
              .Open
              .DataSet.IsEmpty;
end;

class function TUsuario.New: IUsuario;
begin
  Result := Self.Create;
end;

function TUsuario.Senha(Value: String): IUsuario;
begin
  Result := Self;
  FSenha := Value;
end;

function TUsuario.Usuario(Value: String): IUsuario;
begin
  Result := Self;
  FUsuario := Value;
end;

end.
