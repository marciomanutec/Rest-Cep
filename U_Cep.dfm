object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Busca Cep'
  ClientHeight = 206
  ClientWidth = 478
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object lblcep: TLabel
    Left = 16
    Top = 16
    Width = 62
    Height = 13
    Caption = 'Digite o Cep:'
  end
  object lblendereco: TLabel
    Left = 16
    Top = 52
    Width = 49
    Height = 13
    Caption = 'Endere'#231'o:'
  end
  object lblbairro: TLabel
    Left = 16
    Top = 88
    Width = 28
    Height = 13
    Caption = 'Bairro'
  end
  object lbluf: TLabel
    Left = 16
    Top = 128
    Width = 17
    Height = 13
    Caption = 'UF:'
  end
  object lblcidade: TLabel
    Left = 16
    Top = 168
    Width = 37
    Height = 13
    Caption = 'Cidade:'
  end
  object edtCep: TEdit
    Left = 89
    Top = 8
    Width = 121
    Height = 21
    TabOrder = 0
    OnExit = edtCepExit
  end
  object edtEndereco: TEdit
    Left = 89
    Top = 44
    Width = 216
    Height = 21
    Enabled = False
    TabOrder = 2
  end
  object edtBairro: TEdit
    Left = 88
    Top = 80
    Width = 121
    Height = 21
    Enabled = False
    TabOrder = 3
  end
  object edtUF: TEdit
    Left = 88
    Top = 125
    Width = 49
    Height = 21
    Enabled = False
    TabOrder = 4
  end
  object edtCidade: TEdit
    Left = 86
    Top = 160
    Width = 124
    Height = 21
    Enabled = False
    TabOrder = 5
  end
  object btnbuscar: TButton
    Left = 216
    Top = 6
    Width = 89
    Height = 25
    Caption = 'Buscar'
    TabOrder = 1
    OnClick = btnbuscarClick
  end
end
