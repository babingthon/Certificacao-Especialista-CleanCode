unit controller.interfaces;

interface

uses
  model.entity.interfaces;

type
  IController = interface
    function Usuario: IUsuario;
  end;

implementation

end.
