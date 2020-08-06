unit U_Cep;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, System.JSON, REST.Client, IPPeerClient,
  Data.Bind.Components, Data.Bind.ObjectScope;

type
  TForm1 = class(TForm)
    lblcep: TLabel;
    lblendereco: TLabel;
    lblbairro: TLabel;
    lbluf: TLabel;
    lblcidade: TLabel;
    edtCep: TEdit;
    edtEndereco: TEdit;
    edtBairro: TEdit;
    edtUF: TEdit;
    edtCidade: TEdit;
    btnbuscar: TButton;
    procedure edtCepExit(Sender: TObject);
    procedure btnbuscarClick(Sender: TObject);
  private

  function BuscarCep (pCep : string) : TStringList;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.btnbuscarClick(Sender: TObject);
var Endereco : TStringList;
begin
  if (edtCep.Text <> '') and (Length(edtCep.Text) = 8) then
  begin
   Endereco         :=BuscarCep(edtCep.Text);
   edtEndereco.Text :=Endereco[0];
   edtBairro.Text   :=Endereco[1];
   edtUF.Text       :=Endereco[2];
   edtCidade.Text   :=Endereco[3];


  end;

end;

function TForm1.BuscarCep(pCep: string): TStringList;
var
  data : TJSONObject;
  RESTClient1: TRESTClient;
  RESTRequest1: TRESTRequest;
  RESTResponse1: TRESTResponse;
  Endereco: TStringList;

begin
  RESTClient1 := TRESTClient.Create(nil);
  RESTRequest1 := TRESTRequest.Create(nil);
  RESTResponse1 := TRESTResponse.Create(nil);
  RESTRequest1.Client := RESTClient1;
  RESTRequest1.Response := RESTResponse1;
  RESTClient1.BaseURL := 'https://viacep.com.br/ws/' + pCEP + '/json';
  RESTRequest1.Execute;
  data := RESTResponse1.JSONValue as TJSONObject;
  try
    Endereco := TStringList.Create;
    if Assigned(data) then
    begin
        try
          Endereco.Add(data.Values['logradouro'].Value);
        except
          on Exception do
            Endereco.Add('');
        end;
        try
          Endereco.Add(data.Values['bairro'].Value);
        except
         on Exception do
           Endereco.Add('');
        end;
        try
          Endereco.Add(data.Values['uf'].Value);
        except
         on Exception do
           Endereco.Add('');
        end;
        try
          Endereco.Add(data.Values['localidade'].Value);
        except
         on Exception do
           Endereco.Add('');
        end;

    end;
  finally
    FreeAndNil(data);
  end;
  Result := Endereco;
end;


procedure TForm1.edtCepExit(Sender: TObject);
begin
  btnbuscar.Click;
end;
end.
