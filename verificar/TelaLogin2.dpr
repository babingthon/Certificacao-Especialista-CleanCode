program TelaLogin2;

uses
  System.StartUpCopy,
  FMX.Forms,
  view.principal in 'src\view\view.principal.pas' {Form1},
  model.interfaces in 'src\model\conexao\model.interfaces.pas',
  model.entity.interfaces in 'src\model\entity\model.entity.interfaces.pas',
  model.entity.usuario in 'src\model\entity\model.entity.usuario.pas',
  model.conexao.firedac in 'src\model\conexao\model.conexao.firedac.pas',
  model.conexao.query.firedac in 'src\model\conexao\model.conexao.query.firedac.pas',
  controller.interfaces in 'src\controller\controller.interfaces.pas',
  controller.controller in 'src\controller\controller.controller.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
