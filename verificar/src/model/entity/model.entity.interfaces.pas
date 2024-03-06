unit model.entity.interfaces;

interface

type
  IUsuario = interface
    function Id(Value: Integer): IUsuario;
    function Usuario(Value: String): IUsuario;
    function Senha(Value: String): IUsuario;
    function Login: Boolean;
  end;

implementation

end.
