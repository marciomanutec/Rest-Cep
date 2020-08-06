program P_Cep;

uses
  Vcl.Forms,
  U_Cep in 'U_Cep.pas' {Form1};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
