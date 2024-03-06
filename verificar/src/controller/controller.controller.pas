unit controller.controller;

interface

uses
  controller.interfaces,
  model.entity.usuario,
  model.entity.interfaces;

type
  TController = class(TInterfacedObject, IController)
  private
    FUsuario: IUsuario;
  public
    class function New: IController;
    function Usuario: IUsuario;
  end;

implementation

{ TController }

class function TController.New: IController;
begin
  Result := Self.Create;
end;

function TController.Usuario: IUsuario;
begin
  if not Assigned(FUsuario) then
    FUsuario := TUsuario.New;
  Result := FUsuario;
end;

end.
