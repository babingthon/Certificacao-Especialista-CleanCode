unit view.principal;

interface

uses
  System.SysUtils,
  System.Types,
  System.UITypes,
  System.Classes,
  System.Variants,
  FMX.Types,
  FMX.Controls,
  FMX.Forms,
  FMX.Graphics,
  FMX.Dialogs,
  FMX.Layouts,
  FMX.Objects,
  FMX.Controls.Presentation,
  FMX.StdCtrls,
  FMX.Ani,
  FMX.Edit, controller.interfaces;

type
  TForm1 = class(TForm)
    Layout1: TLayout;
    Layout2: TLayout;
    Label1: TLabel;
    Layout3: TLayout;
    Layout4: TLayout;
    Layout5: TLayout;
    CheckBox1: TCheckBox;
    Label2: TLabel;
    Rectangle1: TRectangle;
    Label3: TLabel;
    Layout6: TLayout;
    Layout7: TLayout;
    EditUser: TEdit;
    EditPass: TEdit;
    Path1: TPath;
    Path2: TPath;
    Path3: TPath;
    Layout8: TLayout;
    procedure FormCreate(Sender: TObject);
    procedure Label3Click(Sender: TObject);
  private
    FController: IController;
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

uses
  controller.controller;


{$R *.fmx}
{$R *.XLgXhdpiTb.fmx ANDROID}
{$R *.LgXhdpiPh.fmx ANDROID}

procedure TForm1.FormCreate(Sender: TObject);
begin
  FController := TController.New;
  ReportMemoryLeaksOnShutdown := True;
end;

procedure TForm1.Label3Click(Sender: TObject);
begin
  if FController
    .Usuario
      .Usuario(EditUser.Text)
      .Senha(EditPass.Text)
      .Login then
      ShowMessage('Logado')
    else
      ShowMessage('usuario ou senha invalido');

end;

end.
