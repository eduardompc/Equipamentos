unit frmPix4;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls, FuncoesDLL;

type
  TPix4 = class(TForm)
    memoLogs: TMemo;
    btnConectar: TButton;
    btnVersaoFirmware: TButton;
    btnDesconectar: TButton;
    btnInicializar: TButton;
    btnApresentaImagem: TButton;
    btnApresentaTextoColorido: TButton;
    btnApresentaQRCode: TButton;
    GroupBox1: TGroupBox;
    editPorta: TEdit;
    Label1: TLabel;
    Label3: TLabel;
    editQrcode: TEdit;
    btnReiniciaDisplay: TButton;
    procedure btnConectarClick(Sender: TObject);
    procedure btnVersaoFirmwareClick(Sender: TObject);
    procedure btnDesconectarClick(Sender: TObject);
    procedure btnInicializarClick(Sender: TObject);
    procedure btnApresentaImagemClick(Sender: TObject);
    procedure btnApresentaTextoColoridoClick(Sender: TObject);
    procedure btnApresentaQRCodeClick(Sender: TObject);
    procedure btnReiniciaDisplayClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Pix4: TPix4;

implementation

{$R *.dfm}

procedure TPix4.btnApresentaImagemClick(Sender: TObject);
var
  ret : Integer;
begin
  if FileExists('./P1.jpg') then begin
    ret := FuncoesDLL.CarregaImagemDisplay('imagemTeste', './P1.jpg', 320, 480);
    memoLogs.Lines.Add('Retorno Carregar Imagem: ' + IntToStr(ret));
    if ret = 0 then begin
      ret := FuncoesDLL.ApresentaImagemDisplay('imagemTeste', 0, 0, 1);
      memoLogs.Lines.Add('Retorno Apresenta Imagem: ' + IntToStr(ret));
    end;
  end else begin
    ShowMessage('Coloque uma imagem "P1.jpg" no diret�rio do execut�vel!');
  end;
end;

procedure TPix4.btnApresentaQRCodeClick(Sender: TObject);
var
  ret : Integer;
begin
  if editQrcode.Text <> '' then begin
    ret := FuncoesDLL.ApresentaQrCode(PAnsiChar(AnsiString(editQrcode.Text)), 100, 55, 80);
    memoLogs.Lines.Add('Retorno Apresenta QrCode: ' + IntToStr(ret));
  end else begin
    ShowMessage('Escrever um texto para o QRCode');
  end;
end;

procedure TPix4.btnApresentaTextoColoridoClick(Sender: TObject);
var
  ret : Integer;
begin
  ret := FuncoesDLL.ApresentaTextoColorido(
                'SUB-TOTAL   =  250.00\n' +
                'DESCONTOS   =   50.00\n' +
                'TOTAL-PAGAR =  200.00\n' +
                'DINHEIRO    =   50.00\n' +
                'CREDITO     =   50.00\n' +
                'DEBITO      =   50.00\n' +
                'PIX         =   50.00\n' +
                'TROCO       =   10.00\n', 1, 22, 100, 0, '#005344');

  memoLogs.Lines.Add('Retorno apresenta Texto Colorido: ' + IntToStr(ret));
end;

procedure TPix4.btnConectarClick(Sender: TObject);
var
  ret : Integer;
begin
  ret := FuncoesDLL.AbreConexaoDisplay(PAnsiChar(AnsiString(editPorta.Text)));

  if ret = 0 then
    memoLogs.Lines.Add('Conex�o realizada com sucesso')
  else
    ShowMessage('N�o foi poss�vel realizar a conex�o: Erro: ' + IntToStr(ret));

end;

procedure TPix4.btnDesconectarClick(Sender: TObject);
var
 ret : Integer;
begin
  ret := FuncoesDLL.DesconectarDisplay();
  memoLogs.Lines.Add('Retorno Desconectar Pix4: ' + IntToStr(ret))
end;

procedure TPix4.btnInicializarClick(Sender: TObject);
var
  ret : Integer;
begin
  ret := FuncoesDLL.InicializaDisplay();
  memoLogs.Lines.Add('Retorno Inicializa Pix4: ' + IntToStr(ret));
end;

procedure TPix4.btnReiniciaDisplayClick(Sender: TObject);
var
  ret : Integer;
begin
  ret := FuncoesDLL.ReinicializaDisplay();
  memoLogs.Lines.Add('Retorno M�todo Reinicializar Display: ' + IntToStr(ret));
end;

procedure TPix4.btnVersaoFirmwareClick(Sender: TObject);
var
  ret : Integer;
begin
  ret := FuncoesDLL.ObtemVersaoFirmware();
  memoLogs.Lines.Add('Retorno ObtemVersaoFirmware: ' + IntToStr(ret));
end;


procedure TPix4.FormCreate(Sender: TObject);
begin
  memoLogs.Clear;
end;

end.
